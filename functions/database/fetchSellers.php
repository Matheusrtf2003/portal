<?php
require_once '../config.php';

function fetchSellers($limit = 10, $offset = 0) {
    global $conn;

    // Prepara a consulta SQL com limites e offset
    $stmt = $conn->prepare("SELECT * FROM sellers ORDER BY id DESC LIMIT ? OFFSET ?");
    $stmt->bind_param("ii", $limit, $offset);

    // Executa a consulta
    $stmt->execute();

    // Obtém o resultado
    $result = $stmt->get_result();
    $sellers = $result->fetch_all(MYSQLI_ASSOC);

    $stmt->close();

    return $sellers;
}
?>
