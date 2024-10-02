let allStores = [];
let filteredStores = [];

function loadAllStores() {
    fetch('/portal/functions/getStores.php')
        .then(response => response.json())
        .then(data => {
            if (data.success && Array.isArray(data.stores)) {
                allStores = data.stores;
                displayStores(allStores);
                updateResultCount(allStores.length);
                loadMarkers();
                loadAvailableUsers(); // Carregar os usuários disponíveis
                loadAvailableCities(); // Carregar cidades disponíveis
                loadAvailableMesorregioes(); // Carregar mesorregiões disponíveis
                loadAvailableMarkers(); // Carregar os marcadores disponíveis
            } else {
                console.error('Erro ao carregar lojas:', data.message || 'Erro desconhecido');
            }
        })
        .catch(error => {
            console.error('Erro ao carregar lojas:', error);
            alert('Erro ao carregar lojas. Verifique o console para mais detalhes.');
        });
}


function displayStores(stores) {
    clearStoreList();
    stores.forEach(loja => {
        addStoreToList(loja);
    });
    document.getElementById('storeList').style.height = 'calc(100vh - 300px)';
    document.getElementById('storeList').style.overflowY = 'auto';
}

function clearStoreList() {
    document.getElementById('storeList').innerHTML = '';
}

function getStatusClass(status) {
    switch (status) {
        case 'Descoberto':
            return 'bg-dark';
        case 'Coberto':
            return 'bg-primary';
        case 'Ativo':
            return 'bg-success';
        case 'Inativo':
            return 'bg-danger';
        default:
            return 'bg-secondary';
    }
}

function addStoreToList(loja) {
    let statusClass = getStatusClass(loja.status);

    let markersHtml = loja.marcadores && loja.marcadores.length > 0 
        ? loja.marcadores.map(marker => `<span class="badge" style="background-color: ${marker.cor}; color: white;">${marker.nome}</span>`).join(' ') 
        : '<span class="badge badge-secondary">Sem marcadores</span>';

    let storeItem = `
        <div class="store-item card mb-2 shadow-sm border-0" data-id="${loja.id}" style="border-radius: 10px; padding: 8px;">
            <div class="card-body" style="padding: 8px;">
                <div class="d-flex justify-content-between align-items-center mb-2">
                    <div>
                        <h6 class="card-title mb-1" style="font-size: 16px;">${loja.nome}</h6>
                        <p class="text-muted mb-0" style="font-size: 11px;"><i class="bi bi-geo-alt-fill"></i> ${loja.estado} - ${loja.cidade}</p>
                    </div>
                    <div>
                        <small class="badge badge-pill ${statusClass}">${loja.status}</small>
                    </div>
                </div>
                <p class="mb-1" style="font-size: 13px;"><i class="bi bi-bookmark-star-fill"></i> ${markersHtml}</p>
                <div class="d-flex justify-content-between align-items-center-c">
                    <input type="checkbox" class="store-checkbox" data-id="${loja.id}" checked />
                    <button class="btn btn-primary btn-sm" style="border-radius: 20px; padding: 2px 8px; font-size: 11px;">Ver Detalhes</button>
                </div>
                <div class="store-details" id="storeDetails-${loja.id}" style="margin-top: 10px;"></div>
            </div>
        </div>
    `;

    document.getElementById('storeList').insertAdjacentHTML('beforeend', storeItem);

    const storeElement = document.querySelector(`.store-item[data-id="${loja.id}"]`);

    // Listener para o checkbox
    storeElement.querySelector('.store-checkbox').addEventListener('change', function (event) {
        toggleMarkerVisibility(loja.id, event.target.checked);
    });

    // Listener para o botão de detalhes
    storeElement.querySelector('button').addEventListener('click', function(event) {
        event.preventDefault();
        toggleStoreDetails(loja);
        clearMapMarkers();
        const marker = markers.find(m => m.id === loja.id);
        if (marker) {
            marker.setMap(map);
        }
    });
}

