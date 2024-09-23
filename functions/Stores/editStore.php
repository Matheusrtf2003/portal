<?php
session_start();
include '../config.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $data = json_decode(file_get_contents('php://input'), true);
    
    $storeId = $data['id'] ?? null;
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

    if (!$storeId) {
        echo json_encode(['success' => false, 'message' => 'Dados obrigatórios não foram fornecidos.']);
        exit;
    }

    try {
        $stmt = $pdo->prepare("
            UPDATE stores 
            SET nome = ?, cnpj = ?, status = ?, endereco = ?, cidade = ?, estado = ?, mesorregiao = ?, telefone = ?, instagram = ?, site = ?, decisor = ?, telefone_decisor = ?, email = ?
            WHERE id = ?
        ");
        $stmt->execute([$nome, $cnpj, $status, $endereco, $cidade, $estado, $mesorregiao, $telefone, $instagram, $site, $decisor, $telefone_decisor, $email, $storeId]);

        echo json_encode(['success' => true, 'message' => 'Loja editada com sucesso!']);
    } catch (Exception $e) {
        echo json_encode(['success' => false, 'message' => 'Erro ao editar loja: ' . $e->getMessage()]);
    }
}
?>
