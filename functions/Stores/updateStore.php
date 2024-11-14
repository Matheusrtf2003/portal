<?php
session_start();
include '../config.php';

header('Content-Type: application/json');

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Captura os dados do corpo da requisição
    $data = json_decode(file_get_contents('php://input'), true);

    // Verifica se o storeId foi passado corretamente
    $storeId = intval($data['storeId'] ?? 0);
    if ($storeId === 0) {
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
    $perfil_loja = $data['perfil_loja'] ?? 'ICP';  // Valor padrão se não existir

    // Recebe a lista de IDs de marcadores do formulário
    $markers = $data['markers'] ?? [];

    try {
        // Inicia uma transação
        $pdo->beginTransaction();

        // Atualiza as informações da loja
        $stmt = $pdo->prepare("UPDATE stores SET nome = ?, cnpj = ?, status = ?, endereco = ?, cidade = ?, estado = ?, anotacao = ?, telefone = ?, email = ?, instagram = ?, site = ?, decisor = ?, telefone_decisor = ?, perfil_loja = ? WHERE id = ?");
        $stmt->execute([$nome, $cnpj, $status, $endereco, $cidade, $estado, $anotacao, $telefone, $email, $instagram, $site, $decisor, $telefone_decisor, $perfil_loja, $storeId]);

        // Remove os marcadores antigos da loja
        $stmt = $pdo->prepare("DELETE FROM stores_markers WHERE loja_id = ?");
        $stmt->execute([$storeId]);

        // Insere os novos marcadores selecionados
        if (!empty($markers)) {
            $stmt = $pdo->prepare("INSERT INTO stores_markers (loja_id, marcador_id) VALUES (?, ?)");
            foreach ($markers as $markerId) {
                $stmt->execute([$storeId, intval($markerId)]);
            }
        }

        // Confirma a transação
        $pdo->commit();
        echo json_encode(['success' => true, 'message' => 'Loja e marcadores atualizados com sucesso!']);

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
