// updateStatus.js

function updateUserStatus(userId, status) {
    $.ajax({
        type: 'POST',
        url: 'functions/update_user_status.php',
        data: { id: userId, status: status },
        dataType: 'json',
        success: function (response) {
            if (response.success) {
                location.reload();
            } else {
                console.error('Erro ao atualizar status:', response.message);
                alert('Erro ao atualizar status: ' + response.message);
            }
        },
        error: function (xhr, status, error) {
            console.error('Erro ao atualizar status:', error);
            alert('Erro ao atualizar status: ' + xhr.responseText);
        }
    });
}
