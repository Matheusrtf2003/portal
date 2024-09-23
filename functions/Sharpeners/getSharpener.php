<?php
session_start();
include '../config.php';

header('Content-Type: application/json');

if (!isset($_SESSION['user_id']) || !isset($_SESSION['user_tipo'])) {
    error_log('Usuário não autenticado');
    echo json_encode(['success' => false, 'message' => 'Usuário não autenticado']);
    exit;
}

$userId = $_SESSION['user_id'];
$userTipo = $_SESSION['user_tipo'];
$userFunction = $_SESSION['user_function'] ?? '';

if (!isset($_GET['id'])) {
    echo json_encode(['success' => false, 'message' => 'ID do afiador não fornecido.']);
    exit;
}

$afiadorId = $_GET['id'];

try {
    // Verifica se o usuário é Administrador ou Gerente
    if ($userTipo === 'Administrador' || ($userTipo === "Gerente")) {
        // Administradores e Gerentes podem ver qualquer afiador
        $stmt = $pdo->prepare("SELECT * FROM sharpeners WHERE id = ?");
        $stmt->execute([$afiadorId]);
    } else {
        // Usuários comuns só podem ver seus próprios afiadores
        $stmt = $pdo->prepare("SELECT s.* FROM sharpeners s 
                               INNER JOIN sharpeners_users su ON s.id = su.sharpener_id 
                               WHERE s.id = ? AND su.user_id = ?");
        $stmt->execute([$afiadorId, $userId]);
    }

    $sharpener = $stmt->fetch(PDO::FETCH_ASSOC);

    if ($sharpener) {
        echo json_encode(['success' => true, 'sharpener' => $sharpener]);
    } else {
        echo json_encode(['success' => false, 'message' => 'Afiador não encontrado ou sem permissão para visualizar.']);
    }
} catch (Exception $e) {
    error_log('Erro ao carregar afiador: ' . $e->getMessage());
    echo json_encode(['success' => false, 'message' => 'Erro ao carregar afiador: ' . $e->getMessage()]);
}
?>
