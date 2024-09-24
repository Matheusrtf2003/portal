<?php
include '../config.php';

try {
    // Corrigido o uso do operador OR
    $stmt = $pdo->prepare("SELECT id, nome FROM users WHERE function = 'Representante' OR function = 'Vendedor'");
    $stmt->execute();
    $vendedores = $stmt->fetchAll(PDO::FETCH_ASSOC);

    echo json_encode(['success' => true, 'vendedores' => $vendedores]);
} catch (Exception $e) {
    echo json_encode(['success' => false, 'message' => 'Erro ao carregar vendedores.']);
}
?>
