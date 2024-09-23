<?php
header('Content-Type: application/json');
require_once '../config.php'; // Certifique-se de que o caminho para a conexão com o banco de dados está correto

try {
    if (isset($_GET['estado_id'])) {
        $estadoId = intval($_GET['estado_id']);

        // Consulta para selecionar as mesorregiões relacionadas ao estado
        $stmt = $pdo->prepare("SELECT id, nome FROM mesorregioes WHERE estado_id = :estado_id");
        $stmt->execute(['estado_id' => $estadoId]);
        $mesorregioes = $stmt->fetchAll(PDO::FETCH_ASSOC);

        if ($mesorregioes) {
            echo json_encode(['success' => true, 'mesorregioes' => $mesorregioes]);
        } else {
            echo json_encode(['success' => false, 'message' => 'Nenhuma mesorregião encontrada para esse estado.']);
        }
    } else {
        echo json_encode(['success' => false, 'message' => 'ID do estado não fornecido.']);
    }
} catch (Exception $e) {
    echo json_encode(['success' => false, 'message' => 'Erro no servidor: ' . $e->getMessage()]);
}
