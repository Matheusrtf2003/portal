<?php
include '../config.php';

header('Content-Type: application/json');

$id = $_GET['id'] ?? null;

if (!$id) {
    echo json_encode(['success' => false, 'message' => 'ID da loja não fornecido.']);
    exit;
}

try {
    if (!isset($pdo)) {
        echo json_encode(['success' => false, 'message' => 'Erro na conexão com o banco de dados.']);
        exit;
    }

    $stmt = $pdo->prepare('DELETE FROM stores WHERE id = ?');
    $stmt->execute([$id]);

    echo json_encode(['success' => true, 'message' => 'Loja excluída com sucesso.']);
} catch (PDOException $e) {
    echo json_encode(['success' => false, 'message' => 'Erro ao excluir loja: ' . $e->getMessage()]);
}
?>
