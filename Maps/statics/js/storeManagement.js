import { baseURL } from '../../../statics/js/config.js';
import {clearMapMarkers } from './mapMarkers.js';
import { loadMarkers } from './loadMarkers.js';

export let allStores = []; // Variável global de todas as lojas
export let filteredStores = []; // Variável global para lojas filtradas

fetch(`${baseURL}/functions/getStores.php`)
    .then(response => response.text())  // Alterado para text() para ver a resposta bruta
    .then(text => {
        console.log("Resposta do servidor:", text);  // Log da resposta completa
        return JSON.parse(text);  // Tente converter para JSON
    })
    .then(data => {
        if (data.success && Array.isArray(data.stores)) {
            allStores = data.stores; 
            filteredStores = allStores;
            displayStores(allStores); 
            updateResultCount(allStores.length);
        } else {
            console.error('Erro ao carregar lojas:', data.message || 'Erro desconhecido');
        }
    })
    .catch(error => {
        console.error('Erro ao carregar lojas:', error);
        alert('Erro ao carregar lojas. Verifique o console para mais detalhes.');
    });

    // Função para exibir as lojas e atualizar os marcadores
    export function displayStores(stores) {
        clearStoreList(); // Limpa a lista de lojas no DOM
        
        stores.forEach(loja => {
            addStoreToList(loja);  // Adiciona cada loja na lista do DOM
        });
        
        console.log("Lojas exibidas no mapa:", stores.length); // Loga o número de lojas sendo exibidas
        updateResultCount(stores.length); // Atualiza o contador de resultados
        
        // Atualiza os marcadores no mapa
        clearMapMarkers();
        loadMarkers(stores); // Passa as lojas filtradas para exibir no mapa
    }
    
    function clearStoreList() {
        const storeList = document.getElementById('storeList');
        if (storeList) {
            storeList.innerHTML = ''; // Limpa a lista de lojas
        } else {
            console.error('Elemento storeList não encontrado no DOM.');
        }
    }

function getStatusClass(status) {
    switch (status) {
        case 'Descoberto':
            return 'bg-dark';
        case 'Coberto':
            return 'bg-primary';
        case 'Ativo':
            return 'bg-success';
        case 'Inativo':
            return 'bg-danger';
        default:
            return 'bg-secondary';
    }
}

