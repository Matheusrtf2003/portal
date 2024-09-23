<?php
include '../config.php';

header('Content-Type: application/json');

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    try {
        $data = json_decode(file_get_contents('php://input'), true);
        $nome = $data['nome'];
        $cor = $data['cor'];

        $sql = "INSERT INTO markers (nome, cor) VALUES (?, ?)";
        $stmt = $pdo->prepare($sql);

        if ($stmt->execute([$nome, $cor])) {
            echo json_encode(['success' => true]);
        } else {
            echo json_encode(['success' => false, 'message' => 'Erro ao salvar marcador.']);
        }
    } catch (Exception $e) {
        echo json_encode(['success' => false, 'message' => 'Erro: ' . $e->getMessage()]);
    }
}
?>
