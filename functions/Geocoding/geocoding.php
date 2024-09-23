<?php

function getCoordinates($address) {
    global $pdo; // Supondo que você já tenha uma conexão com o banco de dados

    // Verifica se o endereço já está no banco de dados
    $stmt = $pdo->prepare("SELECT latitude, longitude FROM geocoded_addresses WHERE endereco = :endereco");
    $stmt->execute(['endereco' => $address]);
    $result = $stmt->fetch(PDO::FETCH_ASSOC);

    if ($result) {
        // Retorna as coordenadas armazenadas
        return ['lat' => $result['latitude'], 'lng' => $result['longitude']];
    } else {
        // Se não estiver no banco de dados, realiza a geocodificação
        $geocodeData = geocodeAddress($address); // Função que faz a geocodificação (ver abaixo)

        if ($geocodeData) {
            // Armazena o resultado no banco de dados para futuras consultas
            $stmt = $pdo->prepare("INSERT INTO geocoded_addresses (endereco, latitude, longitude, last_updated) VALUES (:endereco, :latitude, :longitude, NOW())");
            $stmt->execute([
                'endereco' => $address,
                'latitude' => $geocodeData['lat'],
                'longitude' => $geocodeData['lng']
            ]);
        }

        return $geocodeData;
    }
}

function geocodeAddress($address) {
    $apiKey = 'SUA_CHAVE_API'; // Substitua pela sua chave de API do Google Maps
    $url = "https://maps.googleapis.com/maps/api/geocode/json?address=" . urlencode($address) . "&key=" . $apiKey;

    $response = file_get_contents($url);
    $json = json_decode($response, true);

    if ($json['status'] === 'OK') {
        $location = $json['results'][0]['geometry']['location'];
        return ['lat' => $location['lat'], 'lng' => $location['lng']];
    } else {
        return false; // Tratar o erro conforme necessário
    }
}


?>