function addStoreToList(loja) {
    let statusClass = getStatusClass(loja.status);
    let perfilLojaHtml = `<span class="badge badge-secondary">${loja.perfil_loja || 'Sem perfil'}</span>`;

    let vendedorNome = loja.vendedor_nome ? loja.vendedor_nome : 'Sem vendedor';
    let hunterNome = loja.hunter_nome ? loja.hunter_nome : 'Sem hunter'; // Adiciona o nome do Hunter

    // Verificar o status do Agendor
    let agendorStatus = loja.agendor_status || 'Não Localizado'; // Pega o status do Agendor
    let agendorIconHtml;

    if (agendorStatus === 'Não Localizado') {
        agendorIconHtml = ''; // Não exibe o ícone se não foi enviado
    } else {
        agendorIconHtml = `<img src="https://play-lh.googleusercontent.com/s8SlPFRsvv1OgdFre5CAq-3cNlE-jNrXAAPPP8DM_wh4v4IRwcWjgDPN8lHTnQ7iGfXd" alt="Agendor" class="agendor-icon" style="max-width: 30px; border-radius: 10px; margin-right: 10px;">`;
    }

    // Criar o botão "Adicionar Vendedor" somente se não houver vendedor
    let addVendedorButtonHtml = loja.vendedor_nome ? '' : `
        <button class="btn btn-warning btn-sm add-vendedor" data-id="${loja.id}" style="border-radius: 20px; padding: 2px 8px; font-size: 11px;">Adicionar Vendedor</button>
    `;

    let storeItem = `
        <div class="store-item card mb-2 shadow-sm border-0" data-id="${loja.id}" style="border-radius: 10px; padding: 8px;">
            <div class="card-body" style="padding: 8px;">
                <div class="d-flex justify-content-between align-items-center mb-2">
                    <div>
                        <h6 class="card-title mb-1" style="font-size: 16px;">${loja.nome}</h6>
                        <p class="text-muted mb-0" style="font-size: 11px;"><i class="bi bi-geo-alt-fill"></i> ${loja.estado_sigla} - ${loja.cidade}</p> <!-- Exibe a sigla do estado -->
                        <p class="text-muted mb-0" style="font-size: 11px;"><i class="bi bi-person-fill"></i> Hunter: ${hunterNome}</p> <!-- Exibe o nome do Hunter -->
                        <p class="text-muted mb-0" style="font-size: 11px;"><i class="bi bi-person-fill"></i> Vendedor: ${vendedorNome}</p>
                    </div>
                    <div>
                        <small class="badge badge-pill ${statusClass}" style='color: white;'>${loja.status}</small>
                    </div>
                </div>
                <p class="mb-1" style="font-size: 13px;"><i class="bi bi-bookmark-star-fill"></i> ${perfilLojaHtml}</p>
                <div class="d-flex justify-content-between align-items-center-c">
                    <div class="agendor-container">${agendorIconHtml}</div>
                    ${addVendedorButtonHtml}
                    <button class="btn btn-secondary btn-sm toggle-details" style="border-radius: 20px; padding: 2px 8px; font-size: 11px;">Ver Detalhes</button>
                </div>
                <div class="store-details" id="storeDetails-${loja.id}" style="margin-top: 10px;"></div>
            </div>
        </div>
    `;

    document.getElementById('storeList').insertAdjacentHTML('beforeend', storeItem);

    const storeElement = document.querySelector(`.store-item[data-id="${loja.id}"]`);

    const detailsButton = storeElement.querySelector('.toggle-details');
    
    // Listener para o botão de "Ver Detalhes"
    detailsButton.addEventListener('click', function (event) {
        event.preventDefault();
        toggleStoreDetails(loja, detailsButton);
    });

    // Adiciona evento para o botão "Adicionar Vendedor"
    if (!loja.vendedor_nome) {
        const addButton = storeElement.querySelector('.add-vendedor');
        addButton.addEventListener('click', () => openAddVendedorModal(loja.id));
    }
}

function toggleStoreDetails(loja, button) {
    let detailElement = document.getElementById(`storeDetails-${loja.id}`);

    if (!detailElement.classList.contains('show')) {
        let telefoneWhatsApp = loja.telefone ? loja.telefone.replace(/\D/g, '') : null;
        let whatsappLink = telefoneWhatsApp ? `https://wa.me/55${telefoneWhatsApp}` : null;

        let instagramHandle = loja.instagram ? loja.instagram.replace('https://www.instagram.com/', '@') : 'Não disponível';

        let detailContent = `
<div class="card mb-3 shadow-sm border-0 detail-column show" style="border-radius: 8px; font-size: 0.9rem;">
    <div class="card-header d-flex justify-content-between align-items-center bg-primary text-white" style="border-radius: 8px 8px 0 0; padding: 0.5rem 1rem;">
        <h5 class="card-title mb-0" style="font-size: 1.1rem;">${loja.nome}</h5>
    </div>
    <div class="card-body" style="padding: 0.75rem 1rem;">
        <p style="margin-bottom: 0.5rem;">
            <strong>Status:</strong> 
            <span class="badge badge-pill ${getStatusBadge(loja.status)}" style="font-size: 0.85rem;">${loja.status}</span>
        </p>
        <p style="margin-bottom: 0.5rem;"><strong>CNPJ:</strong> ${loja.cnpj}</p>
        <p style="margin-bottom: 0.5rem;"><strong>Descrição:</strong> ${loja.anotacao || 'Nenhuma descrição disponível.'}</p>

        <h6 class="mt-3" style="font-size: 1rem;">Loja</h6>
        <div class="contato" style="margin-bottom: 1rem;">
            <p style="margin-bottom: 0.5rem;"><strong>Endereço:</strong> 
                <a href="https://www.google.com.br/maps/search/${loja.endereco}" target="_blank">${loja.endereco}</a>
            </p>
            <p style="margin-bottom: 0.5rem;"><strong>Telefone:</strong> 
                <a href="${whatsappLink}" target="_blank" style="text-decoration: none;">
                    <i class="bi bi-whatsapp"></i> Enviar mensagem
                </a>
            </p>
            <p style="margin-bottom: 0.5rem;"><strong>Email:</strong> 
                <a href="mailto:${loja.email}">${loja.email}</a>
            </p>
            <p style="margin-bottom: 0.5rem;"><strong>Instagram:</strong> 
                <i class="bi bi-instagram"></i> 
                <a href="${loja.instagram}" target="_blank">${instagramHandle}</a>
            </p>
            <p style="margin-bottom: 0.5rem;"><strong>Site:</strong> 
                <a href="${loja.site}" target="_blank">${loja.site || 'Não disponível'}</a>
            </p>
        </div>

        <h6 class="mt-3" style="font-size: 1rem;">Dados Decisor</h6>
        <p style="margin-bottom: 0.5rem;"><strong>Decisor:</strong> ${loja.decisor || 'Não disponível'}</p>
        <p style="margin-bottom: 0.5rem;"><strong>Contato:</strong> 
            <a href="https://wa.me/55${loja.telefone_decisor.replace(/\D/g, '')}" target="_blank">
                ${loja.telefone_decisor || 'Não disponível'}
            </a>
        </p>

        <!-- Botão para enviar ao Agendor -->
        <div class="mt-3">
            <button class="btn btn-secondary btn-sm" onclick='sendToAgendor(${JSON.stringify(loja)})'>
                Enviar para Agendor
            </button>
        </div>
    </div>
</div>

        `;

        detailElement.innerHTML = detailContent;
        detailElement.classList.add('show');

        // Atualizar o botão para "Fechar"
        button.textContent = 'Fechar';
        button.classList.remove('btn-primary');
        button.classList.add('btn-danger');
    } else {
        // Remover o conteúdo e classes ao fechar
        detailElement.classList.remove('show');
        setTimeout(() => {
            detailElement.innerHTML = ''; // Limpar o conteúdo após o fechamento
        }, 500);

        // Restaurar o texto e estilo do botão
        button.textContent = 'Ver Detalhes';
        button.classList.remove('btn-danger');
        button.classList.add('btn-primary');
    }
}

