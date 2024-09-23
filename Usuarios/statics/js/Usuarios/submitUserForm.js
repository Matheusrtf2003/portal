// submitUserForm.js

document.getElementById('userForm').addEventListener('submit', function (event) {
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
