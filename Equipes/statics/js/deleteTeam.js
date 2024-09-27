// deleteUser.js

function deleteTeam(teamId) {
    if (confirm('Tem certeza que deseja excluir esta equipe?')) {
        $.ajax({
            type: 'POST',
            url: '../functions/Teams/deleteTeam.php',
            data: { id: teamId },
            dataType: 'json',
            success: function (response) {
                if (response.success) {
                    alert('Equipe excluída com sucesso!');
                    location.reload();
                } else {
                    console.error('Erro ao excluir equipe:', response.message);
                    alert('Erro ao excluir equipe: ' + response.message);
                }
            },
            error: function (xhr, status, error) {
                console.error('Erro ao excluir equipe:', error);
                alert('Erro ao excluir equipe: ' + xhr.responseText);
            }
        });
    }
}
