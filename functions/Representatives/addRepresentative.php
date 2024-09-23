<?php
include '../config.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $nome = $_POST['nome'];
    $telefone = $_POST['telefone'];
    $email = $_POST['email'];
    $cidade = $_POST['cidade'];
    $estado = $_POST['estado'];
    $marcas = $_POST['marcas'];
    $status = $_POST['status'];

    try {
        $stmt = $pdo->prepare("INSERT INTO representatives (nome, telefone, email, cidade, estado, marcas, status) VALUES (?, ?, ?, ?, ?, ?, ?)");
        $stmt->execute([$nome, $telefone, $email, $cidade, $estado, $marcas, $status]);

        echo json_encode(['success' => true]);
    } catch (Exception $e) {
        echo json_encode(['success' => false, 'message' => 'Erro ao adicionar representante: ' . $e->getMessage()]);
    }
}
?>
