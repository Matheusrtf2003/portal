// deleteEducator.js

function deleteEducator(id) {
    if (confirm('Tem certeza que deseja excluir esta educadora?')) {
        fetch(`../functions/Educators/deleteEducator.php?id=${id}`, { method: 'DELETE' })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    alert('Educadora excluída com sucesso!');
                    loadEducators();
                } else {
                    alert('Erro ao excluir educadora: ' + data.message);
                }
            })
            .catch(error => {
                console.error('Erro ao excluir educadora:', error);
                alert('Erro ao excluir educadora. Verifique o console para mais detalhes.');
            });
    }
}
