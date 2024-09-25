<?php
include '../config.php';

try {
    // Ordenar por 'id' em ordem decrescente para mostrar os mais recentes primeiro
    $stmt = $pdo->prepare("SELECT * FROM educators ORDER BY id DESC");
    $stmt->execute();
    
    $educators = $stmt->fetchAll(PDO::FETCH_ASSOC);
    
    if ($stmt->rowCount() > 0) {
        echo json_encode(['success' => true, 'educators' => $educators]);
    } else {
        echo json_encode(['success' => false, 'message' => 'Nenhuma educadora encontrada']);
    }
} catch (PDOException $e) {
    echo json_encode(['success' => false, 'message' => 'Erro ao buscar educadoras: ' . $e->getMessage()]);
}
?>
