<?php
include '../config.php';

header('Content-Type: application/json');

$data = json_decode(file_get_contents('php://input'), true);
$ids = $data['ids'] ?? [];

if (empty($ids)) {
    echo json_encode(['success' => false, 'message' => 'Nenhuma loja selecionada para exclusão.']);
    exit;
}

try {
    $idPlaceholders = implode(',', array_fill(0, count($ids), '?'));
    $stmt = $pdo->prepare("DELETE FROM stores WHERE id IN ($idPlaceholders)");
    $stmt->execute($ids);

    echo json_encode(['success' => true, 'message' => 'Lojas excluídas com sucesso.']);
} catch (PDOException $e) {
    echo json_encode(['success' => false, 'message' => 'Erro ao excluir lojas: ' . $e->getMessage()]);
}
?>
