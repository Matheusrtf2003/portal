<?php
session_start();
include '../config.php';

header('Content-Type: application/json');

// Certifique-se de que a solicitação seja DELETE
if ($_SERVER['REQUEST_METHOD'] !== 'DELETE') {
    echo json_encode(['success' => false, 'message' => 'Método de solicitação inválido.']);
    exit;
}

// Obtenha os dados enviados via DELETE
parse_str(file_get_contents("php://input"), $_DELETE);

if (!isset($_DELETE['id'])) {
    echo json_encode(['success' => false, 'message' => 'ID do afiador é obrigatório.']);
    exit;
}

$afiadorId = $_DELETE['id'];

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
