<?php
require 'config.php';

// Função para criar uma nova relação loja-usuário
function createStoreUser($data) {
    global $pdo;
    $sql = "INSERT INTO stores_users (store_id, user_id) VALUES (:store_id, :user_id)";
    $stmt = $pdo->prepare($sql);
    return $stmt->execute($data);
}

// Função para ler relações loja-usuário
function readStoreUsers($filters = []) {
    global $pdo;
    $sql = "SELECT * FROM stores_users WHERE 1=1";
    if (!empty($filters['store_id'])) {
        $sql .= " AND store_id = :store_id";
    }
    if (!empty($filters['user_id'])) {
        $sql .= " AND user_id = :user_id";
    }
    $stmt = $pdo->prepare($sql);
    foreach ($filters as $key => $value) {
        $stmt->bindValue(":$key", $value);
    }
    $stmt->execute();
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
}

// Função para deletar uma relação loja-usuário
function deleteStoreUser($id) {
    global $pdo;
    $sql = "DELETE FROM stores_users WHERE id = :id";
    $stmt = $pdo->prepare($sql);
    $stmt->bindParam(':id', $id);
    return $stmt->execute();
}
?>
