<?php
session_start();
if (!isset($_SESSION['user_id'])) {
    header("Location: index.php");
    exit;
}
?>


<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="statics/css/style.css">
    <link rel="stylesheet" href="statics/css/sidebar.css">
    <link rel="icon" href="statics\img\favi-icon.png" type="image/x-icon">
    <title>Perfil</title>
</head>
<body>
<?php include 'user_menu.php'; ?>
<?php include 'sidebar.php'; ?>
<div class="container">
    <br>
    <h1>Perfil - Painel em Construção</h1>
    <p><a href="logout.php">Logout</a></p>
</div>
</body>
</html>