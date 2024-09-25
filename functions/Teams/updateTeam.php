<?php
include '../config.php';

header('Content-Type: application/json');

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Captura os dados do formulário
    $id = $_POST['team_id']; // Certifique-se de que o nome do campo seja 'team_id' no formulário
    $nome = $_POST['name'];
    $descricao = $_POST['description'];
    $manager_id = isset($_POST['manager_id']) ? $_POST['manager_id'] : null; // Campo opcional para 'manager_id'

    try {
        // Preparar a query de atualização
        if ($manager_id !== null) {
            $stmt = $pdo->prepare("UPDATE teams SET name = ?, description = ?, manager_id = ? WHERE id = ?");
            $params = [$nome, $descricao, $manager_id, $id];
        } else {
            $stmt = $pdo->prepare("UPDATE teams SET name = ?, description = ? WHERE id = ?");
            $params = [$nome, $descricao, $id];
        }

        // Executar a query
        if ($stmt->execute($params)) {
            echo json_encode(['success' => true]);
        } else {
            echo json_encode(['success' => false, 'message' => 'Erro ao atualizar equipe.']);
        }
    } catch (PDOException $e) {
        echo json_encode(['success' => false, 'message' => 'Erro ao atualizar equipe: ' . $e->getMessage()]);
    }
} else {
    echo json_encode(['success' => false, 'message' => 'Requisição inválida.']);
}
?>
