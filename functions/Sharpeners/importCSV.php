<?php
session_start();
include '../config.php';

header('Content-Type: application/json');

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Verificar se o arquivo foi enviado corretamente
    if (isset($_FILES['file'])) {
        if ($_FILES['file']['error'] == 0) {
            $file = $_FILES['file']['tmp_name'];
            $handle = fopen($file, 'r');
            
            if ($handle) {
                // Ler a primeira linha para obter os nomes das colunas
                $header = fgetcsv($handle, 1000, ';');
                if ($header === false) {
                    echo json_encode(['success' => false, 'message' => 'Erro ao ler o cabeçalho do arquivo CSV.']);
                    fclose($handle);
                    exit;
                }

                $columns = array_flip($header); // Mapeia os nomes das colunas para seus índices

                // Verificar se todas as colunas necessárias estão presentes
                $requiredColumns = ['Nome', 'Endereco', 'CEP', 'Instagram', 'E-mail', 'CPF', 'Cidade', 'Estado', 'Telefone', 'Bairro', 'Status'];
                foreach ($requiredColumns as $column) {
                    if (!isset($columns[$column])) {
                        echo json_encode(['success' => false, 'message' => "Coluna necessária não encontrada: $column"]);
                        fclose($handle);
                        exit;
                    }
                }

                // Processar cada linha do CSV
                while (($data = fgetcsv($handle, 1000, ';')) !== FALSE) {
                    // Usando os nomes das colunas para acessar os valores
                    $nome = $data[$columns['Nome']];
                    $endereco = $data[$columns['Endereco']];
                    $cep = $data[$columns['CEP']];
                    $instagram = $data[$columns['Instagram']];
                    $email = $data[$columns['E-mail']];
                    $cpf = $data[$columns['CPF']];
                    $cidade = $data[$columns['Cidade']];
                    $estado = $data[$columns['Estado']];
                    $telefone = $data[$columns['Telefone']];
                    $bairro = $data[$columns['Bairro']];
                    $status = $data[$columns['Status']];

                    $stmt = $pdo->prepare("INSERT INTO sharpeners (nome, endereco, cep, instagram, email, cpf, cidade, uf, telefone, bairro, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
                    if (!$stmt->execute([$nome, $endereco, $cep, $instagram, $email, $cpf, $cidade, $estado, $telefone, $bairro, $status])) {
                        $errorInfo = $stmt->errorInfo();
                        echo json_encode(['success' => false, 'message' => 'Erro ao inserir no banco de dados: ' . $errorInfo[2]]);
                        fclose($handle);
                        exit;
                    }
                }
                fclose($handle);

                echo json_encode(['success' => true, 'message' => 'CSV importado com sucesso!']);
            } else {
                echo json_encode(['success' => false, 'message' => 'Erro ao abrir o arquivo CSV.']);
            }
        } else {
            echo json_encode(['success' => false, 'message' => 'Erro no upload do arquivo: ' . $_FILES['file']['error']]);
        }
    } else {
        echo json_encode(['success' => false, 'message' => 'Nenhum arquivo foi enviado.']);
    }
} else {
    echo json_encode(['success' => false, 'message' => 'Método de solicitação inválido.']);
}
?>
