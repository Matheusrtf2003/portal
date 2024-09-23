<?php
include '../config.php'; // Inclua seu arquivo de configuração para conexão com o banco de dados

$response = array('success' => false);

$data = json_decode(file_get_contents("php://input"), true);

try {
    $sql = "UPDATE educators SET nome=:nome, cpf=:cpf, data_nascimento=:data_nascimento, endereco=:endereco, cidade=:cidade, estado=:estado, cep=:cep, mesorregiao=:mesorregiao, instagram=:instagram, seguidores=:seguidores, site=:site, datetime=:datetime, turma=:turma, status=:status, atuacao=:atuacao, tecnicas=:tecnicas, telefone=:telefone, email=:email WHERE id=:id";
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
        ':datetime' => $data['datetime'],
        ':turma' => $data['turma'],
        ':status' => $data['status'],
        ':atuacao' => $data['atuacao'],
        ':tecnicas' => $data['tecnicas'],
        ':telefone' => $data['telefone'],
        ':email' => $data['email'],
        ':id' => $data['id']
    ]);

    $response['success'] = true;
    $response['message'] = "Educadora atualizada com sucesso.";
} catch (PDOException $e) {
    $response['message'] = "Erro ao atualizar educadora: " . $e->getMessage();
}

echo json_encode($response);
?>
