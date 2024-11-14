<?php
session_start();
header("Content-Type: application/json");
include 'config.php'; // Conexão com o banco de dados

// Pegar o ID do usuário logado para obter a chave de API
$userId = $_SESSION['user_id'];

// Buscar a chave de API do Agendor para o usuário logado
$stmt = $pdo->prepare("SELECT agendor_api FROM users WHERE id = ?");
$stmt->execute([$userId]);
$user = $stmt->fetch(PDO::FETCH_ASSOC);

if (!$user || !$user['agendor_api']) {
    http_response_code(403);
    echo json_encode(["error" => "API Key não encontrada para o usuário logado"]);
    exit();
}

$agendorApiKey = $user['agendor_api']; // Chave de API obtida do banco de dados

// Receber os dados da loja
$data = json_decode(file_get_contents("php://input"), true);

if (!$data || !isset($data['name']) || !isset($data['contact']['email'])) {
    http_response_code(400);
    echo json_encode(["error" => "Dados inválidos ou incompletos fornecidos"]);
    exit();
}

// Buscar a sigla do estado na tabela estados usando o ID do estado da loja
$estadoId = $data['address']['state']; // Esse é o ID do estado que vem da loja
$stmtEstado = $pdo->prepare("SELECT sigla FROM estados WHERE id = ?");
$stmtEstado->execute([$estadoId]);
$estado = $stmtEstado->fetch(PDO::FETCH_ASSOC);

if (!$estado || !$estado['sigla']) {
    http_response_code(400);
    echo json_encode(["error" => "Estado não encontrado"]);
    exit();
}

$siglaEstado = $estado['sigla']; // Sigla do estado obtida do banco de dados

// Preparar o payload para a API do Agendor
$payload = [
    "name" => $data['name'],
    "legalName" => $data['legalName'] ?? $data['name'],
    "cnpj" => $data['cnpj'] ?? '',
    "description" => $data['description'] ?? '',
    "address" => [
        "street_name" => $data['address']['street_name'] ?? '',
        "city" => $data['address']['city'] ?? '',
        "state" => $siglaEstado // Aqui usamos a sigla do estado obtida do banco
    ],
    "contact" => [
        "email" => $data['contact']['email'],
        "whatsapp" => $data['contact']['whatsapp'] ?? ''
    ],
    "social" => [
        "instagram" => $data['social']['instagram'] ?? '',
        "website" => $data['social']['website'] ?? ''
    ]
];

// Enviar os dados para a API do Agendor
$url = "https://api.agendor.com.br/v3/organizations";
$ch = curl_init($url);
curl_setopt($ch, CURLOPT_HTTPHEADER, [
    "Content-Type: application/json",
    "Authorization: Token $agendorApiKey"
]);
curl_setopt($ch, CURLOPT_POST, true);
curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($payload));
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

$result = curl_exec($ch);

if (curl_errno($ch)) {
    http_response_code(500);
    echo json_encode(["error" => "Erro ao conectar ao Agendor", "detail" => curl_error($ch)]);
} else {
    $http_code = curl_getinfo($ch, CURLINFO_HTTP_CODE);
    if ($http_code === 200 || 201) {
        echo $result;
    } else {
        http_response_code($http_code);
        echo json_encode(["error" => "Erro na requisição ao Agendor", "detail" => json_decode($result, true)]);
    }
}
curl_close($ch);
