// importCSV.js

function importCSV() {
    const formData = new FormData(document.getElementById('importCSVForm'));

    fetch('/portal/functions/Sharpeners/importCSV.php', {
        method: 'POST',
        body: formData
    })
    .then(response => response.json())
    .then(data => {
        const importMessage = document.getElementById('importMessage');
        if (data.success) {
            importMessage.innerHTML = `<div class="alert alert-success">${data.message}</div>`;
            loadAllSharpeners();
            $('#importCSVModal').modal('hide');
        } else {
            importMessage.innerHTML = `<div class="alert alert-danger">${data.message}</div>`;
        }
    })
    .catch(error => {
        console.error('Erro ao importar arquivo CSV:', error);
        const importMessage = document.getElementById('importMessage');
        importMessage.innerHTML = `<div class="alert alert-danger">Erro ao importar arquivo CSV. Verifique o console para mais detalhes.</div>`;
    });
}
