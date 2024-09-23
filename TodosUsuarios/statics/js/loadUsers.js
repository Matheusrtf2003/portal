// loadUsers.js

document.addEventListener('DOMContentLoaded', function () {
    loadUsers();
});

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

    addEventListenersToButtons();
}

function addEventListenersToButtons() {
    document.querySelectorAll('.edit-btn').forEach(button => {
        button.addEventListener('click', function () {
            const userId = this.dataset.id;
            fetchUser(userId);
        });
    });

    document.querySelectorAll('.delete-btn').forEach(button => {
        button.addEventListener('click', function () {
            const userId = this.dataset.id;
            deleteUser(userId);
        });
    });
}
