<?php
session_start();
$_SESSION['_csrf'] = $_SESSION['_csrf'] ?? hash('sha256', random_bytes(32));
include 'functions/config.php';

$error_message = '';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    if (!isset($_POST['_csrf']) || $_POST['_csrf'] !== $_SESSION['_csrf']) {
        $error_message = "CSRF token inválido.";
    } else {
        $email = $_POST['email'];
        $senha = $_POST['senha'];

        // Consulta para buscar o usuário
        $stmt = $pdo->prepare("SELECT id, senha, nome, tipo, function, agendor_api FROM users WHERE email = ?");
        $stmt->execute([$email]);
        $user = $stmt->fetch(PDO::FETCH_ASSOC);

        // Verifica se o usuário existe e compara a senha
        if ($user) {
            error_log("Usuário encontrado: " . $user['nome']);
            if ($senha === $user['senha']) {
                // Aqui, você pode usar password_verify() se estiver usando hash para senhas
                $_SESSION['user_id'] = $user['id'];
                $_SESSION['user_nome'] = $user['nome'];
                $_SESSION['user_tipo'] = $user['tipo'];
                $_SESSION['user_function'] = $user['function'];
                $_SESSION['agendor_api'] = $user['agendor_api'];
                error_log("Sessão iniciada para: " . $_SESSION['user_nome']);
                header('Location: Dashboard/index.php');
                exit();
            } else {
                error_log("Senha incorreta para o usuário: " . $email);
                $error_message = "Credenciais inválidas.";
            }
        } else {
            error_log("Usuário não encontrado com o email: " . $email);
            $error_message = "Credenciais inválidas.";
        }
        
        
    }
}
?>



<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="icon" href="statics/img/favi-icon.png" type="image/x-icon">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-gray-900 flex items-center justify-center min-h-screen">
    <!-- Login Form -->
    <div class="bg-white p-6 rounded-lg shadow-lg max-w-md w-full relative z-10">
        <img src="statics/img/favi-icon.png" alt="Logotipo" class="block mx-auto mb-4 w-24 h-24">
        <h1 class="text-center text-2xl font-bold mb-4">Login</h1>

        <?php if (!empty($error_message)): ?>
            <h2 class="text-center text-red-600 mb-4"><?php echo htmlspecialchars($error_message); ?></h2>
        <?php endif; ?>

        <form method="post" action="">
            <div class="mb-4">
                <label for="email" class="block text-sm font-medium text-gray-700">Email:</label>
                <input type="email" class="mt-1 block w-full p-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring focus:ring-blue-300 focus:border-blue-300" id="email" name="email" placeholder="Informe seu email" required>
            </div>

            <div class="mb-4 relative">
                <label for="senha" class="block text-sm font-medium text-gray-700">Senha:</label>
                <input type="password" class="mt-1 block w-full p-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring focus:ring-blue-300 focus:border-blue-300" id="senha" name="senha" placeholder="Informe a sua senha" required>
                <i class="bi bi-eye-slash absolute right-3 top-1/2 transform -translate-y-1/2 cursor-pointer" id="togglePassword"></i>
            </div>

            <input type="hidden" name="_csrf" value="<?php echo $_SESSION['_csrf']; ?>">
            <button type="submit" class="w-full py-2 px-4 bg-green-600 text-white font-semibold rounded-md hover:bg-green-700 focus:outline-none focus:ring focus:ring-green-300">Entrar</button>
        </form>

        <a class="block text-center text-blue-500 mt-4 underline cursor-pointer" id="openModal">Solicitar Acesso</a>
    </div>

    <!-- Modal Solicitar Acesso -->
    <div class="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-20 hidden" id="requestAccessModal">
        <div class="bg-white p-6 rounded-lg shadow-lg max-w-md w-full">
            <div class="flex justify-between items-center mb-4">
                <h5 class="text-lg font-bold">Solicitar Acesso</h5>
                <button class="text-gray-500 hover:text-gray-700" id="closeModal">&times;</button>
            </div>
            <form id="requestAccessForm">
                <div class="mb-4">
                    <label for="requestName" class="block text-sm font-medium text-gray-700">Nome:</label>
                    <input type="text" class="mt-1 block w-full p-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring focus:ring-blue-300 focus:border-blue-300" id="requestName" name="nome" required>
                </div>
                <div class="mb-4">
                    <label for="requestEmail" class="block text-sm font-medium text-gray-700">Email:</label>
                    <input type="email" class="mt-1 block w-full p-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring focus:ring-blue-300 focus:border-blue-300" id="requestEmail" name="email" required>
                </div>
                <div class="mb-4 relative">
                    <label for="requestPassword" class="block text-sm font-medium text-gray-700">Senha:</label>
                    <input type="password" class="mt-1 block w-full p-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring focus:ring-blue-300 focus:border-blue-300" id="requestPassword" name="senha" required>
                    <i class="bi bi-eye-slash absolute right-3 top-1/2 transform -translate-y-1/2 cursor-pointer" id="toggleRequestPassword"></i>
                </div>
                <div class="mb-4 relative">
                    <label for="confirmPassword" class="block text-sm font-medium text-gray-700">Confirme a Senha:</label>
                    <input type="password" class="mt-1 block w-full p-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring focus:ring-blue-300 focus:border-blue-300" id="confirmPassword" required>
                    <i class="bi bi-eye-slash absolute right-3 top-1/2 transform -translate-y-1/2 cursor-pointer" id="toggleConfirmPassword"></i>
                </div>
                <button type="submit" class="w-full py-2 px-4 bg-blue-600 text-white font-semibold rounded-md hover:bg-blue-700 focus:outline-none focus:ring focus:ring-blue-300">Enviar Solicitação</button>
            </form>
        </div>
    </div>

    <!-- Scripts -->
    <script>
        // Função para exibir/ocultar senha
        document.querySelectorAll('[id^=togglePassword], [id^=toggleRequestPassword], [id^=toggleConfirmPassword]').forEach(icon => {
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

        // Abrir modal
        document.getElementById('openModal').addEventListener('click', function() {
            document.getElementById('requestAccessModal').classList.remove('hidden');
        });

        // Fechar modal
        document.getElementById('closeModal').addEventListener('click', function() {
            document.getElementById('requestAccessModal').classList.add('hidden');
        });
    </script>
</body>

</html>
