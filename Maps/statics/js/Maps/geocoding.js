function geocodeAddress(address, callback) {
    fetch(`../../../functions/Geocoding/geocodeAddress.php?address=${encodeURIComponent(address)}`)
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
