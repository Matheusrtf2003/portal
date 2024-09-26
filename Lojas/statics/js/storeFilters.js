// Aplica os filtros
function applyFilters() {
    // Captura os valores dos filtros
    const query = document.getElementById('searchInput').value.trim().toLowerCase();
    const status = document.getElementById('filterStatus').value.trim().toLowerCase();
    const anotacao = document.getElementById('filterAnotacao').value.trim().toLowerCase(); // Filtro de anotações
    const marker = document.getElementById('filterMarker').value.trim(); // Filtro de marcador
    const startDate = document.getElementById('filterDateStart').value ? new Date(document.getElementById('filterDateStart').value) : null;
    const endDate = document.getElementById('filterDateEnd').value ? new Date(document.getElementById('filterDateEnd').value) : null;
    const vendedor = document.getElementById('filterVendedor').value.trim().toLowerCase();
    const hunter = document.getElementById('hunter').value.trim().toLowerCase();

    // Garantir que as datas de início e fim são válidas
    const isStartDateValid = startDate !== null && !isNaN(startDate.getTime());
    const isEndDateValid = endDate !== null && !isNaN(endDate.getTime());

    // Filtrar as lojas com base nos critérios aplicados
    filteredStores = allStores.filter(store => {
        // Filtro por nome da loja
        const matchQuery = !query || store.nome.toLowerCase().includes(query);

        // Filtro por status: se status for vazio, não aplica filtro
        const matchStatus = !status || store.status.toLowerCase() === status;

        // Filtro por anotações: se anotacao for vazio, não aplica filtro
        const matchAnotacao = !anotacao || store.anotacao.toLowerCase() === anotacao;

        // Filtro por marcador: se marker for vazio, não aplica filtro
        const matchMarker = !marker || store.marcador_id === marker;

        // Filtro por datas (se ambas forem válidas)
        const matchDate = (!isStartDateValid && !isEndDateValid) || 
            (isStartDateValid && isEndDateValid && new Date(store.datetime) >= startDate && new Date(store.datetime) <= endDate);

        // Filtro por vendedor: só aplica o filtro de vendedor se o campo estiver preenchido
        const matchVendedor = !vendedor || (store.vendedor && store.vendedor.toLowerCase() === vendedor);

        // Filtro por hunter: aplica o filtro de hunter se o campo estiver preenchido
        const matchHunter = !hunter || (store.hunter && store.hunter.toLowerCase() === hunter);

        // Retorna apenas se todos os filtros baterem
        return matchQuery && matchStatus && matchAnotacao && matchMarker && matchDate && matchVendedor && matchHunter;
    });

    // Exibe as lojas filtradas
    displayStores(filteredStores);
}
