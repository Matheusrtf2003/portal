let currentPage = 1;  // Defina a página atual globalmente para que ela possa ser alterada
const itemsPerPage = 20;  // Defina o número de itens por página

function displayEducators(educators) {
    const tbody = document.querySelector('#educatorsTable tbody');
    tbody.innerHTML = '';

    // Calcular o índice de início e fim com base na página atual
    const start = (currentPage - 1) * itemsPerPage;
    const end = start + itemsPerPage;
    const paginatedEducators = educators.slice(start, end);

    // Exibir os educadores paginados
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

    // Controle dos botões de navegação
    document.getElementById('prevPage').disabled = currentPage === 1;
    document.getElementById('nextPage').disabled = end >= educators.length;

    // Atualiza a contagem de educadoras
    const educatorCount = document.getElementById('educatorCount');
    educatorCount.textContent = `Total de Educadoras: ${educators.length}`;
}

// Funções de paginação
function changePage(direction) {
    currentPage += direction;
    if (currentPage < 1) {
        currentPage = 1;
    }
    if (currentPage > Math.ceil(allEducators.length / itemsPerPage)) {
        currentPage = Math.ceil(allEducators.length / itemsPerPage);
    }
    applyFilters();  // Isso recarrega a tabela para refletir a nova página
}

// Controle de eventos de navegação
document.getElementById('prevPage').addEventListener('click', function() {
    changePage(-1);
});

document.getElementById('nextPage').addEventListener('click', function() {
    changePage(1);
});
