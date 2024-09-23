<?php
include 'config.php';

header('Content-Type: application/json');

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    try {
        if (!isset($_POST['id']) || empty($_POST['id'])) {
            throw new Exception('ID do usuário não fornecido.');
        }

        $id = $_POST['id'];
        $nome = $_POST['nome'];
        $email = $_POST['email'];
        $senha = !empty($_POST['senha']) ? password_hash($_POST['senha'], PASSWORD_BCRYPT) : null;

        $imgName = null;
        if (!empty($_FILES['userPhoto']['name'])) {
            $ext = pathinfo($_FILES['userPhoto']['name'], PATHINFO_EXTENSION);
            $imgName = 'user_' . $id . '.' . $ext;
            $uploadPath = '../uploads/' . $imgName;

            if (!move_uploaded_file($_FILES['userPhoto']['tmp_name'], $uploadPath)) {
                throw new Exception('Erro ao fazer upload da foto.');
            }
        }

        if ($senha) {
            $sql = "UPDATE users SET nome = ?, email = ?, senha = ?, img_name = COALESCE(?, img_name) WHERE id = ?";
            $stmt = $pdo->prepare($sql);
            $stmt->execute([$nome, $email, $senha, $imgName, $id]);
        } else {
            $sql = "UPDATE users SET nome = ?, email = ?, img_name = COALESCE(?, img_name) WHERE id = ?";
            $stmt = $pdo->prepare($sql);
            $stmt->execute([$nome, $email, $imgName, $id]);
        }

        if ($stmt->rowCount() > 0) {
            echo json_encode(['success' => true, 'img_name' => $imgName]);
        } else {
            echo json_encode(['success' => false, 'message' => 'Nenhuma alteração feita nos dados do usuário.']);
        }
    } catch (Exception $e) {
        echo json_encode(['success' => false, 'message' => 'Erro: ' . $e->getMessage()]);
    }
}
?>
