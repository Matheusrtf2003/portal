<?php
// Cabeçalhos para garantir que a resposta seja JSON e permitir o acesso CORS
header('Content-Type: application/json');
header("Access-Control-Allow-Origin: *");

// Inclua a configuração do banco de dados a partir do arquivo config.php
include_once('../config.php');

// Obter o endereço da requisição
$endereco = isset($_GET['address']) ? $conn->real_escape_string($_GET['address']) : '';

if (empty($endereco)) {
    echo json_encode(['success' => false, 'message' => 'Endereço não fornecido']);
    exit();
}

// Consulta para buscar as coordenadas no banco de dados
$query = "SELECT latitude, longitude FROM geocoded_addresses WHERE endereco = '$endereco'";
$result = $conn->query($query);

if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
    echo json_encode(['success' => true, 'lat' => $row['latitude'], 'lng' => $row['longitude']]);
} else {
    echo json_encode(['success' => false, 'message' => 'Coordenadas não encontradas para o endereço fornecido']);
}

// Fechar a conexão com o banco de dados
$conn->close();
?>
