<?php
include 'config.php';

$filters = [];
$params = [];

if (!empty($_GET['status'])) {
    $filters[] = 'status = :status';
    $params[':status'] = $_GET['status'];
}

if (!empty($_GET['vendedor'])) {
    $filters[] = 'vendedor = :vendedor';
    $params[':vendedor'] = $_GET['vendedor'];
}

if (!empty($_GET['addressKeyword'])) {
    $filters[] = 'endereco LIKE :addressKeyword';
    $params[':addressKeyword'] = '%' . $_GET['addressKeyword'] . '%';
}

if (!empty($_GET['cidade'])) {
    $filters[] = 'cidade LIKE :cidade';
    $params[':cidade'] = '%' . $_GET['cidade'] . '%';
}

if (!empty($_GET['estado'])) {
    $filters[] = 'estado LIKE :estado';
    $params[':estado'] = '%' . $_GET['estado'] . '%';
}

if (!empty($_GET['datetime'])) {
    $filters[] = 'DATE(datetime) = :datetime';
    $params[':datetime'] = $_GET['datetime'];
}

if (!empty($_GET['markers'])) {
    $markers = implode(',', array_map('intval', $_GET['markers']));
    $filters[] = "id IN (SELECT store_id FROM stores_markers WHERE marker_id IN ($markers))";
}

if (!empty($_GET['query'])) {
    $filters[] = '(nome LIKE :query OR id = :queryExact OR cnpj LIKE :query)';
    $params[':query'] = '%' . $_GET['query'] . '%';
    $params[':queryExact'] = $_GET['query'];
}

$query = "SELECT * FROM stores";

if (!empty($filters)) {
    $query .= ' WHERE ' . implode(' AND ', $filters);
}

$stmt = $pdo->prepare($query);
foreach ($params as $key => $value) {
    $stmt->bindValue($key, $value);
}
$stmt->execute();

$stores = $stmt->fetchAll(PDO::FETCH_ASSOC);

echo json_encode($stores);
?>