function getStatusBadge(status) {
    switch (status.toLowerCase()) {
        case 'ativo': return 'badge-success';
        case 'inativo': return 'badge-danger';
        case 'coberto': return 'badge-info';
        case 'descoberto': return 'badge-secondary';
        default: return 'badge-light';
    }
}

function showStoreDetails(storeId) {
    // Suponha que você tenha uma lista de lojas chamada `allStores`
    const store = allStores.find(loja => loja.id === storeId);
    
    if (store) {
        // Preencha o modal com as informações da loja
        document.getElementById("storeName").textContent = store.nome;
        document.getElementById("storeStatus").textContent = store.status;
        document.getElementById("storeProfile").textContent = store.perfil_loja || 'Sem perfil';
        document.getElementById("storeSeller").textContent = store.vendedor_nome || 'Sem vendedor';

        // Exibe o modal
        document.getElementById("storeDetailsModal").style.display = "block";
    } else {
        console.error("Loja não encontrada com o ID:", storeId);
    }
}

// Função para fechar o modal
function closeModal() {
    document.getElementById("storeDetailsModal").style.display = "none";
}

// Tornando as funções globais para serem acessíveis pelo HTML
window.showStoreDetails = showStoreDetails;
window.closeModal = closeModal;




// Função para abrir o modal de edição de loja
function openEditModal(loja) {
    document.getElementById('editLojaNome').value = loja.nome || '';
    document.getElementById('editLojaEndereco').value = loja.endereco || '';
    document.getElementById('editLojaTelefone').value = loja.telefone || '';
    document.getElementById('editLojaStatus').value = loja.status || '';

    // Preenche as opções de vendedores dinamicamente
    const vendedorSelect = document.getElementById('editLojaVendedor');
    vendedorSelect.innerHTML = ''; // Limpa as opções atuais

    // Supondo que "vendedores" seja uma variável global que contém a lista de vendedores
    vendedores.forEach(vendedor => {
        const option = document.createElement('option');
        option.value = vendedor.id;
        option.text = vendedor.nome;
        if (loja.vendedor_id === vendedor.id) {
            option.selected = true; // Seleciona o vendedor atual da loja
        }
        vendedorSelect.appendChild(option);
    });

    // Abrir o modal
    $('#editLojaModal').modal('show');
}

