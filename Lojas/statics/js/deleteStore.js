// Função para deletar uma loja
function deleteStore(id) {
    if (confirm('Tem certeza que deseja excluir esta loja?')) {
        fetch(`../functions/Stores/deleteStore.php?id=${id}`, { 
            method: 'GET', 
            headers: {
                'Content-Type': 'application/json'
            }
        })
        .then(response => response.text())  // Use 'text()' para ver a resposta do servidor
        .then(data => {
            console.log('Resposta do servidor:', data);  // Exibe o conteúdo retornado
            try {
                const jsonData = JSON.parse(data);  // Tenta converter a resposta em JSON
                if (jsonData.success) {
                    alert(jsonData.message);
                    loadAllStores();  // Recarrega as lojas após exclusão
                } else {
                    alert('Erro: ' + jsonData.message);
                }
            } catch (e) {
                console.error('Erro ao processar JSON:', e);
                alert('Erro inesperado. Verifique o console.');
            }
        })
        .catch(error => {
            console.error('Erro ao excluir loja:', error);
            alert('Erro ao excluir loja. Verifique o console para mais detalhes.');
        });
    }
}