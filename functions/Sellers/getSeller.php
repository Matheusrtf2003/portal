<?php
require '../config.php';

$sql = "SELECT id, nome FROM users";
$stmt = $pdo->prepare($sql);
$stmt->execute();
$vendedores = $stmt->fetchAll(PDO::FETCH_ASSOC);

echo json_encode($vendedores);
?>
