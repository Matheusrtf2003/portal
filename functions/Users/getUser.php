<?php
include '../config.php';

header('Content-Type: application/json'); // Define o cabeçalho para JSON

if ($_SERVER['REQUEST_METHOD'] == 'GET') {
    $id = isset($_GET['id']) ? (int)$_GET['id'] : 0;  // Sanitiza o ID para garantir que seja um número inteiro

    if ($id > 0) {
        // Prepara a consulta para buscar o usuário
        $stmt = $pdo->prepare("SELECT id, nome, email, tipo, status, function FROM users WHERE id = ?");
        $stmt->execute([$id]);
        $user = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($user) {
            // Se encontrar o usuário, retorna os dados
            echo json_encode(['success' => true, 'data' => $user]);
        } else {
            // Caso o usuário não seja encontrado
            echo json_encode(['success' => false, 'message' => 'Usuário não encontrado.']);
        }
    } else {
        // Caso o ID não seja válido
        echo json_encode(['success' => false, 'message' => 'ID inválido fornecido.']);
    }
} else {
    // Caso o método de requisição seja diferente de GET
    echo json_encode(['success' => false, 'message' => 'Método de requisição inválido.']);
}
?>
