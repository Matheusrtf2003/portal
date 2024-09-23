<?php
session_start();
include '../config.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $goalName = $_POST['goal_name'];
    $startDate = $_POST['start_date'];
    $endDate = $_POST['end_date'];
    $target = $_POST['target'];
    $goalMarker = $_POST['goal_marker'];
    $goalUser = $_POST['goal_user'];

    $userId = $_SESSION['user_id'];

    try {
        $pdo->beginTransaction();

        $stmt = $pdo->prepare("
            INSERT INTO goals (name, start_date, end_date, target, marker_id, created_by) 
            VALUES (?, ?, ?, ?, ?, ?)
        ");
        $stmt->execute([$goalName, $startDate, $endDate, $target, $goalMarker, $userId]);

        $goalId = $pdo->lastInsertId();

        $stmt = $pdo->prepare("
            INSERT INTO goals_user (goal_id, user_id) 
            VALUES (?, ?)
        ");
        $stmt->execute([$goalId, $goalUser]);

        $pdo->commit();

        echo json_encode(['success' => true, 'message' => 'Meta criada com sucesso!']);
    } catch (Exception $e) {
        $pdo->rollBack();
        echo json_encode(['success' => false, 'message' => 'Erro ao criar meta: ' . $e->getMessage()]);
    }
} else {
    echo json_encode(['success' => false, 'message' => 'Método de solicitação inválido.']);
}
?>
