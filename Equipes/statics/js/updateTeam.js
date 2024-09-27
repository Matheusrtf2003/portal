$('#updateTeamModal').on('show.bs.modal', function (event) {
    // Botão que acionou o modal
    var button = $(event.relatedTarget);
    
    // Extrai os dados dos atributos `data-*` do botão
    var id = button.data('id');
    var name = button.data('name');
    var description = button.data('description');
    var managerId = button.data('manager');
    
    // Preenche os campos do modal com os dados extraídos
    var modal = $(this);
    modal.find('#teamId').val(id); // Preenche o campo oculto com o ID da equipe
    modal.find('#editTeamName').val(name); // Preenche o campo do nome da equipe
    modal.find('#editTeamDescription').val(description); // Preenche o campo da descrição

    // Se houver um campo de gerente, seleciona o gerente atual no select
    if (managerId) {
        modal.find('#editTeamManager').val(managerId);
    }
});

  
// Captura o formulário de edição da equipe
const editTeamForm = document.getElementById('editTeamForm');

if (editTeamForm) {
    editTeamForm.addEventListener('submit', function(e) {
        e.preventDefault();
        
        const formData = new FormData(this); // Coleta os dados do formulário

        // Envia os dados para atualizar a equipe no servidor
        fetch('../functions/Teams/updateTeam.php', {
            method: 'POST',
            body: formData
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                // Fecha o modal de edição
                $('#updateTeamModal').modal('hide');
                // Recarrega a página para refletir as mudanças
                location.reload();
            } else {
                alert('Erro ao atualizar a equipe: ' + data.message);
            }
        })
        .catch(error => console.error('Erro ao atualizar a equipe:', error));
    }, { once: true }); // Garante que o evento seja disparado apenas uma vez
}
