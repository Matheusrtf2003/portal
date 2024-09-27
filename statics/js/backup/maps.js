let map;
let geocoder;
let markers = [];
let allStores = [];
let filteredStores = [];

document.addEventListener('DOMContentLoaded', function () {
    loadAllStores();

    document.getElementById('searchInput').addEventListener('input', applyFilters);
    document.getElementById('filterStatusSelect').addEventListener('change', applyFilters);
    document.getElementById('filterMarkers').addEventListener('change', applyFilters);
    document.getElementById('selectAll').addEventListener('change', toggleAllMarkers);
    document.getElementById('applyFilterButton').addEventListener('click', filterByState);
    document.getElementById('applyStatusFilterButton').addEventListener('click', filterByStatus);  // Adicionado evento para o botão de filtro por status
});

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

    // Define a cor do pin com base no status da loja
    let markerColor;
    switch (loja.status) {
        case 'Descoberto':
            markerColor = '#343a40'; // cor dark
            break;
        case 'Coberto':
            markerColor = '#007bff'; // cor primary
            break;
        case 'Ativo':
            markerColor = '#28a745'; // cor success
            break;
        case 'Inativo':
            markerColor = '#dc3545'; // cor danger
            break;
        default:
            markerColor = '#6c757d'; // cor secondary
            break;
    }

    // Adicionando um ícone de loja dentro do pin usando SVG
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

    const infowindow = new google.maps.InfoWindow({
        content: `<h5>${loja.nome}</h5><p>${loja.endereco}</p>`
    });

    markerView.addListener('click', function() {
        infowindow.open(map, markerView);
    });

    return markerView;
}

function loadAllStores() {
    fetch('functions/getStores.php')
        .then(response => response.json())
        .then(data => {
            console.log('Response data:', data); // Verifica a estrutura da resposta
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

function clearMapMarkers() {
    markers.forEach(marker => marker.setMap(null));
    markers = [];
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

    // Adiciona os eventos de mouseover e mouseout para animar o pin
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

function toggleStoreDetails(loja) {
    let detailElement = document.getElementById(`storeDetails-${loja.id}`);

    if (!detailElement.classList.contains('show')) {
        let detailContent = `
            <div class="detail-column">
                <button class="btn btn-danger btn-sm float-right close-details">
                    Fechar
                </button>
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

function applyFilters() {
    const query = document.getElementById('searchInput').value.toLowerCase();
    const status = document.getElementById('filterStatusSelect').value.toLowerCase();
    const state = document.getElementById('filterStateSelect').value.toLowerCase();
    const marker = document.getElementById('filterMarkers').value.toLowerCase();

    filteredStores = allStores.filter(store => {
        const matchQuery = store.nome.toLowerCase().includes(query) || store.cidade.toLowerCase().includes(query);
        const matchStatus = !status || store.status.toLowerCase() === status;
        const matchState = !state || store.estado.toLowerCase() === state;
        const matchMarker = !marker || store.marcadores.some(m => m.nome.toLowerCase() === marker);

        return matchQuery && matchStatus && matchState && matchMarker;
    });

    displayStores(filteredStores);
    updateResultCount(filteredStores.length);
    loadMarkers();
}

function updateResultCount(count) {
    document.getElementById('resultCount').innerText = `${count} loja(s) encontrada(s)`;
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

function filterByState() {
    applyFilters();
    $('#filterStateModal').modal('hide');  // Fechar o modal ao aplicar o filtro
    loadMarkers();  // Atualizar as lojas no mapa com base no estado selecionado
}

function filterByStatus() {
    applyFilters();
    $('#filterStatusModal').modal('hide');  // Fechar o modal ao aplicar o filtro
    loadMarkers();  // Atualizar as lojas no mapa com base no status selecionado
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

function geocodeAddress(address, callback) {
    fetch(`functions/Geocoding/geocodeAddress.php?address=${encodeURIComponent(address)}`)
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                if (data.lat && data.lng && !isNaN(data.lat) && !isNaN(data.lng)) {
                    callback({ lat: parseFloat(data.lat), lng: parseFloat(data.lng) });
                } else {
                    console.error('Coordenadas inválidas:', data);
                }
            } else {
                console.error('Erro ao buscar coordenadas:', data.message);
            }
        })
        .catch(error => console.error('Erro ao buscar coordenadas:', error));
}

// Inicializa o mapa e carrega todas as lojas no início
window.initMap = initMap;
