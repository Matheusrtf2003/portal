let currentPage = 1;
const itemsPerPage = 20;
let allStores = []; // Armazena todas as lojas carregadas
let filteredStores = []; // Armazena as lojas após aplicar os filtros

document.addEventListener('DOMContentLoaded', function () {
    loadAllStores();
    loadMarkers();

    document.getElementById('searchInput').addEventListener('input', applyFilters);
    document.getElementById('storeCNPJ').addEventListener('input', function () {
        const cnpj = this.value;
        if (cnpj.length === 14) {
            fetch(`cnpjProxy.php?cnpj=${cnpj}`)
                .then(response => response.json())
                .then(data => {
                    if (data.status === 'OK') {
                        document.getElementById('storeName').value = data.nome;
                        document.getElementById('storeAddress').value = `${data.logradouro}, ${data.numero}, ${data.bairro}`;
                        document.getElementById('storeCity').value = data.municipio;
                        document.getElementById('storeState').value = data.uf;
                        document.getElementById('storeDecider').value = data.qsa[0] ? data.qsa[0].nome : '';
                    } else {
                        console.error('Erro ao buscar dados do CNPJ:', data.message);
                    }
                })
                .catch(error => console.error('Erro ao buscar dados do CNPJ:', error));
        }
    });

    document.getElementById('selectAll').addEventListener('change', function() {
        const checkboxes = document.querySelectorAll('.select-store');
        checkboxes.forEach(checkbox => checkbox.checked = this.checked);
    });
});

function loadMarkers(selectedMarkers = []) {
    fetch('functions/getMarkers.php')
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                const storeMarkersDiv = document.getElementById('storeMarkers');
                const filterMarkerSelect = document.getElementById('filterMarker');
                
                storeMarkersDiv.innerHTML = '';
                filterMarkerSelect.innerHTML = '<option value="">Selecionar Marcador</option>';

                data.markers.forEach(marker => {
                    const checkbox = document.createElement('div');
                    checkbox.className = 'form-check';
                    checkbox.innerHTML = `
                        <input class="form-check-input" type="checkbox" id="marker${marker.id}" name="marcadores[]" value="${marker.id}" ${selectedMarkers.includes(marker.id.toString()) ? 'checked' : ''}>
                        <label class="form-check-label" for="marker${marker.id}" style="color: ${marker.cor};">
                            ${marker.nome}
                        </label>
                    `;
                    storeMarkersDiv.appendChild(checkbox);

                    const option = document.createElement('option');
                    option.value = marker.id;
                    option.textContent = marker.nome;
                    filterMarkerSelect.appendChild(option);
                });
            } else {
                console.error('Erro ao carregar marcadores:', data.message);
            }
        })
        .catch(error => {
            console.error('Erro ao carregar marcadores:', error);
        });
}

function loadAllStores() {
    fetch('functions/getStores2.php')
        .then(response => response.json())
        .then(data => {
            console.log('Response data:', data); // Verifica a estrutura da resposta
            if (data.success) {
                allStores = data.stores;
                applyFilters(); // Aplicar filtros após carregar todas as lojas
            } else {
                alert('Erro ao carregar lojas: ' + data.message);
            }
        })
        .catch(error => {
            console.error('Erro ao carregar lojas:', error);
            alert('Erro ao carregar lojas. Verifique o console para mais detalhes.');
        });
}

