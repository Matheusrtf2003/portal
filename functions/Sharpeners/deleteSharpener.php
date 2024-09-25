<?php
session_start();
include '../config.php';

header('Content-Type: application/json');

// Verifique se a solicitação é POST
if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    echo json_encode(['success' => false, 'message' => 'Método de solicitação inválido.']);
    exit;
}

if (!isset($_POST['id'])) {
    echo json_encode(['success' => false, 'message' => 'ID do afiador é obrigatório.']);
    exit;
}

$afiadorId = $_POST['id'];

try {
    $stmt = $pdo->prepare("DELETE FROM sharpeners WHERE id = ?");
    $stmt->execute([$afiadorId]);

    if ($stmt->rowCount()) {
        echo json_encode(['success' => true, 'message' => 'Afiador excluído com sucesso.']);
    } else {
        echo json_encode(['success' => false, 'message' => 'Afiador não encontrado.']);
    }
} catch (PDOException $e) {
    echo json_encode(['success' => false, 'message' => 'Erro ao excluir afiador: ' . $e->getMessage()]);
}
?>
