<?php
include 'config.php';
$stmt = $pdo->query("SELECT id, nome FROM mesorregioes");
$mesorregioes = $stmt->fetchAll(PDO::FETCH_ASSOC);
echo json_encode(['mesorregioes' => $mesorregioes]);
?>
