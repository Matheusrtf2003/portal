<?php
// Importa a configuração do banco de dados
require 'config.php'; // Certifique-se de que o caminho está correto

// Consulta para buscar estados e suas mesorregiões
$sql = "SELECT mesorregioes.id AS mesorregiao_id, mesorregioes.nome AS mesorregiao_nome, 
        estados.id AS estado_id, estados.nome AS estado_nome, estados.sigla AS estado_sigla
        FROM mesorregioes
        JOIN estados ON mesorregioes.estado_id = estados.id";

try {
    // Executa a consulta
    $stmt = $pdo->prepare($sql);
    $stmt->execute();

    $mesorregioes = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // Retorna os dados em formato JSON
    echo json_encode($mesorregioes);

} catch (PDOException $e) {
    // Em caso de erro, exibe a mensagem de erro
    echo 'Erro ao buscar dados: ' . $e->getMessage();
}
?>