function displayStores(stores) {
    const tbody = document.querySelector('#storesTable tbody');
    tbody.innerHTML = '';

    // Ordena as lojas pela data, mais recentes primeiro
    stores.sort((a, b) => new Date(b.datetime) - new Date(a.datetime));

    const start = (currentPage - 1) * itemsPerPage;
    const end = start + itemsPerPage;
    const paginatedStores = stores.slice(start, end);

    paginatedStores.forEach(store => {
        const markers = Array.isArray(store.marcadores) 
            ? store.marcadores.map(marker => `<span style="color: ${marker.cor}">${marker.nome}</span>`).join(', ') 
            : 'Sem marcadores';
        
        // Verifica se o Instagram começa com "https://"
        const instagramIcon = store.instagram && store.instagram.startsWith('https://') 
            ? `<a href="${store.instagram}" target="_blank">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-instagram" viewBox="0 0 16 16">
                    <path d="M8 0C5.829 0 5.556.01 4.703.048 3.85.088 3.269.222 2.76.42a3.9 3.9 0 0 0-1.417.923A3.9 3.9 0 0 0 .42 2.76C.222 3.268.087 3.85.048 4.7.01 5.555 0 5.827 0 8.001c0 2.172.01 2.444.048 3.297.04.852.174 1.433.372 1.942.205.526.478.972.923 1.417.444.445.89.719 1.416.923.51.198 1.09.333 1.942.372C5.555 15.99 5.827 16 8 16s2.444-.01 3.298-.048c.851-.04 1.434-.174 1.943-.372a3.9 3.9 0 0 0 1.416-.923c.445-.445.718-.891.923-1.417.197-.509.332-1.09.372-1.942C15.99 10.445 16 10.173 16 8s-.01-2.445-.048-3.299c-.04-.851-.175-1.433-.372-1.941a3.9 3.9 0 0 0-.923-1.417A3.9 3.9 0 0 0 13.24.42c-.51-.198-1.092-.333-1.943-.372C10.443.01 10.172 0 7.998 0zm-.717 1.442h.718c2.136 0 2.389.007 3.232.046.78.035 1.204.166 1.486.275.373.145.64.319.92.599s.453.546.598.92c.11.281.24.705.275 1.485.039.843.047 1.096.047 3.231s-.008 2.389-.047 3.232c-.035.78-.166 1.203-.275 1.485a2.5 2.5 0 0 1-.599.919c-.28.28-.546.453-.92.598-.28.11-.704.24-1.485.276-.843.038-1.096.047-3.232.047s-2.39-.009-3.233-.047c-.78-.036-1.203-.166-1.485-.276a2.5 2.5 0 0 1-.92-.598 2.5 2.5 0 0 1-.6-.92c-.109-.281-.24-.705-.275-1.485-.038-.843-.046-1.096-.046-3.233s.008-2.388.046-3.231c.036-.78.166-1.204.276-1.486.145-.373.319-.64.599-.92s.546-.453.92-.598c.282-.11.705-.24 1.485-.276.738-.034 1.024-.044 2.515-.045zm4.988 1.328a.96.96 0 1 0 0 1.92.96.96 0 0 0 0-1.92m-4.27 1.122a4.109 4.109 0 1 0 0 8.217 4.109 4.109 0 0 0 0-8.217m0 1.441a2.667 2.667 0 1 1 0 5.334 2.667 2.667 0 0 1 0-5.334"/>
                </svg>
            </a>` 
            : '-'; // Exibe um traço se não começar com "https://"

        // Verifica se o Site começa com "https://"
        const siteIcon = store.site && store.site.startsWith('https://') 
            ? `<a href="${store.site}" target="_blank">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-globe" viewBox="0 0 16 16">
                    <path d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8m7.5-6.923c-.67.204-1.335.82-1.887 1.855A8 8 0 0 0 5.145 4H7.5zM4.09 4a9.3 9.3 0 0 1 .64-1.539 7 7 0 0 1 .597-.933A7.03 7.03 0 0 0 2.255 4zm-.582 3.5c.03-.877.138-1.718.312-2.5H1.674a7 7 0 0 0-.656 2.5zM4.847 5a12.5 12.5 0 0 0-.338 2.5H7.5V5zM8.5 5v2.5h2.99a12.5 12.5 0 0 0-.337-2.5zM4.51 8.5a12.5 12.5 0 0 0 .337 2.5H7.5V8.5zm3.99 0V11h2.653c.187-.765.306-1.608.338-2.5zM5.145 12q.208.58.468 1.068c.552 1.035 1.218 1.65 1.887 1.855V12zm.182 2.472a7 7 0 0 1-.597-.933A9.3 9.3 0 0 1 4.09 12H2.255a7 7 0 0 0 3.072 2.472M3.82 11a13.7 13.7 0 0 1-.312-2.5h-2.49c.062.89.291 1.733.656 2.5zm6.853 3.472A7 7 0 0 0 13.745 12H11.91a9.3 9.3 0 0 1-.64 1.539 7 7 0 0 1-.597.933M8.5 12v2.923c.67-.204 1.335-.82 1.887-1.855q.26-.487.468-1.068zm3.68-1h2.146c.365-.767.594-1.61.656-2.5h-2.49a13.7 13.7 0 0 1-.312 2.5m2.802-3.5a7 7 0 0 0-.656-2.5H12.18c.174.782.282 1.623.312 2.5zM11.27 2.461c.247.464.462.98.64 1.539h1.835a7 7 0 0 0-3.072-2.472c.218.284.418.598.597.933M10.855 4a8 8 0 0 0-.468-1.068C9.835 1.897 9.17 1.282 8.5 1.077V4z"/>
                </svg>
            </a>` 
            : '-'; // Exibe um traço se não começar com "https://"

        // Aplicando cores ao status
        const statusColor = store.status === 'Descoberto' ? '#343a40' :
                            store.status === 'Coberto' ? '#007bff' :
                            store.status === 'Ativo' ? '#28a745' :
                            store.status === 'Inativo' ? '#c82333' : 'black';

        const statusBadge = `<span style="background-color: ${statusColor}; color: white; padding: 6px; border-radius: 8px;">${store.status}</span>`;

        // Definindo o nome do vendedor ou um texto padrão caso não haja
        const vendedorNome = store.vendedor && store.vendedor.nome ? store.vendedor.nome : null; // Exibe o nome do vendedor ou exibe o botão se não houver

        // Se não houver vendedor, exibe o botão "Atribuir Vendedor"
        const vendedorCell = vendedorNome 
        ? vendedorNome 
        : `<button class="btn btn-primary btn-sm" onclick="openAssignVendedorModal(${store.id})">Atribuir Vendedor</button>`;


        const row = document.createElement('tr');
        row.innerHTML = `
            <td><input type="checkbox" class="select-store" data-id="${store.id}"></td>
            <td>${store.id}</td>
            <td>${store.nome.toUpperCase()}</td>
            <td>${store.cnpj}</td>
            <td>${statusBadge}</td>
            <td>${store.endereco.toUpperCase()}</td>
            <td>${store.cidade.toUpperCase()}</td>
            <td>${store.estado}</td>
            <td>${store.mesorregiao}</td>
            <td>${store.anotacao.toUpperCase()}</td>
            <td>${store.telefone}</td>
            <td>${instagramIcon}</td>
            <td>${siteIcon}</td>
            <td>${store.decisor.toUpperCase()}</td>
            <td>${store.telefone_decisor}</td>
            <td>${store.email}</td>
            <td>${markers}</td>
            <td>${new Date(store.datetime).toLocaleString()}</td>
            <td>${store.usuarios_data.map(user => `<a href="view_profile.php?id=${user.id}">${user.nome}</a>`).join(', ')}</td>
            <td>${vendedorCell}</td> <!-- Aqui aparece o nome do vendedor ou o botão -->
            <td>
                <button class="btn btn-warning btn-sm" onclick="editStore(${store.id})">Editar</button>
                <button class="btn btn-danger btn-sm" onclick="deleteStore(${store.id})">Excluir</button>
            </td>
        `;
        tbody.appendChild(row);
    });

    document.getElementById('prevPage').disabled = currentPage === 1;
    document.getElementById('nextPage').disabled = end >= stores.length;

    const storeCount = document.getElementById('storeCount');
    storeCount.textContent = `Total de Lojas: ${stores.length}`;
}

