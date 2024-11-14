<?php
session_start();
if (!isset($_SESSION['user_id'])) {
    echo json_encode(["success" => false, "error" => "Usuário não autenticado."]);
    exit();
}

include '../functions/config.php';

// ID da loja enviado via GET
if (isset($_GET['storeId'])) {
    $storeId = $_GET['storeId'];
    $userId = $_SESSION['user_id'];

    // Consulta para obter o nome do usuário com base no ID
    $stmt = $pdo->prepare("SELECT nome FROM users WHERE id = :userId");
    $stmt->execute([':userId' => $userId]);
    $user = $stmt->fetch(PDO::FETCH_ASSOC);

    if ($user) {
        $userName = $user['nome'];

        // Atualizar o status_agendor na tabela stores com o nome do usuário
        $updateStmt = $pdo->prepare("UPDATE stores SET agendor_status = :userName WHERE id = :storeId");
        $updateStmt->execute([':userName' => $userName, ':storeId' => $storeId]);

        if ($updateStmt->rowCount() > 0) {
            echo json_encode(["success" => true, "message" => "Status atualizado com sucesso"]);
        } else {
            echo json_encode(["success" => false, "error" => "Falha ao atualizar o status"]);
        }
    } else {
        echo json_encode(["success" => false, "error" => "Usuário não encontrado."]);
    }
} else {
    echo json_encode(["success" => false, "error" => "ID da loja não fornecido."]);
}
?>
