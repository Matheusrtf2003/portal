<?php
session_start();
include '../config.php';

header('Content-Type: application/json');

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Captura os dados do corpo da requisição
    $data = json_decode(file_get_contents('php://input'), true);

    // Verifique se o storeId foi passado corretamente
    $storeId = intval($data['storeId'] ?? 0);
    if ($storeId === 0) {
        echo json_encode(['success' => false, 'message' => 'ID da loja é obrigatório.']);
        exit;
    }

    // Captura os outros campos
    $nome = $data['nome'] ?? '';
    $cnpj = $data['cnpj'] ?? '';
    $status = $data['status'] ?? '';
    $markerId = intval($data['marker'] ?? 0); // ID do marcador
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

    try {
        // Inicia uma transação
        $pdo->beginTransaction();

        // Atualiza as informações da loja
        $stmt = $pdo->prepare("UPDATE stores SET nome = ?, cnpj = ?, status = ?, endereco = ?, cidade = ?, estado = ?, anotacao = ?, telefone = ?, email = ?, instagram = ?, site = ?, decisor = ?, telefone_decisor = ? WHERE id = ?");
        $stmt->execute([$nome, $cnpj, $status, $endereco, $cidade, $estado, $anotacao, $telefone, $email, $instagram, $site, $decisor, $telefone_decisor, $storeId]);

        // Atualiza o marcador associado à loja
        // Primeiro, remove o marcador anterior
        $stmt = $pdo->prepare("DELETE FROM stores_markers WHERE loja_id = ?");  // Atualize 'loja_id' conforme necessário
        $stmt->execute([$storeId]);

        // Em seguida, insere o novo marcador (se houver)
        if ($markerId > 0) {
            $stmt = $pdo->prepare("INSERT INTO stores_markers (loja_id, marcador_id) VALUES (?, ?)");  // Atualize 'loja_id' conforme necessário
            $stmt->execute([$storeId, $markerId]);
        }

        // Confirma a transação
        $pdo->commit();
        echo json_encode(['success' => true, 'message' => 'Loja e marcador atualizados com sucesso!']);

    } catch (Exception $e) {
        // Se a transação foi iniciada, faz o rollback
        if ($pdo->inTransaction()) {
            $pdo->rollBack();
        }
        echo json_encode(['success' => false, 'message' => 'Erro ao atualizar a loja: ' . $e->getMessage()]);
    }
} else {
    echo json_encode(['success' => false, 'message' => 'Método de solicitação inválido.']);
}