function filterByStatus() {
    applyFilters();
    $('#filterStatusModal').modal('hide');
}

function filterByDate() {
    applyFilters();
    $('#filterDateModal').modal('hide');
}

function filterByMarker() {
    applyFilters();
    $('#filterMarkerModal').modal('hide');
}

function resetFilters() {
    document.getElementById('filterStatus').value = '';
    document.getElementById('filterMarker').value = '';
    document.getElementById('filterDateStart').value = '';
    document.getElementById('filterDateEnd').value = '';
    applyFilters();
    $('#filterModal').modal('hide');
}

function importCSV() {
    const formData = new FormData(document.getElementById('importCSVForm'));

    fetch('functions/importCSV.php', {
        method: 'POST',
        body: formData
    })
    .then(response => response.json())
    .then(data => {
        const importMessage = document.getElementById('importMessage');
        if (data.success) {
            importMessage.innerHTML = `<div class="alert alert-success">${data.message}</div>`;
            loadAllStores();
            $('#importCSVModal').modal('hide');
        } else {
            importMessage.innerHTML = `<div class="alert alert-danger">${data.message}</div>`;
        }
    })
    .catch(error => {
        console.error('Erro ao importar arquivo CSV:', error);
        const importMessage = document.getElementById('importMessage');
        importMessage.innerHTML = `<div class="alert alert-danger">Erro ao importar arquivo CSV. Verifique o console para mais detalhes.</div>`;
    });
}

document.getElementById('storeForm').addEventListener('submit', function(event) {
    event.preventDefault();

    const formData = new FormData(this);
    const storeId = document.getElementById('storeId').value;

    const url = storeId ? 'functions/updateStore.php' : 'functions/addStore.php';

    console.log('Submitting form to URL:', url);
    console.log('FormData:', ...formData.entries());

    fetch(url, {
        method: 'POST',
        body: formData
    })
    .then(response => response.json())
    .then(data => {
        console.log('Response:', data);
        if (data.success) {
            alert('Loja salva com sucesso!');
            $('#addStoreModal').modal('hide');
            loadAllStores(); // Recarrega as lojas para refletir as atualizações
        } else {
            alert('Erro ao salvar loja: ' + data.message);
        }
    })
    .catch(error => {
        console.error('Erro ao salvar loja:', error);
        alert('Erro ao salvar loja. Verifique o console para mais detalhes.');
    });
});

