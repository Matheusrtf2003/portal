<?php
include 'config.php';

$response = [];

try {
    $stmt = $pdo->prepare("SELECT id, nome, cnpj, endereco, cidade, estado, status, datetime, marcadores, 'store' AS type FROM stores");
    $stmt->execute();
    $stores = $stmt->fetchAll(PDO::FETCH_ASSOC);

    $stmt = $pdo->prepare("SELECT id, nome, cpf AS cnpj, endereco, cidade, estado, status, datetime, turma AS marcadores, 'educator' AS type FROM educators");
    $stmt->execute();
    $educators = $stmt->fetchAll(PDO::FETCH_ASSOC);

    $response = array_merge($stores, $educators);
    
    echo json_encode($response);
} catch (Exception $e) {
    echo json_encode(['success' => false, 'message' => 'Erro ao carregar dados: ' . $e->getMessage()]);
}
?>
