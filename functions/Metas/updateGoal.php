<?php
session_start();
include '../config.php';

header('Content-Type: application/json');

if ($_SESSION['user_tipo'] !== 'Administrador') {
    echo json_encode(['success' => false, 'message' => 'Permissão negada.']);
    exit;
}

$data = json_decode(file_get_contents('php://input'), true);

if (!isset($data['id'], $data['goal_name'], $data['start_date'], $data['end_date'], $data['target'], $data['goal_marker'], $data['goal_user'])) {
    echo json_encode(['success' => false, 'message' => 'Dados incompletos.']);
    exit;
}

$goalId = $data['id'];
$goalName = $data['goal_name'];
$startDate = $data['start_date'];
$endDate = $data['end_date'];
$target = $data['target'];
$goalMarker = $data['goal_marker'];
$goalUser = $data['goal_user'];

try {
    $stmt = $pdo->prepare("UPDATE goals SET name = ?, start_date = ?, end_date = ?, target = ?, marker_id = ? WHERE id = ?");
    $stmt->execute([$goalName, $startDate, $endDate, $target, $goalMarker, $goalId]);

    $stmt = $pdo->prepare("UPDATE goals_user SET user_id = ? WHERE goal_id = ?");
    $stmt->execute([$goalUser, $goalId]);

    echo json_encode(['success' => true, 'message' => 'Meta atualizada com sucesso.']);
} catch (Exception $e) {
    echo json_encode(['success' => false, 'message' => 'Erro ao atualizar meta: ' . $e->getMessage()]);
}
?>
