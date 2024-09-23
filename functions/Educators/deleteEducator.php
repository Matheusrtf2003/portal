<?php
include '../config.php'; // Inclua seu arquivo de configuração para conexão com o banco de dados

$response = array('success' => false);

$id = $_GET['id'];

try {
    $sql = "DELETE FROM educators WHERE id=:id";
    $stmt = $pdo->prepare($sql);
    $stmt->execute([':id' => $id]);

    $response['success'] = true;
    $response['message'] = "Educadora excluída com sucesso.";
} catch (PDOException $e) {
    $response['message'] = "Erro ao excluir educadora: " . $e->getMessage();
}

echo json_encode($response);
?>
