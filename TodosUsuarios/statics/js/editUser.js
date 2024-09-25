$('#addUserModal').on('show.bs.modal', function (event) {
    // Botão que acionou o modal
    var button = $(event.relatedTarget);

    // Extrai os dados dos atributos `data-*` do botão
    var id = button.data('id');
    var nome = button.data('nome');
    var email = button.data('email');
    var senha = button.data('senha');
    var tipo = button.data('tipo');
    var status = button.data('status');
    var funcao = button.data('function');
    
    // Preenche os campos do modal com os dados extraídos
    var modal = $(this);
    modal.find('#userId').val(id);          // Preenche o campo oculto com o ID
    modal.find('#userNameInput').val(nome);  // Preenche o campo do nome
    modal.find('#userEmailInput').val(email); // Preenche o campo do email
    modal.find('#userPasswordInput').val(senha); // Preenche o campo do email
    modal.find('#userTipoInput').val(tipo);  // Preenche o campo do tipo
    modal.find('#userStatusInput').val(status); // Preenche o campo do status
    modal.find('#userFunctionInput').val(funcao); // Preenche o campo da função
    
    // Altera o título do modal para "Editar Usuário"
    $('#addUserModalLabel').text('Editar Usuário');
    
    // Abre o modal de edição
    $('#addUserModal').modal('show');
});


// function editUser(userId) {
//     // Faz uma requisição para buscar os dados do usuário com base no userId
//     $.ajax({
//         type: 'GET', // Método GET para buscar os dados
//         url: '/portal/functions/Users/getUser.php', // URL para buscar os dados do usuário
//         data: { id: userId }, // Enviando o ID do usuário como parâmetro
//         dataType: 'json', // Espera-se um retorno em JSON
//         success: function(response) {
//             if (response.success) {
//                 // Preenche o formulário com os dados do usuário
//                 $('#userId').val(response.data.id);
//                 $('#userNameInput').val(response.data.nome);
//                 $('#userEmailInput').val(response.data.email);
//                 $('#userTipoInput').val(response.data.tipo);
//                 $('#userStatusInput').val(response.data.status);
//                 $('#userFunctionInput').val(response.data.function);

//                 // Ajusta o título do modal para edição
//                 $('#addUserModalLabel').text('Editar Usuário');

//                 // Abre o modal de edição
//                 $('#addUserModal').modal('show');
//             } else {
//                 // Exibe o erro se os dados do usuário não forem encontrados
//                 alert('Erro ao carregar os dados do usuário: ' + response.message);
//             }
//         },
//         error: function(xhr, status, error) {
//             // Exibe o erro se houver um problema na requisição
//             console.error('Erro ao carregar os dados do usuário:', error);
//             alert('Erro ao carregar os dados do usuário. Verifique o console para mais detalhes.');
//         }
//     });
// }


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

