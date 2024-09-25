<?php
session_start();
if (!isset($_SESSION['user_id']) || $_SESSION['user_tipo'] !== 'Administrador') {
    header("Location: index.php");
    exit;
}

include '../functions/config.php';

// Pega todos os usuários
$stmt = $pdo->prepare("SELECT id, nome, email, tipo, status FROM users");
$stmt->execute();
$users = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Usuários</title>
    <link rel="icon" href="../statics/img/favi-icon.png" type="image/x-icon">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../statics/css/style.css">
    <link rel="stylesheet" href="statics/css/usuarios.css">
    <link rel="stylesheet" href="../sidebar/css/sidebar.css">
</head>
<body>
    <?php include '../sidebar/sidebar.php'; ?>
    <?php include '../MenuUsuario/user_menu.php'; ?>

    <div class="container-fluid">
        <div class="row">
            <div class="col-md-7 offset-md-3">
                <!--- <a href="i" class="btn btn-secondary mt-4">Voltar</a> -->
                <h1 style="margin-top: 20px;">Usuários Pendentes</h1>
                <div class="table-responsive">
                    <table class="table table-bordered" id="pendingUsersTable">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Nome</th>
                                <th>Email</th>
                                <th>Tipo</th>
                                <th>Status</th>
                                <th>Função</th> <!-- Adicione a coluna Função -->
                                <th>Ações</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php foreach ($users as $user): ?>
                                <?php if ($user['status'] === 'Solicitado'): ?>
                                    <tr>
                                        <td><?php echo htmlspecialchars($user['id']); ?></td>
                                        <td><?php echo htmlspecialchars($user['nome']); ?></td>
                                        <td><?php echo htmlspecialchars($user['email']); ?></td>
                                        <td><?php echo htmlspecialchars($user['tipo']); ?></td>
                                        <td><?php echo htmlspecialchars($user['status']); ?></td>
                                        <td><?php echo htmlentities($user['function']); ?></td> <!-- Exiba a função -->
                                        <td>
                                            <button class="btn btn-success btn-sm" onclick="updateUserStatus(<?php echo $user['id']; ?>, 'Ativo')">Aprovar</button>
                                            <button class="btn btn-danger btn-sm" onclick="updateUserStatus(<?php echo $user['id']; ?>, 'Recusado')">Reprovar</button>
                                        </td>
                                    </tr>
                                <?php endif; ?>
                            <?php endforeach; ?>
                        </tbody>
                    </table>
                </div>
            </div>

            <div class="col-md-7 offset-md-3">
                <h1 style="margin-top: 20px;">Todos os Usuários</h1>
                <button type="button" class="btn btn-info" data-toggle="modal" data-target="#addUserModal" style="margin-bottom: 20px; margin-top: 50px;">Adicionar Usuário</button>
                <div class="table-responsive">
                    <table class="table table-bordered" id="usersTable">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Nome</th>
                                <th>Email</th>
                                <th>Tipo</th>
                                <th>Status</th>
                                <th>Funções</th>
                                <th>Ações</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php foreach ($users as $user): ?>
                                <?php if ($user['status'] !== 'Solicitado'): ?>
                                    <tr>
                                        <td><?php echo htmlspecialchars($user['id']); ?></td>
                                        <td><?php echo htmlspecialchars($user['nome']); ?></td>
                                        <td><?php echo htmlspecialchars($user['email']); ?></td>
                                        <td><?php echo htmlspecialchars($user['tipo']); ?></td>
                                        <td><?php echo htmlspecialchars($user['status']); ?></td>
                                        <td><?php echo htmlentities($user['function']); ?></td> <!-- Exiba a função -->
                                        <td>
                                            <button 
                                                class="btn btn-warning btn-sm edit-btn" 
                                                data-id="<?php echo htmlspecialchars($user['id']); ?>" 
                                                data-nome="<?php echo htmlspecialchars($user['nome']); ?>" 
                                                data-senha="<?php echo htmlspecialchars($user['senha']); ?>" 
                                                data-email="<?php echo htmlspecialchars($user['email']); ?>" 
                                                data-tipo="<?php echo htmlspecialchars($user['tipo']); ?>" 
                                                data-status="<?php echo htmlspecialchars($user['status']); ?>" 
                                                data-function="<?php echo htmlspecialchars($user['function']); ?>" 
                                            >
                                                Editar
                                            </button>
                                            <button class="btn btn-danger btn-sm" onclick="deleteUser(<?php echo $user['id']; ?>)">Excluir</button>
                                        </td>
                                    </tr>
                                <?php endif; ?>
                            <?php endforeach; ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal Adicionar Usuário -->
    <div class="modal fade" id="addUserModal" tabindex="-1" aria-labelledby="addUserModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addUserModalLabel">Adicionar Usuário</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="userForm">
                        <input type="hidden" id="userId" name="id">
                        <div class="form-group">
                            <label for="userNameInput">Nome:</label>
                            <input type="text" class="form-control" id="userNameInput" name="nome" required>
                        </div>
                        <div class="form-group">
                            <label for="userEmailInput">E-mail:</label>
                            <input type="email" class="form-control" id="userEmailInput" name="email" required>
                        </div>
                        <div class="form-group">
                            <label for="userPasswordInput">Senha:</label>
                            <input type="password" class="form-control" id="userPasswordInput" name="senha">
                        </div>
                        <div class="form-group">
                            <label for="userTipoInput">Tipo:</label>
                            <select class="form-control py-0" id="userTipoInput" name="tipo" required>
                                <option value="Padrão">Padrão</option>
                                <option value="Gerente">Gerente</option>
                                <option value="Administrador">Administrador</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="userStatusInput">Status:</label>
                            <select class="form-control py-0" id="userStatusInput" name="status" required>
                                <option value="Ativo">Ativo</option>
                                <option value="Inativo">Inativo</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="userFunctionInput">Função:</label>
                            <select class="form-control py-0" id="userFunctionInput" name="function" required>
                                <option value="Hunter">Hunter</option>
                                <option value="Vendedor">Vendedor</option>
                                <option value="Representantes">Representante</option>
                                <option value="Suporte Afiadores">Suporte Afiadores</option>
                                <option value="Suporte Educadores">Suporte Educadores</option>
                                <option value="Gerente">Gerente</option>
                            </select>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                    <button type="submit" class="btn btn-primary" form="userForm">Salvar</button>
                </div>
            </div>
        </div>
    </div>

    <!-- jQuery, Popper.js, Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="statics/js/loadUsers.js"></script>
    <script src="statics/js/updateStatus.js"></script>
    <script src="statics/js/deleteUser.js"></script>
    <script src="statics/js/fetchUser.js"></script>
    <script src="statics/js/submitUserForm.js"></script>

</body>
</html>
