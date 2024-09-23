function applyFilters() {
    const query = document.getElementById('searchInput').value.toLowerCase();
    const status = document.getElementById('filterStatusSelect').value.toLowerCase();
    const state = document.getElementById('filterStateSelect').value.toLowerCase();
    const marker = document.getElementById('filterMarkers').value.toLowerCase();

    filteredStores = allStores.filter(store => {
        const matchQuery = store.nome.toLowerCase().includes(query) || store.cidade.toLowerCase().includes(query);
        const matchStatus = !status || store.status.toLowerCase() === status;
        const matchState = !state || store.estado.toLowerCase() === state;
        const matchMarker = !marker || store.marcadores.some(m => m.nome.toLowerCase() === marker);

        return matchQuery && matchStatus && matchState && matchMarker;
    });

    displayStores(filteredStores);
    updateResultCount(filteredStores.length);
    loadMarkers();
}

function filterByState() {
    applyFilters();
    $('#filterStateModal').modal('hide');
    loadMarkers();
}

function filterByStatus() {
    applyFilters();
    $('#filterStatusModal').modal('hide');
    loadMarkers();
}

function updateResultCount(count) {
    document.getElementById('resultCount').innerText = `${count} loja(s) encontrada(s)`;
}
