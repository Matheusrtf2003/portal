// dashboard.js

function updateDashboard() {
    fetch('../../../functions/Stores/getDashboardData.php')
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                const totalStores = document.getElementById('totalStores');
                if (totalStores) totalStores.textContent = data.totalStores;

                const markersList = document.getElementById('markersList');
                if (markersList) {
                    markersList.innerHTML = '';
                    data.markers.forEach(marker => {
                        const li = document.createElement('li');
                        li.textContent = `${marker.nome}`;
                        markersList.appendChild(li);
                    });
                }
            } else {
                alert('Erro ao carregar dados do dashboard: ' + data.message);
            }
        })
        .catch(error => {
            console.error('Erro ao carregar dados do dashboard:', error);
            alert('Erro ao carregar dados do dashboard. Verifique o console para mais detalhes.');
        });
}