function editStore(id) {
    console.log('Editing store with ID:', id);
    
    // Fazendo a requisição para obter os dados da loja
    fetch(`functions/getStore.php?id=${id}`)
        .then(response => response.json())
        .then(data => {
            console.log('Data received for store:', data);
            if (data.success && data.store) {
                const store = data.store;
                
                const storeMarkers = store && Array.isArray(store.marcadores) ? store.marcadores.map(marker => marker.id.toString()) : [];

                // Preenchendo os campos do formulário com os dados recebidos
                document.getElementById('storeId').value = store.id || '';
                document.getElementById('storeName').value = store.nome || '';
                document.getElementById('storeCNPJ').value = store.cnpj || '';
                document.getElementById('storeStatus').value = store.status || '';
                document.getElementById('storeAddress').value = store.endereco || '';
                document.getElementById('storeCity').value = store.cidade || '';
                document.getElementById('storeState').value = store.estado || '';
                document.getElementById('storeMesorregiao').value = store.mesorregiao || ''; // Preenchendo a Mesorregião
                document.getElementById('storeDescription').value = store.anotacao || ''; // Preenchendo a Especialidade (Anotação)
                document.getElementById('storePhone').value = store.telefone || '';
                document.getElementById('storeEmail').value = store.email || '';
                document.getElementById('storeInstagram').value = store.instagram || '';
                document.getElementById('storeWebsite').value = store.site || '';
                document.getElementById('storeDecider').value = store.decisor || '';
                document.getElementById('storeDeciderPhone').value = store.telefone_decisor || '';

                // Carregando marcadores (caso aplicável)
                loadMarkers(storeMarkers);

                // Mostrar o modal de edição da loja
                $('#addStoreModal').modal('show');
            } else {
                console.error('Erro: Dados da loja não foram recebidos corretamente', data);
                alert('Erro ao carregar dados da loja: ' + (data.message || 'Dados incompletos'));
            }
        })
        .catch(error => {
            console.error('Erro ao carregar dados da loja:', error);
            alert('Erro ao carregar dados da loja. Verifique o console para mais detalhes.');
        });
}

function deleteStore(id) {
    if (confirm('Tem certeza que deseja excluir esta loja?')) {
        fetch(`functions/deleteStore.php?id=${id}`, { method: 'DELETE' })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    alert('Loja excluída com sucesso!');
                    loadAllStores();
                } else {
                    alert('Erro ao excluir loja: ' + data.message);
                }
            })
            .catch(error => {
                console.error('Erro ao excluir loja:', error);
                alert('Erro ao excluir loja. Verifique o console para mais detalhes.');
            });
    }
}

document.getElementById('storeForm').addEventListener('submit', function(event) {
    event.preventDefault();

    const formData = new FormData(this);
    const storeId = document.getElementById('storeId').value;

    const url = storeId ? 'functions/updateStore.php' : 'functions/addStore.php';

    console.log('Submitting form to URL:', url);
    console.log('FormData:', ...formData.entries());

    fetch(url, {
        method: 'POST',
        body: formData
    })
    .then(response => response.json())
    .then(data => {
        console.log('Response:', data);
        if (data.success) {
            alert('Loja salva com sucesso!');
            $('#addStoreModal').modal('hide');
            loadAllStores();
        } else {
            alert('Erro ao salvar loja: ' + data.message);
        }
    })
    .catch(error => {
        console.error('Erro ao salvar loja:', error);
        alert('Erro ao salvar loja. Verifique o console para mais detalhes.');
    });
});

// Checka o TINY para atualizar Status da loja
function checkAllCNPJs() {
    fetch('functions/getAllCNPJs.php')
        .then(response => response.text())
        .then(data => {
            console.log('Resposta bruta do servidor:', data);
            try {
                const jsonData = JSON.parse(data);
                if (jsonData.success) {
                    const cnpjs = jsonData.cnpjs;
                    const batches = chunkArray(cnpjs, 5);

                    let index = 0;
                    function processBatch() {
                        if (index < batches.length) {
                            const batch = batches[index];
                            index++;
                            Promise.all(batch.map(cnpj => fetchTinyAPI(cnpj)))
                                .then(() => {
                                    setTimeout(processBatch, 2000);
                                })
                                .catch(error => console.error('Erro ao processar lote:', error));
                        }
                    }
                    processBatch();
                } else {
                    console.error('Erro ao buscar CNPJs:', jsonData.message);
                }
            } catch (e) {
                console.error('Erro ao analisar resposta como JSON:', data);
            }
        })
        .catch(error => console.error('Erro ao buscar CNPJs:', error));
}

