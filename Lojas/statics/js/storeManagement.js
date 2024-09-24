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
        ? `<a href="${store.instagram}" target="_blank"><i class="bi bi-instagram"></i></a>` 
        : '-';

    // Verifica se o Site começa com "https://"
    const siteIcon = store.site && store.site.startsWith('https://') 
        ? `<a href="${store.site}" target="_blank"><i class="bi bi-globe"></i></a>`
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
        <td>${store.estado_sigla}</td>
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


