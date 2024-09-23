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
// Log de depuração
error_log("User ID: $userId, User Type: $userTipo");

try {
    // Verifica se o usuário é Administrador ou Gerente com a função de Suporte Afiadores
    if ($userTipo === 'Administrador' || ($userTipo === "Gerente")) {
        // Consulta para Administradores e Gerentes
        $stmt = $pdo->prepare("SELECT s.*, GROUP_CONCAT(sm.marcador_id) as marcadores 
                               FROM sharpeners s 
                               LEFT JOIN sharpeners_markers sm ON s.id = sm.sharpener_id 
                               GROUP BY s.id");
        error_log("Executando consulta para Administrador/Gerente");
        $stmt->execute();
    } elseif ($userTipo === "Padrão" && $userFunction === "Suporte Afiadores"){
        // Consulta para usuários comuns que só podem ver seus próprios afiadores
        $stmt = $pdo->prepare("SELECT s.*, GROUP_CONCAT(sm.marcador_id) as marcadores 
                               FROM sharpeners s 
                               LEFT JOIN sharpeners_markers sm ON s.id = sm.sharpener_id 
                               INNER JOIN sharpeners_users su ON s.id = su.sharpener_id 
                               WHERE su.user_id = ? 
                               GROUP BY s.id");
        error_log("Executando consulta para usuário ID: $userId");
        $stmt->execute([$userId]);
    }

    $sharpeners = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // Processar marcadores para garantir que seja um array
    foreach ($sharpeners as &$sharpener) {
        if (isset($sharpener['marcadores'])) {
            $sharpener['marcadores'] = explode(',', $sharpener['marcadores']);
        } else {
            $sharpener['marcadores'] = [];
        }
    }

    echo json_encode(['success' => true, 'sharpeners' => $sharpeners]);
    error_log("Afiadores carregados com sucesso");
} catch (Exception $e) {
    error_log('Erro ao carregar afiadores: ' . $e->getMessage());
    echo json_encode(['success' => false, 'message' => 'Erro ao carregar afiadores: ' . $e->getMessage()]);
}
?>
