document.addEventListener('DOMContentLoaded', function () {
    loadUsers();
});

// Mantemos o loadUsers igual
function loadUsers() {
    fetch('/portal/functions/Users/getUsers.php')
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                renderUserTables(data.users);
            } else {
                console.error('Erro ao carregar usuários:', data.message);
            }
        })
        .catch(error => console.error('Erro ao carregar usuários:', error));
}

// Mantemos o renderUserTables igual
function renderUserTables(users) {
    const tbodyPending = document.querySelector('#pendingUsersTable tbody');
    const tbodyAll = document.querySelector('#usersTable tbody');
    tbodyPending.innerHTML = '';
    tbodyAll.innerHTML = '';

    users.forEach(user => {
        const row = document.createElement('tr');
        row.innerHTML = `
            <td>${user.id}</td>
            <td>${user.nome}</td>
            <td>${user.email}</td>
            <td>${user.tipo}</td>
            <td>${user.status}</td>
            <td>${user.function}</td>
            <td>
                <button 
                    class="btn btn-warning btn-sm edit-btn" 
                    data-id="${user.id}" 
                    data-nome="${user.nome}" 
                    data-email="${user.email}"
                    data-senha="${user.senha}" 
                    data-tipo="${user.tipo}" 
                    data-status="${user.status}" 
                    data-function="${user.function}" 
                >
                    Editar
                </button>
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
}

// Delegação de eventos para os botões "Editar"
document.addEventListener('click', function (event) {
    if (event.target && event.target.classList.contains('edit-btn')) {
        const button = event.target;
        const userId = button.dataset.id;

        // Agora vamos preencher o modal com os dados do botão "Editar"
        const nome = button.dataset.nome;
        const email = button.dataset.email;
        const senha = button.dataset.senha;
        const tipo = button.dataset.tipo;
        const status = button.dataset.status;
        const funcao = button.dataset.function;

        // Preenche os campos do modal com os dados
        const modal = document.querySelector('#addUserModal');
        modal.querySelector('#userId').value = userId;
        modal.querySelector('#userNameInput').value = nome;
        modal.querySelector('#userEmailInput').value = email;
        modal.querySelector('#userPasswordInput').value = senha;
        modal.querySelector('#userTipoInput').value = tipo;
        modal.querySelector('#userStatusInput').value = status;
        modal.querySelector('#userFunctionInput').value = funcao;

        // Altera o título do modal para "Editar Usuário"
        document.querySelector('#addUserModalLabel').textContent = 'Editar Usuário';

        // Abre o modal de edição
        $('#addUserModal').modal('show');
    }
});

// Delegação de eventos para o botão "Excluir"
document.addEventListener('click', function (event) {
    if (event.target && event.target.classList.contains('delete-btn')) {
        const userId = event.target.dataset.id;
        deleteUser(userId);
    }
});
