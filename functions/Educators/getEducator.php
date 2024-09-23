<?php
include '../config.php';

$id = isset($_GET['id']) ? (int)$_GET['id'] : 0;

try {
    $stmt = $pdo->prepare("SELECT * FROM educators WHERE id = :id");
    $stmt->bindParam(':id', $id, PDO::PARAM_INT);
    $stmt->execute();
    
    if ($stmt->rowCount() > 0) {
        $educator = $stmt->fetch(PDO::FETCH_ASSOC);
        echo json_encode(['success' => true, 'educator' => $educator]);
    } else {
        echo json_encode(['success' => false, 'message' => 'Educadora não encontrada']);
    }
} catch (PDOException $e) {
    echo json_encode(['success' => false, 'message' => 'Erro ao buscar educadora: ' . $e->getMessage()]);
}
?>
