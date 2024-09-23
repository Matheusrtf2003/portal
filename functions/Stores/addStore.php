<?php
session_start();
include '../config.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $data = json_decode(file_get_contents('php://input'), true);
    
    // Obtenção dos campos do formulário
    $storeId = $data['storeId'] ?? null; // Verifica se há um ID de loja para atualização
    $nome = $data['nome'] ?? '';
    $cnpj = $data['cnpj'] ?? '';
    $status = $data['status'] ?? '';
    $endereco = $data['endereco'] ?? '';
    $cidade = $data['cidade'] ?? '';
    $estado = $data['estado'] ?? '';
    $mesorregiao = $data['mesorregiao'] ?? '';
    $telefone = $data['telefone'] ?? '';
    $instagram = $data['instagram'] ?? '';
    $site = $data['site'] ?? '';
    $decisor = $data['decisor'] ?? '';
    $telefone_decisor = $data['telefone_decisor'] ?? '';
    $email = $data['email'] ?? '';
    $userId = $_SESSION['user_id'] ?? null;

    try {
        $pdo->beginTransaction();

        // Se storeId existir, fazemos uma atualização, caso contrário, é uma inserção
        if ($storeId) {
            // Atualizar a loja existente
            $stmt = $pdo->prepare("
                UPDATE stores 
                SET nome = ?, cnpj = ?, status = ?, endereco = ?, cidade = ?, estado = ?, mesorregiao = ?, telefone = ?, instagram = ?, site = ?, decisor = ?, telefone_decisor = ?, email = ?
                WHERE id = ?
            ");
            $stmt->execute([$nome, $cnpj, $status, $endereco, $cidade, $estado, $mesorregiao, $telefone, $instagram, $site, $decisor, $telefone_decisor, $email, $storeId]);

            $message = 'Loja atualizada com sucesso!';
        } else {
            // Inserir uma nova loja
            $stmt = $pdo->prepare("
                INSERT INTO stores 
                    (nome, cnpj, status, endereco, cidade, estado, mesorregiao, telefone, instagram, site, decisor, telefone_decisor, email) 
                VALUES 
                    (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
            ");
            $stmt->execute([$nome, $cnpj, $status, $endereco, $cidade, $estado, $mesorregiao, $telefone, $instagram, $site, $decisor, $telefone_decisor, $email]);
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
