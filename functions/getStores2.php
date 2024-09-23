<?php
session_start();
include 'config.php';

$userId = $_SESSION['user_id'];
$userTipo = $_SESSION['user_tipo'];

try {
    if ($userTipo === 'Administrador') {
        $stmt = $pdo->prepare("
            SELECT s.*, 
                   GROUP_CONCAT(m.id) as marcador_ids, 
                   GROUP_CONCAT(m.nome) as marcador_nomes, 
                   GROUP_CONCAT(m.cor) as marcador_cores,
                   GROUP_CONCAT(u.id) as usuario_ids,  /* IDs dos usuários */
                   GROUP_CONCAT(u.nome) as usuarios,
                   vs.nome as vendedor_nome, /* Nome do vendedor */
                   vs.id as vendedor_id      /* ID do vendedor */
            FROM stores s 
            LEFT JOIN stores_markers sm ON s.id = sm.loja_id 
            LEFT JOIN markers m ON sm.marcador_id = m.id 
            LEFT JOIN stores_users su ON s.id = su.store_id 
            LEFT JOIN users u ON su.user_id = u.id
            LEFT JOIN stores_seller ss ON s.id = ss.store_id
            LEFT JOIN users vs ON ss.vendedor_id = vs.id  /* Join para o vendedor */
            GROUP BY s.id
            ORDER BY s.datetime DESC  /* Ordenar por data de registro */
        ");
        $stmt->execute();
    } else {
        $stmt = $pdo->prepare("
            SELECT s.*, 
                   GROUP_CONCAT(m.id) as marcador_ids, 
                   GROUP_CONCAT(m.nome) as marcador_nomes, 
                   GROUP_CONCAT(m.cor) as marcador_cores,
                   GROUP_CONCAT(u.id) as usuario_ids,  /* IDs dos usuários */
                   GROUP_CONCAT(u.nome) as usuarios,
                   vs.nome as vendedor_nome, /* Nome do vendedor */
                   vs.id as vendedor_id      /* ID do vendedor */
            FROM stores s 
            LEFT JOIN stores_markers sm ON s.id = sm.loja_id 
            LEFT JOIN markers m ON sm.marcador_id = m.id 
            INNER JOIN stores_users su ON s.id = su.store_id 
            LEFT JOIN users u ON su.user_id = u.id
            LEFT JOIN stores_seller ss ON s.id = ss.store_id
            LEFT JOIN users vs ON ss.vendedor_id = vs.id  /* Join para o vendedor */
            WHERE su.user_id = ? 
            GROUP BY s.id
            ORDER BY s.datetime DESC  /* Ordenar por data de registro */
        ");
        $stmt->execute([$userId]);
    }

    $stores = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // Processar os marcadores e usuários para garantir que sejam arrays
    foreach ($stores as &$store) {
        $marcador_ids = isset($store['marcador_ids']) ? explode(',', $store['marcador_ids']) : [];
        $marcador_nomes = isset($store['marcador_nomes']) ? explode(',', $store['marcador_nomes']) : [];
        $marcador_cores = isset($store['marcador_cores']) ? explode(',', $store['marcador_cores']) : [];

        $marcadores = [];
        for ($i = 0; $i < count($marcador_ids); $i++) {
            $marcadores[] = [
                'id' => $marcador_ids[$i],
                'nome' => $marcador_nomes[$i],
                'cor' => $marcador_cores[$i]
            ];
        }
        $store['marcadores'] = $marcadores;
        unset($store['marcador_ids'], $store['marcador_nomes'], $store['marcador_cores']);

        // Processar usuários
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

        // Adicionar o vendedor à loja
        $store['vendedor'] = [
            'id' => $store['vendedor_id'],
            'nome' => $store['vendedor_nome']
        ];
        unset($store['vendedor_id'], $store['vendedor_nome']); // Limpa os dados não processados
    }

    echo json_encode(['success' => true, 'stores' => $stores]);
} catch (Exception $e) {
    echo json_encode(['success' => false, 'message' => 'Erro ao carregar lojas: ' . $e->getMessage()]);
}

?>
