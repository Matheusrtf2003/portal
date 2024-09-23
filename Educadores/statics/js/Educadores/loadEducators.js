// loadEducators.js

function loadEducators() {
    fetch('/portal/functions/Educators/getEducators.php')
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                allEducators = data.educators;
                applyFilters();
            } else {
                alert('Erro ao carregar educadoras: ' + data.message);
            }
        })
        .catch(error => {
            console.error('Erro ao carregar educadoras:', error);
            alert('Erro ao carregar educadoras. Verifique o console para mais detalhes.');
        });
}