function processStoresInBatches(cnpjs) {
    const batches = chunkArray(cnpjs, 5);  // Divide a lista de CNPJs em lotes de 5

    let currentBatchIndex = 0;

    function processNextBatch() {
        if (currentBatchIndex < batches.length) {
            const currentBatch = batches[currentBatchIndex];
            currentBatchIndex++;

            Promise.all(currentBatch.map(cnpj => fetchTinyAPI(cnpj)))
                .then(() => {
                    // Aguarda 1 segundo (1000ms) antes de processar o próximo lote
                    setTimeout(processNextBatch, 1000);
                })
                .catch(error => console.error('Erro ao processar lote:', error));
        }
    }

    processNextBatch();
}

function fetchTinyAPI(cnpj) {
    const url = `tinyProxy.php?cnpj=${encodeURIComponent(cnpj)}`;
    return fetch(url)
        .then(response => response.json())
        .then(data => {
            if (!data.cliente || !data.pedidos || data.cliente.retorno.status !== 'OK') {
                console.log(`CNPJ ${cnpj} não encontrado no Tiny ou erro ao buscar dados.`);
                return; // Se o cliente não estiver no Tiny ou houve um erro, mantenha o status atual e saia da função
            }

            const clientData = data.cliente.retorno;
            const orderData = data.pedidos.retorno;

            if (clientData.contatos.length > 0) {
                const contato = clientData.contatos[0].contato;

                // Verificar se o tipo de contato é "atacado"
                const isAtacado = contato.tipos_contato.some(tipo => tipo.tipo === 'atacado');

                if (!isAtacado) {
                    console.log(`Loja com CNPJ ${cnpj} não é do tipo atacado.`);
                    return; // Se não for atacado, mantenha o status atual e saia da função
                }

                // Verificar se há pedidos e obter a data do último pedido
                if (orderData.status === 'OK' && orderData.pedidos.length > 0) {
                    const pedidos = orderData.pedidos.map(pedido => new Date(pedido.pedido.data_pedido));
                    const ultimaCompra = new Date(Math.max.apply(null, pedidos));

                    if (isOlderThanNineMonths(ultimaCompra)) {
                        updateStoreStatus(cnpj, 'Inativo');
                    } else {
                        updateStoreStatus(cnpj, 'Ativo');
                    }
                } else {
                    console.log(`Loja com CNPJ ${cnpj} não realizou compras.`);
                    return; // Se não há pedidos, mantenha o status atual
                }
            }
        })
        .catch(error => console.error('Erro ao consultar o Tiny API:', error));
}

// Função para verificar se a última compra foi há mais de 9 meses
function isOlderThanNineMonths(date) {
    const nineMonthsAgo = new Date();
    nineMonthsAgo.setMonth(nineMonthsAgo.getMonth() - 9);
    return date < nineMonthsAgo;
}

// Função para atualizar o status da loja
function updateStoreStatus(cnpj, status) {
    fetch('functions/updateStoreStatus.php', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ cnpj: cnpj, status: status })
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            console.log(`Status da loja com CNPJ ${cnpj} atualizado para ${status}`);
            loadAllStores();
        } else {
            console.error('Erro ao atualizar o status da loja:', data.message);
        }
    })
    .catch(error => console.error('Erro ao atualizar o status da loja:', error));
}

function chunkArray(array, chunkSize) {
    const results = [];
    for (let i = 0; i < array.length; i += chunkSize) {
        results.push(array.slice(i, i + chunkSize));
    }
    return results;
}

function isOlderThanNineMonths(date) {
    const nineMonthsAgo = new Date();
    nineMonthsAgo.setMonth(nineMonthsAgo.getMonth() - 9);
    return date < nineMonthsAgo;
}
function updateStoreStatus(cnpj, status) {
    fetch('functions/updateStoreStatus.php', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ cnpj: cnpj, status: status })
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            console.log(`Status da loja com CNPJ ${cnpj} atualizado para ${status}`);
            loadAllStores();
        } else {
            console.error('Erro ao atualizar o status da loja:', data.message);
        }
    })
    .catch(error => console.error('Erro ao atualizar o status da loja:', error));
}

function chunkArray(array, chunkSize) {
    const results = [];
    for (let i = 0; i < array.length; i += chunkSize) {
        results.push(array.slice(i, i + chunkSize));
    }
    return results;
}

