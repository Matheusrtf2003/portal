// goals.js

function initializeGoalForm() {
    const goalForm = document.getElementById('goalForm');

    // Carregar marcadores
    fetch('../functions/markers/getMarkers.php')
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
    fetch('../functions/Users/getUsers.php')
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

        fetch('/portal/functions/Metas/createGoal.php', {
            method: 'POST',
            body: formData
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                alert('Meta criada com sucesso!');
                $('#createGoalModal').modal('hide');
                loadGoals()
            } else {
                alert('Erro ao criar meta: ' + data.message);
            }
        })
        .catch(error => {
            console.error('Erro ao criar meta:', error);
            alert('Erro ao criar meta. Verifique o console para mais detalhes.');
        });
    });
}
