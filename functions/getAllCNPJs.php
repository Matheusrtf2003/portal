<?php
require 'config.php';  // Inclui o arquivo de conexão PDO

header('Content-Type: application/json');

try {
    $stmt = $pdo->query("SELECT cnpj FROM stores");
    $cnpjs = $stmt->fetchAll(PDO::FETCH_COLUMN);

    echo json_encode(['success' => true, 'cnpjs' => $cnpjs]);
} catch (Exception $e) {
    echo json_encode(['success' => false, 'message' => 'Erro ao buscar CNPJs: ' . $e->getMessage()]);
}
?>