function applyFilters() {
    const query = document.getElementById('searchInput').value.toLowerCase();
    const status = document.getElementById('filterStatus').value.toLowerCase();
    const marker = document.getElementById('filterMarker').value.toLowerCase();
    const startDate = new Date(document.getElementById('filterDateStart').value);
    const endDate = new Date(document.getElementById('filterDateEnd').value);

    filteredStores = allStores.filter(store => {
        const id = store.id.toString().toLowerCase();
        const nome = store.nome ? store.nome.toLowerCase() : '';
        const endereco = store.endereco ? store.endereco.toLowerCase() : '';
        const cnpj = store.cnpj ? store.cnpj.toLowerCase() : '';
        const rowStatus = store.status ? store.status.toLowerCase() : '';
        const anotacao = store.anotacao ? store.anotacao.toLowerCase() : '';
        const telefone = store.telefone ? store.telefone.toLowerCase() : '';
        const instagram = store.instagram ? store.instagram.toLowerCase() : '';
        const site = store.site ? store.site.toLowerCase() : '';
        const decisor = store.decisor ? store.decisor.toLowerCase() : '';
        const telefoneDecisor = store.telefone_decisor ? store.telefone_decisor.toLowerCase() : '';
        const datetime = new Date(store.datetime);
        const cidade = store.cidade ? store.cidade.toLowerCase() : '';
        const estado = store.estado ? store.estado.toLowerCase() : '';
        const email = store.email ? store.email.toLowerCase() : '';
        const mesorregiao = store.mesorregiao ? store.mesorregiao.toLowerCase() : '';
        const markers = Array.isArray(store.marcadores)
            ? store.marcadores.map(marker => marker.nome ? marker.nome.toLowerCase() : '').join(', ')
            : '';

        // Verifica se a query corresponde a qualquer campo relevante
        const matchQuery = id.includes(query) || nome.includes(query) || endereco.includes(query) ||
                           cnpj.includes(query) || rowStatus.includes(query) || anotacao.includes(query) ||
                           telefone.includes(query) || instagram.includes(query) || site.includes(query) ||
                           decisor.includes(query) || telefoneDecisor.includes(query) || cidade.includes(query) ||
                           estado.includes(query) || email.includes(query) || mesorregiao.includes(query) || 
                           markers.includes(query);

        const matchStatus = !status || rowStatus === status;
        const matchMarker = !marker || markers.includes(marker);
        const matchDate = (!isNaN(startDate) && !isNaN(endDate)) ? (datetime >= startDate && datetime <= endDate) : true;

        return matchQuery && matchStatus && matchMarker && matchDate;
    });

    displayStores(filteredStores);
    // Fechar o modal após aplicar os filtros
    $('#filterModal').modal('hide');
}

function deleteSelectedStores() {
    const selectedStores = [];
    document.querySelectorAll('.select-store:checked').forEach(checkbox => {
        selectedStores.push(checkbox.getAttribute('data-id'));
    });

    if (selectedStores.length === 0) {
        alert('Nenhuma loja selecionada.');
        return;
    }

    if (confirm('Tem certeza que deseja excluir as lojas selecionadas?')) {
        fetch('functions/deleteSelectedStores.php', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ ids: selectedStores })
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                alert('Lojas excluídas com sucesso!');
                loadAllStores(); // Recarrega as lojas após a exclusão
            } else {
                alert('Erro ao excluir lojas: ' + data.message);
            }
        })
        .catch(error => {
            console.error('Erro ao excluir lojas:', error);
            alert('Erro ao excluir lojas. Verifique o console para mais detalhes.');
        });
    }
}

function changePage(direction) {
    // Atualiza a página atual
    currentPage += direction;

    // Verifica se a página atual é menor que 1, se for, define como 1
    if (currentPage < 1) {
        currentPage = 1;
    }

    // Verifica se a página atual é maior que o número total de páginas
    const totalPages = Math.ceil(filteredStores.length / itemsPerPage);
    if (currentPage > totalPages) {
        currentPage = totalPages;
    }

    // Exibe as lojas na página atual
    displayStores(filteredStores);

    // Atualiza o número da página exibido
    updatePageNumberDisplay();
}

function updatePageNumberDisplay() {
    const totalPages = Math.ceil(filteredStores.length / itemsPerPage);
    document.getElementById('currentPageDisplay').textContent = `Página ${currentPage} de ${totalPages}`;
}


document.getElementById('prevPage').disabled = currentPage === 1;
document.getElementById('nextPage').disabled = end >= stores.length;


document.getElementById('checkStoresWithoutAddress').addEventListener('click', checkAllStoresWithoutAddress);

function checkAllStoresWithoutAddress() {
    fetch('functions/FaltaEndereco/getStoresWithoutAddress.php')
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                const storesWithoutAddress = data.stores;
                processStoresCNPJs(storesWithoutAddress);
            } else {
                console.error('Erro ao carregar lojas sem endereço:', data.message);
            }
        })
        .catch(error => console.error('Erro ao carregar lojas sem endereço:', error));
}

