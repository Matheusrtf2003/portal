<?php
session_start();
include '../config.php';

header('Content-Type: application/json');

if (!isset($_SESSION['user_id']) || !isset($_SESSION['user_tipo'])) {
    echo json_encode(['success' => false, 'message' => 'Usuário não autenticado']);
    exit;
}

try {
    // Consulta para obter todos os marcadores
    $stmt = $pdo->prepare("SELECT id, nome, cor FROM markers");
    $stmt->execute();

    $markers = $stmt->fetchAll(PDO::FETCH_ASSOC);

    echo json_encode(['success' => true, 'markers' => $markers]);
} catch (Exception $e) {
    echo json_encode(['success' => false, 'message' => 'Erro ao carregar marcadores: ' . $e->getMessage()]);
}
?>
