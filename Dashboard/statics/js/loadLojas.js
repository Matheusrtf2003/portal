// loadLojas.js

function loadLojasData() {
    fetch('../../../functions/Stores/getStores.php')
        .then(response => response.json())
        .then(data => {
            const tbody = document.getElementById('lojasTableBody');
            if (tbody) {
                tbody.innerHTML = '';

                data.forEach(loja => {
                    const row = document.createElement('tr');
                    row.innerHTML = `
                        <td>${loja.id}</td>
                        <td>${loja.nome}</td>
                        <td>${loja.endereco}</td>
                        <td>${loja.status}</td>
                        <td>${loja.vendedor}</td>
                        <td>${loja.telefone}</td>
                        <td>${loja.email}</td>
                        <td>${loja.instagram}</td>
                        <td>${loja.site}</td>
                        <td>${loja.decisor}</td>
                        <td>${loja.telefone_decisor}</td>
                        <td>${loja.datetime}</td>
                    `;
                    tbody.appendChild(row);
                });
            }
        })
        .catch(error => console.error('Erro ao carregar dados das lojas:', error));
}
