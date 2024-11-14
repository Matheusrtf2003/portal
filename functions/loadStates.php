<?php
include 'config.php';
$stmt = $pdo->query("SELECT id, nome, sigla FROM estados");
$estados = $stmt->fetchAll(PDO::FETCH_ASSOC);
echo json_encode(['states' => $estados]);
?>
