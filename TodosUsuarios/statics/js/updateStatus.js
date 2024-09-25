function updateUserStatus(userId, status) {
    const confirmation = confirm(`Tem certeza que deseja alterar o status do usuário para '${status}'?`);
    if (!confirmation) {
        return;
    }

    // Enviar a requisição POST com os parâmetros id e status
    fetch('/portal/functions/Users/update_user_status.php', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({
            id: userId,
            status: status
        })
    })
    .then(response => response.json())  // Processar a resposta como JSON
    .then(result => {
        console.log(result);  // Verifique o resultado no console
        if (result.success) {
            alert('Status atualizado com sucesso!');
            location.reload(); // Recarrega a página
        } else {
            alert('Erro ao atualizar o status: ' + result.message);
        }
    })
    .catch(error => {
        console.error('Erro:', error);
        alert('Erro ao atualizar o status. Tente novamente mais tarde.');
    });
}
