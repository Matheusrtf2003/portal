<?php
session_start();
include '../config.php';

// Recebe os dados enviados pelo JavaScript
$data = json_decode(file_get_contents('php://input'), true);
$storeIds = $data['store_ids'] ?? [];
$vendedorId = $data['vendedor_id'] ?? null;

if (empty($storeIds) || !$vendedorId) {
    echo json_encode(['success' => false, 'message' => 'Dados inválidos fornecidos.']);
    exit;
}

try {
    // Loop para atribuir o vendedor a cada loja
    foreach ($storeIds as $storeId) {
        // Verifica se já existe uma associação para essa loja
        $stmt = $pdo->prepare("SELECT * FROM stores_seller WHERE store_id = ?");
        $stmt->execute([$storeId]);
        $existing = $stmt->fetch();

        if ($existing) {
            // Atualiza o vendedor se já existir uma associação
            $stmt = $pdo->prepare("UPDATE stores_seller SET vendedor_id = ? WHERE store_id = ?");
            $stmt->execute([$vendedorId, $storeId]);
        } else {
            // Insere uma nova associação
            $stmt = $pdo->prepare("INSERT INTO stores_seller (store_id, vendedor_id) VALUES (?, ?)");
            $stmt->execute([$storeId, $vendedorId]);
        }
    }

    // Retorna sucesso
    echo json_encode(['success' => true]);
} catch (Exception $e) {
    echo json_encode(['success' => false, 'message' => 'Erro: ' . $e->getMessage()]);
}
?>
