<?php
include __DIR__ . '../config.php';

function getAllRepresentatives($pdo) {
    $stmt = $pdo->query("SELECT * FROM representatives");
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
}


function getRepresentativeById($pdo, $id) {
    $stmt = $pdo->prepare("SELECT * FROM representatives WHERE id = ?");
    $stmt->execute([$id]);
    return $stmt->fetch(PDO::FETCH_ASSOC);
}

function saveRepresentative($pdo, $data) {
    if (!empty($data['id'])) {
        $stmt = $pdo->prepare("
            UPDATE representatives 
            SET nome = ?, telefone = ?, email = ?, cidade = ?, estado = ?, marcas = ?, status = ?
            WHERE id = ?
        ");
        return $stmt->execute([
            $data['nome'], $data['telefone'], $data['email'], $data['cidade'], $data['estado'], $data['marcas'], $data['status'], $data['id']
        ]);
    } else {
        $stmt = $pdo->prepare("
            INSERT INTO representatives (nome, telefone, email, cidade, estado, marcas, status) 
            VALUES (?, ?, ?, ?, ?, ?, ?)
        ");
        return $stmt->execute([
            $data['nome'], $data['telefone'], $data['email'], $data['cidade'], $data['estado'], $data['marcas'], $data['status']
        ]);
    }
}

function deleteRepresentative($pdo, $id) {
    $stmt = $pdo->prepare("DELETE FROM representatives WHERE id = ?");
    return $stmt->execute([$id]);
}
?>
