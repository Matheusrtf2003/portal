function deleteSelectedStores() {
    const selectedStores = Array.from(document.querySelectorAll('.select-store:checked'))
        .map(checkbox => checkbox.dataset.id);

    if (selectedStores.length === 0) {
        alert('Selecione pelo menos uma loja.');
        return;
    }

    if (confirm('Tem certeza que deseja excluir as lojas selecionadas?')) {
        fetch('../functions/Stores/deleteMultipleStores.php', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ ids: selectedStores })
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                alert('Lojas excluídas com sucesso.');
                loadAllStores(); // Recarrega a lista de lojas após a exclusão
            } else {
                alert('Erro ao excluir lojas: ' + data.message);
            }
        })
        .catch(error => console.error('Erro ao excluir lojas:', error));
    }
}
