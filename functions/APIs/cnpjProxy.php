<?php
header('Content-Type: application/json');

if (isset($_GET['cnpj'])) {
    $cnpj = $_GET['cnpj'];

    $url = "https://receitaws.com.br/v1/cnpj/$cnpj";

    $ch = curl_init($url);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
    curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);

    $response = curl_exec($ch);

    if (curl_errno($ch)) {
        echo json_encode(['success' => false, 'message' => 'Erro na requisição: ' . curl_error($ch)]);
    } else {
        echo $response;
    }

    curl_close($ch);
} else {
    echo json_encode(['success' => false, 'message' => 'CNPJ não fornecido.']);
}
?>
