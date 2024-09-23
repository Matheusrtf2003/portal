<?php
require 'config.php';

// Função para criar uma nova relação loja-marcador
function createStoreMarker($data) {
    global $pdo;
    $sql = "INSERT INTO stores_markers (loja_id, marcador_id) VALUES (:loja_id, :marcador_id)";
    $stmt = $pdo->prepare($sql);
    return $stmt->execute($data);
}

// Função para ler relações loja-marcador
function readStoreMarkers($filters = []) {
    global $pdo;
    $sql = "SELECT * FROM stores_markers WHERE 1=1";
    if (!empty($filters['loja_id'])) {
        $sql .= " AND loja_id = :loja_id";
    }
    if (!empty($filters['marcador_id'])) {
        $sql .= " AND marcador_id = :marcador_id";
    }
    $stmt = $pdo->prepare($sql);
    foreach ($filters as $key => $value) {
        $stmt->bindValue(":$key", $value);
    }
    $stmt->execute();
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
}

// Função para deletar uma relação loja-marcador
function deleteStoreMarker($id) {
    global $pdo;
    $sql = "DELETE FROM stores_markers WHERE id = :id";
    $stmt = $pdo->prepare($sql);
    $stmt->bindParam(':id', $id);
    return $stmt->execute();
}
?>
