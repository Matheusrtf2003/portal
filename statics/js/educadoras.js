let currentPage = 1;
const itemsPerPage = 20;
let allEducators = [];
let filteredEducators = [];

document.addEventListener('DOMContentLoaded', function () {
    loadEducators();

    document.getElementById('searchInput').addEventListener('input', applyFilters);

    document.getElementById('selectAll').addEventListener('change', function() {
        const checkboxes = document.querySelectorAll('.select-row');
        checkboxes.forEach(checkbox => checkbox.checked = this.checked);
    });
});

function loadEducators() {
    fetch('functions/Educators/getEducators.php')
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

function displayEducators(educators) {
    const tbody = document.querySelector('#educatorsTable tbody');
    tbody.innerHTML = '';

    const start = (currentPage - 1) * itemsPerPage;
    const end = start + itemsPerPage;
    const paginatedEducators = educators.slice(start, end);

    paginatedEducators.forEach(educator => {
        const row = document.createElement('tr');
        row.innerHTML = `
            <td><input type="checkbox" class="select-row" data-id="${educator.id}"></td>
            <td>${educator.id}</td>
            <td>${educator.nome}</td>
            <td>${educator.cpf}</td>
            <td>${educator.estado}</td>
            <td>${educator.status ? 'Ativo' : 'Inativo'}</td>
            <td>
                <button class="btn btn-info btn-sm" onclick="viewEducator(${educator.id})">Ver Mais</button>
                <button class="btn btn-danger btn-sm" onclick="deleteEducator(${educator.id})">Excluir</button>
            </td>
        `;
        tbody.appendChild(row);
    });

    document.getElementById('prevPage').disabled = currentPage === 1;
    document.getElementById('nextPage').disabled = end >= educators.length;

    // Atualiza a contagem de educadoras
    const educatorCount = document.getElementById('educatorCount');
    educatorCount.textContent = `Total de Educadoras: ${educators.length}`;
}

function applyFilters() {
    const query = document.getElementById('searchInput').value.toLowerCase();
    const status = document.getElementById('filterStatus').value.toLowerCase();
    const state = document.getElementById('filterState').value.toLowerCase();

    filteredEducators = allEducators.filter(educator => {
        const id = educator.id.toString().toLowerCase();
        const nome = educator.nome.toLowerCase();
        const cpf = educator.cpf.toLowerCase();
        const estado = educator.estado.toLowerCase();
        const educatorStatus = educator.status ? 'Ativo' : 'Inativo';

        const matchQuery = id.includes(query) || nome.includes(query) || cpf.includes(query);
        const matchStatus = !status || educatorStatus === status;
        const matchState = !state || estado === state;

        return matchQuery && matchStatus && matchState;
    });

    displayEducators(filteredEducators);
    $('#filterStatusModal').modal('hide');
}

function changePage(direction) {
    currentPage += direction;
    applyFilters();
}

function viewEducator(id) {
    const educator = allEducators.find(ed => ed.id === id);
    if (educator) {
        document.getElementById('viewEducatorId').textContent = educator.id;
        document.getElementById('viewEducatorName').textContent = educator.nome;
        document.getElementById('viewEducatorCPF').textContent = educator.cpf;
        document.getElementById('viewEducatorBirthDate').textContent = educator.data_nascimento;
        document.getElementById('viewEducatorAddress').textContent = educator.endereco;
        document.getElementById('viewEducatorCity').textContent = educator.cidade;
        document.getElementById('viewEducatorState').textContent = educator.estado;
        document.getElementById('viewEducatorCEP').textContent = educator.cep;
        document.getElementById('viewEducatorMesoRegion').textContent = educator.mesorregiao;
        document.getElementById('viewEducatorInstagram').textContent = educator.instagram;
        document.getElementById('viewEducatorFollowers').textContent = educator.seguidores;
        document.getElementById('viewEducatorWebsite').textContent = educator.site;
        document.getElementById('viewEducatorClass').textContent = educator.turma;
        document.getElementById('viewEducatorStatus').textContent = educator.status ? 'Ativo' : 'Inativo';
        document.getElementById('viewEducatorActuation').textContent = educator.atuacao;
        document.getElementById('viewEducatorTechniques').textContent = educator.tecnicas;
        document.getElementById('viewEducatorPhone').textContent = educator.telefone;
        document.getElementById('viewEducatorEmail').textContent = educator.email;

        $('#viewEducatorModal').modal('show');
    }
}

function deleteEducator(id) {
    if (confirm('Tem certeza que deseja excluir esta educadora?')) {
        fetch(`functions/Educators/deleteEducator.php?id=${id}`, { method: 'DELETE' })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    alert('Educadora excluída com sucesso!');
                    loadEducators();
                } else {
                    alert('Erro ao excluir educadora: ' + data.message);
                }
            })
            .catch(error => {
                console.error('Erro ao excluir educadora:', error);
                alert('Erro ao excluir educadora. Verifique o console para mais detalhes.');
            });
    }
}

function deleteSelectedEducators() {
    const selectedEducators = [];
    document.querySelectorAll('.select-row:checked').forEach(checkbox => {
        selectedEducators.push(checkbox.getAttribute('data-id'));
    });

    if (selectedEducators.length === 0) {
        alert('Nenhuma educadora selecionada.');
        return;
    }

    if (confirm('Tem certeza que deseja excluir as educadoras selecionadas?')) {
        fetch('functions/Educators/deleteSelectedEducators.php', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ ids: selectedEducators })
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                alert('Educadoras excluídas com sucesso!');
                loadEducators();
            } else {
                alert('Erro ao excluir educadoras: ' + data.message);
            }
        })
        .catch(error => {
            console.error('Erro ao excluir educadoras:', error);
            alert('Erro ao excluir educadoras. Verifique o console para mais detalhes.');
        });
    }
}