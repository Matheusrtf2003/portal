<?php
include '../config.php';

$id = $_POST['id'];
$nome = $_POST['nome'];
$email = $_POST['email'];
$senha = $_POST['senha'];
$tipo = $_POST['tipo'];
$status = $_POST['status'];
$funcao = $_POST['function'];
$agendorApiKey = $_POST['agendor_api_key']; // Captura a chave de API

$sql = "UPDATE users SET nome = ?, email = ?, senha = ?, tipo = ?, status = ?, function = ?, agendor_api_key = ? WHERE id = ?";
$stmt = $pdo->prepare($sql);
$stmt->execute([$nome, $email, $senha, $tipo, $status, $funcao, $agendorApiKey, $id]);

echo json_encode(["success" => true]);
