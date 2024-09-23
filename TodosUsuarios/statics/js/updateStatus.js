function updateUserStatus(userId, status) {
    const confirmation = confirm(`Tem certeza que deseja alterar o status do usuário para '${status}'?`);
    if (!confirmation) {
        return;
    }

    fetch('/portal/functions/Users/update_user_status.php', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ id: userId, status: status })
    })
    .then(response => response.json())
    .then(result => {
        if (result.success) {
            alert('Status atualizado com sucesso!');
            location.reload(); // Recarrega a página para refletir as alterações
        } else {
            alert('Erro ao atualizar o status: ' + result.message);
        }
    })
    .catch(error => {
        alert('Erro ao atualizar o status. Tente novamente mais tarde.');
        console.error('Erro:', error);
    });
}
