<?php
include '../config.php';

header('Content-Type: application/json');

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $id = $_POST['id'];
    $nome = $_POST['nome'];
    $cor = $_POST['cor'];

    try {
        $stmt = $pdo->prepare("UPDATE markers SET nome = ?, cor = ? WHERE id = ?");
        if ($stmt->execute([$nome, $cor, $id])) {
            echo json_encode(['success' => true]);
        } else {
            echo json_encode(['success' => false, 'message' => 'Erro ao atualizar marcador.']);
        }
    } catch (PDOException $e) {
        echo json_encode(['success' => false, 'message' => 'Erro ao atualizar marcador: ' . $e->getMessage()]);
    }
} else {
    echo json_encode(['success' => false, 'message' => 'Requisição inválida.']);
}
?>
