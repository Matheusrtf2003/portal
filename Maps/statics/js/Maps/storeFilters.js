function applyFilters() {
    const query = document.getElementById('searchInput').value.toLowerCase();
    const status = document.getElementById('filterStatusSelect').value.toLowerCase();
    const state = document.getElementById('filterStateSelect').value.toLowerCase();
    const marker = document.getElementById('filterMarkerSelect').value.toLowerCase();
    const usuario = document.getElementById('filterUsuarioSelect').value; // Não converter para lowerCase pois é um ID numérico
    const city = document.getElementById('filterCitySelect').value.toLowerCase(); // Filtro de cidade
    const mesorregiao = document.getElementById('filterMesorregiaoSelect').value.toLowerCase(); // Filtro de mesorregião

    // Usar 'allStores' como a base para o filtro
    filteredStores = allStores.filter(store => {
        const matchQuery = store.nome.toLowerCase().includes(query) || store.cidade.toLowerCase().includes(query);
        const matchStatus = !status || store.status.toLowerCase() === status;
        const matchState = !state || store.estado.toLowerCase() === state;
        const matchMarker = !marker || (store.marcadores && store.marcadores.some(m => m.nome.toLowerCase() === marker));
        const matchUsuario = !usuario || store.usuario_id == usuario;
        const matchCity = !city || store.cidade.toLowerCase() === city; // Novo filtro de cidade
        const matchMesorregiao = !mesorregiao || store.mesorregiao.toLowerCase() === mesorregiao; // Novo filtro de mesorregião

        // Retorna apenas se todos os filtros forem satisfeitos
        return matchQuery && matchStatus && matchUsuario && matchState && matchMarker && matchCity && matchMesorregiao;
    });

    displayStores(filteredStores);
    updateResultCount(filteredStores.length);
    loadMarkers();
    loadAvailableMarkers();
    loadAvailableUsers();
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

function filterByUser() {
    applyFilters();
    $('#filterUsuarioModal').modal('hide');
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

function loadAvailableUsers() {
    const userSelect = document.getElementById('filterUsuarioSelect');
    const previousSelectedUser = userSelect.value; // Capturar o valor previamente selecionado
    const uniqueUsers = new Map();

    // Extraindo usuários únicos de todas as lojas
    allStores.forEach(store => {
        if (store.usuario_id && store.usuario_nome) {
            uniqueUsers.set(store.usuario_id, store.usuario_nome);
        }
    });

    // Limpar opções existentes
    userSelect.innerHTML = '<option value="">Todos</option>';

    // Adicionar usuários únicos à lista de seleção
    uniqueUsers.forEach((nome, id) => {
        const option = document.createElement('option');
        option.value = id;
        option.textContent = nome;
        userSelect.appendChild(option);
    });

    // Restaurar o valor previamente selecionado
    if (previousSelectedUser) {
        userSelect.value = previousSelectedUser;
    }
}

function loadAvailableCities() {
    const citySelect = document.getElementById('filterCitySelect');
    const uniqueCities = new Set();

    // Extraindo cidades únicas de todas as lojas
    allStores.forEach(store => {
        uniqueCities.add(store.cidade.toLowerCase());
    });

    // Limpar opções existentes
    citySelect.innerHTML = '<option value="">Todas</option>';

    // Adicionar cidades únicas à lista de seleção
    uniqueCities.forEach(city => {
        const option = document.createElement('option');
        option.value = city;
        option.textContent = city.charAt(0).toUpperCase() + city.slice(1); // Capitaliza a primeira letra
        citySelect.appendChild(option);
    });
}

function loadAvailableMesorregioes() {
    const mesorregiaoSelect = document.getElementById('filterMesorregiaoSelect');
    const uniqueMesorregioes = new Set();

    // Extraindo mesorregiões únicas de todas as lojas
    allStores.forEach(store => {
        if (store.mesorregiao_nome) {  // Verifique se 'mesorregiao_nome' é o campo correto no seu banco de dados
            uniqueMesorregioes.add(store.mesorregiao_nome.toLowerCase());
        }
    });

    // Limpar opções existentes
    mesorregiaoSelect.innerHTML = '<option value="">Todas</option>';

    // Adicionar mesorregiões únicas à lista de seleção
    uniqueMesorregioes.forEach(mesorregiao => {
        const option = document.createElement('option');
        option.value = mesorregiao;
        option.textContent = mesorregiao.charAt(0).toUpperCase() + mesorregiao.slice(1); // Capitaliza a primeira letra
        mesorregiaoSelect.appendChild(option);
    });
}




