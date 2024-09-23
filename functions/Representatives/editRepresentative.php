<?php
include '../config.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $id = $_POST['id'];
    $nome = $_POST['nome'];
    $telefone = $_POST['telefone'];
    $email = $_POST['email'];
    $cidade = $_POST['cidade'];
    $estado = $_POST['estado'];
    $marcas = $_POST['marcas'];
    $status = $_POST['status'];

    $stmt = $pdo->prepare("UPDATE representantes SET nome = ?, telefone = ?, email = ?, cidade = ?, estado = ?, marcas = ?, status = ? WHERE id = ?");
    $stmt->execute([$nome, $telefone, $email, $cidade, $estado, $marcas, $status, $id]);

    header('Location: ../../representantes.php');
    exit;
}
