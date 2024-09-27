// Checka o TINY para atualizar Status da loja
function checkAllCNPJs() {
    fetch('../functions/getAllCNPJs.php')
        .then(response => response.json()) // Já espera o JSON diretamente
        .then(data => {
            console.log('Resposta bruta do servidor:', data);
            if (data.success) {
                const cnpjs = data.cnpjs;
                const batches = chunkArray(cnpjs, 5);

                let index = 0;
                function processBatch() {
                    if (index < batches.length) {
                        const batch = batches[index];
                        index++;
                        Promise.all(batch.map(cnpj => fetchTinyAPI(cnpj)))
                            .then(() => {
                                setTimeout(processBatch, 2000); // 2 segundos entre lotes
                            })
                            .catch(error => console.error('Erro ao processar lote:', error));
                    }
                }
                processBatch();
            } else {
                console.error('Erro ao buscar CNPJs:', data.message);
            }
        })
        .catch(error => console.error('Erro ao buscar CNPJs:', error));
}

function fetchTinyAPI(cnpj) {
    const url = `../tinyProxy.php?cnpj=${encodeURIComponent(cnpj)}`;
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
            loadAllStores(); // Atualiza a visualização após atualização do status
        } else {
            console.error('Erro ao atualizar o status da loja:', data.message);
        }
    })
    .catch(error => console.error('Erro ao atualizar o status da loja:', error));
}

// Função para dividir o array em lotes
function chunkArray(array, chunkSize) {
    const results = [];
    for (let i = 0; i < array.length; i += chunkSize) {
        results.push(array.slice(i, i + chunkSize));
    }
    return results;
}
