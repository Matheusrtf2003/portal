<?php
session_start();
include '../config.php';

// Verifica se o usuário tem permissão
if (!isset($_SESSION['user_id']) || !in_array($_SESSION['user_tipo'], ['Administrador', 'Gerente'])) {
    header("Location: ../../index.php");
    exit;
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $name = $_POST['name'];
    $description = $_POST['description'];
    $manager_id = $_POST['manager_id'] ?? $_SESSION['user_id']; // Se não for Administrador, o gerente é o próprio usuário
    $created_by = $_SESSION['user_id'];

    $stmt = $pdo->prepare("INSERT INTO teams (name, description, manager_id, created_by) VALUES (?, ?, ?, ?)");
    $stmt->execute([$name, $description, $manager_id, $created_by]);

    header("Location: ../../pageEquipes.php");
    exit;
}
?>
