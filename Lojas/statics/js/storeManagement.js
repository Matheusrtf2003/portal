// Carrega todas as lojas
function loadAllStores() {
    fetch('/portal/functions/getStores2.php')
        .then(response => response.json())
        .then(data => {
            console.log('Dados retornados:', data); // Exibir dados no console
            if (data.success) {
                allStores = data.stores;
                if (allStores.length > 0) {
                    applyFilters(); // Aplica filtros após carregar as lojas
                    displayStores(allStores); // Exibe as lojas após carregar
                } else {
                    console.log('Nenhuma loja encontrada.');
                    document.querySelector('#storesTable tbody').innerHTML = '<tr><td colspan="20">Nenhuma loja encontrada.</td></tr>';
                }
            } else {
                alert('Erro ao carregar lojas: ' + data.message);
            }
        })
        .catch(error => {
            console.error('Erro ao carregar lojas:', error);
            alert('Erro ao carregar lojas. Verifique o console para mais detalhes.');
        });
}

// Exibe as lojas com paginação
function displayStores(stores) {
    const tbody = document.querySelector('#storesTable tbody');
    tbody.innerHTML = ''; // Limpa tabela antes de exibir lojas

    const start = (currentPage - 1) * itemsPerPage; // Calcula o início da paginação
    const end = start + itemsPerPage;  // Calcula o fim da paginação
    const paginatedStores = stores.slice(start, end);  // Pega as lojas paginadas

    if (paginatedStores.length === 0) {
        console.log('Nenhuma loja a exibir.');
        tbody.innerHTML = '<tr><td colspan="20">Nenhuma loja a exibir nesta página.</td></tr>';
        return;
    }

    paginatedStores.forEach(store => {
        const row = createStoreRow(store);
        tbody.appendChild(row);
    });

    // Atualiza os botões de navegação de página
    document.getElementById('prevPage').disabled = currentPage === 1;
    document.getElementById('nextPage').disabled = end >= stores.length;

    // Atualiza a exibição da contagem de lojas
    const storeCount = document.getElementById('storeCount');
    storeCount.textContent = `Total de Lojas: ${stores.length}`;
}

