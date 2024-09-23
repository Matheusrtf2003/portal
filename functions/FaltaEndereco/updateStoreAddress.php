<?php
include('../config.php');

$data = json_decode(file_get_contents('php://input'), true);

$id = $data['id'];
$endereco = $data['endereco'];
$cidade = $data['cidade'];
$estado = $data['estado'];

$query = "UPDATE stores SET endereco = ?, cidade = ?, estado = ? WHERE id = ?";
$stmt = $db->prepare($query);
$stmt->bind_param('sssi', $endereco, $cidade, $estado, $id);

if ($stmt->execute()) {
    echo json_encode(['success' => true]);
} else {
    echo json_encode(['success' => false, 'message' => 'Erro ao atualizar o endereço.']);
}

$stmt->close();
?>
