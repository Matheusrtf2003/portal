// fetchUser.js

function fetchUser(id) {
    fetch(`../functions/Users/getUser.php?id=${id}`)
        .then(response => response.json())
        .then(data => {
            document.getElementById('userId').value = data.id;
            document.getElementById('userNameInput').value = data.nome;
            document.getElementById('userEmailInput').value = data.email;
            document.getElementById('userPasswordInput').value = ''; // Não mostrar a senha
            document.getElementById('userTipoInput').value = data.tipo;
            document.getElementById('userStatusInput').value = data.status;
            document.getElementById('userAgendorApiKey').value = data.agendor_api_key; // Adicione esta linha

            $('#addUserModal').modal('show');
        })
        .catch(error => console.error('Erro ao buscar usuário:', error));
}
