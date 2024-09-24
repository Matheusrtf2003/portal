<?php
session_start();
include '../config.php';

header('Content-Type: application/json');

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Captura os dados do corpo da requisição
    $data = json_decode(file_get_contents('php://input'), true);

    // Verifique se o storeId foi passado corretamente
    $id = intval($data['storeId'] ?? 0);
    if ($id === 0) {
        echo json_encode(['success' => false, 'message' => 'ID da loja é obrigatório.']);
        exit;
    }

    // Captura os outros campos
    $nome = $data['nome'] ?? '';
    $cnpj = $data['cnpj'] ?? '';
    $status = $data['status'] ?? '';
    $endereco = $data['endereco'] ?? '';
    $cidade = $data['cidade'] ?? '';
    $estado = $data['estado'] ?? '';
    $anotacao = $data['anotacao'] ?? '';
    $telefone = $data['telefone'] ?? '';
    $email = $data['email'] ?? '';
    $instagram = $data['instagram'] ?? '';
    $site = $data['site'] ?? '';
    $decisor = $data['decisor'] ?? '';
    $telefone_decisor = $data['telefone_decisor'] ?? '';
    $marcadores = $data['marcadores'] ?? [];

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
