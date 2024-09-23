<?php
function sanitizeInput($data) {
    // Remove espaços em branco do início e do fim
    $data = trim($data);
    // Remove barras invertidas
    $data = stripslashes($data);
    // Converte caracteres especiais em HTML entities
    $data = htmlspecialchars($data);
    return $data;
}

function validateEmail($email) {
    return filter_var($email, FILTER_VALIDATE_EMAIL);
}

function validateString($string, $minLength = 1, $maxLength = 255) {
    $length = strlen($string);
    return $length >= $minLength && $length <= $maxLength;
}
?>
