<?php
include '../config.php';

// Verifica se os dados foram enviados
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Valida os dados recebidos
    $nome = trim($_POST['nome']);
    $email = filter_var($_POST['email'], FILTER_VALIDATE_EMAIL);
    $senha = trim($_POST['senha']);
    $tipo = trim($_POST['tipo']);
    $status = trim($_POST['status']);
    $function = trim($_POST['function']);

    // Verifica se todos os campos foram preenchidos corretamente
    if ($nome && $email && $senha && $tipo && $status && $function) {
        // Prepara a query para inserir os dados no banco de dados
        $sql = "INSERT INTO users (nome, email, senha, tipo, status, function) VALUES (?, ?, ?, ?, ?, ?)";
        $stmt = $pdo->prepare($sql);

        // Executa a query
        if ($stmt->execute([$nome, $email, $senha, $tipo, $status, $function])) {
            echo json_encode(['success' => true]);
        } else {
            echo json_encode(['success' => false, 'message' => 'Erro ao adicionar usuário.']);
        }
    } else {
        echo json_encode(['success' => false, 'message' => 'Dados inválidos fornecidos.']);
    }
} else {
    echo json_encode(['success' => false, 'message' => 'Método de requisição inválido.']);
}
?>
