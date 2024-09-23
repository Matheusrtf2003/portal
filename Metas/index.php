<?php
session_start();
include 'config.php';

if ($_SESSION['user_tipo'] !== 'Administrador') {
    header("Location: index.php");
    exit;
}

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $user_id = $_POST['user_id'];
    $marcador_id = $_POST['marcador_id'];
    $data_maxima = $_POST['data_maxima'];
    $quantidade = $_POST['quantidade'];
    $premiacao = $_POST['premiacao'];

    $stmt = $pdo->prepare("INSERT INTO metas (user_id, marcador_id, data_maxima, quantidade, premiacao) VALUES (?, ?, ?, ?, ?)");
    $stmt->execute([$user_id, $marcador_id, $data_maxima, $quantidade, $premiacao]);

    header("Location: pageMetas.php");
    exit;
}

$users = $pdo->query("SELECT id, nome FROM users WHERE tipo = 'Padrão'")->fetchAll(PDO::FETCH_ASSOC);
$marcadores = $pdo->query("SELECT id, nome FROM markers")->fetchAll(PDO::FETCH_ASSOC);
?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastro de Metas</title>
    <link rel="icon" href="statics\img\favi-icon.png" type="image/x-icon">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <?php include 'sidebar.php'; ?>

    <div class="container mt-4">
        <h1>Cadastro de Metas</h1>
        <form method="POST">
            <div class="form-group">
                <label for="user_id">Usuário</label>
                <select class="form-control" id="user_id" name="user_id" required>
                    <?php foreach ($users as $user): ?>
                        <option value="<?= $user['id'] ?>"><?= $user['nome'] ?></option>
                    <?php endforeach; ?>
                </select>
            </div>
            <div class="form-group">
                <label for="marcador_id">Marcador</label>
                <select class="form-control" id="marcador_id" name="marcador_id" required>
                    <?php foreach ($marcadores as $marcador): ?>
                        <option value="<?= $marcador['id'] ?>"><?= $marcador['nome'] ?></option>
                    <?php endforeach; ?>
                </select>
            </div>
            <div class="form-group">
                <label for="data_maxima">Data Máxima</label>
                <input type="date" class="form-control" id="data_maxima" name="data_maxima" required>
            </div>
            <div class="form-group">
                <label for="quantidade">Quantidade</label>
                <input type="number" class="form-control" id="quantidade" name="quantidade" required>
            </div>
            <div class="form-group">
                <label for="premiacao">Premiação</label>
                <input type="text" class="form-control" id="premiacao" name="premiacao" required>
            </div>
            <button type="submit" class="btn btn-primary">Cadastrar Meta</button>
        </form>
    </div>
</body>
</html>
