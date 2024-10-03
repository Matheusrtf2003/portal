let map;
let markers = [];

let lastOpenedInfoWindow = null; // Variável para armazenar o último infowindow

async function initMap() {
    const { Map } = await google.maps.importLibrary("maps");
    const { AdvancedMarkerElement, PinElement } = await google.maps.importLibrary("marker");

    map = new Map(document.getElementById("map"), {
        zoom: 5,
        center: { lat: -14.235004, lng: -51.92528 }, // Centro do Brasil
        mapTypeId: google.maps.MapTypeId.ROADMAP,
        mapId: "a38eadaa5c4a64d7" // Substitua por seu Map ID
    });

    loadAllStores();
}

function addMarkerToMap(location, loja) {
    if (!location || isNaN(location.lat) || isNaN(location.lng)) {
        console.error('Coordenadas inválidas:', location);
        return;
    }

    let markerColor;
    switch (loja.status) {
        case 'Descoberto': markerColor = '#343a40'; break;
        case 'Coberto': markerColor = '#007bff'; break;
        case 'Ativo': markerColor = '#28a745'; break;
        case 'Inativo': markerColor = '#dc3545'; break;
        default: markerColor = '#6c757d'; break;
    }

    const pin = new google.maps.marker.PinElement({
        background: markerColor,
        scale: 1.0,
        glyphColor: 'white',
        borderColor: '#000000',
    });

    const markerView = new google.maps.marker.AdvancedMarkerElement({
        map: map,
        position: location,
        content: pin.element,
        title: loja.nome,
        id: loja.id
    });

    markers.push(markerView);

    // Gerar o link do WhatsApp
    let telefoneWhatsApp = loja.telefone ? loja.telefone.replace(/\D/g, '') : null;
    let whatsappLink = telefoneWhatsApp ? `https://wa.me/55${telefoneWhatsApp}` : null;

    // Gerar o handle do Instagram
    let instagramHandle = loja.instagram ? loja.instagram.replace('https://www.instagram.com/', '@') : 'Não disponível';

    const infoContent = `
    <div class="infowindow-content" id="infowindow-${loja.id}" style="border-radius: 12px; width: 280px; padding: 10px; opacity: 0; max-height: 0; transition: all 0.4s ease;">
        <div class="card-body" style="padding: 10px;">
            <h5 class="card-title mb-2" style="color: #007bff; font-weight: 600;">
                <a href="#" style="text-decoration: none; color: #007bff;" onclick="openStoreCard(${loja.id})">${loja.nome}</a>
            </h5>
            <span class="badge badge-pill ${getStatusClass(loja.status)}" style="font-size: 14px; margin-bottom: 10px;">${loja.status}</span>
            
            <p><strong>CNPJ:</strong> ${loja.cnpj}</p>
            <p><strong>Descrição:</strong> ${loja.anotacao || 'Nenhuma descrição disponível.'}</p>

            <div class="mt-3">
                <h6 style="color: #007bff;">Informações de Contato</h6>
                <p><strong>Endereço:</strong> <a href="https://www.google.com.br/maps/search/${loja.endereco}" target="_blank" style="text-decoration: none; color: #007bff;">${loja.endereco}</a></p>
                <p><strong>Telefone:</strong> 
                    <a href="${whatsappLink}" target="_blank" style="text-decoration:none; color: #007bff;">
                        <i class="bi bi-whatsapp"></i> Enviar mensagem
                    </a>
                </p>
                <p><strong>Email:</strong> <a href="mailto:${loja.email}" style="text-decoration:none; color: #007bff;">${loja.email}</a></p>
                <p><strong>Instagram:</strong> <i class="bi bi-instagram"></i> 
                    <a href="${loja.instagram}" target="_blank" style="color: #007bff;">${instagramHandle}</a>
                </p>
                <p><strong>Site:</strong> <a href="${loja.site}" target="_blank" style="color: #007bff;">${loja.site || 'Não disponível'}</a></p>
            </div>

            <h6 class="mt-3" style="color: #007bff;">Dados Decisor</h6>
            <p><strong>Decisor:</strong> ${loja.decisor || 'Não disponível'}</p>
            <p><strong>Contato:</strong> 
                <a href="https://wa.me/55${loja.telefone_decisor.replace(/\D/g, '')}" target="_blank" style="color: #007bff;">
                    ${loja.telefone_decisor || 'Não disponível'}
                </a>
            </p>
        </div>
    </div>
`;


    const infowindow = new google.maps.InfoWindow({
        content: infoContent
    });

    // Adiciona a animação para abrir suavemente no primeiro clique
    markerView.addListener('click', function() {
        // Fecha o último infowindow se estiver aberto
        if (lastOpenedInfoWindow) {
            lastOpenedInfoWindow.close();
        }
    
        // Abre o novo infowindow
        infowindow.open(map, markerView);
    
        // Armazena o infowindow recém-aberto como o último
        lastOpenedInfoWindow = infowindow;
    
        // Animação para abrir suavemente
        setTimeout(() => {
            const infoElement = document.getElementById(`infowindow-${loja.id}`);
            infoElement.style.opacity = '1';
            infoElement.style.maxHeight = '1000px';
        }, 50);
    });
    

    // Listener para o fechamento suave do infowindow
    infowindow.addListener('closeclick', function() {
        const infoElement = document.getElementById(`infowindow-${loja.id}`);
        if (infoElement) {
            infoElement.style.opacity = '0';
            infoElement.style.maxHeight = '0';
        }
    });

    return markerView;
}

function getStatusClass(status) {
    switch (status.toLowerCase()) {
        case 'ativo': return 'badge-success';
        case 'inativo': return 'badge-danger';
        case 'coberto': return 'badge-info';
        case 'descoberto': return 'badge-secondary';
        default: return 'badge-light';
    }
}

function clearMapMarkers() {
    markers.forEach(marker => marker.setMap(null));
    markers = [];
}

function toggleMarkerVisibility(storeId, isVisible) {
    const marker = markers.find(m => m.id === storeId);
    if (marker) {
        marker.setMap(isVisible ? map : null);
    }
}

function toggleAllMarkers(event) {
    const checkboxes = document.querySelectorAll('.store-checkbox');
    const isChecked = event.target.checked;

    checkboxes.forEach(checkbox => {
        checkbox.checked = isChecked;
        toggleMarkerVisibility(checkbox.dataset.id, isChecked);
    });
}

function loadMarkers() {
    clearMapMarkers();

    filteredStores.forEach(loja => {
        geocodeAddress(loja.endereco, function (location) {
            const marker = addMarkerToMap(location, loja);
            const checkbox = document.querySelector(`.store-checkbox[data-id="${loja.id}"]`);
            marker.setMap(checkbox.checked ? map : null);
        });
    });
}

function openStoreCard(storeId) {
    const storeElement = document.querySelector(`.store-item[data-id="${storeId}"]`);
    
    if (storeElement) {
        // Simular o clique no botão de "Ver Detalhes" para abrir o card da loja
        const detailsButton = storeElement.querySelector('button');
        if (detailsButton) {
            detailsButton.click(); // Simula o clique no botão "Ver Detalhes"
        }
    } else {
        console.error('Loja não encontrada:', storeId);
    }
}

// Inicializa o mapa e carrega todas as lojas no início
window.initMap = initMap;
