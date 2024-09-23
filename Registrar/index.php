<?php
include 'functions/config.php';
header('Content-Type: application/json');

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $nome = $_POST['nome'];
    $email = $_POST['email'];
    $senha = $_POST['senha'];

    $stmt = $pdo->prepare("INSERT INTO users (nome, email, senha, status) VALUES (?, ?, ?, 'Solicitado')");
    if ($stmt->execute([$nome, $email])) {
        echo json_encode(['success' => true]);
    } else {
        echo json_encode(['success' => false, 'message' => 'Erro ao solicitar acesso.']);
    }
}
?>
