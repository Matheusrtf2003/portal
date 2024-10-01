// Função para carregar vendedores no select
function loadVendedoresIntoSelect(vendedorSelect) {
    vendedorSelect.innerHTML = '<option value="" disabled selected>Selecione um vendedor</option>';
    fetch('/portal/functions/Sellers/getVendedores.php')
        .then(response => response.json())
        .then(data => {
            if (data.success) {
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
        .catch(error => console.error('Erro ao carregar vendedores:', error));
}

// Abrir modal para atribuir vendedor a uma loja específica
function openAssignVendedorModal(storeId) {
    const vendedorSelect = document.getElementById('vendedorSelect');
    document.getElementById('storeId').value = storeId;
    document.getElementById('storeIds').value = ''; // Limpa o campo para múltiplas lojas

    loadVendedoresIntoSelect(vendedorSelect);
    $('#assignVendedorModal').modal('show');
}

// Abrir modal para atribuir vendedor a múltiplas lojas
function openAssignVendedorModalMultiple() {
    const selectedStores = Array.from(document.querySelectorAll('.select-store:checked')).map(cb => cb.getAttribute('data-id'));

    if (selectedStores.length === 0) {
        alert('Selecione pelo menos uma loja.');
        return;
    }

    document.getElementById('storeIds').value = JSON.stringify(selectedStores);
    const vendedorSelect = document.getElementById('vendedorSelect');

    loadVendedoresIntoSelect(vendedorSelect);
    $('#assignVendedorModal').modal('show');
}

// Função genérica para atribuir vendedor a uma ou mais lojas
function assignVendedor() {
    const vendedorId = document.getElementById('vendedorSelect').value;

    if (!vendedorId) {
        alert('Selecione um vendedor.');
        return;
    }

    const storeId = document.getElementById('storeId').value;
    const storeIds = document.getElementById('storeIds').value;

    if (!storeId && !storeIds) {
        alert('Nenhuma loja selecionada.');
        return;
    }

    const endpoint = storeId ? '/portal/functions/Sellers/assignVendedor.php' : '/portal/functions/Sellers/assignVendedorMultiple.php';
    const payload = storeId ? 
        { store_id: storeId, vendedor_id: vendedorId } : 
        { store_ids: JSON.parse(storeIds), vendedor_id: vendedorId };

    fetch(endpoint, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(payload)
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            alert(`Vendedor atribuído com sucesso ${storeId ? 'à loja' : 'a várias lojas'}!`);
            $('#assignVendedorModal').modal('hide');
            loadAllStores(); // Recarrega a lista de lojas
        } else {
            alert('Erro ao atribuir vendedor.');
        }
    })
    .catch(error => {
        console.error('Erro ao atribuir vendedor:', error);
        alert('Ocorreu um erro ao atribuir o vendedor. Tente novamente.');
    });
}
