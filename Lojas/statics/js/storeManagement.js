// Carrega todas as lojas
function loadAllStores() {
    fetch('../functions/getStores2.php')
        .then(response => {
            if (!response.ok) throw new Error("Erro na resposta do servidor");
            return response.json();
        })
        .then(data => {
            console.log('Dados retornados:', data);
            if (data.success) {
                allStores = data.stores;
                if (allStores.length > 0) {
                    applyFilters();
                    displayStores(allStores);
                } else {
                    console.log('Nenhuma loja encontrada.');
                    document.querySelector('#storesTable tbody').innerHTML = '<tr><td colspan="20">Nenhuma loja encontrada.</td></tr>';
                }
            } else {
                alert('Erro ao carregar lojas: ' + (data.message || 'Erro desconhecido.'));
            }
        })
        .catch(error => {
            console.error('Erro ao carregar lojas:', error);
            alert('Erro ao carregar lojas. Verifique o console para mais detalhes.');
        });
}


// Função para exibir as lojas com paginação
function displayStores(stores) {
    const tbody = document.querySelector('#storesTable tbody');
    tbody.innerHTML = ''; // Limpa a tabela antes de exibir as lojas

    const start = (currentPage - 1) * itemsPerPage; // Calcula o índice inicial com base na página atual
    const end = start + itemsPerPage;  // Calcula o índice final com base na página atual
    const paginatedStores = stores.slice(start, end);  // Divide as lojas com base na paginação

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
        ? store.marcadores.map(marker => `
            <span style="
                background-color: ${marker.cor};
                color: white;
                padding: 4px 8px;
                margin-right: 5px;
                border-radius: 12px;
                font-size: 0.9em;
                display: inline-block;
            ">
                <i class="bi bi-bookmark-star-fill"> </i>${marker.nome}
            </span>
        `).join(' ')
        : 'Sem marcadores';

    const hasValidatedMarker = (markerName) => {
        return store.marcadores.some(marker => marker.nome === markerName);
    };

    const instagramIcon = store.instagram && store.instagram.startsWith('https://')
        ? `<a href="${store.instagram}" target="_blank"><i class="bi bi-instagram"></i></a>`
        : '-';

    const siteIcon = store.site && store.site.startsWith('https://')
        ? `<a href="${store.site}" target="_blank"><i class="bi bi-globe"></i></a>`
        : '-';

    const statusColor = store.status === 'Descoberto' ? '#343a40' :
        store.status === 'Coberto' ? '#007bff' :
            store.status === 'Ativo' ? '#28a745' :
                store.status === 'Inativo' ? '#c82333' : 'black';

    const statusBadge = `<span style="background-color: ${statusColor}; color: white; padding: 6px; border-radius: 8px;">${store.status}</span>`;

    const vendedorNome = store.Vendedor && store.Vendedor.nome ? store.Vendedor.nome : null;

    const vendedorCell = vendedorNome
        ? vendedorNome
        : `<button class="btn btn-primary btn-sm" onclick="openAssignVendedorModal(${store.id})">Atribuir Vendedor</button>`;

    const row = document.createElement('tr');
    row.innerHTML = `
    <td><input type="checkbox" class="select-store" data-id="${store.id}"></td>
    <td>${store.id}</td>
    <td>
        <button class="btn btn-warning btn-sm" onclick="editStore(${store.id})">Editar</button>
        <button class="btn btn-danger btn-sm" onclick="deleteStore(${store.id})">Excluir</button>
    </td>
    <td>${store.usuarios_data.map(user => `<a href="view_profile.php?id=${user.id}">${user.nome}</a>`).join(', ')}</td>
    <td>${vendedorCell}</td>
    <td>${store.nome.toUpperCase()}</td>
    <td>${store.cnpj}</td>
    <td>${statusBadge}</td>
    <td>${store.endereco.toUpperCase()}</td>
    <td>${store.cidade.toUpperCase()}</td>
    <td>${store.estado_sigla}</td>
    <td>${store.mesorregiao_nome}</td>
    <td>${store.anotacao.toUpperCase()}</td>
    <td>
        ${store.telefone}
    </td>
    <td>
        ${instagramIcon}
        ${!hasValidatedMarker('Instagram Validado') ? `<button class="btn btn-success btn-sm" onclick="validateMarker(${store.id}, 'Instagram Validado')">Validar</button>` : ''}
    </td>
    <td>
        ${siteIcon}
    </td>
    <td>
        ${store.decisor.toUpperCase()}
        ${!hasValidatedMarker('Decisor Validado') ? `<button class="btn btn-success btn-sm" onclick="validateMarker(${store.id}, 'Decisor Validado')">Validar</button>` : ''}
    </td>
    <td>
        ${store.telefone_decisor}
    </td>
    <td>
        ${store.email}
        ${!hasValidatedMarker('Email Validado') ? `<button class="btn btn-success btn-sm" onclick="validateMarker(${store.id}, 'Email Validado')">Validar</button>` : ''}
    </td>
    <td>${store.perfil_loja}</td>
    <td>${markers}</td>
    <td>${new Date(store.datetime).toLocaleString()}</td>
    `;
    return row;
}

