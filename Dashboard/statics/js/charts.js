// charts.js

function loadCharts() {
    fetch('portal/functions/Stores/getStores.php')
        .then(response => response.json())
        .then(data => {
            const statusCounts = {};
            const vendedorCounts = {};
            const monthlyCounts = {};
            const typeCounts = {};

            data.forEach(loja => {
                statusCounts[loja.status] = (statusCounts[loja.status] || 0) + 1;
                vendedorCounts[loja.vendedor] = (vendedorCounts[loja.vendedor] || 0) + 1;

                const month = new Date(loja.datetime).getMonth() + 1;
                monthlyCounts[month] = (monthlyCounts[month] || 0) + 1;

                typeCounts[loja.tipo] = (typeCounts[loja.tipo] || 0) + 1;
            });

            createChart('statusChart', 'Status das Lojas', statusCounts);
            createChart('vendedoresChart', 'Lojas por Vendedor', vendedorCounts);
            createChart('monthlyChart', 'Lojas por Mês', monthlyCounts);
            createChart('typeChart', 'Lojas por Tipo', typeCounts);
        })
        .catch(error => console.error('Erro ao carregar dados dos gráficos:', error));
}

function createChart(canvasId, label, data) {
    const ctx = document.getElementById(canvasId) ? document.getElementById(canvasId).getContext('2d') : null;
    if (ctx) {
        new Chart(ctx, {
            type: 'bar',
            data: {
                labels: Object.keys(data),
                datasets: [{
                    label: label,
                    data: Object.values(data),
                    backgroundColor: 'rgba(75, 192, 192, 0.2)',
                    borderColor: 'rgba(75, 192, 192, 1)',
                    borderWidth: 1
                }]
            },
            options: {
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });
    }
}
