<?php
session_start();
include '../config.php';

header('Content-Type: application/json');

if ($_SESSION['user_tipo'] !== 'Administrador') {
    echo json_encode(['success' => false, 'message' => 'Permissão negada.']);
    exit;
}

if (!isset($_GET['id'])) {
    echo json_encode(['success' => false, 'message' => 'ID da meta não fornecido.']);
    exit;
}

$goalId = $_GET['id'];

try {
    $stmt = $pdo->prepare("DELETE FROM goals WHERE id = ?");
    $stmt->execute([$goalId]);

    $stmt = $pdo->prepare("DELETE FROM goals_user WHERE goal_id = ?");
    $stmt->execute([$goalId]);

    echo json_encode(['success' => true, 'message' => 'Meta excluída com sucesso.']);
} catch (Exception $e) {
    echo json_encode(['success' => false, 'message' => 'Erro ao excluir meta: ' . $e->getMessage()]);
}
?>
