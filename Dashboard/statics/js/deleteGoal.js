window.deleteGoal = function(id) {
    if (confirm('Tem certeza que deseja excluir esta meta?')) {
        fetch(`../functions/Metas/deleteGoal.php?id=${id}`, {
            method: 'GET'
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                location.reload()
            } else {
                alert('Erro ao excluir meta.');
            }
        })
        .catch(error => console.error('Erro ao excluir meta:', error));
    }
}