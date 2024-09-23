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
    <title>Ajustes</title>
</head>
<body>
<?php include 'sidebar.php'; ?>
<?php include 'user_menu.php'; ?>

<div class="container">
    <br>
    <h1>Ajustes - Painel em Construção</h1>
</div>
</body>
</html>