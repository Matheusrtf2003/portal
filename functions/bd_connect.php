<?php
// Configurações do banco de dados
$servername = "localhost";  // Nome do servidor MySQL (normalmente localhost)
$username = "root";  // Nome de usuário do MySQL
$password = "";    // Senha do MySQL
$dbname = "b2pro-maps";  // Nome do banco de dados a ser utilizado

// Cria a conexão
$conn = new mysqli($servername, $username, $password, $dbname);

// Verifica a conexão
if ($conn->connect_error) {
    die("Erro de conexão: " . $conn->connect_error);
}

// Configura o charset para UTF-8 (opcional)
$conn->set_charset("utf8");

?>
