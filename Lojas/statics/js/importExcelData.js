let duplicateCNPJs = [];

function importStores() {
    const fileInput = document.getElementById('storeFile');
    if (!fileInput || !fileInput.files[0]) {
        displayStatusMessage("Por favor, selecione um arquivo para importar.", false);
        return;
    }

    const formData = new FormData();
    formData.append('storeFile', fileInput.files[0]);

    fetch('/portal/functions/Import/importStores.php', {
        method: 'POST',
        body: formData
    })
    .then(response => response.json())
    .then(data => {
        let message = data.message || '';
        duplicateCNPJs = []; // Reiniciar a lista de CNPJs duplicados

        if (data.errors && data.errors.length > 0) {
            message += '<br>Erros durante a importação:<ul>';
            data.errors.forEach(error => {
                message += `<li>${error}</li>`;
                
                // Armazena CNPJs duplicados
                if (error.includes("CNPJ '")) {
                    const match = error.match(/CNPJ '([\d]+)'/);
                    if (match) {
                        duplicateCNPJs.push(match[1]);
                    }
                }
            });
            message += '</ul>';
        }

        // Exibe a mensagem e o botão de download se houver CNPJs duplicados
        displayStatusMessage(message, data.success);
    })
    .catch(error => {
        console.error('Erro na importação:', error);
        displayStatusMessage("Erro na importação. Tente novamente.", false);
    });
}

// Função para exibir mensagens com botão de fechar e botão de download (se necessário)
function displayStatusMessage(message, isSuccess = true) {
    const importStatus = document.getElementById('importStatus');

    // Verifica se há CNPJs duplicados e cria o botão de download, se necessário
    const downloadButton = duplicateCNPJs.length > 0 
        ? `<button class="btn btn-warning mt-2" onclick="downloadDuplicatesSheet()">Baixar CNPJs Duplicados</button>`
        : '';

    importStatus.innerHTML = `
        <div class="status-message ${isSuccess ? 'status-success' : 'status-error'}">
            <button class="close-btn" onclick="closeStatusMessage()">×</button>
            ${message}
            ${downloadButton}
        </div>
    `;
}

// Função para gerar a planilha de CNPJs duplicados e fazer o download
function downloadDuplicatesSheet() {
    if (duplicateCNPJs.length === 0) {
        return;
    }

    // Cria a planilha usando a biblioteca SheetJS
    const ws = XLSX.utils.aoa_to_sheet([["CNPJs Duplicados"], ...duplicateCNPJs.map(cnpj => [cnpj])]);
    const wb = XLSX.utils.book_new();
    XLSX.utils.book_append_sheet(wb, ws, "CNPJs Duplicados");

    // Gera o arquivo e faz o download
    XLSX.writeFile(wb, "CNPJs_Duplicados.xlsx");
}

// Função para fechar a mensagem de status
function closeStatusMessage() {
    document.getElementById('importStatus').innerHTML = '';
}
