// Abre o modal para atribuir vendedor a uma loja específica
function openAssignVendedorModal(storeId) {
    const vendedorSelect = document.getElementById('vendedorSelect');
    vendedorSelect.innerHTML = '<option value="" disabled selected>Selecione um vendedor</option>';

    // Preenche o campo oculto com o ID da loja específica
    document.getElementById('storeId').value = storeId;
    document.getElementById('storeIds').value = ''; // Limpa o campo para múltiplas lojas

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

    $('#assignVendedorModal').modal('show');
}

// Atribuir o vendedor para uma loja ou múltiplas lojas
function assignVendedor() {
    const vendedorId = document.getElementById('vendedorSelect').value;

    if (!vendedorId) {
        alert('Selecione um vendedor.');
        return;
    }

    const storeId = document.getElementById('storeId').value;
    const storeIds = document.getElementById('storeIds').value;

    // Atribuir a uma loja específica
    if (storeId) {
        fetch('/portal/functions/Sellers/assignVendedor.php', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ store_id: storeId, vendedor_id: vendedorId })
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                alert('Vendedor atribuído com sucesso!');
                $('#assignVendedorModal').modal('hide');
                loadAllStores(); // Recarrega a lista de lojas
            } else {
                alert('Erro ao atribuir vendedor.');
            }
        })
        .catch(error => console.error('Erro ao atribuir vendedor:', error));
    }

    // Atribuir a múltiplas lojas
    else if (storeIds) {
        fetch('/portal/functions/Sellers/assignVendedorMultiple.php', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ store_ids: JSON.parse(storeIds), vendedor_id: vendedorId })
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                alert('Vendedor atribuído com sucesso a várias lojas!');
                $('#assignVendedorModal').modal('hide');
                loadAllStores(); // Recarrega a lista de lojas
            } else {
                alert('Erro ao atribuir vendedor.');
            }
        })
        .catch(error => console.error('Erro ao atribuir vendedor:', error));
    }
}
