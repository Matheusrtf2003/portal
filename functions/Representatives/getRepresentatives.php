<?php
include '../config.php';

header('Content-Type: application/json');

$input = json_decode(file_get_contents('php://input'), true);

$status = $input['status'] ?? '';
$dateStart = $input['dateStart'] ?? '';
$dateEnd = $input['dateEnd'] ?? '';

try {
    $query = "SELECT * FROM representatives WHERE 1";

    $params = [];

    if ($status) {
        $query .= " AND status = ?";
        $params[] = $status;
    }

    if ($dateStart) {
        $query .= " AND DATE(timestamp) >= ?";
        $params[] = $dateStart;
    }

    if ($dateEnd) {
        $query .= " AND DATE(timestamp) <= ?";
        $params[] = $dateEnd;
    }

    $stmt = $pdo->prepare($query);
    $stmt->execute($params);

    $representatives = $stmt->fetchAll(PDO::FETCH_ASSOC);

    echo json_encode(['success' => true, 'representatives' => $representatives]);
} catch (PDOException $e) {
    echo json_encode(['success' => false, 'message' => 'Erro ao carregar representantes: ' . $e->getMessage()]);
}
