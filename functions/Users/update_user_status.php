<?php
session_start();
include '../config.php';
require '../../vendor/autoload.php';  // Carregar autoload do Composer

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

// Exibe erros no PHP para depuração (remover em produção)
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

header('Content-Type: application/json');

// Decodificar o corpo JSON da requisição
$data = json_decode(file_get_contents('php://input'), true);

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Valida os parâmetros no JSON
    if (empty($data['id']) || empty($data['status'])) {
        echo json_encode(['success' => false, 'message' => 'Parâmetros id ou status ausentes.']);
        exit;
    }

    $id = $data['id'];
    $status = $data['status'];

    try {
        // Atualiza o status do usuário no banco de dados
        $stmt = $pdo->prepare("UPDATE users SET status = ? WHERE id = ?");
        if ($stmt->execute([$status, $id])) {
            // Se o status for "Ativo", envia um e-mail ao usuário
            if ($status === 'Ativo') {
                // Busca os dados do usuário
                $stmt = $pdo->prepare("SELECT email, nome FROM users WHERE id = ?");
                $stmt->execute([$id]);
                $user = $stmt->fetch(PDO::FETCH_ASSOC);

                if ($user) {
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

                        // Envia o e-mail
                        $mail->send();
                        echo json_encode(['success' => true]);
                    } catch (Exception $e) {
                        echo json_encode(['success' => false, 'message' => 'Erro ao enviar email: ' . $mail->ErrorInfo]);
                    }
                } else {
                    echo json_encode(['success' => false, 'message' => 'Usuário não encontrado.']);
                }
            } else {
                echo json_encode(['success' => true]);
            }
        } else {
            $errorInfo = $stmt->errorInfo();
            echo json_encode(['success' => false, 'message' => 'Erro ao atualizar status: ' . $errorInfo[2]]);
        }
    } catch (Exception $e) {
        echo json_encode(['success' => false, 'message' => 'Erro: ' . $e->getMessage()]);
    }
} else {
    echo json_encode(['success' => false, 'message' => 'Método de requisição inválido.']);
}
?>
