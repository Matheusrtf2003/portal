<?php
session_start();
if (!isset($_SESSION['user_id']) || !in_array($_SESSION['user_tipo'], ['Administrador', 'Gerente'])) {
    header("Location: ../../index.php");
    exit;
}

include '../config.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $team_id = $_POST['team_id'];
    $user_id = $_POST['user_id'];

    // Remove o usuário da equipe
    $stmt = $pdo->prepare("DELETE FROM team_users WHERE team_id = ? AND user_id = ?");
    $stmt->execute([$team_id, $user_id]);

    // Redireciona de volta para a página de detalhes da equipe
    header("Location: ../../Equipes/team_details.php?id=$team_id");
    exit;
}
?>
