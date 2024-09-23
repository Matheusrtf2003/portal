<?php
session_start();
include('../config.php');

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $email = $_POST['email'];
    $password = $_POST['password'];

    try {
        // Verificar se o usuário existe
        $stmt = $pdo->prepare("SELECT * FROM users WHERE email = ?");
        $stmt->execute([$email]);
        $user = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($user && password_verify($password, $user['password'])) {
            // Autenticação bem-sucedida
            $_SESSION['user_id'] = $user['id'];
            header("Location: ../../dashboard.php");
            exit();
        } else {
            // Falha na autenticação
            $_SESSION['error'] = "Email ou senha incorretos.";
            header("Location: ../../index.php");
            exit();
        }
    } catch (PDOException $e) {
        echo 'Query failed: ' . $e->getMessage();
    }
}
?>
