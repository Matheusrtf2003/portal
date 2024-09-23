<?php
include '../config.php';

header('Content-Type: application/json');

try {
    if (!isset($pdo)) {
        echo json_encode(['success' => false, 'message' => 'Erro na conexão com o banco de dados.']);
        exit;
    }

    $sql = "SELECT * FROM markers";
    $stmt = $pdo->query($sql);
    $markers = $stmt->fetchAll(PDO::FETCH_ASSOC);

    echo json_encode(['success' => true, 'markers' => $markers]);
} catch (PDOException $e) {
    echo json_encode(['success' => false, 'message' => 'Erro ao carregar marcadores: ' . $e->getMessage()]);
}
?>
