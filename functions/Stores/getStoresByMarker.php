<?php
include '../config.php';

header('Content-Type: application/json');

if (!isset($_GET['marker_id'])) {
    echo json_encode(['success' => false, 'message' => 'Marker ID não fornecido.']);
    exit;
}

$marker_id = $_GET['marker_id'];

try {
    $sql = "
        SELECT s.*, GROUP_CONCAT(m.nome SEPARATOR ', ') AS marcadores, GROUP_CONCAT(m.cor SEPARATOR ', ') AS marcadores_cor
        FROM stores s
        JOIN stores_markers sm ON s.id = sm.loja_id
        JOIN markers m ON sm.marcador_id = m.id
        WHERE sm.marcador_id = ?
        GROUP BY s.id
    ";
    $stmt = $pdo->prepare($sql);
    $stmt->execute([$marker_id]);

    $stores = $stmt->fetchAll(PDO::FETCH_ASSOC);

    echo json_encode(['success' => true, 'stores' => $stores]);
} catch (PDOException $e) {
    echo json_encode(['success' => false, 'message' => 'Erro ao filtrar lojas: ' . $e->getMessage()]);
}
?>
