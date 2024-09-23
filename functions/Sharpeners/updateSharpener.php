<?php
session_start();
include '../config.php';

header('Content-Type: application/json');

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $id = $_POST['id'] ?? '';
    $nome = $_POST['nome'] ?? '';
    $endereco = $_POST['endereco'] ?? '';
    $cep = $_POST['cep'] ?? '';
    $instagram = $_POST['instagram'] ?? '';
    $email = $_POST['email'] ?? '';
    $cpf = $_POST['cpf'] ?? '';
    $cidade = $_POST['cidade'] ?? '';
    $estado = $_POST['estado'] ?? '';
    $telefone = $_POST['telefone'] ?? '';
    $bairro = $_POST['bairro'] ?? '';
    $status = $_POST['status'] ?? '';

    if (empty($id)) {
        echo json_encode(['success' => false, 'message' => 'ID do afiador é obrigatório.']);
        exit;
    }

    try {
        $stmt = $pdo->prepare("UPDATE sharpeners SET nome = ?, endereco = ?, cep = ?, instagram = ?, email = ?, cpf = ?, cidade = ?, uf = ?, telefone = ?, bairro = ?, status = ? WHERE id = ?");
        $stmt->execute([$nome, $endereco, $cep, $instagram, $email, $cpf, $cidade, $estado, $telefone, $bairro, $status, $id]);
        echo json_encode(['success' => true, 'message' => 'Afiador atualizado com sucesso!']);
    } catch (PDOException $e) {
        echo json_encode(['success' => false, 'message' => 'Erro ao atualizar afiador: ' . $e->getMessage()]);
    }
} else {
    echo json_encode(['success' => false, 'message' => 'Método de solicitação inválido.']);
}
?>
