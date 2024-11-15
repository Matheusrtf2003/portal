<?php
session_start();
if (!isset($_SESSION['user_id']) || !in_array($_SESSION['user_tipo'], ['Administrador', 'Gerente'])) {
    header("Location: index.php");
    exit;
}

include '../functions/config.php';

$user_id = $_SESSION['user_id'];
$user_tipo = $_SESSION['user_tipo'];

// Pega todas as equipes com base no tipo de usuário
if ($user_tipo == 'Administrador') {
    $stmt = $pdo->prepare("SELECT teams.*, (SELECT COUNT(*) FROM team_users WHERE team_users.team_id = teams.id) as total_members, users.nome as manager_name FROM teams LEFT JOIN users ON teams.manager_id = users.id");
    $stmt->execute();
} else {
    $stmt = $pdo->prepare("SELECT teams.*, (SELECT COUNT(*) FROM team_users WHERE team_users.team_id = teams.id) as total_members, users.nome as manager_name FROM teams LEFT JOIN users ON teams.manager_id = users.id WHERE created_by = ?");
    $stmt->execute([$user_id]);
}
$teams = $stmt->fetchAll(PDO::FETCH_ASSOC);

// Pega todos os Gerentes (para o administrador poder atribuir um responsável)
if ($user_tipo == 'Administrador') {
    $stmt = $pdo->prepare("SELECT id, nome FROM users WHERE function = 'Gerente'");
    $stmt->execute();
    $managers = $stmt->fetchAll(PDO::FETCH_ASSOC);
}
?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Equipes</title>
    <link rel="icon" href="../statics/img/favi-icon.png" type="image/x-icon">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

    <link rel="stylesheet" href="statics/css/equipes.css">
    <link rel="stylesheet" href="../sidebar/css/sidebar.css">
</head>
<body>
    <div class="container">
        <?php include '../sidebar/sidebar.php'; ?>
        <div class="container-right">
            <?php include '../MenuUsuario/user_menu.php'; ?>
            <div class="button-container">
                <?php if ($user_tipo == 'Administrador'): ?>
                <button class="btn btn-secondary" data-toggle="modal" data-target="#createTeamModal">Criar Nova Equipe</button>
                <?php endif; ?>
            </div>

            <div class="card-container">
                <?php foreach ($teams as $team): ?>
                <div class="card" >
                    <div onclick="window.location.href='team_details.php?id=<?php echo $team['id']; ?>'">
                        <div class="card-icon">
                            <i class="fas fa-users"></i> <!-- Ícone de exemplo -->
                        </div>
                        <div class="card-text">
                            <?php echo htmlspecialchars($team['name']); ?><br>
                            <?php echo $team['total_members']; ?> Membro(s)
                            <small>Responsável: <?php echo htmlspecialchars($team['manager_name']); ?></small>
                        </div>
                    </div>
                    <div class="mt-3">
                        <button class="btn btn-danger btn-md" onclick="deleteTeam(<?php echo $team['id']; ?>)">Excluir</button>
                        <button class="btn btn-warning btn-md" data-id="<?php echo $team['id']; ?>" data-name="<?php echo $team['name']; ?>" data-manager="<?php echo htmlspecialchars($team['manager_id'], ENT_QUOTES); ?>" data-description="<?php echo htmlspecialchars($team['description'], ENT_QUOTES); ?>" data-toggle="modal" data-target="#updateTeamModal">Editar</button>
                    </div>
                </div>
                <?php endforeach; ?>
            </div>
        </div>
    </div>

    <!-- Modal Criar Equipe -->
    <div class="modal fade" id="createTeamModal" tabindex="-1" aria-labelledby="createTeamModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <form action="/portal/functions/Teams/create_team.php" method="POST">
                    <div class="modal-header">
                        <h5 class="modal-title" id="createTeamModalLabel">Criar Nova Equipe</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label for="teamName">Nome da Equipe</label>
                            <input type="text" class="form-control" id="teamName" name="name" required>
                        </div>
                        <div class="form-group">
                            <label for="teamDescription">Descrição</label>
                            <textarea class="form-control" id="teamDescription" name="description"></textarea>
                        </div>
                        <?php if ($user_tipo == 'Administrador'): ?>
                        <div class="form-group">
                            <label for="teamManager">Responsável (Gerente)</label>
                            <select class="form-control p-0" id="teamManager" name="manager_id" required>
                                <?php foreach ($managers as $manager): ?>
                                <option value="<?php echo $manager['id']; ?>"><?php echo htmlspecialchars($manager['nome']); ?></option>
                                <?php endforeach; ?>
                            </select>
                        </div>
                        <?php endif; ?>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                        <button type="submit" class="btn btn-primary">Criar Equipe</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Modal Atualizar Equipe -->
    <div class="modal fade" id="updateTeamModal" tabindex="-1" aria-labelledby="updateTeamModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <form action="/portal/functions/Teams/updateTeam.php" method="POST" id="editTeamForm">
                    <input type="hidden" id="teamId" name="team_id">
                    <div class="modal-header">
                        <h5 class="modal-title" id="updateTeamModalLabel">Editar Equipe</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label for="teamName">Nome da Equipe</label>
                            <input type="text" class="form-control" id="editTeamName" name="name" required>
                        </div>
                        <div class="form-group">
                            <label for="teamDescription">Descrição</label>
                            <textarea class="form-control" id="editTeamDescription" name="description"></textarea>
                        </div>
                        <?php if ($user_tipo == 'Administrador'): ?>
                        <div class="form-group">
                            <label for="teamManager">Responsável (Gerente)</label>
                            <select class="form-control p-0" id="editTeamManager" name="manager_id" required>
                                <?php foreach ($managers as $manager): ?>
                                <option value="<?php echo $manager['id']; ?>"><?php echo htmlspecialchars($manager['nome']); ?></option>
                                <?php endforeach; ?>
                            </select>
                        </div>
                        <?php endif; ?>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                        <button type="submit" class="btn btn-primary">Salvar Alterações</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

<script>
    
</script>
    <!-- jQuery, Popper.js, Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://kit.fontawesome.com/a076d05399.js"></script> <!-- Biblioteca para os ícones -->
    <script src="statics/js/deleteTeam.js"></script>
    <script src="statics/js/updateTeam.js"></script>
</body>
</html>
