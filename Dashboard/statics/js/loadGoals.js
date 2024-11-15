function loadGoals(user_id) {
    fetch('../functions/Metas/getGoals.php')
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
                        goalDiv.className = 'card mb-3 border-0 col-md-4';
                        goalDiv.innerHTML = `
                            <div class="card-body" style="border-left: 15px solid ${goal.marker_color}; padding: 20px; background-color: #ffffff;">
                                <div class="d-flex justify-content-between align-items-center">
                                    <h5 class="card-title text-primary font-weight-bold">${goal.name}</h5>
                                    ${user_id == goal.created_by ? `
                                    <div class="dropdown">
                                        <button class="btn btn-link text-dark dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <i class="fas fa-ellipsis-v"></i>
                                        </button>
                                        <div class="dropdown-menu dropdown-menu-right">
                                            <a class="dropdown-item" href="#" onclick="editGoal(${goal.id})">Editar</a>
                                            <a class="dropdown-item" href="#" onclick="deleteGoal(${goal.id})">Excluir</a>
                                        </div>
                                    </div>` : ''}
                                </div>
                                <p class="card-text"><strong>Quantidade de Lojas:</strong> ${goal.target}</p>
                                <p class="card-text"><strong>Data Limite:</strong> ${goal.end_date}</p>
                                <p class="card-text"><strong>Marcador:</strong> <span style="color: ${goal.marker_color}; font-weight: bold;">${goal.marker_name}</span></p>
                                <p class="card-text"><strong>Usuários:</strong> ${goal.users.map(user => user.nome).join(', ')}</p>
                                <p class="card-text"><strong>Progresso:</strong> ${goal.current}/${goal.target}</p>
                                <div class="progress" style="height: 15px; border-radius: 10px; background-color: #e9ecef;">
                                    <div class="progress-bar bg-${getProgressColor(goal.current, goal.target)}" role="progressbar" style="width: ${Math.min((goal.current / goal.target) * 100, 100)}%;" aria-valuenow="${goal.current}" aria-valuemin="0" aria-valuemax="${goal.target}">
                                        ${Math.min((goal.current / goal.target) * 100, 100).toFixed(0)}%
                                    </div>
                                </div>
                            </div>
                        `;
                        if (goal.created_by == user_id) {
                            goalsContainerAdmin.appendChild(goalDiv);
                        } else if (goal.users.some(user => user.id == user_id)) {
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

function getProgressColor(current, target) {
    const percentage = (current / target) * 100;
    if (percentage >= 80) return 'success';
    if (percentage >= 50) return 'warning';
    return 'danger';
}