function processStoresCNPJs(stores) {
    const delayBetweenRequests = 20000; // 20 segundos para respeitar o rate limit de 3 consultas por minuto
    let index = 0;

    function processNextStore() {
        if (index < stores.length) {
            const store = stores[index];
            const cnpj = store.cnpj.replace(/\D/g, ''); // Remove caracteres especiais do CNPJ

            fetch(`https://receitaws.com.br/v1/cnpj/${cnpj}`, {
                method: 'GET',
                headers: {
                    'Accept': 'application/json'
                }
            })
            .then(response => {
                if (response.status === 429) {
                    console.error('Rate limit exceeded. Waiting before retrying...');
                    setTimeout(processNextStore, delayBetweenRequests);
                    return;
                } else if (response.status === 504) {
                    console.error('Request timed out. Skipping this store...');
                    index++;
                    processNextStore();
                    return;
                }
                return response.json();
            })
            .then(data => {
                if (data && data.status === 'OK') {
                    const fullAddress = `${data.logradouro}, ${data.numero}, ${data.bairro}, ${data.municipio} - ${data.uf}`;
                    const updatedStore = {
                        id: store.id,
                        endereco: fullAddress,
                        cep: data.cep,
                        telefone: data.telefone,
                        email: data.email,
                        nome_fantasia: data.fantasia,
                        atividade_principal: data.atividade_principal.length > 0 ? data.atividade_principal[0].text : '',
                        capital_social: data.capital_social
                    };

                    updateStoreAddress(updatedStore);
                }
                index++;
                setTimeout(processNextStore, delayBetweenRequests);
            })
            .catch(error => {
                console.error('Erro ao buscar dados do CNPJ:', error);
                index++;
                setTimeout(processNextStore, delayBetweenRequests);
            });
        }
    }

    processNextStore();
}

function updateStoreAddress(store) {
    fetch('functions/FaltaEndereco/updateStoreAddress.php', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(store)
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            console.log(`Endereço da loja ${store.id} atualizado com sucesso!`);
            loadAllStores(); // Recarrega as lojas após a atualização
        } else {
            console.error('Erro ao atualizar endereço da loja:', data.message);
        }
    })
    .catch(error => {
        console.error('Erro ao atualizar endereço da loja:', error);
    });
}

document.getElementById('cnpj').addEventListener('input', function (e) {
    var cnpj = e.target.value;

    // Remove todos os caracteres não numéricos
    cnpj = cnpj.replace(/\D/g, '');

    // Aplica a formatação do CNPJ (XX.XXX.XXX/XXXX-XX)
    if (cnpj.length <= 14) {
      cnpj = cnpj.replace(/^(\d{2})(\d)/, "$1.$2");
      cnpj = cnpj.replace(/^(\d{2})\.(\d{3})(\d)/, "$1.$2.$3");
      cnpj = cnpj.replace(/\.(\d{3})(\d)/, ".$1/$2");
      cnpj = cnpj.replace(/(\d{4})(\d)/, "$1-$2");
    }

    // Atualiza o valor do campo de input com a formatação
    e.target.value = cnpj;
  });

  document.getElementById('pesquisar-cnpj').addEventListener('click', function() {
    var cnpj = document.getElementById('cnpj').value;

    // Remove a formatação do CNPJ, deixando apenas os números
    cnpj = cnpj.replace(/[^\d]+/g, '');

    // Verifica se o CNPJ tem 14 dígitos
    if (cnpj.length !== 14) {
      alert('Por favor, digite um CNPJ válido com 14 dígitos.');
      return;
    }

    // Faz a requisição ao proxy PHP (para evitar CORS)
    fetch(`cnpj_proxy.php?cnpj=${cnpj}`)
      .then(response => {
        if (response.status === 429) {
          alert('Limite de consultas atingido. Tente novamente em 1 minuto.');
          throw new Error('Limite de consultas atingido');
        }
        return response.json();
      })
      .then(data => {
        if (data.status === 'OK') {
          // Preenche os campos com os dados retornados pela API
          document.getElementById('storeAddress').value = `${data.logradouro}, ${data.numero}, ${data.bairro}`;
          document.getElementById('storeCity').value = data.municipio;
          document.getElementById('storeState').value = data.uf;
        } else {
          alert('Erro ao buscar os dados da empresa. Verifique o CNPJ informado.');
        }
      })
      .catch(error => {
        console.error('Erro ao buscar os dados:', error);
      });
  });

  // CARREGAR LISTA DE ESTADOS E MESORREGIÕES NO SISTEMA
