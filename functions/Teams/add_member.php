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
    $role = 'Membro'; // Defina o papel do usuário na equipe, aqui estou usando 'Membro' como exemplo

    // Verifica se o usuário já faz parte da equipe
    $stmt = $pdo->prepare("SELECT * FROM team_users WHERE team_id = ? AND user_id = ?");
    $stmt->execute([$team_id, $user_id]);
    if ($stmt->rowCount() == 0) {
        // Adiciona o usuário à equipe com o papel especificado
        $stmt = $pdo->prepare("INSERT INTO team_users (team_id, user_id, role) VALUES (?, ?, ?)");
        $stmt->execute([$team_id, $user_id, $role]);
    }

    // Redireciona de volta para a página de detalhes da equipe
    header("Location: ../../team_details.php?id=$team_id");
    exit;
}
?>
