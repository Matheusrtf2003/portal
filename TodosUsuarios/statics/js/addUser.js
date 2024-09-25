// Função para abrir o modal de adicionar usuário
function addUser() {
    // Limpa o formulário e ajusta o modal para adicionar
    clearUserForm();
    document.getElementById('userModalLabel').textContent = 'Adicionar Usuário';
    $('#userModal').modal('show');
}

// Função para limpar os campos do modal (usado tanto no adicionar quanto no editar)
function clearUserForm() {
    // Limpar todos os campos de texto do formulário
    document.getElementById('userForm').reset();
    document.getElementById('userId').value = '';

    // Redefinir o título do modal para "Adicionar Usuário"
    document.getElementById('userModalLabel').textContent = 'Adicionar Usuário';
}

// Evento que será chamado sempre que o modal for fechado
$('#userModal').on('hidden.bs.modal', function () {
    clearUserForm();
});