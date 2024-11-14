<?php
session_start();
include '../config.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $data = json_decode(file_get_contents("php://input"), true);

    if (isset($data['store_id']) && isset($data['vendedor_id'])) {
        $storeId = $data['store_id'];
        $vendedorId = $data['vendedor_id'];

        // Atualiza o vendedor da loja
        $query = "UPDATE stores_seller SET vendedor_id = :vendedor_id WHERE store_id = :store_id";
        $stmt = $pdo->prepare($query);
        $stmt->bindParam(':vendedor_id', $vendedorId);
        $stmt->bindParam(':store_id', $storeId);

        if ($stmt->execute()) {
            echo json_encode(['success' => true]);
        } else {
            echo json_encode(['success' => false, 'message' => 'Erro ao atualizar o vendedor.']);
        }
    } else {
        echo json_encode(['success' => false, 'message' => 'Dados incompletos.']);
    }
}
?>
