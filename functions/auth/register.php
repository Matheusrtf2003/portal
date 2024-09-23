<?php
require_once 'auth.php';
require_once 'validation.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $email = sanitizeInput($_POST['email'] ?? '');
    $password = sanitizeInput($_POST['password'] ?? '');
    $repeatpassword = sanitizeInput($_POST['repeatpassword'] ?? '');

    if (!validateEmail($email) || !validateString($password) || !validateString($repeatpassword)) {
        echo json_encode(['success' => false, 'message' => 'Invalid input data']);
        exit;
    }

    $result = registerUser($email, $password, $repeatpassword);
    echo json_encode($result);
}
?>
