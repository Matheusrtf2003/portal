<?php
include '../config.php';

header('Content-Type: application/json');

if ($_FILES['file']['error'] !== UPLOAD_ERR_OK) {
    echo json_encode(['success' => false, 'message' => 'Erro ao enviar arquivo.']);
    exit;
}

$file = fopen($_FILES['file']['tmp_name'], 'r');
if ($file === false) {
    echo json_encode(['success' => false, 'message' => 'Erro ao abrir arquivo.']);
    exit;
}

// Ler a primeira linha (cabeçalho)
$header = fgetcsv($file, 0, ';');
if ($header === false) {
    echo json_encode(['success' => false, 'message' => 'Erro ao ler cabeçalho do arquivo.']);
    fclose($file);
    exit;
}

// Remover colunas vazias do início do cabeçalho
$header = array_filter($header, function($value) {
    return !is_null($value) && $value !== '';
});

// Verificar se todas as colunas necessárias estão presentes
$requiredColumns = ['nome', 'cnpj', 'status', 'endereco', 'cidade', 'estado', 'anotacao', 'telefone', 'email', 'instagram', 'site', 'decisor', 'telefone_decisor', 'marcadores', 'mesorregiao'];
$columns = array_flip($header);
foreach ($requiredColumns as $column) {
    if (!isset($columns[$column])) {
        echo json_encode(['success' => false, 'message' => "Coluna $column não encontrada no arquivo."]);
        fclose($file);
        exit;
    }
}

$pdo->beginTransaction();

try {
    while (($row = fgetcsv($file, 0, ';')) !== false) {
        // Limpeza e associação dos dados do CSV às variáveis
        $nome = $row[$columns['nome']] ?? '';
        $cnpj = $row[$columns['cnpj']] ?? '';
        $status = $row[$columns['status']] ?? '';
        $endereco = $row[$columns['endereco']] ?? '';
        $cidade = $row[$columns['cidade']] ?? '';
        $estado = $row[$columns['estado']] ?? '';
        $anotacao = $row[$columns['anotacao']] ?? '';
        $telefone = $row[$columns['telefone']] ?? '';
        $email = $row[$columns['email']] ?? '';
        $instagram = $row[$columns['instagram']] ?? '';
        $site = $row[$columns['site']] ?? '';
        $decisor = $row[$columns['decisor']] ?? '';
        $telefone_decisor = $row[$columns['telefone_decisor']] ?? '';
        $marcadores = isset($row[$columns['marcadores']]) ? explode(',', $row[$columns['marcadores']]) : [];
        $mesorregiao = $row[$columns['mesorregiao']] ?? '';

        // Log para depuração
        error_log("Processando loja: $nome, CNPJ: $cnpj");

        // Verificação de duplicidade de CNPJ
        $stmt = $pdo->prepare("SELECT id FROM stores WHERE cnpj = ?");
        $stmt->execute([$cnpj]);
        if ($stmt->rowCount() > 0) {
            error_log("CNPJ duplicado: $cnpj");
            continue; // Ignora se o CNPJ já existe
        }

        // Inserção da loja no banco de dados
        $stmt = $pdo->prepare("
            INSERT INTO stores (nome, cnpj, status, endereco, cidade, estado, anotacao, telefone, email, instagram, site, decisor, telefone_decisor, mesorregiao)
            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
        ");
        $stmt->execute([$nome, $cnpj, $status, $endereco, $cidade, $estado, $anotacao, $telefone, $email, $instagram, $site, $decisor, $telefone_decisor, $mesorregiao]);
        
        $loja_id = $pdo->lastInsertId();

        // Verificação e inserção de marcadores
        foreach ($marcadores as $marcador_id) {
            $stmt = $pdo->prepare("SELECT id FROM markers WHERE id = ?");
            $stmt->execute([$marcador_id]);
            if ($stmt->rowCount() === 0) {
                error_log("Marcador não encontrado: $marcador_id");
                continue; // Ignora se o marcador não existe
            }

            $stmt = $pdo->prepare("INSERT INTO stores_markers (loja_id, marcador_id) VALUES (?, ?)");
            $stmt->execute([$loja_id, $marcador_id]);
        }

        error_log("Loja inserida com sucesso: $nome, ID: $loja_id");
    }

    $pdo->commit();
    echo json_encode(['success' => true]);
} catch (PDOException $e) {
    $pdo->rollBack();
    error_log('Erro ao importar dados: ' . $e->getMessage());
    echo json_encode(['success' => false, 'message' => 'Erro ao importar dados: ' . $e->getMessage()]);
}

fclose($file);
?>