function populateStoreForm(store) {
    console.log('Store recebido:', store);

    const elements = [
        { id: 'storeId', value: store.store_id },
        { id: 'storeName', value: store.nome },
        { id: 'cnpj', value: store.cnpj },
        { id: 'storeStatus', value: store.status },
        { id: 'storeAnotacao', value: store.anotacao },
        { id: 'storeAddress', value: store.endereco },
        { id: 'storeCity', value: store.cidade },
        { id: 'storeState', value: store.estado },
        { id: 'storeMesorregiao', value: store.mesorregiao },
        { id: 'storePhone', value: store.telefone },
        { id: 'storeInstagram', value: store.instagram },
        { id: 'storeWebsite', value: store.site },
        { id: 'storeDecider', value: store.decisor },
        { id: 'storeDeciderPhone', value: store.telefone_decisor },
        { id: 'storeEmail', value: store.email },
        { id: 'perfilLoja', value: store.perfil_loja || 'ICP' }  // Valor padrão 'ICP'
    ];

    // Preenche os campos de texto do formulário
    elements.forEach(element => {
        const el = document.getElementById(element.id);
        if (el) {
            el.value = element.value || ''; // String vazia como padrão
            console.log(`${element.id} definido para: ${element.value}`);
        } else {
            console.error(`Elemento '${element.id}' não encontrado no DOM`);
        }
    });

    // Marca as checkboxes dos marcadores
    if (store.marcadores && Array.isArray(store.marcadores)) {
        console.log('Marcadores:', store.marcadores);

        // Desmarque todas as checkboxes antes de marcá-las novamente
        document.querySelectorAll('input[name="markers[]"]').forEach(checkbox => {
            checkbox.checked = false;
        });

        // Marca as checkboxes correspondentes aos IDs dos marcadores da loja
        store.marcadores.forEach(marker => {
            const checkbox = document.querySelector(`input[name="markers[]"][value="${marker.id}"]`);
            if (checkbox) {
                checkbox.checked = true;
                console.log(`Marcador '${marker.nome}' marcado.`);
            } else {
                console.warn(`Checkbox para marcador com ID ${marker.id} não encontrado.`);
            }
        });
    } else {
        console.warn('Nenhum marcador encontrado para esta loja.');
    }

    // Especialidade, caso necessário
    if (store.especialidade) {
        console.log('Especialidade:', store.especialidade);
    } else {
        console.warn('Nenhuma especialidade encontrada para esta loja.');
    }
}

document.addEventListener('DOMContentLoaded', function () {
    loadAllStores();

    // Escuta o evento de digitação no campo de pesquisa
    document.getElementById('searchInput').addEventListener('input', function () {
        applySearchFilter();
    });
});


document.getElementById('storeForm').addEventListener('submit', function (event) {
    event.preventDefault();

    // Coletar os IDs dos marcadores selecionados
    const selectedMarkers = Array.from(document.querySelectorAll('input[name="markers[]"]:checked'))
        .map(checkbox => checkbox.value);

    const storeData = {
        storeId: document.getElementById('storeId').value,
        nome: document.getElementById('storeName').value.trim(),
        cnpj: document.getElementById('cnpj').value.trim(),
        status: document.getElementById('storeStatus').value,
        markers: selectedMarkers,
        anotacao: document.getElementById('storeAnotacao').value,
        endereco: document.getElementById('storeAddress').value.trim(),
        cidade: document.getElementById('storeCity').value.trim(),
        estado: document.getElementById('storeState').value,
        mesorregiao: document.getElementById('storeMesorregiao').value,
        telefone: document.getElementById('storePhone').value.trim(),
        instagram: document.getElementById('storeInstagram').value.trim(),
        site: document.getElementById('storeWebsite').value.trim(),
        decisor: document.getElementById('storeDecider').value.trim(),
        telefone_decisor: document.getElementById('storeDeciderPhone').value.trim(),
        email: document.getElementById('storeEmail').value.trim(),
        perfil_loja: document.getElementById('perfilLoja').value  // Adicionado aqui
    };

    // Verifique se a URL e o método estão corretos
    let url = storeData.storeId ? `../functions/Stores/updateStore.php` : `../functions/Stores/addStore.php`;

    fetch(url, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(storeData)
    })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                alert(data.message);
                $('#addStoreModal').modal('hide');
                loadAllStores();  // Recarrega as lojas após adicionar ou atualizar
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
    fetch(`../functions/Stores/getStore.php?id=${storeId}`)
        .then(response => response.json())
        .then(data => {
            console.log("Dados recebidos:", data);
            if (data.success && data.store) {
                // Preenche os campos
                document.getElementById('storeId').value = storeId;
                document.getElementById('storeName').value = data.store.nome || '';
                document.getElementById('cnpj').value = data.store.cnpj || '';
                document.getElementById('storeStatus').value = data.store.status || '';
                document.getElementById('storeAnotacao').value = data.store.anotacao || '';
                document.getElementById('storeAddress').value = data.store.endereco || '';
                document.getElementById('storeCity').value = data.store.cidade || '';
                document.getElementById('storeState').value = data.store.estado || '';
                document.getElementById('storeMesorregiao').value = data.store.mesorregiao || '';
                document.getElementById('storePhone').value = data.store.telefone || '';
                document.getElementById('storeInstagram').value = data.store.instagram || '';
                document.getElementById('storeWebsite').value = data.store.site || '';
                document.getElementById('storeDecider').value = data.store.decisor || '';
                document.getElementById('storeDeciderPhone').value = data.store.telefone_decisor || '';
                document.getElementById('storeEmail').value = data.store.email || '';
                document.getElementById('perfilLoja').value = data.store.perfil_loja || 'ICP';

                // Definindo marcadores no campo correto
                const storeMarkerElement = document.getElementById('storeMarker');
                if (storeMarkerElement) {
                    const primeiroMarcador = data.store.marcadores && data.store.marcadores.length > 0 ? data.store.marcadores[0].id : null;
                    storeMarkerElement.value = primeiroMarcador || '';
                } else {
                    console.error("Elemento 'storeMarker' não encontrado no DOM.");
                }

                // Abrir modal para edição
                $('#addStoreModal').modal('show');
            } else {
                alert('Erro ao carregar os dados da loja: ' + (data.message || 'Dados da loja não encontrados.'));
            }
        })
        .catch(error => {
            console.error('Erro ao carregar a loja:', error);
            alert('Erro ao carregar a loja. Verifique o console para mais detalhes.');
        });
}


