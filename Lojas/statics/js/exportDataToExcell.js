// Função para buscar todos os dados e exportar para Excel
function exportAllDataToExcel() {
    // Faz a requisição para obter todos os dados
    fetch('../portal/functions/getStores.php')
        .then(response => response.json())
        .then(data => {
            if (data.success && data.stores.length > 0) {
                // Cria a planilha com todos os dados
                let stores = data.stores;
                let workbook = XLSX.utils.book_new();
                let worksheetData = [];

                // Cabeçalhos da tabela
                worksheetData.push([
                    'Nome', 'CNPJ', 'Status', 'Endereço', 'Cidade', 'Estado', 'Telefone', 'Instagram', 'Site', 'Decisor', 'Telefone Decisor', 'Email'
                ]);

                // Preenche os dados
                stores.forEach(store => {
                    worksheetData.push([
                        store.nome,
                        store.cnpj,
                        store.status,
                        store.endereco,
                        store.cidade,
                        store.estado_sigla,
                        store.telefone,
                        store.instagram,
                        store.site,
                        store.decisor,
                        store.telefone_decisor,
                        store.email
                    ]);
                });

                // Converte os dados para uma planilha
                let worksheet = XLSX.utils.aoa_to_sheet(worksheetData);
                XLSX.utils.book_append_sheet(workbook, worksheet, 'Lojas');

                // Exporta para Excel
                XLSX.writeFile(workbook, 'tabela-completa.xlsx');
            } else {
                console.error('Nenhum dado disponível para exportar.');
            }
        })
        .catch(error => {
            console.error('Erro ao buscar os dados:', error);
        });
}