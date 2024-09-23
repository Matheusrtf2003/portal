<?php

header('Content-Type: application/json');

require_once '../config.php';  // Inclua aqui a sua conexão com o banco de dados

try {
    function getCoordinates($address) {
        global $pdo;

        // Verifica se o endereço já está no banco de dados
        $stmt = $pdo->prepare("SELECT latitude, longitude FROM geocoded_addresses WHERE endereco = :endereco");
        $stmt->execute(['endereco' => $address]);
        $result = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($result) {
            return ['lat' => $result['latitude'], 'lng' => $result['longitude']];
        } else {
            $geocodeData = geocodeAddress($address);
            if ($geocodeData) {
                $stmt = $pdo->prepare("INSERT INTO geocoded_addresses (endereco, latitude, longitude, last_updated) VALUES (:endereco, :latitude, :longitude, NOW())");
                $stmt->execute([
                    'endereco' => $address,
                    'latitude' => $geocodeData['lat'],
                    'longitude' => $geocodeData['lng']
                ]);
                return $geocodeData;
            } else {
                return false;
            }
        }
    }

    function geocodeAddress($address) {
        $apiKey = 'AIzaSyAnqVbnVlRY2EaQL7pzLQMKMhBGxm6T02c'; 
        $url = "https://maps.googleapis.com/maps/api/geocode/json?address=" . urlencode($address) . "&key=" . $apiKey;

        $response = file_get_contents($url);
        $json = json_decode($response, true);

        if ($json['status'] === 'OK') {
            $location = $json['results'][0]['geometry']['location'];
            return ['lat' => $location['lat'], 'lng' => $location['lng']];
        } else {
            return false;
        }
    }

    if (isset($_GET['address'])) {
        $address = $_GET['address'];
        $coordinates = getCoordinates($address);

        if ($coordinates) {
            echo json_encode(['success' => true, 'lat' => $coordinates['lat'], 'lng' => $coordinates['lng']]);
        } else {
            echo json_encode(['success' => false, 'message' => 'Falha ao obter coordenadas']);
        }
    } else {
        echo json_encode(['success' => false, 'message' => 'Endereço não fornecido']);
    }
} catch (Exception $e) {
    echo json_encode(['success' => false, 'message' => 'Erro no servidor: ' . $e->getMessage()]);
}

?>