// Função para salvar as alterações da loja
function salvarEdicaoLoja() {
    const dadosAtualizados = {
        nome: document.getElementById('editLojaNome').value,
        status: document.getElementById('editLojaStatus').value,
        vendedor_id: document.getElementById('editLojaVendedor').value
    };
    fetch(`${baseURL}/functions/atualizarLoja.php`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(dadosAtualizados),
        credentials: 'include'
    })
    .then(response => response.json())
    .then(result => {
        if (result.success) {
            alert('Loja atualizada com sucesso!');
            $('#editLojaModal').modal('hide');
            // Atualize a lista de lojas ou o card da loja
        } else {
            alert('Erro ao atualizar a loja: ' + result.error);
        }
    })
    .catch(error => {
        console.error('Erro ao atualizar a loja:', error);
        alert('Erro ao atualizar a loja.');
    });
}

document.addEventListener('DOMContentLoaded', function () {
    // Listener para o modal, garantindo que o botão existe antes de adicionar o evento
    $('#addVendedorModal').on('shown.bs.modal', function () {
        const saveVendedorButton = document.getElementById('saveVendedorButton');
        if (saveVendedorButton) {
            saveVendedorButton.addEventListener('click', function () {
                const lojaId = document.getElementById('lojaId').value;
                const vendedorId = document.getElementById('vendedorSelect').value;
                fetch(`${baseURL}/functions/addVendedorToStore.php`, {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                    },
                    body: JSON.stringify({ lojaId, vendedorId }),
                })
                .then(response => response.json())
                .then(data => {
                    if (data.success) {
                        alert('Vendedor adicionado com sucesso!');
                        $('#addVendedorModal').modal('hide');
                        location.reload();
                    } else {
                        alert('Erro ao adicionar vendedor: ' + data.error);
                    }
                })
                .catch(error => {
                    console.error('Erro ao adicionar vendedor:', error);
                    alert('Erro ao adicionar vendedor.');
                });
            });
        } else {
            console.error("O botão 'saveVendedorButton' não foi encontrado no DOM após a abertura do modal.");
        }
    });
});

// CONTA TOTAL LOJAS
export function updateResultCount(count) {
    const resultCountElement = document.getElementById('resultCount');
    if (resultCountElement) {
        resultCountElement.textContent = `Total de lojas: ${count}`;
    } else {
        console.error('Elemento resultCount não encontrado no DOM.');
    }
}

// Exemplo de como abrir o modal para adicionar vendedor
function openAddVendedorModal(lojaId) {
    // Lógica para preencher o modal com os vendedores
    fetch(`${baseURL}/functions/getVendedores.php`)
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                const vendedorSelect = document.getElementById('goalUsers');
                vendedorSelect.innerHTML = ''; // Limpa opções anteriores
                data.vendedores.forEach(vendedor => {
                    const option = document.createElement('option');
                    option.value = vendedor.id;
                    option.textContent = vendedor.nome;
                    vendedorSelect.appendChild(option);
                });

                // Adiciona um listener ao botão de adicionar
                const addButton = document.getElementById('addVendedorButton');
                addButton.onclick = function(event) {
                    event.preventDefault(); // Previne o recarregamento
                    const vendedorId = vendedorSelect.value;
                    addVendedorToLoja(lojaId, vendedorId);
                };

                // Abre o modal
                $('#addVendedorModal').modal('show');
            } else {
                console.error('Erro ao carregar vendedores:', data.error);
            }
        })
        .catch(err => console.error('Erro na requisição:', err));
}

// Função para adicionar o vendedor à loja
function addVendedorToLoja(lojaId, vendedorId) {
        fetch(`${baseURL}/functions/addVendedorToStore.php`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ lojaId: lojaId, vendedorId: vendedorId })
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            // Atualiza a lista de lojas ou informa o usuário
            alert('Vendedor adicionado com sucesso!');
            // Feche o modal
            $('#addVendedorModal').modal('hide');
            // Aqui você pode chamar uma função para atualizar a lista de lojas
        } else {
            console.error('Erro ao adicionar vendedor:', data.error);
        }
    })
    .catch(err => console.error('Erro na requisição:', err));
}

