<?php
// Inclui a configuração do banco de dados
include '../config.php';

$nome = $_POST['nome'];
$email = $_POST['email'];
$senha = $_POST['senha'];
$tipo = $_POST['tipo'];
$status = $_POST['status'];
$funcao = $_POST['function'];
$agendorApiKey = $_POST['agendor_api_key']; // Captura a chave de API

$sql = "INSERT INTO users (nome, email, senha, tipo, status, function, agendor_api) VALUES (?, ?, ?, ?, ?, ?, ?)";
$stmt = $pdo->prepare($sql);
$stmt->execute([$nome, $email, $senha, $tipo, $status, $funcao, $agendorApiKey]);

echo json_encode(["success" => true]);
