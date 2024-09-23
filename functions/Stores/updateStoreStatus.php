<?php
require '../config.php';  // Inclui o arquivo de conexão PDO

header('Content-Type: application/json');

$data = json_decode(file_get_contents('php://input'), true);

if (isset($data['cnpj']) && isset($data['status'])) {
    $cnpj = $data['cnpj'];
    $status = $data['status'];

    try {
        $stmt = $pdo->prepare("UPDATE stores SET status = :status WHERE cnpj = :cnpj");
        $stmt->execute(['status' => $status, 'cnpj' => $cnpj]);

        echo json_encode(['success' => true]);
    } catch (Exception $e) {
        echo json_encode(['success' => false, 'message' => 'Erro ao atualizar o status: ' . $e->getMessage()]);
    }
} else {
    echo json_encode(['success' => false, 'message' => 'Dados inválidos']);
}
?>
