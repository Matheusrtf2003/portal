<?php
include 'functions/config.php';

$currentDate = date('Y-m-d');

// Resetar créditos no dia 9 de cada mês
if (date('d') == 9) {
    $stmt = $pdo->prepare("UPDATE users SET credits = 40000, last_reset = ? WHERE last_reset IS NULL OR last_reset < ?");
    $stmt->execute([$currentDate, $currentDate]);
}
?>
