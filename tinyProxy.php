<?php
if (!isset($_GET['cnpj'])) {
    echo json_encode(['success' => false, 'message' => 'CNPJ não fornecido']);
    exit;
}

$cnpj = urlencode($_GET['cnpj']);
$token = 'c854f3ce8979089e9b0e6b758697b6ce48a9bceaf7506983d25bc9fc73a510e1';  // Substitua pelo seu token real

// Função para fazer uma chamada à API do Tiny
function callTinyAPI($url) {
    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
    $response = curl_exec($ch);

    if (curl_errno($ch)) {
        curl_close($ch);
        return ['success' => false, 'message' => 'Erro na chamada à API: ' . curl_error($ch)];
    }

    curl_close($ch);
    $decodedResponse = json_decode($response, true);

    if (json_last_error() !== JSON_ERROR_NONE) {
        return ['success' => false, 'message' => 'Erro na decodificação JSON: ' . json_last_error_msg()];
    }

    return $decodedResponse;
}

// Chamada para buscar os detalhes do cliente
$clientUrl = "https://api.tiny.com.br/api2/contatos.pesquisa.php?token=$token&cpf_cnpj=$cnpj&formato=json";
$clientData = callTinyAPI($clientUrl);

// Chamada para buscar os pedidos do cliente
$orderUrl = "https://api.tiny.com.br/api2/pedidos.pesquisa.php?token=$token&cpf_cnpj=$cnpj&formato=json";
$orderData = callTinyAPI($orderUrl);

// Combinar as duas respostas em um único JSON
$response = [
    'cliente' => $clientData,
    'pedidos' => $orderData
];

header('Content-Type: application/json');
echo json_encode($response);
?>
