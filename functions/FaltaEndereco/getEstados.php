<?php
header('Content-Type: application/json');
require_once '../config.php'; // Certifique-se de que o caminho para a conexão com o banco de dados está correto

try {
    // Consulta para selecionar os estados
    $stmt = $pdo->query("SELECT id, nome, sigla FROM estados");
    $estados = $stmt->fetchAll(PDO::FETCH_ASSOC);

    if ($estados) {
        echo json_encode(['success' => true, 'estados' => $estados]);
    } else {
        echo json_encode(['success' => false, 'message' => 'Nenhum estado encontrado.']);
    }
} catch (Exception $e) {
    echo json_encode(['success' => false, 'message' => 'Erro no servidor: ' . $e->getMessage()]);
}
