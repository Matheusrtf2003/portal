document.addEventListener('DOMContentLoaded', function () {
    loadUsers();
});

function loadUsers() {
    fetch('functions/getUsers.php')
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                const tbodyPending = document.querySelector('#pendingUsersTable tbody');
                const tbodyAll = document.querySelector('#usersTable tbody');
                tbodyPending.innerHTML = '';
                tbodyAll.innerHTML = '';

                data.users.forEach(user => {
                    const row = document.createElement('tr');

                    row.innerHTML = `
                        <td>${user.id}</td>
                        <td>${user.nome}</td>
                        <td>${user.email}</td>
                        <td>${user.tipo}</td>
                        <td>${user.status}</td>
                        <td>
                            <button class="btn btn-warning btn-sm edit-btn" data-id="${user.id}">Editar</button>
                            <button class="btn btn-danger btn-sm delete-btn" data-id="${user.id}">Excluir</button>
                        </td>
                    `;

                    if (user.status === 'Solicitado') {
                        const actions = `
                            <button class="btn btn-success btn-sm" onclick="updateUserStatus(${user.id}, 'Ativo')">Aprovar</button>
                            <button class="btn btn-danger btn-sm" onclick="updateUserStatus(${user.id}, 'Recusado')">Reprovar</button>
                        `;
                        row.querySelector('td:last-child').innerHTML = actions;
                        tbodyPending.appendChild(row);
                    } else {
                        tbodyAll.appendChild(row);
                    }
                });

                // Adicionar eventos aos botões
                document.querySelectorAll('.edit-btn').forEach(button => {
                    button.addEventListener('click', function() {
                        const userId = this.dataset.id;
                        fetchUser(userId);
                    });
                });

                document.querySelectorAll('.delete-btn').forEach(button => {
                    button.addEventListener('click', function() {
                        const userId = this.dataset.id;
                        deleteUser(userId);
                    });
                });
            } else {
                console.error('Erro ao carregar usuários:', data.message);
            }
        })
        .catch(error => console.error('Erro ao carregar usuários:', error));
}

function fetchUser(id) {
    fetch(`functions/getUser.php?id=${id}`)
        .then(response => response.json())
        .then(data => {
            document.getElementById('userId').value = data.id;
            document.getElementById('userNameInput').value = data.nome;
            document.getElementById('userEmailInput').value = data.email;
            document.getElementById('userPasswordInput').value = ''; // Não mostrar a senha
            document.getElementById('userTipoInput').value = data.tipo;
            document.getElementById('userStatusInput').value = data.status;
            document.getElementById('userFunctionInput').value = data.function;

            $('#addUserModal').modal('show');
        })
        .catch(error => console.error('Erro ao buscar usuário:', error));
}

function updateUserStatus(userId, status) {
    $.ajax({
        type: 'POST',
        url: 'functions/update_user_status.php',
        data: { id: userId, status: status },
        dataType: 'json',
        success: function(response) {
            console.log('Response received:', response); // Log the response
            if (response.success) {
                location.reload();
            } else {
                console.error('Erro ao atualizar status:', response.message);
                alert('Erro ao atualizar status: ' + response.message);
            }
        },
        error: function(xhr, status, error) {
            console.error('Erro ao atualizar status:', error);
            console.error('Status:', status);
            console.error('Response:', xhr.responseText);
            alert('Erro ao atualizar status: ' + xhr.responseText);
        }
    });
}

function deleteUser(userId) {
    if (confirm('Tem certeza que deseja excluir este usuário?')) {
        $.ajax({
            type: 'POST',
            url: 'functions/deleteUser.php',
            data: { id: userId },
            dataType: 'json',
            success: function(response) {
                console.log('Response received:', response); // Log the response
                if (response.success) {
                    alert('Usuário excluído com sucesso!');
                    location.reload();
                } else {
                    console.error('Erro ao excluir usuário:', response.message);
                    alert('Erro ao excluir usuário: ' + response.message);
                }
            },
            error: function(xhr, status, error) {
                console.error('Erro ao excluir usuário:', error);
                console.error('Status:', status);
                console.error('Response:', xhr.responseText);
                alert('Erro ao excluir usuário: ' + xhr.responseText);
            }
        });
    }
}

document.getElementById('userForm').addEventListener('submit', function(event) {
    event.preventDefault();

    const formData = new FormData(this);
    const userId = document.getElementById('userId').value;
    const url = userId ? 'functions/updateUser.php' : 'functions/addUser.php';

    fetch(url, {
        method: 'POST',
        body: formData
    })
    .then(response => response.json())
    .then(data => {
        console.log('Response received:', data); // Log the response
        if (data.success) {
            alert('Operação realizada com sucesso!');
            $('#addUserModal').modal('hide');
            location.reload();
        } else {
            console.error('Erro ao realizar operação:', data.message);
            alert('Erro ao realizar operação: ' + data.message);
        }
    })
    .catch(error => {
        console.error('Erro ao realizar operação:', error);
        alert('Erro ao realizar operação. Verifique o console para mais detalhes.');
    });
});
