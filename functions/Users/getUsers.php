<?php
include '../config.php'; // Certifique-se de que o caminho para config.php está correto

header('Content-Type: application/json');

try {
    $stmt = $pdo->query("SELECT id, nome, email, tipo, status, function FROM users");
    $users = $stmt->fetchAll(PDO::FETCH_ASSOC);

    echo json_encode(['success' => true, 'users' => $users]);
} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(['success' => false, 'message' => 'Erro ao carregar usuários: ' . $e->getMessage()]);
}
?>
