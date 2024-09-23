<?php
include '../config.php';

header('Content-Type: application/json');

try {
    // Verificar se a variável $pdo está definida
    if (!isset($pdo)) {
        echo json_encode(['success' => false, 'message' => 'Erro na conexão com o banco de dados.']);
        exit;
    }

    // Obter o total de lojas
    $stmt = $pdo->query('SELECT COUNT(*) as total FROM stores');
    $totalStores = $stmt->fetch(PDO::FETCH_ASSOC)['total'];

    // Obter todos os marcadores
    $stmt = $pdo->query('SELECT nome, cor FROM markers');
    $markers = $stmt->fetchAll(PDO::FETCH_ASSOC);

    echo json_encode(['success' => true, 'totalStores' => $totalStores, 'markers' => $markers]);
} catch (PDOException $e) {
    echo json_encode(['success' => false, 'message' => 'Erro ao carregar dados do dashboard: ' . $e->getMessage()]);
}
?>