document.addEventListener('DOMContentLoaded', function() {
    const stateSelect = document.getElementById('storeState');
    const mesorregiaoSelect = document.getElementById('storeMesorregiao');

    let estadosMap = {}; // Map para armazenar os estados
    let mesorregioes = []; // Array para armazenar todas as mesorregiões

    // Função para carregar as mesorregiões e estados
    function loadEstadosMesorregioes() {
        fetch('functions/getEstadosMesorregioes.php')  // O caminho correto para o PHP
            .then(response => response.json())
            .then(data => {
                estadosMap = {}; // Reinicializa o map de estados
                mesorregioes = data; // Armazena todas as mesorregiões

                // Agrupar estados e preencher o select de estados
                data.forEach(item => {
                    if (!estadosMap[item.estado_id]) {
                        estadosMap[item.estado_id] = {
                            id: item.estado_id,
                            nome: item.estado_nome,
                            sigla: item.estado_sigla
                        };

                        // Adicionar estado ao select de estados
                        const stateOption = document.createElement('option');
                        stateOption.value = item.estado_id; // Usando o ID do estado para associar
                        stateOption.textContent = `${item.estado_nome} (${item.estado_sigla})`;
                        stateSelect.appendChild(stateOption);
                    }
                });
            })
            .catch(error => {
                console.error('Erro ao carregar dados:', error);
            });
    }

    // Carregar estados e mesorregiões
    loadEstadosMesorregioes();

    // Função para filtrar e mostrar apenas as mesorregiões do estado selecionado
    function filterMesorregioesByEstado(estadoId) {
        // Limpar o select de mesorregiões
        mesorregiaoSelect.innerHTML = '<option value="" disabled selected>Selecione uma mesorregião</option>';

        // Filtrar mesorregiões pelo estado selecionado
        const filteredMesorregioes = mesorregioes.filter(mesorregiao => mesorregiao.estado_id == estadoId); // Use '==' para comparar tipos diferentes

        // Preencher o select de mesorregiões com as opções filtradas
        filteredMesorregioes.forEach(mesorregiao => {
            const mesoOption = document.createElement('option');
            mesoOption.value = mesorregiao.mesorregiao_id;
            mesoOption.textContent = mesorregiao.mesorregiao_nome;
            mesorregiaoSelect.appendChild(mesoOption);
        });

        // Verifica se há mesorregiões para o estado selecionado
        if (filteredMesorregioes.length === 0) {
            const noOption = document.createElement('option');
            noOption.value = '';
            noOption.disabled = true;
            noOption.textContent = 'Nenhuma mesorregião disponível';
            mesorregiaoSelect.appendChild(noOption);
        }
    }

    // Evento para quando um estado é selecionado
    stateSelect.addEventListener('change', function() {
        const selectedEstadoId = this.value;

        // Filtrar as mesorregiões de acordo com o estado selecionado
        filterMesorregioesByEstado(selectedEstadoId);
    });
});
// Função para abrir o modal e carregar os vendedores
function openAssignVendedorModal(storeId) {
    document.getElementById('storeId').value = storeId;

    // Limpa o select antes de carregar os vendedores
    const vendedorSelect = document.getElementById('vendedorSelect');
    vendedorSelect.innerHTML = '<option value="" disabled selected>Selecione um vendedor</option>';

    // Carregar os vendedores via fetch
    fetch('../functions/Sellers/getVendedores.php')
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                console.log(data);  // Debug para verificar se os dados estão chegando
                data.vendedores.forEach(vendedor => {
                    const option = document.createElement('option');
                    option.value = vendedor.id;
                    option.textContent = vendedor.nome;
                    vendedorSelect.appendChild(option);
                });
            } else {
                alert('Erro ao carregar vendedores.');
            }
        })
        .catch(error => {
            console.error('Erro ao carregar vendedores:', error);
        });

    $('#assignVendedorModal').modal('show'); // Mostra o modal
}

function assignVendedor() {
    const storeId = document.getElementById('storeId').value;
    const vendedorId = document.getElementById('vendedorSelect').value;

    if (!vendedorId) {
        alert('Selecione um vendedor.');
        return;
    }

    // Enviar os dados para o backend
    fetch('../functions/Sellers/assignVendedor.php', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({
            store_id: storeId,
            vendedor_id: vendedorId
        })
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            alert('Vendedor atribuído com sucesso!');
            $('#assignVendedorModal').modal('hide');
            // Atualizar a lista de lojas, ou atualize o vendedor na interface diretamente
            loadStores();
        } else {
            alert('Erro ao atribuir vendedor.');
        }
    })
    .catch(error => {
        console.error('Erro ao atribuir vendedor:', error);
    });
}

// Atualiza o número da página exibido
updatePageNumberDisplay();

// Carregar as lojas e aplicar filtros inicialmente
loadAllStores();

