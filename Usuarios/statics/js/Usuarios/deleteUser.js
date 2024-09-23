// deleteUser.js

function deleteUser(userId) {
    if (confirm('Tem certeza que deseja excluir este usuário?')) {
        $.ajax({
            type: 'POST',
            url: '../../../functions/Users/deleteUser.php',
            data: { id: userId },
            dataType: 'json',
            success: function (response) {
                if (response.success) {
                    alert('Usuário excluído com sucesso!');
                    location.reload();
                } else {
                    console.error('Erro ao excluir usuário:', response.message);
                    alert('Erro ao excluir usuário: ' + response.message);
                }
            },
            error: function (xhr, status, error) {
                console.error('Erro ao excluir usuário:', error);
                alert('Erro ao excluir usuário: ' + xhr.responseText);
            }
        });
    }
}
