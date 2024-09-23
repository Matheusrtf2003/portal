<?php
require '../config.php';

// Função para criar um novo usuário
function createUser($data) {
    global $pdo;
    $sql = "INSERT INTO users (nome, senha, email, tipo, status, function) VALUES (:nome, :senha, :email, :tipo, :status, :function)";
    $stmt = $pdo->prepare($sql);
    return $stmt->execute($data);
}

// Função para ler usuários com filtros opcionais
function readUsers($filters = []) {
    global $pdo;
    $sql = "SELECT * FROM users WHERE 1=1";
    if (!empty($filters['status'])) {
        $sql .= " AND status = :status";
    }
    if (!empty($filters['tipo'])) {
        $sql .= " AND tipo = :tipo";
    }
    if (!empty($filters['nome'])) {
        $sql .= " AND nome LIKE :nome";
    }
    $stmt = $pdo->prepare($sql);
    foreach ($filters as $key => $value) {
        $stmt->bindValue(":$key", $value);
    }
    $stmt->execute();
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
}

// Função para atualizar um usuário
function updateUser($id, $data) {
    global $pdo;
    $sql = "UPDATE users SET nome = :nome, senha = :senha, email = :email, tipo = :tipo, status = :status, function = :function WHERE id = :id";
    $stmt = $pdo->prepare($sql);
    $data['id'] = $id;
    return $stmt->execute($data);
}

// Função para deletar um usuário
function deleteUser($id) {
    global $pdo;
    $sql = "DELETE FROM users WHERE id = :id";
    $stmt = $pdo->prepare($sql);
    $stmt->bindParam(':id', $id);
    return $stmt->execute();
}
?>
