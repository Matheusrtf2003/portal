<?php
header('Content-Type: application/json');

include '../config.php';

if (isset($_GET['id'])) {
    $id = intval($_GET['id']);
    $sql = "SELECT * FROM lojas WHERE id = $id";
} else {
    $sql = "SELECT id, nome, endereco FROM lojas";
}

$result = $conn->query($sql);

$data = [];
if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        $data[] = $row;
    }
} else {
    $data = ["message" => "0 results"];
}

$conn->close();

echo json_encode($data);
?>
