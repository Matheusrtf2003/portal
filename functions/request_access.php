<?php
include 'config.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $nome = $_POST['nome'];
    $email = $_POST['email'];
    $senha = $_POST['senha'];
    $confirm_senha = $_POST['confirm_senha'];

    if ($senha !== $confirm_senha) {
        echo json_encode(['success' => false, 'message' => 'As senhas não coincidem.']);
        exit;
    }

    $tipo = 'Padrão';
    $status = 'Solicitado';

    $stmt = $pdo->prepare("INSERT INTO users (nome, email, senha, status, tipo) VALUES (?, ?, ?, ?, ?)");
    if ($stmt->execute([$nome, $email, $senha, $status, $tipo])) {
        echo json_encode(['success' => true]);
    } else {
        echo json_encode(['success' => false, 'message' => 'Erro ao registrar.']);
    }
}
?>
