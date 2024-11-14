<!DOCTYPE html>
<html>
<head>
    <title>Google Maps - Delimitar Área por Raio com Lojas</title>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAnqVbnVlRY2EaQL7pzLQMKMhBGxm6T02c"></script>
    <script>
        let map;
        let areaCircle;
        let marker;

        // Inicializar o mapa
        function initMap(center = { lat: -23.55052, lng: -46.633308 }) {
            map = new google.maps.Map(document.getElementById("map"), {
                zoom: 12,
                center: center,
            });

            // Criar o círculo inicial
            areaCircle = new google.maps.Circle({
                strokeColor: "#FF0000",
                strokeOpacity: 0.8,
                strokeWeight: 2,
                fillColor: "#FF0000",
                fillOpacity: 0.35,
                map: map,
                center: center,
                radius: 5000, // Raio inicial de 5 km
            });

            // Criar o marcador inicial
            marker = new google.maps.Marker({
                position: center,
                map: map,
                title: "Centro do Raio"
            });

            // Carregar lojas do backend e adicionar os marcadores
            carregarLojas(center, areaCircle.getRadius());
        }

        // Função para carregar lojas do backend
        function carregarLojas(center, radius) {
            fetch('URL_PARA_SUA_API_LOJAS') // Altere para a URL que retorna os dados das lojas
                .then(response => response.json())
                .then(lojas => {
                    adicionarMarcadoresDentroDoRaio(lojas, center, radius);
                })
                .catch(error => {
                    console.error('Erro ao carregar lojas:', error);
                });
        }

        // Função para verificar se uma loja está dentro do raio
        function adicionarMarcadoresDentroDoRaio(lojas, center, radius) {
            lojas.forEach(loja => {
                const lojaLatLng = new google.maps.LatLng(loja.lat, loja.lng);
                const distance = google.maps.geometry.spherical.computeDistanceBetween(center, lojaLatLng);

                // Se a loja estiver dentro do raio, adiciona um marcador
                if (distance <= radius) {
                    const lojaMarker = new google.maps.Marker({
                        position: lojaLatLng,
                        map: map,
                        title: loja.nome
                    });
                }
            });
        }

        // Atualizar o círculo com nova localização
        function updateCircle(lat, lng) {
            const newCenter = { lat: parseFloat(lat), lng: parseFloat(lng) };

            // Reposicionar o círculo e o marcador no novo centro
            areaCircle.setCenter(newCenter);
            marker.setPosition(newCenter);
            map.setCenter(newCenter);

            // Limpar os marcadores anteriores e carregar os novos dentro do raio
            carregarLojas(newCenter, areaCircle.getRadius());
        }

        // Obter localização atual do navegador
        function getCurrentLocation() {
            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(
                    (position) => {
                        const lat = position.coords.latitude;
                        const lng = position.coords.longitude;
                        updateCircle(lat, lng); // Atualizar o círculo para a localização atual
                        document.getElementById("latitude").value = lat;
                        document.getElementById("longitude").value = lng;
                    },
                    () => {
                        alert("Não foi possível obter sua localização.");
                    }
                );
            } else {
                alert("Geolocalização não é suportada pelo seu navegador.");
            }
        }

        // Atualizar localização por input manual
        function updateLocationFromInput() {
            const lat = document.getElementById("latitude").value;
            const lng = document.getElementById("longitude").value;
            if (lat && lng) {
                updateCircle(lat, lng);
            } else {
                alert("Por favor, insira latitude e longitude válidas.");
            }
        }
    </script>

    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAnqVbnVlRY2EaQL7pzLQMKMhBGxm6T02c&libraries=geometry"></script> <!-- Necessário para a função computeDistanceBetween -->
</head>

<body onload="initMap()">
    <div style="margin-bottom: 20px;">
        <button onclick="getCurrentLocation()" class="bg-blue-500 text-white py-2 px-4 rounded-lg">Usar Minha Localização Atual</button>
        <br><br>
        <label for="latitude">Latitude:</label>
        <input type="text" id="latitude" placeholder="Digite a latitude" class="border p-2 rounded">
        <label for="longitude">Longitude:</label>
        <input type="text" id="longitude" placeholder="Digite a longitude" class="border p-2 rounded">
        <button onclick="updateLocationFromInput()" class="bg-green-500 text-white py-2 px-4 rounded-lg">Atualizar Localização</button>
    </div>

    <div id="map" style="height: 500px; width: 100%;"></div>
</body>
</html>
