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

document.getElementById('sharpenerForm').addEventListener('submit', function(event) {
    event.preventDefault(); // Previne o envio normal do formulário

    const formData = new FormData(this);

    fetch('/portal/functions/Sharpeners/addSharpener.php', {
        method: 'POST',
        body: formData
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            alert('Afiador adicionado com sucesso!');
            loadAllSharpeners(); // Recarrega a lista de afiadores
            $('#addSharpenerModal').modal('hide'); // Fecha o modal
        } else {
            alert('Erro ao adicionar afiador: ' + data.message);
        }
    })
    .catch(error => {
        console.error('Erro ao adicionar afiador:', error);
        alert('Erro ao adicionar afiador. Verifique o console para mais detalhes.');
    });
});


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

function deleteSelectedSharpeners() {
    // Coletar todos os checkboxes marcados
    const selectedSharpeners = Array.from(document.querySelectorAll('.select-sharpener:checked'))
        .map(checkbox => checkbox.getAttribute('data-id'));

    // Verificar se algum afiador foi selecionado
    if (selectedSharpeners.length === 0) {
        alert('Selecione pelo menos um afiador para excluir.');
        return;
    }

    // Confirmação do usuário
    if (confirm('Tem certeza que deseja excluir os afiadores selecionados?')) {
        // Enviar a requisição para o servidor
        fetch('/portal/functions/Sharpeners/deleteSelectedSharpeners.php', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ ids: selectedSharpeners })
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                alert('Afiadores excluídos com sucesso!');
                loadAllSharpeners(); // Recarregar a lista de afiadores
            } else {
                alert('Erro ao excluir afiadores: ' + data.message);
            }
        })
        .catch(error => {
            console.error('Erro ao excluir afiadores:', error);
            alert('Erro ao excluir afiadores. Verifique o console para mais detalhes.');
        });
    }
}

