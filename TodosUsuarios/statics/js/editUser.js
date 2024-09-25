function editUser(userId) {
    // Faz uma requisição para buscar os dados do usuário com base no userId
    $.ajax({
        type: 'GET', // Método GET para buscar os dados
        url: '/portal/functions/Users/getUser.php', // URL para buscar os dados do usuário
        data: { id: userId }, // Enviando o ID do usuário como parâmetro
        dataType: 'json', // Espera-se um retorno em JSON
        success: function(response) {
            if (response.success) {
                // Preenche o formulário com os dados do usuário
                $('#userId').val(response.data.id);
                $('#userNameInput').val(response.data.nome);
                $('#userEmailInput').val(response.data.email);
                $('#userTipoInput').val(response.data.tipo);
                $('#userStatusInput').val(response.data.status);
                $('#userFunctionInput').val(response.data.function);

                // Ajusta o título do modal para edição
                $('#addUserModalLabel').text('Editar Usuário');

                // Abre o modal de edição
                $('#addUserModal').modal('show');
            } else {
                // Exibe o erro se os dados do usuário não forem encontrados
                alert('Erro ao carregar os dados do usuário: ' + response.message);
            }
        },
        error: function(xhr, status, error) {
            // Exibe o erro se houver um problema na requisição
            console.error('Erro ao carregar os dados do usuário:', error);
            alert('Erro ao carregar os dados do usuário. Verifique o console para mais detalhes.');
        }
    });
}


// Função para limpar os campos do modal
function clearUserForm() {
    // Limpar todos os campos de texto do formulário
    document.getElementById('userForm').reset();

    // Remover o valor do campo hidden userId
    document.getElementById('userId').value = '';

    // Redefinir o título do modal para "Adicionar Usuário"
    const modalTitle = document.getElementById('addUserModalLabel');
    modalTitle.textContent = 'Adicionar Usuário';
}

// Evento que será chamado sempre que o modal for fechado
$('#addUserModal').on('hidden.bs.modal', function () {
    clearUserForm();
});

