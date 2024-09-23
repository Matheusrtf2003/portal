<?php
include '../config.php';

header('Content-Type: application/json');

$data = json_decode(file_get_contents('php://input'), true);
$ids = $data['ids'] ?? [];
$vendorId = $data['vendorId'] ?? null;

if (empty($ids) || !$vendorId) {
    echo json_encode(['success' => false, 'message' => 'Lojas ou vendedor não selecionados.']);
    exit;
}

try {
    $idPlaceholders = implode(',', array_fill(0, count($ids), '?'));
    $stmt = $pdo->prepare("UPDATE stores SET vendedor_id = ? WHERE id IN ($idPlaceholders)");
    $params = array_merge([$vendorId], $ids);
    $stmt->execute($params);

    echo json_encode(['success' => true, 'message' => 'Vendedor atribuído com sucesso.']);
} catch (PDOException $e) {
    echo json_encode(['success' => false, 'message' => 'Erro ao atribuir vendedor: ' . $e->getMessage()]);
}
?>
