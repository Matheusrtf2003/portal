<?php
// Inclui o arquivo de conexão com o banco de dados
include_once "../config.php";

// Prepara a consulta SQL para buscar lojas
$sql = "SELECT * FROM stores";

// Executa a consulta
$result = $conn->query($sql);

$stores = [];

if ($result->num_rows > 0) {
    // Busca todos os dados
    while($row = $result->fetch_assoc()) {
        $stores[] = $row;
    }
}

// Fecha a conexão
$conn->close();

// Retorna os dados como JSON
header("Content-Type: application/json");
echo json_encode($stores);
?>
