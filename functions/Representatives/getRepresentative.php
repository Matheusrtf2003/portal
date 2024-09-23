<?php
include '../config.php';

if (isset($_GET['id'])) {
    $id = $_GET['id'];

    try {
        $stmt = $pdo->prepare("SELECT * FROM representatives WHERE id = ?");
        $stmt->execute([$id]);
        $representative = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($representative) {
            echo json_encode(['success' => true, 'representative' => $representative]);
        } else {
            echo json_encode(['success' => false, 'message' => 'Representante não encontrado']);
        }
    } catch (Exception $e) {
        echo json_encode(['success' => false, 'message' => 'Erro ao carregar representante: ' . $e->getMessage()]);
    }
} else {
    echo json_encode(['success' => false, 'message' => 'ID do representante não fornecido']);
}
?>
