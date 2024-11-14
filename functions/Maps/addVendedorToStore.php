<?php
session_start();
include '../config.php';

if (!isset($_SESSION['user_id'])) {
    echo json_encode(["success" => false, "error" => "Usuário não autenticado."]);
    exit();
}

$data = json_decode(file_get_contents('php://input'), true);

if (!isset($data['lojaId']) || !isset($data['vendedorId'])) {
    echo json_encode(["success" => false, "error" => "Dados inválidos."]);
    exit();
}

$lojaId = $data['lojaId'];
$vendedorId = $data['vendedorId'];

try {
    // Adiciona o vendedor à loja
    $stmt = $pdo->prepare("INSERT INTO stores_seller (store_id, vendedor_id) VALUES (:storeId, :vendedorId)");
    $stmt->bindParam(':storeId', $lojaId);
    $stmt->bindParam(':vendedorId', $vendedorId);
    $stmt->execute();

    // Verifica o status atual da loja
    $statusStmt = $pdo->prepare("SELECT status FROM stores WHERE id = :storeId");
    $statusStmt->bindParam(':storeId', $lojaId);
    $statusStmt->execute();
    $store = $statusStmt->fetch(PDO::FETCH_ASSOC);

    // Verifica se o status é diferente de "Coberto"
    if ($store && $store['status'] !== 'Coberto') {
        // Atualiza o status para "Coberto"
        $updateStatusStmt = $pdo->prepare("UPDATE stores SET status = 'Coberto' WHERE id = :storeId");
        $updateStatusStmt->bindParam(':storeId', $lojaId);
        $updateStatusStmt->execute();
    }

    echo json_encode(['success' => true, 'message' => 'Vendedor adicionado e status atualizado, se necessário.']);
} catch (Exception $e) {
    echo json_encode(['success' => false, 'message' => 'Erro ao adicionar vendedor: ' . $e->getMessage()]);
}
