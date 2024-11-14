<?php
include 'config.php';

session_start();

try {
    // Consulta para buscar todos os vendedores
    $stmt = $pdo->prepare("SELECT id, nome FROM users WHERE function = 'Vendedor'");
    $stmt->execute();
    $vendedores = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // Retorna os vendedores em formato JSON
    echo json_encode(['success' => true, 'vendedores' => $vendedores]);
} catch (Exception $e) {
    echo json_encode(['success' => false, 'message' => 'Erro ao carregar vendedores.']);
}
?>
