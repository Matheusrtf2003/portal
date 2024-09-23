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
        ? loja.marcadores.map(marker => `<span style="color: ${marker.cor};">${marker.nome}</span>`).join(', ') 
        : 'Sem marcadores';

    let storeItem = `
        <div class="store-item" data-id="${loja.id}">
            <div class="store-details" id="storeDetails-${loja.id}"></div>
            <a href="#" class="list-group-item list-group-item-action mb-3">
                <div class="d-flex w-100 justify-content-between">
                    <input type="checkbox" class="store-checkbox" data-id="${loja.id}" checked />
                    <h5 class="mb-1">${loja.nome}</h5>
                    <small><span class="status-indicator ${statusClass}"></span>${loja.status}</small>
                </div>
                <p class="mb-1 mt-2" style="font-size: 12px;">${loja.estado} - ${loja.cidade}</p>
                <small>Marcadores: ${markersHtml}</small>
            </a>
        </div>`;

    document.getElementById('storeList').insertAdjacentHTML('beforeend', storeItem);

    const storeElement = document.querySelector(`.store-item[data-id="${loja.id}"]`);

    storeElement.querySelector('.store-checkbox').addEventListener('change', function (event) {
        toggleMarkerVisibility(loja.id, event.target.checked);
    });

    document.querySelector(`.store-item[data-id="${loja.id}"] a`).addEventListener('click', function(event) {
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
        let detailContent = `
            <div class="detail-column">
                <button class="btn btn-danger btn-sm float-right close-details">Fechar</button>
                <h4>${loja.nome}</h4>
                <h5>Status: ${loja.status}</h5>
                <p><strong>CNPJ: </strong>${loja.cnpj}</p>
                <p><strong>Descrição: </strong>${loja.anotacao}</p>
                <h5>Loja</h5>
                <div class="contato">
                    <p>Endereço: <a href="https://www.google.com.br/maps/search/${loja.endereco}" target="_blank">${loja.endereco}</a></p>
                    <p>Telefone: <a href="tel:${loja.telefone}">${loja.telefone}</a></p>
                    <p>Email: <a href="mailto:${loja.email}">${loja.email}</a></p>
                    <p>Instagram: <a href="${loja.instagram}" target="_blank">${loja.instagram}</a></p>
                    <p>Site: <a href="${loja.site}" target="_blank">${loja.site}</a></p>
                </div>
                <h5>Dados Decisor</h5>
                <p>Decisor: ${loja.decisor}</p>
                <p>Contato: ${loja.telefone_decisor}</p>
            </div>
        `;

        detailElement.innerHTML = detailContent;
        detailElement.classList.add('show');

        detailElement.querySelector('.close-details').addEventListener('click', function() {
            detailElement.classList.remove('show');
            detailElement.innerHTML = '';
        });
    } else {
        detailElement.classList.remove('show');
        detailElement.innerHTML = '';
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

