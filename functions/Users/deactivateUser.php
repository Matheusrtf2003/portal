<?php
include '../config.php';

$id = $_GET['id'];

$sql = "UPDATE users SET status = 'inactive' WHERE id = ?";
$stmt = $pdo->prepare($sql);

if ($stmt->execute([$id])) {
    echo json_encode(['success' => true]);
} else {
    echo json_encode(['success' => false, 'message' => 'Erro ao desativar usuário.']);
}
?>
