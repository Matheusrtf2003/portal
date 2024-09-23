<?php
include '../config.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_FILES['file'])) {
    $file = $_FILES['file']['tmp_name'];

    if (($handle = fopen($file, 'r')) !== FALSE) {
        // Lendo a primeira linha (cabeçalho) para obter os índices das colunas
        $header = fgetcsv($handle, 1000, ";");

        // Definindo os índices das colunas conforme a ordem fornecida 
        //A ORDEM ESTÁ ERRADA, CORRIGIR
        $indices = [
            'turma' => 0,
            'nome' => 1,
            'instagram' => 5,
            'atuacao' => 6,
            'tecnicas' => 7,
            'seguidores' => 9,
            'cpf' => 20,
            'cep' => 21,
            'endereco' => 22,
            'cidade' => 23,
            'mesorregiao' => 24,
            'estado' => 25,
            'telefone' => 26,
            'email' => 27,
            'data_nascimento' => 28
        ];

        $pdo->beginTransaction();

        try {
            while (($data = fgetcsv($handle, 1000, ";")) !== FALSE) {
                // Extraindo os dados necessários usando os índices definidos
                $turma = $data[$indices['turma']];
                $nome = $data[$indices['nome']];
                $instagram = $data[$indices['instagram']];
                $atuacao = $data[$indices['atuacao']];
                $tecnicas = $data[$indices['tecnicas']];
                $seguidores = $data[$indices['seguidores']];
                $cpf = $data[$indices['cpf']];
                $cep = $data[$indices['cep']];
                $endereco = $data[$indices['endereco']];
                $cidade = $data[$indices['cidade']];
                $mesorregiao = $data[$indices['mesorregiao']];
                $estado = $data[$indices['estado']];
                $telefone = $data[$indices['telefone']];
                $email = $data[$indices['email']];
                $data_nascimento = $data[$indices['data_nascimento']];

                // Definindo um valor padrão para a coluna datetime e status
                $datetime = date('Y-m-d H:i:s');
                $status = 1; // Pode ser ajustado conforme necessário

                // Preparando a instrução SQL para inserção
                $stmt = $pdo->prepare("INSERT INTO educators 
                (nome, cpf, data_nascimento, endereco, cidade, estado, cep, mesorregiao, instagram, seguidores, site, datetime, turma, status, atuacao, tecnicas, telefone, email) 
                VALUES (:nome, :cpf, :data_nascimento, :endereco, :cidade, :estado, :cep, :mesorregiao, :instagram, :seguidores, :site, :datetime, :turma, :status, :atuacao, :tecnicas, :telefone, :email)");

                // Executando a instrução com os dados mapeados
                $stmt->execute([
                    ':nome' => $nome,
                    ':cpf' => $cpf,
                    ':data_nascimento' => $data_nascimento,
                    ':endereco' => $endereco,
                    ':cidade' => $cidade,
                    ':estado' => $estado,
                    ':cep' => $cep,
                    ':mesorregiao' => $mesorregiao,
                    ':instagram' => $instagram,
                    ':seguidores' => $seguidores,
                    ':site' => '', // Site não está na planilha, então definimos como vazio
                    ':datetime' => $datetime,
                    ':turma' => $turma,
                    ':status' => $status,
                    ':atuacao' => $atuacao,
                    ':tecnicas' => $tecnicas,
                    ':telefone' => $telefone,
                    ':email' => $email
                ]);
            }

            $pdo->commit();
            echo json_encode(['success' => true, 'message' => 'Educadoras importadas com sucesso!']);
        } catch (Exception $e) {
            $pdo->rollBack();
            echo json_encode(['success' => false, 'message' => 'Erro ao importar educadoras: ' . $e->getMessage()]);
        }

        fclose($handle);
    } else {
        echo json_encode(['success' => false, 'message' => 'Erro ao abrir o arquivo CSV.']);
    }
} else {
    echo json_encode(['success' => false, 'message' => 'Nenhum arquivo CSV enviado.']);
}
?>
