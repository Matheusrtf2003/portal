<?php
include '../config.php';

$id = $_POST['id'];
$nome = $_POST['nome'];
$email = $_POST['email'];
$tipo = $_POST['tipo'];
$status = $_POST['status'];
$senha = $_POST['senha'];

$sql = "UPDATE users SET nome = ?, email = ?, tipo = ?, status = ?, senha = ? WHERE id = ?";
$stmt = $pdo->prepare($sql);

if ($stmt->execute([$nome, $email, $tipo, $status, $senha, $id])) {
    echo json_encode(['success' => true]);
} else {
    echo json_encode(['success' => false, 'message' => 'Erro ao atualizar usuário.']);
}
?>
