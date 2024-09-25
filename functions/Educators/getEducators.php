<?php
include '../config.php'; // Inclua seu arquivo de configuração para conexão com o banco de dados

$response = array('success' => false);

try {
    $stmt = $pdo->query("SELECT * FROM educators ORDER BY id DESC");
    $educators = $stmt->fetchAll(PDO::FETCH_ASSOC);

    if ($educators) {
        $response['success'] = true;
        $response['educators'] = $educators;
    } else {
        $response['message'] = "Nenhuma educadora encontrada.";
    }
} catch (PDOException $e) {
    $response['message'] = "Erro ao carregar educadoras: " . $e->getMessage();
}

echo json_encode($response);
?>
