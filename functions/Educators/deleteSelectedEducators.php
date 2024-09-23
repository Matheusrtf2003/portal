<?php
include '../config.php'; // Inclua seu arquivo de configuração para conexão com o banco de dados

$response = array('success' => false);

$data = json_decode(file_get_contents("php://input"), true);
$ids = $data['ids'];

if (!empty($ids)) {
    try {
        $idsString = implode(',', array_map('intval', $ids));
        $sql = "DELETE FROM educators WHERE id IN ($idsString)";
        $stmt = $pdo->prepare($sql);
        $stmt->execute();

        $response['success'] = true;
        $response['message'] = "Educadoras excluídas com sucesso.";
    } catch (PDOException $e) {
        $response['message'] = "Erro ao excluir educadoras: " . $e->getMessage();
    }
} else {
    $response['message'] = "Nenhuma educadora selecionada.";
}

echo json_encode($response);
?>
