function applyFilters() {
    const query = document.getElementById('searchInput').value.toLowerCase();
    const status = document.getElementById('filterStatusSelect').value.toLowerCase();
    const state = document.getElementById('filterStateSelect').value.toLowerCase();
    const marker = document.getElementById('filterMarkerSelect').value.toLowerCase();

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
    loadAvailableMarkers();
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

function filterByMarker() {
    applyFilters();
    $('#filterMarkerModal').modal('hide');
    loadMarkers();
}

function updateResultCount(count) {
    document.getElementById('resultCount').innerText = `${count} loja(s) encontrada(s)`;
}

function loadAvailableMarkers() {
    const markerSelect = document.getElementById('filterMarkerSelect');
    const uniqueMarkers = new Set();

    // Extraindo os marcadores únicos de todas as lojas
    allStores.forEach(store => {
        store.marcadores.forEach(marker => {
            uniqueMarkers.add(marker.nome); // Assumindo que 'nome' é a propriedade do marcador
        });
    });

    // Limpar opções existentes
    markerSelect.innerHTML = '<option value="">Todos</option>';

    // Adicionar marcadores únicos à lista de seleção
    uniqueMarkers.forEach(marker => {
        const option = document.createElement('option');
        option.value = marker;
        option.textContent = marker;
        markerSelect.appendChild(option);
    });
}
