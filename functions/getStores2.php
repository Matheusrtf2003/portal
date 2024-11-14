<?php
// No início do script PHP responsável por carregar a loja
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

header('Content-Type: application/json');
session_start();
include 'config.php';

if (!isset($_SESSION['user_id']) || !isset($_SESSION['user_tipo'])) {
    echo json_encode(['success' => false, 'message' => 'Sessão expirada ou usuário não autenticado.']);
    exit;
}

$userId = $_SESSION['user_id'];
$userTipo = $_SESSION['user_tipo'];

try {
    if ($userTipo === 'Administrador') {
        // If the user is an Administrator, fetch all stores
        $stmt = $pdo->prepare("
            SELECT s.*, 
                   e.sigla AS estado_sigla,          
                   meso.nome AS mesorregiao_nome,    
                   GROUP_CONCAT(DISTINCT mr.id) AS marcador_ids, 
                   GROUP_CONCAT(DISTINCT mr.nome) AS marcador_nomes, 
                   GROUP_CONCAT(DISTINCT mr.cor) AS marcador_cores,
                   GROUP_CONCAT(DISTINCT u.id) AS usuario_ids,  
                   GROUP_CONCAT(DISTINCT u.nome) AS usuarios,
                   vs.nome AS vendedor_nome, 
                   vs.id AS vendedor_id      
            FROM stores s 
            LEFT JOIN estados e ON s.estado = e.id
            LEFT JOIN mesorregioes meso ON s.mesorregiao = meso.id
            LEFT JOIN stores_markers sm ON s.id = sm.loja_id 
            LEFT JOIN markers mr ON sm.marcador_id = mr.id 
            LEFT JOIN stores_users su ON s.id = su.store_id 
            LEFT JOIN users u ON su.user_id = u.id
            LEFT JOIN stores_seller ss ON s.id = ss.store_id
            LEFT JOIN users vs ON ss.vendedor_id = vs.id  
            GROUP BY s.id
            ORDER BY s.datetime DESC
        ");
        $stmt->execute();
    } else {
        // For non-administrator users, fetch stores associated via stores_users or stores_seller
        $stmt = $pdo->prepare("
            SELECT s.*, 
                   e.sigla AS estado_sigla,          
                   meso.nome AS mesorregiao_nome,    
                   GROUP_CONCAT(DISTINCT mr.id) AS marcador_ids, 
                   GROUP_CONCAT(DISTINCT mr.nome) AS marcador_nomes, 
                   GROUP_CONCAT(DISTINCT mr.cor) AS marcador_cores,
                   GROUP_CONCAT(DISTINCT u.id) AS usuario_ids,  
                   GROUP_CONCAT(DISTINCT u.nome) AS usuarios,
                   vs.nome AS vendedor_nome, 
                   vs.id AS vendedor_id 
            FROM stores s 
            LEFT JOIN estados e ON s.estado = e.id
            LEFT JOIN mesorregioes meso ON s.mesorregiao = meso.id
            LEFT JOIN stores_markers sm ON s.id = sm.loja_id 
            LEFT JOIN markers mr ON sm.marcador_id = mr.id 
            LEFT JOIN stores_users su ON s.id = su.store_id 
            LEFT JOIN users u ON su.user_id = u.id
            LEFT JOIN stores_seller ss ON s.id = ss.store_id
            LEFT JOIN users vs ON ss.vendedor_id = vs.id  
            WHERE su.user_id = :userId OR ss.vendedor_id = :userId
            GROUP BY s.id
            ORDER BY s.datetime DESC
        ");
        $stmt->execute(['userId' => $userId]);
    }

    $stores = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // Process the fetched data to convert markers and users into arrays
    foreach ($stores as &$store) {
        // Process markers
        $marcador_ids = isset($store['marcador_ids']) ? explode(',', $store['marcador_ids']) : [];
        $marcador_nomes = isset($store['marcador_nomes']) ? explode(',', $store['marcador_nomes']) : [];
        $marcador_cores = isset($store['marcador_cores']) ? explode(',', $store['marcador_cores']) : [];

        $marcadores = [];
        for ($i = 0; $i < max(count($marcador_ids), count($marcador_nomes), count($marcador_cores)); $i++) {
            $marcadores[] = [
                'id' => $marcador_ids[$i] ?? null,
                'nome' => $marcador_nomes[$i] ?? 'Sem Nome',
                'cor' => $marcador_cores[$i] ?? '#000000'
            ];
        }
        $store['marcadores'] = $marcadores;
        unset($store['marcador_ids'], $store['marcador_nomes'], $store['marcador_cores']);

        // Process users
        $usuario_ids = isset($store['usuario_ids']) ? explode(',', $store['usuario_ids']) : [];
        $usuarios = isset($store['usuarios']) ? explode(',', $store['usuarios']) : [];

        $usuarios_data = [];
        for ($i = 0; $i < count($usuario_ids); $i++) {
            $usuarios_data[] = [
                'id' => $usuario_ids[$i],
                'nome' => $usuarios[$i]
            ];
        }
        $store['usuarios_data'] = $usuarios_data;
        unset($store['usuario_ids'], $store['usuarios']);

        // Add the seller to the store
        $store['Vendedor'] = [
            'id' => $store['vendedor_id'],
            'nome' => $store['vendedor_nome']
        ];
        unset($store['vendedor_id'], $store['vendedor_nome']); // Clean up raw data
    }

    echo json_encode(['success' => true, 'stores' => $stores]);
} catch (Exception $e) {
    echo json_encode(['success' => false, 'message' => 'Erro ao carregar lojas: ' . $e->getMessage()]);
}
?>
