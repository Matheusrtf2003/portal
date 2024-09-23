// deleteSelectedEducators.js

function deleteSelectedEducators() {
    const selectedEducators = [];
    document.querySelectorAll('.select-row:checked').forEach(checkbox => {
        selectedEducators.push(checkbox.getAttribute('data-id'));
    });

    if (selectedEducators.length === 0) {
        alert('Nenhuma educadora selecionada.');
        return;
    }

    if (confirm('Tem certeza que deseja excluir as educadoras selecionadas?')) {
        fetch('/portal/functions/Educators/deleteSelectedEducators.php', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ ids: selectedEducators })
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                alert('Educadoras excluídas com sucesso!');
                loadEducators();
            } else {
                alert('Erro ao excluir educadoras: ' + data.message);
            }
        })
        .catch(error => {
            console.error('Erro ao excluir educadoras:', error);
            alert('Erro ao excluir educadoras. Verifique o console para mais detalhes.');
        });
    }
}
