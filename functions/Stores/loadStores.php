<?php
include '../config.php';

// Consulta SQL para selecionar todas as lojas
$sql = "SELECT * FROM stores";
$result = $conn->query($sql);

// Array para armazenar os dados das lojas
$stores = array();

// Verifica se há resultados na consulta
if ($result->num_rows > 0) {
    // Percorre cada linha de resultado
    while ($row = $result->fetch_assoc()) {
        // Adiciona os dados da loja ao array
        $stores[] = array(
            'id' => $row['id'],
            'nome' => $row['nome'],
            'status' => $row['status'],
            'endereco' => $row['endereco'],
            'descricao' => $row['descricao'],
            'vendedor' => $row['vendedor'],
            'telefone' => $row['telefone'],
            'email' => $row['email'],
            'instagram' => $row['instagram'],
            'site' => $row['site'],
            'decisor' => $row['decisor'],
            'telefone_decisor' => $row['telefone_decisor']
        );
    }
}

// Converte o array para formato JSON
echo json_encode($stores);

// Fecha a conexão com o banco de dados
$conn->close();
?>
