<?php
include '../config.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $id = $_POST['id'];
    $nome = $_POST['nome'];
    $telefone = $_POST['telefone'];
    $email = $_POST['email'];
    $cidade = $_POST['cidade'];
    $estado = $_POST['estado'];
    $marcas = $_POST['marcas'];
    $status = $_POST['status'];

    try {
        $stmt = $pdo->prepare("UPDATE representatives SET nome = ?, telefone = ?, email = ?, cidade = ?, estado = ?, marcas = ?, status = ? WHERE id = ?");
        $stmt->execute([$nome, $telefone, $email, $cidade, $estado, $marcas, $status, $id]);

        echo json_encode(['success' => true]);
    } catch (Exception $e) {
        echo json_encode(['success' => false, 'message' => 'Erro ao editar representante: ' . $e->getMessage()]);
    }
}
?>
