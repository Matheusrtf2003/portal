<?php
session_start();
include '../config.php';

header('Content-Type: application/json');

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $nome = $_POST['nome'] ?? '';
    $endereco = $_POST['endereco'] ?? '';
    $cep = $_POST['cep'] ?? '';
    $instagram = $_POST['instagram'] ?? '';
    $email = $_POST['email'] ?? '';
    $cpf = $_POST['cpf'] ?? '';
    $cidade = $_POST['cidade'] ?? '';
    $uf = $_POST['uf'] ?? '';  // Corrigi o nome da variável, já que o banco de dados parece usar 'uf'
    $telefone = $_POST['telefone'] ?? '';
    $bairro = $_POST['bairro'] ?? '';
    $status = $_POST['status'] ?? '';
    $situacao = $_POST['situacao'] ?? '';
    
    // Obtém o ID do usuário logado a partir da sessão
    $userId = $_SESSION['user_id'] ?? null;

    if ($userId === null) {
        echo json_encode(['success' => false, 'message' => 'Usuário não autenticado.']);
        exit;
    }

    try {
        // Inicia a transação
        $pdo->beginTransaction();

        // Inserção na tabela sharpeners
        $stmt = $pdo->prepare("INSERT INTO sharpeners (nome, endereco, cep, instagram, email, cpf, cidade, uf, telefone, bairro, status, situacao) 
                               VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
        $stmt->execute([
            $nome,
            $endereco,
            $cep,
            $instagram,
            $email,
            $cpf,
            $cidade,
            $uf,
            $telefone,
            $bairro,
            $status,
            $situacao
        ]);

        // Obtém o ID do afiador recém-inserido
        $sharpenerId = $pdo->lastInsertId();

        // Inserção na tabela sharpeners_users
        $stmt = $pdo->prepare("INSERT INTO sharpeners_users (sharpener_id, user_id) VALUES (?, ?)");
        $stmt->execute([$sharpenerId, $userId]);

        // Confirma a transação
        $pdo->commit();

        echo json_encode(['success' => true, 'message' => 'Afiador adicionado com sucesso!']);
    } catch (PDOException $e) {
        // Reverte a transação em caso de erro
        $pdo->rollBack();
        echo json_encode(['success' => false, 'message' => 'Erro ao adicionar afiador: ' . $e->getMessage()]);
    }
} else {
    echo json_encode(['success' => false, 'message' => 'Método de solicitação inválido.']);
}
?>
