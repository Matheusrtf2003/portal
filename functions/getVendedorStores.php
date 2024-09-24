<?php
include '../config.php';

session_start();
$vendedorId = $_SESSION['user_id']; // Assumindo que o ID do vendedor esteja armazenado na sessão

try {
    // Consulta para buscar lojas atribuídas ao vendedor logado
    $stmt = $pdo->prepare("SELECT stores.* FROM stores 
                           INNER JOIN stores_seller ON stores.id = stores_seller.store_id
                           WHERE stores_seller.vendedor_id = :vendedor_id");
    $stmt->bindParam(':vendedor_id', $vendedorId);
    $stmt->execute();
    $lojas = $stmt->fetchAll(PDO::FETCH_ASSOC);

    echo json_encode(['success' => true, 'lojas' => $lojas]);
} catch (Exception $e) {
    echo json_encode(['success' => false, 'message' => 'Erro ao carregar lojas.']);
}
?>