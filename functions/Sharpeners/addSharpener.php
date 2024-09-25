<?php
session_start();
include '../config.php';

header('Content-Type: application/json');

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Coletando os dados do formulário
    $nome = $_POST['nome'] ?? '';
    $endereco = $_POST['endereco'] ?? '';
    $cep = $_POST['cep'] ?? '';
    $instagram = $_POST['instagram'] ?? '';
    $email = $_POST['email'] ?? '';
    $cpf = $_POST['cpf'] ?? '';
    $cidade = $_POST['cidade'] ?? '';
    $uf = $_POST['uf'] ?? '';
    $telefone = $_POST['telefone'] ?? '';
    $bairro = $_POST['bairro'] ?? '';
    $status = $_POST['status'] ?? '';
    $situacao = $_POST['situacao'] ?? '';
    
    // Verifica se o usuário está logado
    $userId = $_SESSION['user_id'] ?? null;

    if ($userId === null) {
        echo json_encode(['success' => false, 'message' => 'Usuário não autenticado.']);
        exit;
    }

    // Validação básica dos campos obrigatórios
    if (empty($nome) || empty($cpf) || !filter_var($email, FILTER_VALIDATE_EMAIL)) {
        echo json_encode(['success' => false, 'message' => 'Preencha todos os campos obrigatórios corretamente.']);
        exit;
    }

    try {
        // Inicia a transação
        $pdo->beginTransaction();

        // Inserção do afiador na tabela sharpeners
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

        // Vincula o afiador ao usuário logado
        $stmt = $pdo->prepare("INSERT INTO sharpeners_users (sharpener_id, user_id) VALUES (?, ?)");
        $stmt->execute([$sharpenerId, $userId]);

        // Confirma a transação
        $pdo->commit();

        echo json_encode(['success' => true, 'message' => 'Afiador adicionado com sucesso!']);
    } catch (PDOException $e) {
        // Reverte a transação em caso de erro
        $pdo->rollBack();
        error_log("Erro ao adicionar afiador: " . $e->getMessage());
        echo json_encode(['success' => false, 'message' => 'Erro ao adicionar afiador. Verifique o log de erros.']);
    }
} else {
    echo json_encode(['success' => false, 'message' => 'Método de solicitação inválido.']);
}
?>
