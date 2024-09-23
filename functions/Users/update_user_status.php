<?php
session_start();
include '../config.php';
require '../vendor/autoload.php';  // Carregar autoload do Composer

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

header('Content-Type: application/json');

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $id = $_POST['id'];
    $status = $_POST['status'];

    try {
        $stmt = $pdo->prepare("UPDATE users SET status = ? WHERE id = ?");
        if ($stmt->execute([$status, $id])) {
            if ($status === 'Ativo') {  // Atualize o status para "Ativo"
                $stmt = $pdo->prepare("SELECT email, nome FROM users WHERE id = ?");
                $stmt->execute([$id]);
                $user = $stmt->fetch(PDO::FETCH_ASSOC);

                // Enviar email usando PHPMailer
                $mail = new PHPMailer(true);

                try {
                    // Configurações do servidor SMTP
                    $mail->isSMTP();
                    $mail->Host = 'smtp.hostinger.com';
                    $mail->SMTPAuth = true;
                    $mail->Username = 'portal@b2pro.com.br';
                    $mail->Password = 'Portal@12';
                    $mail->SMTPSecure = PHPMailer::ENCRYPTION_SMTPS;
                    $mail->Port = 465;

                    // Destinatários
                    $mail->setFrom('portal@b2pro.com.br', 'Sistema');
                    $mail->addAddress($user['email'], $user['nome']);

                    // Conteúdo do email
                    $mail->isHTML(true);
                    $mail->Subject = 'Conta Aprovada - Portal Mapeamento B2PRO';
                    $mail->Body    = "Olá " . $user['nome'] . ",<br><br>Sua conta foi aprovada com sucesso! Você agora pode acessar o sistema.<br><br>Parabéns e bem-vindo!<br><br>Atenciosamente,<br>Equipe do Sistema";

                    $mail->send();
                    echo json_encode(['success' => true]);
                } catch (Exception $e) {
                    echo json_encode(['success' => false, 'message' => 'Erro ao enviar email: ' . $mail->ErrorInfo]);
                }
            } else {
                echo json_encode(['success' => true]);
            }
        } else {
            echo json_encode(['success' => false, 'message' => 'Erro ao atualizar status.']);
        }
    } catch (Exception $e) {
        echo json_encode(['success' => false, 'message' => 'Erro: ' . $e->getMessage()]);
    }
} else {
    echo json_encode(['success' => false, 'message' => 'Método de requisição inválido.']);
}
?>