// Cria uma linha da tabela para uma loja
function createStoreRow(store) {
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
        : '-';

    // Verifica se o Site começa com "https://"
    const siteIcon = store.site && store.site.startsWith('https://') 
        ? `<a href="${store.site}" target="_blank">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-globe" viewBox="0 0 16 16">
                <path d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8m7.5-6.923c-.67.204-1.335.82-1.887 1.855A8 8 0 0 0 5.145 4H7.5zM4.09 4a9.3 9.3 0 0 1 .64-1.539 7 7 0 0 1 .597-.933A7.03 7.03 0 0 0 2.255 4zm-.582 3.5c.03-.877.138-1.718.312-2.5H1.674a7 7 0 0 0-.656 2.5zM4.847 5a12.5 12.5 0 0 0-.338 2.5H7.5V5zM8.5 5v2.5h2.99a12.5 12.5 0 0 0-.337-2.5zM4.51 8.5a12.5 12.5 0 0 0 .337 2.5H7.5V8.5zm3.99 0V11h2.653c.187-.765.306-1.608.338-2.5zM5.145 12q.208.58.468 1.068c.552 1.035 1.218 1.65 1.887 1.855V12zm.182 2.472a7 7 0 0 1-.597-.933A9.3 9.3 0 0 1 4.09 12H2.255a7 7 0 0 0 3.072 2.472M3.82 11a13.7 13.7 0 0 1-.312-2.5h-2.49c.062.89.291 1.733.656 2.5zm6.853 3.472A7 7 0 0 0 13.745 12H11.91a9.3 9.3 0 0 1-.64 1.539 7 7 0 0 1-.597.933M8.5 12v2.923c.67-.204 1.335-.82 1.887-1.855q.26-.487.468-1.068zm3.68-1h2.146c.365-.767.594-1.61.656-2.5h-2.49a13.7 13.7 0 0 1-.312 2.5m2.802-3.5a7 7 0 0 0-.656-2.5H12.18c.174.782.282 1.623.312 2.5zM11.27 2.461c.247.464.462.98.64 1.539h1.835a7 7 0 0 0-3.072-2.472c.218.284.418.598.597.933M10.855 4a8 8 0 0 0-.468-1.068C9.835 1.897 9.17 1.282 8.5 1.077V4z"/>
            </svg>
        </a>` 
        : '-';

    // Aplicando cores ao status
    const statusColor = store.status === 'Descoberto' ? '#343a40' :
                        store.status === 'Coberto' ? '#007bff' :
                        store.status === 'Ativo' ? '#28a745' :
                        store.status === 'Inativo' ? '#c82333' : 'black';

    const statusBadge = `<span style="background-color: ${statusColor}; color: white; padding: 6px; border-radius: 8px;">${store.status}</span>`;

    // Definindo o nome do vendedor ou um texto padrão caso não haja
    const vendedorNome = store.vendedor && store.vendedor.nome ? store.vendedor.nome : null; 

    // Se não houver vendedor, exibe o botão "Atribuir Vendedor"
    const vendedorCell = vendedorNome 
        ? vendedorNome 
        : `<button class="btn btn-primary btn-sm" onclick="openAssignVendedorModal(${store.id})">Atribuir Vendedor</button>`;

    // Criando a linha da tabela
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
        <td>${vendedorCell}</td>
        <td>
            <button class="btn btn-warning btn-sm" onclick="editStore(${store.id})">Editar</button>
            <button class="btn btn-danger btn-sm" onclick="deleteStore(${store.id})">Excluir</button>
        </td>
    `;

    return row;
}

// Função para preencher o formulário de edição com os dados da loja
function populateStoreForm(store) {
    console.log('Store recebido:', store);
    if (document.getElementById('storeId')) {
        document.getElementById('storeId').value = store.id;
        console.log('storeId definido para:', store.id);
    } else {
        console.error('Elemento storeId não encontrado no DOM');
    }
    
    if (document.getElementById('storeName')) {
        document.getElementById('storeName').value = store.nome;
    } else {
        console.error('Elemento storeName não encontrado no DOM');
    }

    if (document.getElementById('cnpj')) {
        document.getElementById('cnpj').value = store.cnpj;
    } else {
        console.error('Elemento cnpj não encontrado no DOM');
    }

    if (document.getElementById('storeStatus')) {
        document.getElementById('storeStatus').value = store.status;
    } else {
        console.error('Elemento storeStatus não encontrado no DOM');
    }

    if (document.getElementById('storeAddress')) {
        document.getElementById('storeAddress').value = store.endereco;
    } else {
        console.error('Elemento storeAddress não encontrado no DOM');
    }

    if (document.getElementById('storeCity')) {
        document.getElementById('storeCity').value = store.cidade;
    }

    if (document.getElementById('storeState')) {
        document.getElementById('storeState').value = store.estado;
    }

    if (document.getElementById('storeMesorregiao')) {
        document.getElementById('storeMesorregiao').value = store.mesorregiao;
    }

    if (document.getElementById('storePhone')) {
        document.getElementById('storePhone').value = store.telefone;
    }

    if (document.getElementById('storeInstagram')) {
        document.getElementById('storeInstagram').value = store.instagram;
    }

    if (document.getElementById('storeWebsite')) {
        document.getElementById('storeWebsite').value = store.site;
    }

    if (document.getElementById('storeDecider')) {
        document.getElementById('storeDecider').value = store.decisor;
    }

    if (document.getElementById('storeDeciderPhone')) {
        document.getElementById('storeDeciderPhone').value = store.telefone_decisor;
    }

    if (document.getElementById('storeEmail')) {
        document.getElementById('storeEmail').value = store.email;
    }
}

document.addEventListener('DOMContentLoaded', function () {
    loadAllStores();
});

document.getElementById('storeForm').addEventListener('submit', function(event) {
    event.preventDefault();

    const storeId = document.getElementById('storeId').value;  // Ensure this is set

    const storeData = {
        storeId: storeId,  // Ensure the storeId is included in the submission
        nome: document.getElementById('storeName').value,
        cnpj: document.getElementById('cnpj').value,
        status: document.getElementById('storeStatus').value,
        endereco: document.getElementById('storeAddress').value,
        cidade: document.getElementById('storeCity').value,
        estado: document.getElementById('storeState').value,
        mesorregiao: document.getElementById('storeMesorregiao').value,
        telefone: document.getElementById('storePhone').value,
        instagram: document.getElementById('storeInstagram').value,
        site: document.getElementById('storeWebsite').value,
        decisor: document.getElementById('storeDecider').value,
        telefone_decisor: document.getElementById('storeDeciderPhone').value,
        email: document.getElementById('storeEmail').value
    };

    // Ensure required fields are validated
    if (!storeData.nome || !storeData.cnpj || !storeData.status || !storeData.endereco) {
        alert("Os campos 'Nome', 'CNPJ', 'Status' e 'Endereço' são obrigatórios.");
        return;
    }

    let url = '/portal/functions/Stores/addStore.php';
    let method = 'POST';

    if (storeId) {
        url = `/portal/functions/Stores/updateStore.php`;
        method = 'POST';
    }

    fetch(url, {
        method: method,
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(storeData)
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            alert(data.message);
            $('#addStoreModal').modal('hide');
            loadAllStores();  // Reload stores after update
        } else {
            alert('Erro ao salvar a loja: ' + data.message);
        }
    })
    .catch(error => {
        console.error('Erro ao salvar a loja:', error);
    });
});

// Função para carregar os dados da loja e preencher o formulário de edição
function editStore(storeId) {
    // Faz uma requisição para buscar os dados da loja com base no storeId
    fetch(`/portal/functions/Stores/getStore.php?id=${storeId}`)
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                // Popula o formulário com os dados da loja
                populateStoreForm(data.store);

                // Ajusta o título do modal para edição
                const modalTitle = document.getElementById('addStoreModalLabel');
                if (modalTitle) {
                    modalTitle.textContent = 'Editar Loja';
                }

                // Abre o modal de edição
                $('#addStoreModal').modal('show');
            } else {
                alert('Erro ao carregar os dados da loja: ' + data.message);
            }
        })
        .catch(error => {
            console.error('Erro ao carregar a loja:', error);
            alert('Erro ao carregar a loja. Verifique o console para mais detalhes.');
        });
}


function openAddStoreModal() {
    // Limpa o formulário para evitar dados residuais de edições anteriores
    document.getElementById('storeForm').reset();
    
    // Reseta o valor do campo storeId para garantir que não haja ID residual
    document.getElementById('storeId').value = '';

    // Ajusta o título do modal para "Adicionar Loja"
    document.getElementById('modalTitle').textContent = 'Adicionar Loja';

    // Abre o modal de adição
    $('#addStoreModal').modal('show');
}

console.log('Store ID:', storeId);  // Adicione este log antes do envio da requisição


