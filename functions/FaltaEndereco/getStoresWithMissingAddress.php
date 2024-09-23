<?php
include('../config.php');

$query = "SELECT id, cnpj FROM stores WHERE cnpj IS NOT NULL AND cnpj != '' AND (endereco IS NULL OR endereco = '')";
$result = $db->query($query);

if ($result->num_rows > 0) {
    $stores = [];
    while ($row = $result->fetch_assoc()) {
        $stores[] = $row;
    }
    echo json_encode(['success' => true, 'stores' => $stores]);
} else {
    echo json_encode(['success' => false, 'message' => 'Nenhuma loja com CNPJ sem endereço encontrada.']);
}
?>
