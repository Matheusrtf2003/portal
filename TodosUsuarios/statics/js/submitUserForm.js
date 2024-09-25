// submitUserForm.js

// submitUserForm.js

document.getElementById('userForm').addEventListener('submit', function (event) {
    event.preventDefault();

    const formData = new FormData(this);
    const userId = document.getElementById('userId').value;
    const url = userId ? '/portal/functions/Users/updateUser.php' : '/portal/functions/Users/addUser.php';

    fetch(url, {
        method: 'POST',
        body: formData
    })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                alert('Operação realizada com sucesso!');
                $('#addUserModal').modal('hide');
                location.reload(); // Recarregar a página para mostrar os dados atualizados
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

// Função para limpar o formulário ao fechar o modal
function clearUserForm() {
    document.getElementById('userForm').reset();
    document.getElementById('userId').value = ''; // Limpar o campo hidden de ID

    const modalTitle = document.getElementById('addUserModalLabel');
    modalTitle.textContent = 'Adicionar Usuário'; // Redefinir o título para "Adicionar Usuário"
}

// Evento que será chamado sempre que o modal for fechado
$('#addUserModal').on('hidden.bs.modal', function () {
    clearUserForm(); // Limpa o formulário quando o modal é fechado
});

