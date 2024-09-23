<?php
session_start();
if (!isset($_SESSION['user_id']) || $_SESSION['user_tipo'] !== 'Administrador') {
    header("Location: index.php");
    exit;
}

include 'functions/config.php';

// Pega todos os usuários
$stmt = $pdo->prepare("SELECT id, nome, email, tipo, status FROM users");
$stmt->execute();
$users = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Usuários</title>
    <link rel="icon" href="statics\img\favi-icon.png" type="image/x-icon">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../statics/css/style.css">
    <link rel="stylesheet" href="../sidebar/css/sidebar.css">
    <style>

        .container {
            width: 100%;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }


        .container-right {
            margin-top: 10%;
            width: 100%;
            padding: 20px;
        }

        .button-container {
            text-align: left;
            margin-bottom: 20px;
        }

        .card-container {
            width: 100%;
            display: flex;
            justify-content: space-between;
            flex-wrap: wrap;
        }

        .card {
            display: flex;
            align-items: center;
            justify-content: center;
            width: calc(50% - 10px); /* Dois cards por linha com espaço entre eles */
            height: 300px;
            margin-bottom: 20px;
            text-align: center;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.2s;
            cursor: pointer;
            transition: all .3s ease;
        }

        .card:hover {
            transform: scale(1.01);
            background-color: #BFBFBF;
        }

        .card-icon {
            font-size: 50px;
            margin-top: 30px;
        }

        .card-text {
            margin-top: 10px;
            font-size: 18px;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="container">
            <?php include '../sidebar/sidebar.php'; ?>
        <div class="container-right">
            <?php include '../MenuUsuario/user_menu.php'; ?>

            <div class="card-container">
                <div class="card" onclick="window.location.href='../TodosUsuarios/index.php'">
                    <div class="card-icon">
                    <svg xmlns="http://www.w3.org/2000/svg" width="100" height="100" fill="currentColor" class="bi bi-person-fill" viewBox="0 0 16 16">
                        <path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6"/>
                    </svg>
                    <div class="card-text">Usuários</div>
                    </div>
                </div>
                <div class="card" onclick="window.location.href='../Equipes/index.php'">
                    <div class="card-icon">
                        <i class="fas fa-cog"></i> <!-- Ícone de exemplo -->
                    </div>
                    <svg xmlns="http://www.w3.org/2000/svg" width="100" height="100" fill="currentColor" class="bi bi-people-fill" viewBox="0 0 16 16">
                        <path d="M7 14s-1 0-1-1 1-4 5-4 5 3 5 4-1 1-1 1zm4-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6m-5.784 6A2.24 2.24 0 0 1 5 13c0-1.355.68-2.75 1.936-3.72A6.3 6.3 0 0 0 5 9c-4 0-5 3-5 4s1 1 1 1zM4.5 8a2.5 2.5 0 1 0 0-5 2.5 2.5 0 0 0 0 5"/>
                    </svg>
                    <div class="card-text">Equipes</div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- jQuery, Popper.js, Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://kit.fontawesome.com/a076d05399.js"></script> <!-- Biblioteca para os ícones -->
</body>
</html>
