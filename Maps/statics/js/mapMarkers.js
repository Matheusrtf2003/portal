let markers = [];

export function clearMapMarkers() {
    markers.forEach(marker => marker.setMap(null));
    markers = [];
}

export function addMarkerToMap(location, store) {
    const map = new google.maps.Map(document.getElementById("map"), {
        zoom: 10,
        center: location,
    });

    const marker = new google.maps.Marker({
        position: location,
        map: map,
        title: store.nome,
    });

    markers.push(marker);
}
