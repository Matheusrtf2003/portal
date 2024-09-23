<?php
require '../config.php';

header('Content-Type: application/json');

if ($_FILES['file']['error'] > 0) {
    echo json_encode(['success' => false, 'message' => 'Erro ao fazer upload do arquivo.']);
    exit;
}

$file = $_FILES['file']['tmp_name'];
$fileType = \PhpOffice\PhpSpreadsheet\IOFactory::identify($file);
$reader = \PhpOffice\PhpSpreadsheet\IOFactory::createReader($fileType);
$spreadsheet = $reader->load($file);

$worksheet = $spreadsheet->getActiveSheet();
$rows = $worksheet->toArray();

foreach ($rows as $index => $row) {
    if ($index === 0) {
        continue; // Pula o cabeçalho
    }

    $nome = $row[0];
    $status = $row[1];
    $endereco = $row[2];
    $anotacao = $row[3];
    $vendedor = $row[4];
    $telefone = $row[5];
    $email = $row[6];
    $instagram = $row[7];
    $site = $row[8];
    $decisor = $row[9];
    $telefone_decisor = $row[10];

    $sql = "INSERT INTO stores (nome, status, endereco, anotacao, vendedor, telefone, email, instagram, site, decisor, telefone_decisor) VALUES (:nome, :status, :endereco, :anotacao, :vendedor, :telefone, :email, :instagram, :site, :decisor, :telefone_decisor)";
    $stmt = $pdo->prepare($sql);
    $stmt->bindParam(':nome', $nome);
    $stmt->bindParam(':status', $status);
    $stmt->bindParam(':endereco', $endereco);
    $stmt->bindParam(':anotacao', $anotacao);
    $stmt->bindParam(':vendedor', $vendedor);
    $stmt->bindParam(':telefone', $telefone);
    $stmt->bindParam(':email', $email);
    $stmt->bindParam(':instagram', $instagram);
    $stmt->bindParam(':site', $site);
    $stmt->bindParam(':decisor', $decisor);
    $stmt->bindParam(':telefone_decisor', $telefone_decisor);

    $stmt->execute();
}

echo json_encode(['success' => true]);
?>
