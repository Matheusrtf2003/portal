document.addEventListener('DOMContentLoaded', function () {
    document.getElementById('updateMissingAddresses').addEventListener('click', function() {
        updateMissingAddresses();
    });
});

function updateMissingAddresses() {
    fetch('/portal/functions/FaltaEndereco/getStoresWithMissingAddress.php')
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                const stores = data.stores;
                if (stores.length === 0) {
                    alert('Nenhuma loja com CNPJ sem endereço encontrada.');
                    return;
                }

                let completedRequests = 0;
                stores.forEach(store => {
                    const cleanedCNPJ = store.cnpj.replace(/[^\d]+/g, ''); // Remove caracteres especiais
                    fetch(`https://www.receitaws.com.br/v1/cnpj/${cleanedCNPJ}`)
                        .then(response => response.json())
                        .then(apiData => {
                            if (apiData.status === 'OK') {
                                const addressData = {
                                    id: store.id,
                                    endereco: `${apiData.logradouro}, ${apiData.numero}, ${apiData.bairro}`,
                                    cidade: apiData.municipio,
                                    estado: apiData.uf
                                };

                                updateStoreAddress(addressData);
                            } else {
                                console.error(`Erro ao buscar dados para CNPJ ${store.cnpj}:`, apiData.message);
                            }
                        })
                        .catch(error => console.error('Erro ao consultar a API ReceitaWS:', error))
                        .finally(() => {
                            completedRequests++;
                            if (completedRequests === stores.length) {
                                alert('Processo de atualização de endereços concluído.');
                            }
                        });
                });
            } else {
                alert('Erro ao buscar lojas sem endereço: ' + data.message);
            }
        })
        .catch(error => console.error('Erro ao buscar lojas sem endereço:', error));
}

function updateStoreAddress(addressData) {
    fetch('/portal/functions/FaltaEndereco/updateStoreAddress.php', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(addressData)
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            console.log(`Endereço da loja ID ${addressData.id} atualizado com sucesso.`);
        } else {
            console.error('Erro ao atualizar endereço da loja:', data.message);
        }
    })
    .catch(error => console.error('Erro ao atualizar endereço da loja:', error));
}
