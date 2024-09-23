<?php
session_start();
include '../config.php';

// Exibir erros para debug
ini_set('display_errors', 1);
error_reporting(E_ALL);

// Recebe os dados enviados pelo JavaScript
$data = json_decode(file_get_contents('php://input'), true);

// Extrai as variáveis recebidas
$storeId = $data['store_id'] ?? null;
$vendedorId = $data['vendedor_id'] ?? null;
$storeIds = $data['store_ids'] ?? [];  // Para múltiplas lojas

// Função para atribuir o vendedor a uma única loja
function atribuirVendedorUnico($pdo, $storeId, $vendedorId) {
    try {
        // Verifica se já existe associação
        $stmt = $pdo->prepare("SELECT * FROM stores_seller WHERE store_id = ?");
        $stmt->execute([$storeId]);
        $existing = $stmt->fetch();

        if ($existing) {
            // Atualiza o vendedor se existir
            $stmt = $pdo->prepare("UPDATE stores_seller SET vendedor_id = ? WHERE store_id = ?");
            $stmt->execute([$vendedorId, $storeId]);
        } else {
            // Insere uma nova associação
            $stmt = $pdo->prepare("INSERT INTO stores_seller (store_id, vendedor_id) VALUES (?, ?)");
            $stmt->execute([$storeId, $vendedorId]);
        }

        return ['success' => true];
    } catch (Exception $e) {
        return ['success' => false, 'message' => 'Erro: ' . $e->getMessage()];
    }
}

// Função para atribuir o vendedor a várias lojas
function atribuirVendedorMultiplo($pdo, $storeIds, $vendedorId) {
    try {
        foreach ($storeIds as $storeId) {
            atribuirVendedorUnico($pdo, $storeId, $vendedorId);
        }
        return ['success' => true];
    } catch (Exception $e) {
        return ['success' => false, 'message' => 'Erro: ' . $e->getMessage()];
    }
}

// Lógica principal
if ($storeId) {
    // Atribui para uma única loja
    echo json_encode(atribuirVendedorUnico($pdo, $storeId, $vendedorId));
} elseif (!empty($storeIds)) {
    // Atribui para várias lojas
    echo json_encode(atribuirVendedorMultiplo($pdo, $storeIds, $vendedorId));
} else {
    echo json_encode(['success' => false, 'message' => 'Dados inválidos fornecidos.']);
}
