// Função para buscar todos os dados e exportar para Excel
function exportAllDataToExcel() {
    // Faz a requisição para obter todos os dados
    fetch('/portal/functions/getStores.php')
        .then(response => response.json())
        .then(data => {
            if (data.success && data.stores.length > 0) {
                // Cria a planilha com todos os dados
                let stores = data.stores;
                let workbook = XLSX.utils.book_new();
                let worksheetData = [];

                // Cabeçalhos da tabela
                worksheetData.push([
                    'Nome', 'CNPJ', 'Status', 'Endereço', 'Cidade', 'Estado', 'Mesorregião','Especialidade','Telefone', 'Instagram', 'Site', 'Decisor', 'Telefone Decisor', 'Email', 'Marcadores', 'Data de registro'
                ]);

                // Preenche os dados
                stores.forEach(store => {
                    let marcadores = '';
                    if (Array.isArray(store.marcadores) && store.marcadores.length > 0) {
                        marcadores = store.marcadores.map(marcador => {
                            return `${marcador.nome}`; // Retorna apenas o nome
                        }).join(', '); // Usa join para separar os marcadores por vírgula
                    } else {
                        marcadores = 'Não preenchido'; // Caso não haja marcadores
                    }

                    worksheetData.push([
                        store.nome,
                        store.cnpj,
                        store.status,
                        store.endereco,
                        store.cidade,
                        store.estado,
                        store.mesorregiao,
                        store.anotacao || 'Não preenchido',
                        store.telefone,
                        store.instagram,
                        store.site,
                        store.decisor,
                        store.telefone_decisor,
                        store.email,
                        marcadores,
                        new Date(store.datetime).toLocaleString(),
                        // store.hunter
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