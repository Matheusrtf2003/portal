<?php
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}
if (!isset($_SESSION['user_id'])) {
    header("Location: ../index.php");
    exit;
}

$user_tipo = $_SESSION['user_tipo'];
$user_function = isset($_SESSION['user_function']) ? $_SESSION['user_function'] : '';
?>
<link rel="stylesheet" href="../Perfil/statics/css/view_profile.css">
<!-- Inclua o CSS dos ícones do Bootstrap -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<nav class="sidebar-menu">
    <ul class="nav flex-column mb-5">
        <!-- Dashboard -->
        <li class="nav-item">
            <a class="nav-link <?php if(basename($_SERVER['PHP_SELF']) == '../Dashboard/index.php'){echo 'active';} ?>" href="../Dashboard/index.php">
                <i class="bi bi-speedometer"></i>  
                <span>Dashboard</span>
            </a>
        </li>

        <!-- Maps (Somente Administradores e Gerentes) -->
        <?php if ($user_tipo === 'Administrador' || $user_tipo === 'Gerente'): ?>
        <li class="nav-item">
            <a class="nav-link <?php if(basename($_SERVER['PHP_SELF']) == '../Maps/index.php'){echo 'active';} ?>" href="../Maps/index.php">
                <i class="bi bi-map"></i>    
                <span>Maps</span>
            </a>
        </li>
        <?php endif; ?>

        <!-- Lojas (Todos os Usuários) -->
        <li class="nav-item">
            <a class="nav-link <?php if(basename($_SERVER['PHP_SELF']) == '../Lojas/index.php'){echo 'active';} ?>" href="../Lojas/index.php">
                <i class="bi bi-shop"></i>    
                <span>Lojas</span>
            </a>
        </li>

        <!-- Equipe (Somente Administradores e Gerentes) -->
        <?php if ($user_tipo === 'Administrador' || $user_tipo === 'Gerente'): ?>
        <li class="nav-item">
            <a class="nav-link <?php if(basename($_SERVER['PHP_SELF']) == '../Equipes/index.php'){echo 'active';} ?>" href="../Equipes/index.php">
                <i class="bi bi-people"></i>    
                <span>Equipe</span>
            </a>
        </li>
        <?php endif; ?>

        <!-- Marcadores (Somente Administradores e Gerentes) -->
        <?php if ($user_tipo === 'Administrador' || $user_tipo === 'Gerente'): ?>
        <li class="nav-item">
            <a class="nav-link <?php if(basename($_SERVER['PHP_SELF']) == '../Marcadores/index.php'){echo 'active';} ?>" href="../Marcadores/index.php">
                <i class="bi bi-bookmark-star"></i>    
                <span>Marcadores</span>
            </a>
        </li>
        <?php endif; ?>

        <!-- Educadoras Oficiais (Somente Administradores e Suporte Educadoras) -->
        <?php if ($user_tipo === 'Administrador' || $user_function === 'Suporte Educadoras'): ?>
        <li class="nav-item">
            <a class="nav-link <?php if(basename($_SERVER['PHP_SELF']) == '../Educadores/index.php'){echo 'active';} ?>" href="../Educadores/index.php">
                <i class="bi bi-book"></i>    
                <span>Educadoras Oficiais</span>
            </a>
        </li>
        <?php endif; ?>

        <!-- Afiadores (Somente Administradores e Suporte Afiadores) -->
        <?php if ($user_tipo === 'Administrador' || $user_function === 'Suporte Afiadores'): ?>
        <li class="nav-item">
            <a class="nav-link <?php if(basename($_SERVER['PHP_SELF']) == '../Afiadores/index.php'){echo 'active';} ?>" href="../Afiadores/index.php">
                <i class="bi bi-scissors"></i>    
                <span>Afiadores</span>
            </a>
        </li>
        <?php endif; ?>

        <!-- Usuários (Somente Administradores e Gerentes) -->
        <?php if ($user_tipo === 'Administrador' || $user_tipo === 'Gerente'): ?>
        <li class="nav-item">
            <a class="nav-link <?php if(basename($_SERVER['PHP_SELF']) == '../TodosUsuarios/index.php'){echo 'active';} ?>" href="../TodosUsuarios/index.php">
                <i class="bi bi-person-plus"></i>
                <span>Usuários</span>
            </a>
        </li>
        <?php endif; ?>
    </ul>
    <p class="text-primary badge p-2 bg-white">Versão 0.2</p>

</nav>
