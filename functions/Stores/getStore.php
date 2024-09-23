<?php
include '../config.php';

header('Content-Type: application/json');

// Verifica se o ID da loja foi fornecido
if (!isset($_GET['id'])) {
    echo json_encode(['success' => false, 'message' => 'ID da loja é obrigatório.']);
    exit;
}

$storeId = $_GET['id'];

try {
    // Verifica se a conexão com o banco de dados existe
    if (!isset($pdo)) {
        echo json_encode(['success' => false, 'message' => 'Erro na conexão com o banco de dados.']);
        exit;
    }

    // Consulta para buscar a loja e seus marcadores
    $stmt = $pdo->prepare("
        SELECT s.*, 
               GROUP_CONCAT(m.id) as marcador_ids, 
               GROUP_CONCAT(m.nome) as marcador_nomes, 
               GROUP_CONCAT(m.cor) as marcador_cores 
        FROM stores s
        LEFT JOIN stores_markers sm ON s.id = sm.loja_id
        LEFT JOIN markers m ON sm.marcador_id = m.id
        WHERE s.id = ?
        GROUP BY s.id
    ");
    $stmt->execute([$storeId]);
    $store = $stmt->fetch(PDO::FETCH_ASSOC);

    if ($store) {
        // Processa os marcadores
        $marcador_ids = explode(',', $store['marcador_ids']);
        $marcador_nomes = explode(',', $store['marcador_nomes']);
        $marcador_cores = explode(',', $store['marcador_cores']);
        
        $marcadores = [];
        for ($i = 0; $i < count($marcador_ids); $i++) {
            if (!empty($marcador_ids[$i])) { // Certifica-se de que o ID do marcador não esteja vazio
                $marcadores[] = [
                    'id' => $marcador_ids[$i],
                    'nome' => $marcador_nomes[$i],
                    'cor' => $marcador_cores[$i]
                ];
            }
        }
        $store['marcadores'] = $marcadores;

        // Remove as colunas de agregação
        unset($store['marcador_ids'], $store['marcador_nomes'], $store['marcador_cores']);

        // Retorna os dados da loja com sucesso
        echo json_encode(['success' => true, 'store' => $store]);
    } else {
        echo json_encode(['success' => false, 'message' => 'Loja não encontrada.']);
    }
} catch (PDOException $e) {
    echo json_encode(['success' => false, 'message' => 'Erro ao carregar loja: ' . $e->getMessage()]);
}
?>