function toggleStoreDetails(loja) {
    let detailElement = document.getElementById(`storeDetails-${loja.id}`);

    if (!detailElement.classList.contains('show')) {
        // Removendo caracteres especiais do telefone para o link do WhatsApp
        let telefoneWhatsApp = loja.telefone ? loja.telefone.replace(/\D/g, '') : null;
        let whatsappLink = telefoneWhatsApp ? `https://wa.me/55${telefoneWhatsApp}` : null;

        let instagramHandle = loja.instagram ? loja.instagram.replace('https://www.instagram.com/', '@') : 'Não disponível';
        let detailContent = `
            <div class="card mb-4 shadow-sm border-0 detail-column" style="border-radius: 10px;">
                <div class="card-header d-flex justify-content-between align-items-center bg-primary text-white" style="border-top-left-radius: 10px; border-top-right-radius: 10px;">
                    <h4 class="card-title mb-0">${loja.nome}</h4>
                    <button class="btn btn-light btn-sm close-details" style="border-radius: 20px;">Fechar</button>
                </div>
                <div class="card-body">
                    <h5>Status: <span class="badge badge-pill ${getStatusBadge(loja.status)}">${loja.status}</span></h5>
                    <p><strong>CNPJ:</strong> ${loja.cnpj}</p>
                    <p><strong>Descrição:</strong> ${loja.anotacao || 'Nenhuma descrição disponível.'}</p>
                    
                    <h5 class="mt-4">Loja</h5>
                    <div class="contato">
                        <p><strong>Endereço:</strong> <a href="https://www.google.com.br/maps/search/${loja.endereco}" target="_blank">${loja.endereco}</a></p>
                        <p><strong>Telefone:</strong> 
                            <a href="${whatsappLink}" target="_blank" style="text-decoration:none;">
                                <i class="bi bi-whatsapp"></i> Enviar mensagem
                            </a>
                        </p>
                        <p><strong>Email:</strong> <a href="mailto:${loja.email}">${loja.email}</a></p>
                        <p><strong>Instagram:</strong> <i class="bi bi-instagram"></i> 
                        <a href="${loja.instagram}" target="_blank">${instagramHandle}</a></p>
                        <p><strong>Site:</strong> <a href="${loja.site}" target="_blank">${loja.site || 'Não disponível'}</a></p>
                    </div>

                    <h5 class="mt-4">Dados Decisor</h5>
                    <p><strong>Decisor:</strong> ${loja.decisor || 'Não disponível'}</p>
                    <p><strong>Contato:</strong> 
                        <a href="https://wa.me/55${loja.telefone_decisor.replace(/\D/g, '')}" target="_blank">
                            ${loja.telefone_decisor || 'Não disponível'}
                        </a>
                    </p>
                </div>
            </div>
        `;

        detailElement.innerHTML = detailContent;
        setTimeout(() => {
            detailElement.querySelector('.detail-column').classList.add('show'); // Adiciona a classe show com atraso
        }, 10);

        detailElement.querySelector('.close-details').addEventListener('click', function() {
            detailElement.querySelector('.detail-column').classList.remove('show'); // Remove a classe show para ocultar
            setTimeout(() => {
                detailElement.innerHTML = ''; // Limpa o conteúdo após a animação
            }, 500); // Aguarda a animação terminar antes de remover o conteúdo
        });

    } else {
        detailElement.querySelector('.detail-column').classList.remove('show'); // Remove a classe show para ocultar
        setTimeout(() => {
            detailElement.innerHTML = ''; // Limpa o conteúdo após a animação
        }, 500); // Aguarda a animação terminar antes de remover o conteúdo
    }
}

function getStatusBadge(status) {
    switch (status.toLowerCase()) {
        case 'ativo': return 'badge-success';
        case 'inativo': return 'badge-danger';
        case 'coberto': return 'badge-info';
        case 'descoberto': return 'badge-secondary';
        default: return 'badge-light';
    }
}


let markersHtml = loja.marcadores && loja.marcadores.length > 0 
    ? loja.marcadores.map(marker => `
        <div style="background-color: ${marker.cor}; color: black; border-radius: 5px; padding: 5px; display: inline-block;">
            ${marker.nome}
        </div>`).join(', ') 
    : 'Sem marcadores';



function toggleMarkerVisibility(storeId, isVisible) {
    const marker = markers.find(m => m.id === storeId);
    if (marker) {
        marker.setMap(isVisible ? map : null);
    }
}

function clearMapMarkers() {
    markers.forEach(marker => marker.setMap(null));
}

function loadMarkers() {
    clearMapMarkers();
    filteredStores.forEach(loja => {
        geocodeAddress(loja.endereco, function(location) {
            const marker = addMarkerToMap(location, loja);
            const checkbox = document.querySelector(`.store-checkbox[data-id="${loja.id}"]`);
            marker.setMap(checkbox.checked ? map : null);
        });
    });
}

