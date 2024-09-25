// sharpenerActions.js

function editSharpener(id) {
    console.log('Editing sharpener with ID:', id);
    fetch(`/portal/functions/Sharpeners/getSharpener.php?id=${id}`)
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                const sharpener = data.sharpener;

                // Preenche os campos com os dados do afiador
                document.getElementById('sharpenerId').value = sharpener.id;
                document.getElementById('sharpenerName').value = sharpener.nome;
                document.getElementById('sharpenerCPF').value = sharpener.cpf;
                document.getElementById('sharpenerStatus').value = sharpener.status;
                document.getElementById('sharpenerSituation').value = sharpener.situacao;
                // Complete com os outros campos...
                
                $('#addSharpenerModal').modal('show');
            } else {
                alert('Erro ao carregar dados do afiador: ' + data.message);
            }
        })
        .catch(error => {
            console.error('Erro ao carregar dados do afiador:', error);
            alert('Erro ao carregar dados do afiador. Verifique o console para mais detalhes.');
        });
}

function deleteSharpener(id) {
    if (confirm('Tem certeza que deseja excluir este afiador?')) {
        fetch(`/portal/functions/Sharpeners/deleteSharpener.php`, { 
            method: 'POST',
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
            body: `id=${id}`
        })                
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                alert('Afiador excluído com sucesso!');
                loadAllSharpeners();
            } else {
                alert('Erro ao excluir afiador: ' + data.message);
            }
        })
        .catch(error => {
            console.error('Erro ao excluir afiador:', error);
            alert('Erro ao excluir afiador. Verifique o console para mais detalhes.');
        });
    }
}
