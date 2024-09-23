<?php
include '../config.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $storeId = $_POST['storeId'];
    $vendedorId = $_POST['vendedorId'];

    try {
        $stmt = $pdo->prepare("REPLACE INTO stores_seller (store_id, vendedor_id) VALUES (?, ?)");
        $stmt->execute([$storeId, $vendedorId]);

        echo json_encode(['success' => true]);
    } catch (Exception $e) {
        echo json_encode(['success' => false, 'message' => $e->getMessage()]);
    }
}
?>
