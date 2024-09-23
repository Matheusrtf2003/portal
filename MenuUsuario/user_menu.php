<?php
// Certifique-se de que não há nenhuma saída antes da chamada session_start()
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}

// Verifique se a variável $_SESSION['user_id'] está definida
if (!isset($_SESSION['user_id'])) {
    echo 'Usuário não está logado.';
    exit;
}

$user_id = $_SESSION['user_id'];
include '../functions/config.php';

$userName = isset($_SESSION['user_nome']) ? $_SESSION['user_nome'] : 'default';
$avatarUrl = "https://api.dicebear.com/9.x/initials/svg?seed=" . urlencode($userName);

// Obtenha os dados do usuário
$stmt = $pdo->prepare("SELECT * FROM users WHERE id = ?");
$user_name = ("SELECT nome FROM user WHERE id = ?");
$stmt->execute([$user_id]);
$user = $stmt->fetch();
$userPhoto = isset($user['img_name']) && !empty($user['img_name']) ? '../uploads/' . $user['img_name'] : $avatarUrl;
?>

<div class="user-menu-container">
    <div class="user-menu">
        <img src="<?php echo $userPhoto; ?>" alt="User Photo" class="user-photo" id="userPhoto">
        <div class="dropdown-menu" id="userDropdown">
            <a href="#" class="dropdown-item" id="userData">
            <svg xmlns="http://www.w3.org/2000/svg" width="28" height="28" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
                <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0"/>
                <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8m8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1"/>
            </svg>
            Dados do usuário</a>
            <a href="../logout.php" class="dropdown-item">
            <svg xmlns="http://www.w3.org/2000/svg" width="28" height="28" fill="currentColor" class="bi bi-door-closed-fill" viewBox="0 0 16 16">
                <path d="M12 1a1 1 0 0 1 1 1v13h1.5a.5.5 0 0 1 0 1h-13a.5.5 0 0 1 0-1H3V2a1 1 0 0 1 1-1zm-2 9a1 1 0 1 0 0-2 1 1 0 0 0 0 2"/>
            </svg>
            Logout</a>
        </div>
    </div>
</div>

<!-- Modal para atualizar dados do usuário -->
<div class="modal fade" id="userDataModal" tabindex="-1" aria-labelledby="userDataModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="userDataModalLabel">Dados do usuário</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="userDataForm" enctype="multipart/form-data">
                    <input type="hidden" name="id" value="<?php echo $user['id']; ?>">
                    <div class="form-group">
                        <label for="userName">Nome</label>
                        <input type="text" class="form-control" id="userName" name="nome" value="<?php echo $user['nome']; ?>" required>
                    </div>
                    <div class="form-group">
                        <label for="userEmail">Email</label>
                        <input type="email" class="form-control" id="userEmail" name="email" value="<?php echo $user['email']; ?>" required>
                    </div>
                    <div class="form-group">
                        <label for="userPassword">Senha Atual</label>
                        <input type="password" class="form-control" id="userPassword" name="senha_atual" required>
                    </div>
                    <div class="form-group">
                        <label for="newPassword">Nova Senha</label>
                        <input type="password" class="form-control" id="newPassword" name="nova_senha">
                        <small class="form-text text-muted">Deixe em branco para não alterar.</small>
                    </div>
                    <div class="form-group">
                        <label for="userPhotoInput">Foto do Perfil</label>
                        <input type="file" class="form-control" id="userPhotoInput" name="userPhoto">
                    </div>
                    <div id="updateMessage" class="mt-3"></div>
                    <button type="submit" class="btn btn-primary">Salvar</button>
                </form>
            </div>
        </div>
    </div>
</div>

<style>
.user-menu-container {
    position: fixed;
    top: 20px;
    right: 20px;
    cursor: pointer;
    transition: border-color 0.3s ease;
}

.user-menu {
    position: relative;
    display: inline-block;
}

.user-photo {
    width: 60px;
    height: 60px;
    border-radius: 50%;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    transition: transform 0.3s ease;
}

.user-photo:hover {
    transform: scale(1.05);
}

.dropdown-menu {
    display: none;
    position: absolute;
    left: -220px; /* Posiciona o menu à esquerda */
    top: 0; /* Alinha com o topo da foto do usuário */
    background-color: #ffffff;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    z-index: 1000;
    min-width: 220px;
    padding: 10px 0;
    overflow: hidden;
}

.dropdown-item {
    color: #343a40;
    padding: 12px 20px;
    font-size: 16px;
    text-decoration: none;
    display: block;
    transition: background-color 0.3s ease;
}

.dropdown-item svg {
    margin-right: 10px;
    vertical-align: middle;
}

.dropdown-item:hover {
    background-color: #f1f1f1;
}

.modal-content {
    border-radius: 10px;
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
}

.modal-header {
    background-color: #007bff;
    color: #fff;
    border-top-left-radius: 10px;
    border-top-right-radius: 10px;
}

.modal-footer .btn {
    border-radius: 5px;
}

.form-control {
    border-radius: 5px;
    padding: 10px;
    font-size: 16px;
}
</style>


<script>
document.getElementById('userPhoto').addEventListener('click', function() {
    var dropdown = document.getElementById('userDropdown');
    dropdown.style.display = dropdown.style.display === 'block' ? 'none' : 'block';
});

window.onclick = function(event) {
    if (!event.target.matches('.user-photo')) {
        var dropdowns = document.getElementsByClassName('dropdown-menu');
        for (var i = 0; i < dropdowns.length; i++) {
            var openDropdown = dropdowns[i];
            if (openDropdown.style.display === 'block') {
                openDropdown.style.display = 'none';
            }
        }
    }
}

document.getElementById('userData').addEventListener('click', function() {
    $('#userDataModal').modal('show');
});

document.getElementById('userDataForm').addEventListener('submit', function(event) {
    event.preventDefault();
    var formData = new FormData(this);
    fetch('functions/save_user_data.php', {
        method: 'POST',
        body: formData
    })
    .then(response => response.json())
    .then(data => {
        var updateMessage = document.getElementById('updateMessage');
        if (data.success) {
            updateMessage.textContent = 'Dados atualizados com sucesso.';
            updateMessage.classList.add('text-success');
            updateMessage.classList.remove('text-danger');

            if (data.img_name) {
                document.getElementById('userPhoto').src = 'uploads/' + data.img_name;
            }
        } else {
            updateMessage.textContent = 'Erro ao atualizar dados: ' + data.message;
            updateMessage.classList.add('text-danger');
            updateMessage.classList.remove('text-success');
        }
    })
    .catch(error => {
        console.error('Erro:', error);
        var updateMessage = document.getElementById('updateMessage');
        updateMessage.textContent = 'Erro ao atualizar dados: ' + error.message;
        updateMessage.classList.add('text-danger');
        updateMessage.classList.remove('text-success');
    });
});
</script>
