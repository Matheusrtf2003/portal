<?php
require '../config.php'; // Arquivo de conexão com o banco de dados

$id = $_GET['id'] ?? '';

if ($id) {
    $query = "SELECT * FROM stores WHERE id = :id";
    $stmt = $pdo->prepare($query);
    $stmt->bindParam(':id', $id);
    $stmt->execute();
    $store = $stmt->fetch(PDO::FETCH_ASSOC);

    if ($store) {
        echo json_encode($store);
    } else {
        echo json_encode(['success' => false, 'message' => 'Loja não encontrada.']);
    }
} else {
    echo json_encode(['success' => false, 'message' => 'ID inválido.']);
}
?>
