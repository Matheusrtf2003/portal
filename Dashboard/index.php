<?php
session_start();
if (!isset($_SESSION['user_id'])) {
    header("Location: ../index.php");
    exit;
}

include '../functions/config.php';
?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Cache-Control" content="no-cache" />
    <title>Dashboard</title>
    <link rel="icon" href="statics\img\favi-icon.png" type="image/x-icon">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="statics/css/style.css">
    <link rel="stylesheet" href="statics/css/dashboard.css">
    <link rel="stylesheet" href="statics/css/sidebar.css">
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>

<body>
    <?php include '../sidebar/sidebar.php'; ?>
    <?php include '../MenuUsuario/user_menu.php'; ?>

    <div class="container-fluid">
        <div class="row">
            <div class="col-md-7 offset-md-2">
                <h1 style="margin-top: 20px;">Dashboard</h1>

                <!-- Exibir botão "Criar Meta" apenas para Administradores e Gerentes -->
                <?php if ($_SESSION['user_tipo'] === 'Administrador' || $_SESSION['user_tipo'] === 'Gerente'): ?>
                    <button type="button" class="btn btn-info" data-toggle="modal" data-target="#createGoalModal">Criar Meta</button>
                <?php endif; ?>

                <div class="row justify-content-between">
                    <div class="col-md-7">
                        <!-- Exibir o gráfico para todos os usuários -->
                        <canvas id="lineChart"></canvas>
                    </div>
                    <div class="col-md-4">
                        <canvas id="pieChart"></canvas>
                    </div>
                </div>

                <div class="d-flex flex-wrap justify-content-between mt-4" id="goalsContainerAdmin">
                    <!-- Exibir metas apenas para Administradores e Gerentes -->
                    <?php if ($_SESSION['user_tipo'] === 'Administrador' || $_SESSION['user_tipo'] === 'Gerente'): ?>
                        <!-- Aqui vai o conteúdo das metas gerais -->
                    <?php endif; ?>
                </div>

                <div class="d-flex flex-wrap justify-content-between mt-4" id="goalsContainerUser">
                    <!-- Exibir metas apenas para o usuário Padrão -->
                    <?php if ($_SESSION['user_tipo'] === 'Padrão'): ?>
                        <!-- Aqui vai o conteúdo das metas do usuário -->
                    <?php endif; ?>
                </div>
                
                <input type="hidden" id="userId" value="<?php echo $_SESSION['user_id']; ?>">
            </div>
        </div>
    </div>

    <!-- Modal Criar Meta -->
    <div class="modal fade" id="createGoalModal" tabindex="-1" aria-labelledby="createGoalModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="createGoalModalLabel">Criar Metas</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="goalForm">
                        <div class="form-group">
                            <label for="goalName">Nome da Meta:</label>
                            <input type="text" class="form-control" id="goalName" name="goal_name" required>
                        </div>
                        <div class="form-group">
                            <label for="startDate">Data de Início:</label>
                            <input type="datetime-local" class="form-control" id="startDate" name="start_date" required>
                        </div>
                        <div class="form-group">
                            <label for="endDate">Data de Fim:</label>
                            <input type="datetime-local" class="form-control" id="endDate" name="end_date" required>
                        </div>
                        <div class="form-group">
                            <label for="target">Quantidade de Lojas:</label>
                            <input type="number" class="form-control" id="target" name="target" required>
                        </div>
                        <div class="form-group">
                            <label for="goalMarker">Marcador:</label>
                            <select class="form-control" id="goalMarker" name="goal_marker" required>
                                <!-- Marcadores serão carregados via JS -->
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="goalUsers">Usuário:</label>
                            <select class="form-control" id="goalUsers" name="goal_user" required>
                                <!-- Usuários serão carregados via JS -->
                            </select>
                        </div>
                        <button type="submit" class="btn btn-primary">Salvar</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="statics/js/dashboard.js"></script>
    <script src="statics/js/init.js"></script>
    <script src="statics/js/loadLojas.js"></script>
    <script src="statics/js/charts.js"></script>
    <script src="statics/js/dashboard.js"></script>
    <script src="statics/js/loadGoals.js"></script>
    <script src="statics/js/dashboardCharts.js"></script>

</body>
</html>
