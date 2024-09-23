// filters.js

function applyFilters() {
    const query = document.getElementById('searchInput') ? document.getElementById('searchInput').value.toLowerCase() : '';
    const status = document.getElementById('filterStatus') ? document.getElementById('filterStatus').value.toLowerCase() : '';
    const situation = document.getElementById('filterSituation') ? document.getElementById('filterSituation').value.toLowerCase() : '';
    const startDate = document.getElementById('filterDateStart') ? new Date(document.getElementById('filterDateStart').value) : new Date(NaN);
    const endDate = document.getElementById('filterDateEnd') ? new Date(document.getElementById('filterDateEnd').value) : new Date(NaN);

    filteredSharpeners = allSharpeners.filter(sharpener => {
        const id = sharpener.id.toString().toLowerCase();
        const nome = sharpener.nome ? sharpener.nome.toLowerCase() : '';
        const cpf = sharpener.cpf ? sharpener.cpf.toLowerCase() : '';
        const rowStatus = sharpener.status ? sharpener.status.toLowerCase() : '';
        const rowSituation = sharpener.situacao ? sharpener.situacao.toLowerCase() : '';
        const datetime = new Date(sharpener.datetime);

        const matchQuery = id.includes(query) || nome.includes(query) || cpf.includes(query);
        const matchStatus = !status || rowStatus === status;
        const matchSituation = !situation || rowSituation === situation;
        const matchDate = (!isNaN(startDate) && !isNaN(endDate)) ? (datetime >= startDate && datetime <= endDate) : true;

        return matchQuery && matchStatus && matchSituation && matchDate;
    });

    displaySharpeners(filteredSharpeners);
}
