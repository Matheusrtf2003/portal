// Aplica os filtros
function applyFilters() {
    const query = document.getElementById('searchInput').value.toLowerCase();
    const status = document.getElementById('filterStatus').value.toLowerCase();
    const startDate = new Date(document.getElementById('filterDateStart').value);
    const endDate = new Date(document.getElementById('filterDateEnd').value);
    const vendedor = document.getElementById('filterVendedor').value.toLowerCase();
    const hunter = document.getElementById('hunter').value.toLowerCase();

    // Garantir que as datas de início e fim são válidas
    const isStartDateValid = !isNaN(startDate.getTime());
    const isEndDateValid = !isNaN(endDate.getTime());

    // Filtrar as lojas com base nos critérios aplicados
    filteredStores = allStores.filter(store => {
        // Filtro por nome da loja
        const matchQuery = store.nome.toLowerCase().includes(query);

        // Filtro por status
        const matchStatus = !status || store.status.toLowerCase() === status;

        // Filtro por datas (se ambas forem válidas)
        const matchDate = (!isStartDateValid && !isEndDateValid) || 
            (isStartDateValid && isEndDateValid && new Date(store.datetime) >= startDate && new Date(store.datetime) <= endDate);

        // Filtro por vendedor: só aplica o filtro de vendedor se o campo estiver preenchido
        const matchVendedor = !vendedor || store.vendedor.toLowerCase() === vendedor;

        // Filtro por hunter: aplica o filtro de hunter se o campo estiver preenchido
        const matchHunter = !hunter || store.hunter.toLowerCase() === hunter;

        // Retorna apenas se todos os filtros baterem
        return matchQuery && matchStatus && matchDate && matchVendedor && matchHunter;
    });

    // Exibe as lojas filtradas
    displayStores(filteredStores);
}

// Reseta os filtros
function resetFilters() {
    document.getElementById('filterStatus').value = '';
    document.getElementById('filterDateStart').value = '';
    document.getElementById('filterDateEnd').value = '';
    document.getElementById('filterVendedor').value = '';
    document.getElementById('hunter').value = '';
    document.getElementById('searchInput').value = '';
    applyFilters();
}
