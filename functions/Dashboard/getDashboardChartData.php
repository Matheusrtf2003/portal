<?php
session_start();
include '../config.php';

header('Content-Type: application/json');

try {
    // Obter dados para o gráfico de linhas
    $lineChartData = $pdo->query("
        SELECT DATE(su.timestemp) as date, COUNT(*) as count
        FROM stores_users su
        GROUP BY DATE(su.timestemp)
        ORDER BY DATE(su.timestemp)
    ")->fetchAll(PDO::FETCH_ASSOC);

    // Obter dados para o gráfico de pizza
    $totalGoals = $pdo->query("SELECT SUM(target) as total_goals FROM goals")->fetch(PDO::FETCH_ASSOC)['total_goals'];
    $totalStores = $pdo->query("SELECT COUNT(*) as total_stores FROM stores_users")->fetch(PDO::FETCH_ASSOC)['total_stores'];

    echo json_encode([
        'success' => true,
        'lineChartData' => $lineChartData,
        'totalGoals' => $totalGoals,
        'totalStores' => $totalStores
    ]);
} catch (Exception $e) {
    echo json_encode(['success' => false, 'message' => 'Erro ao carregar dados: ' . $e->getMessage()]);
}
?>
