// loadGoals.js

function loadGoals(user_id) {
    fetch('../../../functions/Metas/getGoals.php')
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
