// dashboardCharts.js

function loadDashboardCharts(user_id) {
    fetch('../functions/Dashboard/getDashboardChartData.php')
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                // Dados para o gráfico de linhas
                const lineChartLabels = data.lineChartData.map(item => item.date);
                const lineChartData = data.lineChartData.map(item => item.count);

                // Dados para o gráfico de pizza
                const pieChartData = [data.totalStores, data.totalGoals];

                // Criação do gráfico de linhas
                const lineCtx = document.getElementById('lineChart').getContext('2d');
                new Chart(lineCtx, {
                    type: 'line',
                    data: {
                        labels: lineChartLabels,
                        datasets: [{
                            label: 'Lojas Adicionadas por Dia',
                            data: lineChartData,
                            borderColor: 'rgba(75, 192, 192, 1)',
                            borderWidth: 1,
                            fill: false
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

                // Criação do gráfico de pizza
                const pieCtx = document.getElementById('pieChart').getContext('2d');
                new Chart(pieCtx, {
                    type: 'pie',
                    data: {
                        labels: ['Lojas Adicionadas', 'Meta Total'],
                        datasets: [{
                            data: pieChartData,
                            backgroundColor: ['rgba(75, 192, 192, 0.2)', 'rgba(192, 75, 75, 0.2)'],
                            borderColor: ['rgba(75, 192, 192, 1)', 'rgba(192, 75, 75, 1)'],
                            borderWidth: 1
                        }]
                    }
                });
            } else {
                alert('Erro ao carregar dados dos gráficos: ' + data.message);
            }
        })
        .catch(error => {
            console.error('Erro ao carregar dados dos gráficos:', error);
            alert('Erro ao carregar dados dos gráficos. Verifique o console para mais detalhes.');
        });
}
