async function checkCNPJInTiny(cnpj) {
    const response = await fetch('https://api.tiny.com.br/api2/contatos.pesquisa.php', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: new URLSearchParams({
            token: 'c854f3ce8979089e9b0e6b758697b6ce48a9bceaf7506983d25bc9fc73a510e1',
            pesquisa: cnpj,
            formato: 'json'
        })
    });

    const data = await response.json();
    return data.retorno.status === 'OK' && data.retorno.contatos.length > 0;
}

async function updateStoreStatus(storeId) {
    await fetch('../functions/Stores/updateStoreStatus.php', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ id: storeId })
    });
}
