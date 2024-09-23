<?php
include '../config.php';

header('Content-Type: application/json');

// Decodifica o JSON recebido
$input = json_decode(file_get_contents('php://input'), true);
$id = $input['id'] ?? null;

if (!$id) {
    echo json_encode(['success' => false, 'message' => 'ID do representante não fornecido.']);
    exit;
}

try {
    // Verifica se a conexão com o banco de dados foi estabelecida
    if (!isset($pdo)) {
        echo json_encode(['success' => false, 'message' => 'Erro na conexão com o banco de dados.']);
        exit;
    }

    // Prepara e executa a consulta para deletar o representante
    $stmt = $pdo->prepare('DELETE FROM representatives WHERE id = ?');
    $stmt->execute([$id]);

    echo json_encode(['success' => true, 'message' => 'Representante excluído com sucesso.']);
} catch (PDOException $e) {
    echo json_encode(['success' => false, 'message' => 'Erro ao excluir representante: ' . $e->getMessage()]);
}
