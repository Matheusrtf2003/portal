document.addEventListener('DOMContentLoaded', function () {
    loadEstados();
    
    // Quando um estado for selecionado, carregue as mesorregiões correspondentes
    document.getElementById('storeState').addEventListener('change', function() {
        const estadoId = this.value;
        loadMesorregioes(estadoId);
    });
});

// Função para carregar os estados
function loadEstados() {
    fetch('../functions/FaltaEndereco/getEstados.php')
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                const estadoSelect = document.getElementById('storeState');
                data.estados.forEach(estado => {
                    const option = document.createElement('option');
                    option.value = estado.id; // Usar o ID do estado
                    option.textContent = `${estado.nome} (${estado.sigla})`;
                    estadoSelect.appendChild(option);
                });
            } else {
                console.error('Erro ao carregar estados:', data.message);
            }
        })
        .catch(error => console.error('Erro ao carregar estados:', error));
}

// Função para carregar as mesorregiões com base no estado selecionado
function loadMesorregioes(estadoId) {
    const mesorregiaoSelect = document.getElementById('storeMesorregiao');
    mesorregiaoSelect.innerHTML = ''; // Limpa as opções anteriores

    fetch(`../functions/FaltaEndereco/getMesorregioes.php?estado_id=${estadoId}`)
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                mesorregiaoSelect.innerHTML = '<option value="" disabled selected>Selecione uma mesorregião</option>'; // Opção padrão
                data.mesorregioes.forEach(mesorregiao => {
                    const option = document.createElement('option');
                    option.value = mesorregiao.id;
                    option.textContent = mesorregiao.nome;
                    mesorregiaoSelect.appendChild(option);
                });
            } else {
                mesorregiaoSelect.innerHTML = '<option value="" disabled>Nenhuma mesorregião disponível</option>';
                console.error('Erro ao carregar mesorregiões:', data.message);
            }
        })
        .catch(error => console.error('Erro ao carregar mesorregiões:', error));
}
