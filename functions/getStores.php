<?php
session_start();
include 'config.php';

$userId = $_SESSION['user_id'];
$userTipo = $_SESSION['user_tipo'];

try {
    // Seleção da query com base no tipo de usuário
    if ($userTipo === 'Administrador') {
        $query = "
            SELECT s.*, 
                GROUP_CONCAT(DISTINCT m.id) as marcador_ids, 
                GROUP_CONCAT(DISTINCT m.nome) as marcador_nomes, 
                GROUP_CONCAT(DISTINCT m.cor) as marcador_cores,
                u.nome AS vendedor_nome,
                su.user_id AS usuario_id,
                uu.nome AS usuario_nome
            FROM stores s
            LEFT JOIN stores_markers sm ON s.id = sm.loja_id
            LEFT JOIN markers m ON sm.marcador_id = m.id
            LEFT JOIN stores_seller ss ON s.id = ss.store_id
            LEFT JOIN users u ON ss.vendedor_id = u.id
            LEFT JOIN stores_users su ON s.id = su.store_id
            LEFT JOIN users uu ON su.user_id = uu.id
            GROUP BY s.id

        ";
        $stmt = $pdo->prepare($query);
        $stmt->execute();
    } else {
        $query = "
            SELECT s.*, 
                GROUP_CONCAT(DISTINCT m.id) as marcador_ids, 
                GROUP_CONCAT(DISTINCT m.nome) as marcador_nomes, 
                GROUP_CONCAT(DISTINCT m.cor) as marcador_cores,
                u.nome AS vendedor_nome,
                su.user_id AS usuario_id,
                uu.nome AS usuario_nome
            FROM stores s
            LEFT JOIN stores_markers sm ON s.id = sm.loja_id
            LEFT JOIN markers m ON sm.marcador_id = m.id
            LEFT JOIN stores_seller ss ON s.id = ss.store_id
            LEFT JOIN users u ON ss.vendedor_id = u.id
            INNER JOIN stores_users su ON s.id = su.store_id AND su.user_id = ?
            LEFT JOIN users uu ON su.user_id = uu.id
            GROUP BY s.id
        ";
        $stmt = $pdo->prepare($query);
        $stmt->execute([$userId]);
    }

    $stores = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // Processa as lojas para incluir os marcadores e vendedores
    foreach ($stores as &$store) {
        // Marcadores
        $marcador_ids = explode(',', $store['marcador_ids']);
        $marcador_nomes = explode(',', $store['marcador_nomes']);
        $marcador_cores = explode(',', $store['marcador_cores']);
        
        $marcadores = [];
        for ($i = 0; $i < count($marcador_ids); $i++) {
            if (!empty($marcador_ids[$i])) {
                $marcadores[] = [
                    'id' => $marcador_ids[$i],
                    'nome' => $marcador_nomes[$i],
                    'cor' => $marcador_cores[$i]
                ];
            }
        }
        $store['marcadores'] = $marcadores;

        // Vendedor (se existir)
        $store['vendedor'] = $store['vendedor_nome'] ?: 'Sem vendedor';

        // Usuário (se existir)
        $store['usuario_id'] = $store['usuario_id'] ?: null;
        $store['usuario_nome'] = $store['usuario_nome'] ?: 'Sem usuário';
    }

    echo json_encode(['success' => true, 'stores' => $stores]);
} catch (Exception $e) {
    echo json_encode(['success' => false, 'message' => 'Erro ao carregar lojas: ' . $e->getMessage()]);
}
