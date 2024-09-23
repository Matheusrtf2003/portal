document.addEventListener('DOMContentLoaded', function () {
    const userIdElement = document.getElementById('userId');
    if (userIdElement) {
        const user_id = userIdElement.value;
        initializeGoalForm();
        loadGoals(user_id);
        if (document.getElementById('lineChart') && document.getElementById('pieChart')) {
            loadDashboardCharts(user_id);
        }
    } else {
        console.error('Element with id "userId" not found.');
    }
});

function loadLojasData() {
    fetch('functions/getStores.php')
        .then(response => response.json())
        .then(data => {
            const tbody = document.getElementById('lojasTableBody');
            if (tbody) {
                tbody.innerHTML = '';

                data.forEach(loja => {
                    const row = document.createElement('tr');

                    row.innerHTML = `
                        <td>${loja.id}</td>
                        <td>${loja.nome}</td>
                        <td>${loja.endereco}</td>
                        <td>${loja.status}</td>
                        <td>${loja.vendedor}</td>
                        <td>${loja.telefone}</td>
                        <td>${loja.email}</td>
                        <td>${loja.instagram}</td>
                        <td>${loja.site}</td>
                        <td>${loja.decisor}</td>
                        <td>${loja.telefone_decisor}</td>
                        <td>${loja.datetime}</td>
                    `;

                    tbody.appendChild(row);
                });
            }
        })
        .catch(error => console.error('Erro ao carregar dados das lojas:', error));
}

function loadCharts() {
    fetch('functions/getStores.php')
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

function updateDashboard() {
    fetch('functions/getDashboardData.php')
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

function initializeGoalForm() {
    const goalForm = document.getElementById('goalForm');

    // Carregar marcadores
    fetch('functions/getMarkers.php')
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                const goalMarker = document.getElementById('goalMarker');
                if (goalMarker) {
                    data.markers.forEach(marker => {
                        const option = document.createElement('option');
                        option.value = marker.id;
                        option.textContent = marker.nome;
                        goalMarker.appendChild(option);
                    });
                }
            } else {
                console.error('Erro ao carregar marcadores:', data.message);
            }
        })
        .catch(error => console.error('Erro ao carregar marcadores:', error));

    // Carregar usuários
    fetch('functions/getUsers.php')
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                const goalUsers = document.getElementById('goalUsers');
                if (goalUsers) {
                    data.users.forEach(user => {
                        const option = document.createElement('option');
                        option.value = user.id;
                        option.textContent = user.nome;
                        goalUsers.appendChild(option);
                    });
                }
            } else {
                console.error('Erro ao carregar usuários:', data.message);
            }
        })
        .catch(error => console.error('Erro ao carregar usuários:', error));

    goalForm.addEventListener('submit', function (event) {
        event.preventDefault();

        const formData = new FormData(goalForm);

        fetch('functions/Metas/createGoal.php', {
            method: 'POST',
            body: formData
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                alert('Meta criada com sucesso!');
                $('#createGoalModal').modal('hide');
                loadGoals();
            } else {
                alert('Erro ao criar meta: ' + data.message);
            }
        })
        .catch(error => {
            console.error('Erro ao criar meta:', error);
            alert('Erro ao criar meta. Verifique o console para mais detalhes.');
        });
    });

    loadGoals();
}

function loadGoals(user_id) {
    fetch('functions/Metas/getGoals.php')
        .then(response => response.text())
        .then(text => {
            try {
                const data = JSON.parse(text);
                if (data.success) {
                    const goalsContainerAdmin = document.getElementById('goalsContainerAdmin');
                    const goalsContainerUser = document.getElementById('goalsContainerUser');
                    goalsContainerAdmin.innerHTML = '';
                    goalsContainerUser.innerHTML = '';

                    data.goals.forEach(goal => {
                        const goalDiv = document.createElement('div');
                        goalDiv.className = 'card mb-3 col-md-4';
                        goalDiv.innerHTML = `
                            <div class="card-body">
                                <div class="d-flex justify-content-between">
                                    <h5 class="card-title">${goal.name}</h5>
                                    ${user_id == goal.created_by ? `
                                    <div class="btn-group">
                                        <button type="button" class="btn btn-tool" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <i class="fas fa-ellipsis-v"></i>
                                        </button>
                                        <div class="dropdown-menu dropdown-menu-right">
                                            <a class="dropdown-item" href="#" onclick="editGoal(${goal.id})">Editar</a>
                                            <a class="dropdown-item" href="#" onclick="deleteGoal(${goal.id})">Excluir</a>
                                        </div>
                                    </div>` : ''}
                                </div>
                                <p class="card-text">Quantidade de Lojas: ${goal.target}</p>
                                <p class="card-text">Data Limite: ${goal.end_date}</p>
                                <p class="card-text">Marcador: <span style="color: ${goal.marker_color}">${goal.marker_name}</span></p>
                                <p class="card-text">Usuários: ${goal.users.map(user => user.nome).join(', ')}</p>
                                <p class="card-text">Progresso: ${goal.current}/${goal.target}</p>
                                <div class="progress">
                                    <div class="progress-bar" role="progressbar" style="width: ${Math.min((goal.current / goal.target) * 100, 100)}%;" aria-valuenow="${goal.current}" aria-valuemin="0" aria-valuemax="${goal.target}"></div>
                                </div>
                            </div>
                        `;
                        if (goal.created_by == user_id) {
                            goalsContainerAdmin.appendChild(goalDiv);
                        } else if (goal.users.some(                            user => user.id == user_id)) {
                            goalsContainerUser.appendChild(goalDiv);
                        }
                    });
                } else {
                    alert('Erro ao carregar metas: ' + data.message);
                }
            } catch (error) {
                console.error('Erro ao analisar a resposta como JSON:', text);
                alert('Erro ao carregar metas. Verifique o console para mais detalhes.');
            }
        })
        .catch(error => {
            console.error('Erro ao carregar metas:', error);
            alert('Erro ao carregar metas. Verifique o console para mais detalhes.');
        });
}

function loadDashboardCharts(user_id) {
    fetch('functions/getDashboardChartData.php')
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

function editGoal(goalId) {
    // Implementar a lógica para editar meta
}

function deleteGoal(goalId) {
    if (confirm('Tem certeza que deseja excluir esta meta?')) {
        fetch(`functions/Metas/deleteGoal.php?id=${goalId}`, {
            method: 'DELETE'
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                alert('Meta excluída com sucesso!');
                loadGoals();
            } else {
                alert('Erro ao excluir meta: ' + data.message);
            }
        })
        .catch(error => {
            console.error('Erro ao excluir meta:', error);
            alert('Erro ao excluir meta. Verifique o console para mais detalhes.');
        });
    }
}