// Função para limpar os campos do modal
function clearStoreForm() {
    // Limpar todos os campos de texto
    document.getElementById('storeForm').reset();

    // Remover o valor do campo hidden storeId
    document.getElementById('storeId').value = '';

    // Desmarcar todas as checkboxes de marcadores
    document.querySelectorAll('input[name="marcadores[]"]').forEach(checkbox => {
        checkbox.checked = false;
    });

    // Redefinir o título do modal para "Adicionar Loja"
    const modalTitle = document.getElementById('addStoreModalLabel');
    modalTitle.textContent = 'Adicionar Loja';
}

// Evento que será chamado sempre que o modal for fechado
$('#addStoreModal').on('hidden.bs.modal', function () {
    clearStoreForm();
});

console.log('Store ID:', storeId);  // Adicione este log antes do envio da requisição

function applySearchFilter() {
    const query = document.getElementById('searchInput').value.trim().toLowerCase();

    // Filtra as lojas por qualquer coluna
    const filteredStores = allStores.filter(store => {
        return store.nome.toLowerCase().includes(query) ||
            store.cnpj.toLowerCase().includes(query) ||
            store.endereco.toLowerCase().includes(query) ||
            store.cidade.toLowerCase().includes(query) ||
            (store.estado_sigla && store.estado_sigla.toLowerCase().includes(query)) || // Verifica se não é null
            (store.mesorregiao_nome && store.mesorregiao_nome.toLowerCase().includes(query)) || // Verifica se não é null
            store.telefone.toLowerCase().includes(query) ||
            (store.instagram && store.instagram.toLowerCase().includes(query)) || // Verifica se não é null
            (store.site && store.site.toLowerCase().includes(query)) || // Verifica se não é null
            store.decisor.toLowerCase().includes(query) ||
            store.telefone_decisor.toLowerCase().includes(query) ||
            store.email.toLowerCase().includes(query) ||
            store.status.toLowerCase().includes(query);
    });

    // Exibe as lojas filtradas
    displayStores(filteredStores);
}

function resetFilters() {
    // Limpa os campos de filtro
    document.getElementById('searchInput').value = '';
    document.getElementById('filterStatus').value = '';
    document.getElementById('filterAnotacao').value = '';
    document.getElementById('filterMarker').value = '';
    document.getElementById('filterDateStart').value = '';
    document.getElementById('filterDateEnd').value = '';
    document.getElementById('filterVendedor').value = '';
    document.getElementById('hunter').value = '';

    // Recarrega todas as lojas sem filtros
    applyFilters();
}


const storeMarkerElement = document.getElementById('storeMarker');
const marcadorId = (data.store.marcadores && data.store.marcadores.length > 0) ? data.store.marcadores[0].id : null;

if (storeMarkerElement && marcadorId) {
    storeMarkerElement.value = marcadorId;
} else {
    console.error("Elemento 'storeMarker' não encontrado no DOM ou marcadorId é indefinido.");
}


function validateMarker(storeId, markerName) {
    fetch('../functions/Markers/addMarker.php', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ storeId: storeId, marker: markerName })
    })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                alert(`${markerName} adicionado com sucesso.`);
                loadAllStores();  // Recarrega a tabela para atualizar os marcadores
            } else {
                alert('Erro ao adicionar marcador: ' + data.message);
            }
        })
        .catch(error => {
            console.error('Erro ao adicionar marcador:', error);
        });
}
