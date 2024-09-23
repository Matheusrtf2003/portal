// Abre o modal para atribuir vendedor às lojas selecionadas
function openAssignVendedorModalMultiple() {
  const selectedStores = Array.from(document.querySelectorAll('.select-store:checked')).map(cb => cb.getAttribute('data-id'));

  if (selectedStores.length === 0) {
      alert('Selecione pelo menos uma loja.');
      return;
  }

  document.getElementById('storeIds').value = JSON.stringify(selectedStores);

  const vendedorSelect = document.getElementById('vendedorSelect');
  vendedorSelect.innerHTML = '<option value="" disabled selected>Selecione um vendedor</option>';

  // Fetch vendedores
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

// Atribuir o vendedor para múltiplas lojas
function assignVendedorMultiple() {
  const storeIds = JSON.parse(document.getElementById('storeIds').value);
  const vendedorId = document.getElementById('vendedorSelect').value;

  if (!vendedorId) {
      alert('Selecione um vendedor.');
      return;
  }

  fetch('/portal/functions/Sellers/assignVendedorMultiple.php', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ store_ids: storeIds, vendedor_id: vendedorId })
  })
  .then(response => response.json())
  .then(data => {
      if (data.success) {
          alert('Vendedor atribuído com sucesso!');
          $('#assignVendedorModal').modal('hide');
          loadAllStores(); // Atualiza a lista de lojas
      } else {
          alert('Erro ao atribuir vendedor.');
      }
  })
  .catch(error => console.error('Erro ao atribuir vendedor:', error));
}
