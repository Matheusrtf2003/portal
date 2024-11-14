<?php
include 'config.php';
$stmt = $pdo->query("SELECT id, nome FROM cidades");
$cidades = $stmt->fetchAll(PDO::FETCH_ASSOC);
echo json_encode(['cities' => $cidades]);
?>
