<?php
include '../config.php'; // Inclua seu arquivo de configuração para conexão com o banco de dados

$response = array('success' => false);

$data = json_decode(file_get_contents("php://input"), true);

try {
    $sql = "INSERT INTO educators (nome, cpf, data_nascimento, endereco, cidade, estado, cep, mesorregiao, instagram, seguidores, site, datetime, turma, status, atuacao, tecnicas, telefone, email)
            VALUES (:nome, :cpf, :data_nascimento, :endereco, :cidade, :estado, :cep, :mesorregiao, :instagram, :seguidores, :site, :datetime, :turma, :status, :atuacao, :tecnicas, :telefone, :email)";
    $stmt = $pdo->prepare($sql);

    $stmt->execute([
        ':nome' => $data['nome'],
        ':cpf' => $data['cpf'],
        ':data_nascimento' => $data['data_nascimento'],
        ':endereco' => $data['endereco'],
        ':cidade' => $data['cidade'],
        ':estado' => $data['estado'],
        ':cep' => $data['cep'],
        ':mesorregiao' => $data['mesorregiao'],
        ':instagram' => $data['instagram'],
        ':seguidores' => $data['seguidores'],
        ':site' => $data['site'],
        ':datetime' => date('Y-m-d H:i:s'),
        ':turma' => $data['turma'],
        ':status' => $data['status'],
        ':atuacao' => $data['atuacao'],
        ':tecnicas' => $data['tecnicas'],
        ':telefone' => $data['telefone'],
        ':email' => $data['email']
    ]);

    $response['success'] = true;
    $response['message'] = "Educadora adicionada com sucesso.";
} catch (PDOException $e) {
    $response['message'] = "Erro ao adicionar educadora: " . $e->getMessage();
}

echo json_encode($response);
?>
