<?php
session_start();
include '../config.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $data = json_decode(file_get_contents('php://input'), true);

    // Obtenção dos campos do formulário
    $storeId = $data['storeId'] ?? null;
    $nome = trim($data['nome'] ?? '');
    $cnpj = trim($data['cnpj'] ?? '');
    $status = trim($data['status'] ?? '');
    $marker = trim($data['marker'] ?? '');
    $anotacao = trim($data['anotacao'] ?? '');
    $endereco = trim($data['endereco'] ?? '');
    $cidade = trim($data['cidade'] ?? '');
    $estado = trim($data['estado'] ?? '');
    $mesorregiao = trim($data['mesorregiao'] ?? '');
    $telefone = trim($data['telefone'] ?? '');
    $instagram = trim($data['instagram'] ?? '');
    $site = trim($data['site'] ?? '');
    $decisor = trim($data['decisor'] ?? '');
    $telefone_decisor = trim($data['telefone_decisor'] ?? '');
    $email = trim($data['email'] ?? '');
    $userId = $_SESSION['user_id'] ?? null;

    // Verificar campos obrigatórios
    if (!$nome || !$cnpj || !$status || !$endereco) {
        echo json_encode(['success' => false, 'message' => 'Campos obrigatórios faltando.']);
        exit;
    }

    try {
        $pdo->beginTransaction();

        // Se storeId existir, faz uma atualização, caso contrário, faz uma inserção
        if ($storeId) {
            // Atualizar loja
            $stmt = $pdo->prepare("
                UPDATE stores 
                SET nome = ?, cnpj = ?, status = ?, endereco = ?, cidade = ?, estado = ?, telefone = ?, instagram = ?, site = ?, decisor = ?, telefone_decisor = ?, email = ?
                WHERE id = ?
            ");
            $stmt->execute([$nome, $cnpj, $status, $endereco, $cidade, $estado, $telefone, $instagram, $site, $decisor, $telefone_decisor, $email, $storeId]);

            $message = 'Loja atualizada com sucesso!';
        } else {
            // Inserir nova loja
            $stmt = $pdo->prepare("
                INSERT INTO stores 
                    (nome, cnpj, status, endereco, cidade, estado, telefone, instagram, site, decisor, telefone_decisor, email) 
                VALUES 
                    (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
            ");
            $stmt->execute([$nome, $cnpj, $status, $endereco, $cidade, $estado, $telefone, $instagram, $site, $decisor, $telefone_decisor, $email]);
            $storeId = $pdo->lastInsertId();

            $message = 'Loja adicionada com sucesso!';
        }

        // Atualizar marcadores
        // Primeiro, remove todos os marcadores existentes para essa loja
        $stmt = $pdo->prepare("DELETE FROM stores_markers WHERE loja_id = ?");
        $stmt->execute([$storeId]);

        // Em seguida, insira os novos marcadores selecionados
        if (!empty($marker)) {
            $stmt = $pdo->prepare("INSERT INTO stores_markers (loja_id, marcador_id) VALUES (?, ?)");
            if ($marker) {
                $stmt->execute([$storeId, $marker]);
            }
        }

        // Vincular a loja ao usuário na tabela stores_users (se ainda não estiver vinculada)
        $stmt = $pdo->prepare("SELECT COUNT(*) FROM stores_users WHERE store_id = ? AND user_id = ?");
        $stmt->execute([$storeId, $userId]);
        $count = $stmt->fetchColumn();

        if ($count == 0) {
            $stmt = $pdo->prepare("INSERT INTO stores_users (store_id, user_id) VALUES (?, ?)");
            $stmt->execute([$storeId, $userId]);
        }

        $pdo->commit();
        echo json_encode(['success' => true, 'message' => $message]);

    } catch (Exception $e) {
        $pdo->rollBack();
        echo json_encode(['success' => false, 'message' => 'Erro ao salvar loja: ' . $e->getMessage()]);
    }
}
?>
