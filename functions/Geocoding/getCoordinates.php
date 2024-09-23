<?php
include '../config.php'; // Conexão com o banco de dados

if (!isset($_GET['address'])) {
    echo json_encode(['success' => false, 'message' => 'Endereço não fornecido']);
    exit;
}

$address = $_GET['address'];
$coordinates = getCoordinates($address);

if ($coordinates) {
    echo json_encode(['success' => true, 'lat' => $coordinates['lat'], 'lng' => $coordinates['lng']]);
} else {
    echo json_encode(['success' => false, 'message' => 'Não foi possível geocodificar o endereço']);
}
?>
