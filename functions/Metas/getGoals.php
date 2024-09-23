<?php
session_start();
include '../config.php';

$userId = $_SESSION['user_id'];
$userTipo = $_SESSION['user_tipo'];

header('Content-Type: application/json');

try {
    if ($userTipo === 'Administrador') {
        $stmt = $pdo->prepare("
            SELECT g.*, gu.user_id, m.nome AS marker_name, m.cor AS marker_color,
            (SELECT COUNT(*) FROM stores_users su WHERE su.user_id = gu.user_id AND su.timestemp BETWEEN g.start_date AND g.end_date) as current
            FROM goals g
            JOIN goals_user gu ON g.id = gu.goal_id
            JOIN markers m ON g.marker_id = m.id
        ");
        $stmt->execute();
    } else {
        $stmt = $pdo->prepare("
            SELECT g.*, gu.user_id, m.nome AS marker_name, m.cor AS marker_color,
            (SELECT COUNT(*) FROM stores_users su WHERE su.user_id = gu.user_id AND su.timestemp BETWEEN g.start_date AND g.end_date) as current
            FROM goals g
            JOIN goals_user gu ON g.id = gu.goal_id
            JOIN markers m ON g.marker_id = m.id
            WHERE gu.user_id = ?
        ");
        $stmt->execute([$userId]);
    }

    $goals = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // Agrupar usuários por meta
    $goalsGrouped = [];
    foreach ($goals as $goal) {
        if (!isset($goalsGrouped[$goal['id']])) {
            $goalsGrouped[$goal['id']] = $goal;
            $goalsGrouped[$goal['id']]['users'] = [];
        }
        $goalsGrouped[$goal['id']]['users'][] = $goal['user_id'];
    }

    $goalsResult = array_values($goalsGrouped);

    echo json_encode(['success' => true, 'goals' => $goalsResult]);
} catch (Exception $e) {
    echo json_encode(['success' => false, 'message' => 'Erro ao carregar metas: ' . $e->getMessage()]);
}
?>
