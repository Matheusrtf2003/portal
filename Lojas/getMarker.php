<?php
// Conectar ao banco de dados
include '../functions/config.php';

// Consulta para obter todos os marcadores
$sql = "SELECT id, nome, cor FROM markers";
$result = $conn->query($sql);

$markers = [];
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $markers[] = $row;
    }
}

echo json_encode($markers);

$conn->close();
?>
