<?php
session_start();
include 'functions/config.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $email = $_POST['email'];
    $senha = $_POST['senha'];

    // Consulta para buscar o usuário
    $stmt = $pdo->prepare("SELECT id, senha, nome, tipo, function FROM users WHERE email = ?");
    $stmt->execute([$email]);
    $user = $stmt->fetch(PDO::FETCH_ASSOC);

    // Verifica se o usuário existe e compara a senha sem hash
    if ($user && $senha === $user['senha']) {
        // Salva as informações do usuário na sessão
        $_SESSION['user_id'] = $user['id'];
        $_SESSION['user_nome'] = $user['nome'];
        $_SESSION['user_tipo'] = $user['tipo']; // Captura o tipo do usuário
        $_SESSION['user_function'] = $user['function']; // Captura a função do usuário
        
        header('Location: Dashboard/index.php'); // Redireciona para o dashboard
    } else {
        echo "Credenciais inválidas.";
    }
}
?>


<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="statics/css/index.css">
    <title>Login</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="icon" href="statics\img\favi-icon.png" type="image/x-icon">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #343a40;
            color: #fff;
        }

        .login-container {
            width: 100%;
            max-width: 500px;
            padding: 30px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
            color: #000;
        }

        .login-container .form-group {
            margin-bottom: 1.5rem;
        }

        .login-container h1 {
            margin-bottom: 1.5rem;
        }

        .login-container img {
            display: block;
            margin: 0 auto 20px;
            max-width: 100px;
        }

        label {
            color: black;
        }

        .password-container {
            position: relative;
        }

        .password-container input {
            padding-right: 50px;
            /* Ajuste de padding para acomodar o ícone maior */
        }

        .password-container i {
            position: absolute;
            right: 15px;
            /* Distância do ícone para a borda direita */
            top: 70%;
            transform: translateY(-50%);
            cursor: pointer;
            font-size: 1.5rem;
            /* Aumenta o tamanho do ícone */
        }

        .btn-block {
            width: 100%;
            max-width: 100%;
            /* Aumenta o tamanho do botão */
            margin: 0 auto;
            /* Centraliza o botão */
            padding: 15px 20px;
            /* Aumenta o espaço interno do botão */
            font-size: 18px;
            /* Aumenta o tamanho da fonte do botão */
        }

        .solicitar-acesso {
            display: block;
            text-align: center;
            margin-top: 15px;
            color: #007bff;
            cursor: pointer;
            font-size: 1rem;
            text-decoration: underline;
        }
    </style>
</head>

<body>
    <div class="login-container">
        <img src="statics/img/favi-icon.png" alt="Logotipo">
        <h1 class="text-center">Login</h1>
        <form method="post" action="">
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" class="form-control" id="email" name="email" placeholder="Informe seu email" required>
            </div>
            <div class="form-group password-container">
                <label for="senha">Senha:</label>
                <input type="password" class="form-control" id="senha" name="senha" placeholder="Informe a sua senha" required>
                <i class="bi bi-eye-slash" id="togglePassword"></i> <!-- Ícone para exibir/ocultar senha -->
            </div>
            <button type="submit" class="btn btn-success btn-block">Entrar</button>
        </form>

        <!-- Link para solicitar acesso -->
        <a class="solicitar-acesso" data-toggle="modal" data-target="#requestAccessModal">Solicitar Acesso</a>

        <?php
        if (!empty($error_message)) {
            echo '<p class="text-danger text-center mt-3">' . htmlspecialchars($error_message) . '</p>';
        }
        ?>
    </div>

    <!-- Modal Solicitar Acesso -->
    <div class="modal fade" id="requestAccessModal" tabindex="-1" aria-labelledby="requestAccessModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="requestAccessModalLabel">Solicitar Acesso</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="requestAccessForm">
                        <div class="form-group">
                            <label for="requestName">Nome:</label>
                            <input type="text" class="form-control" id="requestName" name="nome" required>
                        </div>
                        <div class="form-group">
                            <label for="requestEmail">Email:</label>
                            <input type="email" class="form-control" id="requestEmail" name="email" required>
                        </div>
                        <div class="form-group password-container">
                            <label for="requestPassword">Senha:</label>
                            <input type="password" class="form-control" id="requestPassword" name="senha" required>
                            <i class="bi bi-eye-slash" id="toggleRequestPassword"></i> <!-- Ícone para exibir/ocultar senha -->
                        </div>
                        <div class="form-group password-container">
                            <label for="confirmPassword">Confirme a Senha:</label>
                            <input type="password" class="form-control" id="confirmPassword" required>
                            <i class="bi bi-eye-slash" id="toggleConfirmPassword"></i> <!-- Ícone para exibir/ocultar confirmação -->
                        </div>
                        <div id="requestMessage" class="mt-3"></div>
                        <button type="submit" class="btn btn-primary btn-block">Enviar Solicitação</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal Aviso de Solicitação Enviada -->
    <div class="modal fade" id="successModal" tabindex="-1" aria-labelledby="successModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="successModalLabel">Solicitação Enviada</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p>Sua solicitação de acesso foi enviada com sucesso e está em fase de análise. Assim que o administrador aprová-lo, você será notificado por email.</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                </div>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
        // Função para exibir/ocultar senha
        document.querySelectorAll('[id^=togglePassword]').forEach(icon => {
            icon.addEventListener('click', function() {
                const input = this.previousElementSibling;
                if (input.type === "password") {
                    input.type = "text";
                    this.classList.remove('bi-eye-slash');
                    this.classList.add('bi-eye');
                } else {
                    input.type = "password";
                    this.classList.remove('bi-eye');
                    this.classList.add('bi-eye-slash');
                }
            });
        });

        $(document).ready(function() {
            $('#requestAccessForm').on('submit', function(event) {
                event.preventDefault();
                var formData = {
                    nome: $('#requestName').val(),
                    email: $('#requestEmail').val(),
                    senha: $('#requestPassword').val(),
                    confirm_senha: $('#confirmPassword').val()
                };
                if (formData.senha !== formData.confirm_senha) {
                    $('#requestMessage').text('As senhas não coincidem.').addClass('text-danger').removeClass('text-success');
                    return;
                }
                $.ajax({
                    type: 'POST',
                    url: 'functions/request_access.php',
                    data: formData,
                    success: function(response) {
                        if (response.success) {
                            $('#requestAccessModal').modal('hide'); // Fecha o modal de solicitação
                            $('#successModal').modal('show'); // Mostra o modal de sucesso
                            $('#requestAccessForm')[0].reset(); // Limpa o formulário
                        } else {
                            $('#requestMessage').text(response.message).addClass('text-danger').removeClass('text-success');
                        }
                    },
                    error: function() {
                        $('#requestMessage').text('Erro ao enviar solicitação.').addClass('text-danger').removeClass('text-success');
                    }
                });
            });
        });
    </script>
</body>

</html>