<?php
header('Content-Type: application/json');

// Inclua seu arquivo de configuração de banco de dados
require 'config.php';

// Verifique se os dados necessários foram enviados via POST
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $storeId = $_POST['store_id'] ?? null;
    $newCredits = $_POST['new_credits'] ?? null;

    if ($storeId && $newCredits) {
        try {
            $stmt = $pdo->prepare('UPDATE stores SET credits = :credits WHERE id = :id');
            $stmt->execute([
                ':credits' => $newCredits,
                ':id' => $storeId
            ]);

            if ($stmt->rowCount() > 0) {
                echo json_encode(['status' => 'success', 'message' => 'Créditos atualizados com sucesso.']);
            } else {
                echo json_encode(['status' => 'error', 'message' => 'Nenhuma loja encontrada com esse ID.']);
            }
        } catch (PDOException $e) {
            echo json_encode(['status' => 'error', 'message' => 'Erro ao atualizar créditos: ' . $e->getMessage()]);
        }
    } else {
        echo json_encode(['status' => 'error', 'message' => 'Dados incompletos.']);
    }
} else {
    echo json_encode(['status' => 'error', 'message' => 'Método de requisição inválido.']);
}
?>
