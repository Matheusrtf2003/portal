// displayEducators.js

function displayEducators(educators) {
    const tbody = document.querySelector('#educatorsTable tbody');
    tbody.innerHTML = '';

    let currentPage = 1;  // Declare and initialize currentPage globally
const itemsPerPage = 20;  // Also make sure this is defined


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
