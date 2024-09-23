// displaySharpeners.js

function displaySharpeners(sharpeners) {
    const tbody = document.querySelector('#sharpenersTable tbody');
    tbody.innerHTML = '';

    const start = (currentPage - 1) * itemsPerPage;
    const end = start + itemsPerPage;
    const paginatedSharpeners = sharpeners.slice(start, end);

    paginatedSharpeners.forEach(sharpener => {
        const row = document.createElement('tr');
        row.innerHTML = `
            <td><input type="checkbox" class="select-sharpener" data-id="${sharpener.id}"></td>
            <td>${sharpener.id}</td>
            <td>${sharpener.nome}</td>
            <td>${sharpener.cpf}</td>
            <td>${sharpener.uf}</td>
            <td>${sharpener.status}</td>
            <td>${sharpener.situacao}</td>
            <td>
                <button class="btn btn-warning btn-sm" onclick="editSharpener(${sharpener.id})">Editar</button>
                <button class="btn btn-danger btn-sm" onclick="deleteSharpener(${sharpener.id})">Excluir</button>
            </td>
        `;
        tbody.appendChild(row);
    });

    const sharpenerCount = document.getElementById('sharpenerCount');
    if (sharpenerCount) {
        sharpenerCount.textContent = `Total de Afiadores: ${sharpeners.length}`;
    }

    document.getElementById('prevPage').disabled = currentPage === 1;
    document.getElementById('nextPage').disabled = end >= sharpeners.length;
}
