// filters.js

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
