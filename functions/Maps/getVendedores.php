<?php
header('Content-Type: application/json');
include '../config.php';

try {
    // Consultando vendedores da tabela `users` com base em `vendedor_id` na `stores_seller`
    $query = "
        SELECT DISTINCT u.id, u.nome
        FROM stores_seller ss
        INNER JOIN users u ON ss.vendedor_id = u.id
    ";
    $stmt = $pdo->prepare($query);
    $stmt->execute();
    $vendedores = $stmt->fetchAll(PDO::FETCH_ASSOC);
    
    echo json_encode($vendedores); // Retornando apenas o array de vendedores
} catch (Exception $e) {
    echo json_encode(['success' => false, 'message' => 'Erro ao carregar vendedores: ' . $e->getMessage()]);
}
