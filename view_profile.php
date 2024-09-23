<?php
session_start();
if (!isset($_SESSION['user_id'])) {
    header("Location: index.php");
    exit;
}

include 'functions/config.php';

$user_id = $_GET['id'];

// Pega as informações do usuário
$stmt = $pdo->prepare("SELECT * FROM users WHERE id = ?");
$stmt->execute([$user_id]);
$user = $stmt->fetch(PDO::FETCH_ASSOC);

if (!$user) {
    echo "Usuário não encontrado.";
    exit;
}

// Pega as metas do usuário e calcula o progresso baseado nas lojas adicionadas
$stmt = $pdo->prepare("
    SELECT g.id, g.name, g.start_date, g.end_date, g.target,
    (SELECT COUNT(su.id) 
     FROM stores_users su
     JOIN stores s ON su.store_id = s.id
     WHERE su.user_id = gu.user_id AND su.timestemp BETWEEN g.start_date AND g.end_date) as progress
    FROM goals_user gu
    JOIN goals g ON gu.goal_id = g.id
    WHERE gu.user_id = ?
");
$stmt->execute([$user_id]);
$goals = $stmt->fetchAll(PDO::FETCH_ASSOC);

// Pega o desempenho dos últimos 30 dias
$performanceStmt = $pdo->prepare("
    SELECT DATE(su.timestemp) as date, COUNT(su.id) as total
    FROM stores_users su
    WHERE su.user_id = ? AND su.timestemp >= DATE_SUB(CURDATE(), INTERVAL 30 DAY)
    GROUP BY DATE(su.timestemp)
    ORDER BY DATE(su.timestemp) ASC
");
$performanceStmt->execute([$user_id]);
$performanceData = $performanceStmt->fetchAll(PDO::FETCH_ASSOC);

// Preparar os dados para o gráfico
$dates = [];
$totals = [];

foreach ($performanceData as $data) {
    $dates[] = $data['date'];
    $totals[] = $data['total'];
}
?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Perfil de <?php echo htmlspecialchars($user['nome']); ?></title>
    <link rel="icon" href="statics\img\favi-icon.png" type="image/x-icon">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="statics/css/style.css">
    <link rel="stylesheet" href="statics/css/view_profile.css">
    <link rel="stylesheet" href="statics/css/sidebar.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .profile-container {
            max-width: 900px;
            margin: 30px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .profile-image {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            object-fit: cover;
            margin-bottom: 20px;
            border: 3px solid #ccc;
        }
        .profile-header {
            display: flex;
            align-items: center;
            margin-bottom: 30px;
        }
        .profile-header .info {
            margin-left: 20px;
        }
        .profile-header .info h1 {
            margin: 0;
            font-size: 24px;
            font-weight: bold;
        }
        .profile-header .info p {
            margin: 5px 0;
            color: #666;
        }
        .goal-card {
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 15px;
            margin-bottom: 15px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        .goal-card h5 {
            margin-bottom: 10px;
            font-size: 18px;
            font-weight: bold;
        }
        .goal-card p {
            margin-bottom: 5px;
        }
        .progress {
            height: 20px;
            border-radius: 10px;
            background-color: #f0f0f0;
            margin-top: 10px;
        }
        .progress-bar {
            border-radius: 10px;
        }
        .chart-container {
            width: 90%;
            margin: 50px auto;
        }
    </style>
</head>
<body>
    <div class="container profile-container">
        <?php include 'sidebar.php'; ?>
        <div class="container-right">
            <?php include 'user_menu.php'; ?>
            <a href="javascript:history.back()" class="btn btn-secondary mt-4">Voltar</a>

            <div class="profile-header">
                <!-- Exibição da imagem do usuário -->
                <div>
                    <?php if (!empty($user['img_name'])): ?>
                        <img src="uploads/<?php echo htmlspecialchars($user['img_name']); ?>" alt="Foto de <?php echo htmlspecialchars($user['nome']); ?>" class="profile-image">
                    <?php else: ?>
                        <img src="uploads/default.png" alt="Foto padrão" class="profile-image">
                    <?php endif; ?>
                </div>
                <div class="info">
                    <h1>Perfil de <?php echo htmlspecialchars($user['nome']); ?></h1>
                    <p><strong>Email:</strong> <?php echo htmlspecialchars($user['email']); ?></p>
                    <p><strong>Função:</strong> <?php echo htmlspecialchars($user['function']); ?></p>
                    <p><strong>Status:</strong> <?php echo htmlspecialchars($user['status']); ?></p>
                </div>
            </div>

            <ul class="list-group mt-4">
                <li class="list-group-item"><strong>ID:</strong> <?php echo htmlspecialchars($user['id']); ?></li>
                <li class="list-group-item"><strong>Nome:</strong> <?php echo htmlspecialchars($user['nome']); ?></li>
                <li class="list-group-item"><strong>Email:</strong> <?php echo htmlspecialchars($user['email']); ?></li>
                <li class="list-group-item"><strong>Tipo:</strong> <?php echo htmlspecialchars($user['tipo']); ?></li>
                <li class="list-group-item"><strong>Status:</strong> <?php echo htmlspecialchars($user['status']); ?></li>
                <li class="list-group-item"><strong>Função:</strong> <?php echo htmlspecialchars($user['function']); ?></li>
            </ul>

            <!-- Exibição das metas como cards -->
            <h2 class="mt-4">Metas do Usuário</h2>
            <?php if (count($goals) > 0): ?>
                <?php foreach ($goals as $goal): ?>
                    <?php 
                    // Calcular o progresso percentual
                    $progressPercentage = min(100, ($goal['progress'] / $goal['target']) * 100); 
                    ?>
                    <div class="goal-card">
                        <h5><?php echo htmlspecialchars($goal['name']); ?></h5>
                        <p><strong>Data de Início:</strong> <?php echo htmlspecialchars($goal['start_date']); ?></p>
                        <p><strong>Data de Término:</strong> <?php echo htmlspecialchars($goal['end_date']); ?></p>
                        <p><strong>Meta:</strong> <?php echo htmlspecialchars($goal['target']); ?></p>
                        <p><strong>Lojas Adicionadas:</strong> <?php echo htmlspecialchars($goal['progress']); ?> de <?php echo htmlspecialchars($goal['target']); ?></p>

                        <!-- Barra de Progresso -->
                        <div class="progress">
                            <div class="progress-bar bg-success" role="progressbar" style="width: <?php echo $progressPercentage; ?>%;" aria-valuenow="<?php echo $progressPercentage; ?>" aria-valuemin="0" aria-valuemax="100">
                                <?php echo round($progressPercentage, 2); ?>%
                            </div>
                        </div>
                    </div>
                <?php endforeach; ?>
            <?php else: ?>
                <p>Este usuário não possui metas associadas.</p>
            <?php endif; ?>

            <!-- Gráfico de desempenho -->
            <div class="chart-container">
                <h2>Desempenho nos Últimos 30 Dias</h2>
                <canvas id="performanceChart"></canvas>
            </div>
        </div>
    </div>
    <!-- jQuery, Popper.js, Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <!-- Chart.js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
        const ctx = document.getElementById('performanceChart').getContext('2d');
        const performanceChart = new Chart(ctx, {
            type: 'line',
            data: {
                labels: <?php echo json_encode($dates); ?>,
                datasets: [{
                    label: 'Lojas Adicionadas',
                    data: <?php echo json_encode($totals); ?>,
                    backgroundColor: 'rgba(75, 192, 192, 0.2)',
                    borderColor: 'rgba(75, 192, 192, 1)',
                    borderWidth: 1,
                    fill: true,
                }]
            },
            options: {
                scales: {
                    x: {
                        type: 'time',
                        time: {
                            unit: 'day'
                        }
                    },
                    y: {
                        beginAtZero: true,
                        ticks: {
                            stepSize: 1
                        }
                    }
                }
            }
        });
    </script>
</body>
</html>
