<?php
require_once __DIR__ . '/../../vendor/autoload.php';
use PHPAuth\Config as PHPAuthConfig;
use PHPAuth\Auth as PHPAuth;

function initializeAuth() {
    try {
        // Substitua 'db_user' e 'db_password' pelas credenciais corretas do seu banco de dados
        $dbh = new PDO("mysql:host=localhost;dbname=b2pro-maps", "root", "");
        $dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        $config = new PHPAuthConfig($dbh);
        $auth = new PHPAuth($dbh, $config);
        return $auth;
    } catch (PDOException $e) {
        echo "Error: " . $e->getMessage();
        die();
    }
}

function registerUser($email, $password, $repeatpassword) {
    $auth = initializeAuth();
    $register = $auth->register($email, $password, $repeatpassword);
    if ($register['error']) {
        return ['success' => false, 'message' => $register['message']];
    }
    return ['success' => true, 'message' => 'User registered successfully'];
}

function loginUser($email, $password) {
    $auth = initializeAuth();
    $login = $auth->login($email, $password);
    if ($login['error']) {
        return ['success' => false, 'message' => $login['message']];
    }
    return ['success' => true, 'hash' => $login['hash'], 'message' => 'Login successful'];
}

function logoutUser($hash) {
    $auth = initializeAuth();
    $logout = $auth->logout($hash);
    if ($logout['error']) {
        return ['success' => false, 'message' => $logout['message']];
    }
    return ['success' => true, 'message' => 'Logout successful'];
}
?>
