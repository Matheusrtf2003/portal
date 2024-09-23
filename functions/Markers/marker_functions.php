<?php
require '../config.php';

// Função para criar um novo marcador
function createMarker($data) {
    global $pdo;
    $sql = "INSERT INTO markers (nome, cor) VALUES (:nome, :cor)";
    $stmt = $pdo->prepare($sql);
    return $stmt->execute($data);
}

// Função para ler marcadores
function readMarkers() {
    global $pdo;
    $sql = "SELECT * FROM markers";
    $stmt = $pdo->prepare($sql);
    $stmt->execute();
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
}

// Função para atualizar um marcador
function updateMarker($id, $data) {
    global $pdo;
    $sql = "UPDATE markers SET nome = :nome, cor = :cor WHERE id = :id";
    $stmt = $pdo->prepare($sql);
    $data['id'] = $id;
    return $stmt->execute($data);
}

// Função para deletar um marcador
function deleteMarker($id) {
    global $pdo;
    $sql = "DELETE FROM markers WHERE id = :id";
    $stmt = $pdo->prepare($sql);
    $stmt->bindParam(':id', $id);
    return $stmt->execute();
}
?>
