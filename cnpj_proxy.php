<?php
// cnpj_proxy.php
if (isset($_GET['cnpj'])) {
    $cnpj = $_GET['cnpj'];

    // Remove caracteres não numéricos do CNPJ
    $cnpj = preg_replace('/\D/', '', $cnpj);

    // Faz a requisição à API da ReceitaWS
    $url = "https://www.receitaws.com.br/v1/cnpj/" . $cnpj;
    
    // Realiza a requisição e retorna o resultado para o frontend
    $ch = curl_init($url);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    $response = curl_exec($ch);
    curl_close($ch);
    
    // Retorna a resposta da API ao navegador
    header('Content-Type: application/json');
    echo $response;
}
