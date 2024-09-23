<?php
session_start();
include '../config.php';

header('Content-Type: application/json');

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $id = $_POST['storeId'] ?? '';
    $nome = $_POST['nome'] ?? '';
    $cnpj = $_POST['cnpj'] ?? '';
    $status = $_POST['status'] ?? '';
    $endereco = $_POST['endereco'] ?? '';
    $cidade = $_POST['cidade'] ?? '';
    $estado = $_POST['estado'] ?? '';
    $anotacao = $_POST['anotacao'] ?? '';
    $telefone = $_POST['telefone'] ?? '';
    $email = $_POST['email'] ?? '';
    $instagram = $_POST['instagram'] ?? '';
    $site = $_POST['site'] ?? '';
    $decisor = $_POST['decisor'] ?? '';
    $telefone_decisor = $_POST['telefone_decisor'] ?? '';
    $marcadores = $_POST['marcadores'] ?? [];

    if (empty($id)) {
        echo json_encode(['success' => false, 'message' => 'ID da loja é obrigatório.']);
        exit;
    }

    try {
        // Atualizando a loja
        $stmt = $pdo->prepare("UPDATE stores SET nome = ?, cnpj = ?, status = ?, endereco = ?, cidade = ?, estado = ?, anotacao = ?, telefone = ?, email = ?, instagram = ?, site = ?, decisor = ?, telefone_decisor = ? WHERE id = ?");
        $stmt->execute([$nome, $cnpj, $status, $endereco, $cidade, $estado, $anotacao, $telefone, $email, $instagram, $site, $decisor, $telefone_decisor, $id]);

        // Sucesso ao atualizar
        echo json_encode(['success' => true, 'message' => 'Loja atualizada com sucesso!']);
    } catch (Exception $e) {
        echo json_encode(['success' => false, 'message' => 'Erro ao atualizar a loja: ' . $e->getMessage()]);
    }
} else {
    echo json_encode(['success' => false, 'message' => 'Método de solicitação inválido.']);
}
