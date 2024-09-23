<?php
session_start();
include '../config.php';

header('Content-Type: application/json');

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    echo json_encode(['success' => false, 'message' => 'Método de solicitação inválido.']);
    exit;
}

$data = json_decode(file_get_contents("php://input"), true);

if (!isset($data['ids']) || !is_array($data['ids']) || count($data['ids']) === 0) {
    echo json_encode(['success' => false, 'message' => 'IDs dos afiadores são obrigatórios e devem ser um array não vazio.']);
    exit;
}

$afiadorIds = $data['ids'];

try {
    $placeholders = implode(',', array_fill(0, count($afiadorIds), '?'));
    $stmt = $pdo->prepare("DELETE FROM sharpeners WHERE id IN ($placeholders)");
    $stmt->execute($afiadorIds);

    if ($stmt->rowCount()) {
        echo json_encode(['success' => true, 'message' => 'Afiadores excluídos com sucesso.']);
    } else {
        echo json_encode(['success' => false, 'message' => 'Nenhum afiador foi excluído.']);
    }
} catch (PDOException $e) {
    echo json_encode(['success' => false, 'message' => 'Erro ao excluir afiadores: ' . $e->getMessage()]);
}
?>
