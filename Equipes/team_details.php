<?php
session_start();
if (!isset($_SESSION['user_id']) || !in_array($_SESSION['user_tipo'], ['Administrador', 'Gerente'])) {
    header("Location: index.php");
    exit;
}

include '../functions/config.php';

$user_id = $_SESSION['user_id'];
$user_tipo = $_SESSION['user_tipo'];
$team_id = $_GET['id'];

// Verifica se o usuário tem permissão para acessar essa equipe
if ($user_tipo === 'Gerente') {
    $stmt = $pdo->prepare("SELECT id FROM teams WHERE id = ? AND created_by = ?");
    $stmt->execute([$team_id, $user_id]);
    $team = $stmt->fetch(PDO::FETCH_ASSOC);
    if (!$team) {
        header("Location: teams.php");
        exit;
    }
} else {
    $stmt = $pdo->prepare("SELECT * FROM teams WHERE id = ?");
    $stmt->execute([$team_id]);
    $team = $stmt->fetch(PDO::FETCH_ASSOC);
}

// Pega os membros da equipe
$stmt = $pdo->prepare("SELECT users.id, users.nome, users.email, team_users.role FROM team_users JOIN users ON team_users.user_id = users.id WHERE team_users.team_id = ?");
$stmt->execute([$team_id]);
$members = $stmt->fetchAll(PDO::FETCH_ASSOC);

// Pega todos os usuários do sistema que não estão na equipe (para adicionar novos membros)
$stmt = $pdo->prepare("SELECT id, nome, email FROM users WHERE id NOT IN (SELECT user_id FROM team_users WHERE team_id = ?)");
$stmt->execute([$team_id]);
$users = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Detalhes da Equipe</title>
    <link rel="icon" href="statics\img\favi-icon.png" type="image/x-icon">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../statics/css/style.css">
    <link rel="stylesheet" href="statics/css/team_details.css">
    <link rel="stylesheet" href="../sidebar/css/sidebar.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<body>
    <div class="container mt-4">
        <?php include '../sidebar/sidebar.php'; ?>
        <div class="container-right">
            <?php include '../MenuUsuario/user_menu.php'; ?>
            <a href="pageEquipes.php" class="btn btn-secondary mt-4">Voltar</a>

            <h1><?php echo htmlspecialchars($team['name']); ?></h1>
            <p><?php echo htmlspecialchars($team['description']); ?></p>

            <!-- Barra divisória -->
            <hr>

            <h2>Adicionar Membro</h2>

            <!-- Barra de Pesquisa -->
            <div class="form-group">
                <input type="text" id="userSearch" class="form-control" placeholder="Pesquisar usuário por nome...">
            </div>

            <form action="../functions/Teams/add_member.php" method="POST">
                <div class="form-group">
                    <label for="userSelect">Selecionar Usuário</label>
                    <select class="form-control p-0" id="userSelect" name="user_id" required>
                        <?php foreach ($users as $user): ?>
                        <option value="<?php echo $user['id']; ?>"><?php echo htmlspecialchars($user['nome']); ?> (<?php echo htmlspecialchars($user['email']); ?>)</option>
                        <?php endforeach; ?>
                    </select>
                </div>
                <input type="hidden" name="team_id" value="<?php echo $team_id; ?>">
                <button type="submit" class="btn btn-primary">Adicionar Membro</button>
            </form>

            <!-- Outro espaço e barra divisória antes da lista de membros -->
            <hr class="mt-4">

            <h2 class="mt-4">Membros da Equipe</h2>
            <ul class="list-group mt-2">
                <?php foreach ($members as $member): ?>
                <li class="list-group-item d-flex justify-content-between align-items-center">
                    <div>
                        <?php echo htmlspecialchars($member['nome']); ?> (<?php echo htmlspecialchars($member['email']); ?>)
                        <span class="badge badge-primary badge-pill"><?php echo htmlspecialchars($member['role']); ?></span>
                    </div>
                    <div>
                        <a href="view_profile.php?id=<?php echo $member['id']; ?>" class="btn btn-info btn-sm">Ver Perfil</a>
                        <form action="../functions/Teams/remove_member.php" method="POST" style="display:inline;">
                            <input type="hidden" name="team_id" value="<?php echo $team_id; ?>">
                            <input type="hidden" name="user_id" value="<?php echo $member['id']; ?>">
                            <button type="submit" class="btn btn-danger btn-sm">Remover</button>
                        </form>
                    </div>
                </li>
                <?php endforeach; ?>
            </ul>
        </div>
    </div>

    <!-- jQuery, Popper.js, Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
    <!-- Script para Filtrar Usuários -->
    <script>
        $(document).ready(function(){
            $("#userSearch").on("keyup", function() {
                var value = $(this).val().toLowerCase();
                $("#userSelect option").filter(function() {
                    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
                });
            });
        });
    </script>
</body>
</html>
