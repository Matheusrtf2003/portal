let map;
let markers = [];

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

    const infowindow = new google.maps.InfoWindow({
        content: `<h5>${loja.nome}</h5><p>${loja.endereco}</p>`
    });

    markerView.addListener('click', function() {
        infowindow.open(map, markerView);
    });

    return markerView;
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

// Inicializa o mapa e carrega todas as lojas no início
window.initMap = initMap;
