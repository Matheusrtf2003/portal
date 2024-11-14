<?php
header('Content-Type: application/json');
include '../config.php';

try {
    // Consultando hunters da tabela `users` com base em `user_id` na `stores_users`
    $query = "
        SELECT DISTINCT u.id, u.nome
        FROM stores_users su
        INNER JOIN users u ON su.user_id = u.id
    ";
    $stmt = $pdo->prepare($query);
    $stmt->execute();
    $hunters = $stmt->fetchAll(PDO::FETCH_ASSOC);
    
    echo json_encode($hunters); // Retornando apenas o array de hunters
} catch (Exception $e) {
    echo json_encode(['success' => false, 'message' => 'Erro ao carregar hunters: ' . $e->getMessage()]);
}
