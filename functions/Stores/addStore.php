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
            $stmt = $pdo->prepare("
                UPDATE stores 
                SET nome = ?, cnpj = ?, status = ?, anotacao = ?, endereco = ?, cidade = ?, estado = ?, mesorregiao = ?, telefone = ?, instagram = ?, site = ?, decisor = ?, telefone_decisor = ?, email = ?
                WHERE id = ?
            ");
            $stmt->execute([$nome, $cnpj, $status, $anotacao, $endereco, $cidade, $estado, $mesorregiao, $telefone, $instagram, $site, $decisor, $telefone_decisor, $email, $storeId]);

            $message = 'Loja atualizada com sucesso!';
        } else {
            $stmt = $pdo->prepare("
                INSERT INTO stores 
                    (nome, cnpj, status, anotacao, endereco, cidade, estado, mesorregiao, telefone, instagram, site, decisor, telefone_decisor, email) 
                VALUES 
                    (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
            ");
            $stmt->execute([$nome, $cnpj, $status, $anotacao, $endereco, $cidade, $estado, $mesorregiao, $telefone, $instagram, $site, $decisor, $telefone_decisor, $email]);
            $storeId = $pdo->lastInsertId();

            // Inserir na tabela stores_users
            $stmt = $pdo->prepare("INSERT INTO stores_users (store_id, user_id) VALUES (?, ?)");
            $stmt->execute([$storeId, $userId]);

            $message = 'Loja adicionada com sucesso!';
        }

        $pdo->commit();
        echo json_encode(['success' => true, 'message' => $message]);
    } catch (Exception $e) {
        $pdo->rollBack();
        echo json_encode(['success' => false, 'message' => 'Erro ao salvar loja: ' . $e->getMessage()]);
    }
}
?>
