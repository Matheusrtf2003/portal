<?php
require_once '../config.php'; // Certifique-se de que este caminho está correto

header('Content-Type: application/json');

// Obtém os dados enviados via JSON
$data = json_decode(file_get_contents("php://input"), true);

if (!isset($data['storeId']) || !isset($data['marker'])) {
    echo json_encode(["success" => false, "message" => "Dados incompletos."]);
    exit;
}

$storeId = $data['storeId'];
$markerName = $data['marker'];

try {
    // Busca o ID do marcador com base no nome do marcador
    $stmt = $pdo->prepare("SELECT id FROM markers WHERE nome = ?");
    $stmt->execute([$markerName]);
    $markerId = $stmt->fetchColumn();

    if (!$markerId) {
        echo json_encode(["success" => false, "message" => "Marcador não encontrado na tabela markers."]);
        exit;
    }

    // Verifica se o marcador já existe para evitar duplicação
    $stmt = $pdo->prepare("SELECT COUNT(*) FROM stores_markers WHERE loja_id = ? AND marcador_id = ?");
    $stmt->execute([$storeId, $markerId]);
    $exists = $stmt->fetchColumn();

    if ($exists) {
        echo json_encode(["success" => false, "message" => "Marcador já existe para esta loja."]);
        exit;
    }

    // Insere o novo marcador no banco de dados
    $stmt = $pdo->prepare("INSERT INTO stores_markers (loja_id, marcador_id) VALUES (?, ?)");
    $stmt->execute([$storeId, $markerId]);

    echo json_encode(["success" => true, "message" => "Marcador adicionado com sucesso."]);
} catch (Exception $e) {
    echo json_encode(["success" => false, "message" => "Erro ao adicionar marcador: " . $e->getMessage()]);
}
?>
