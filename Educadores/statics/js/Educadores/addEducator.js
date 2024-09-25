document.addEventListener('DOMContentLoaded', function() {
    document.getElementById('addEducatorForm').addEventListener('submit', function(e) {
        e.preventDefault(); // Previne o comportamento padrão do formulário
        
        // Captura dos dados do formulário
        const data = {
            nome: document.getElementById('educatorName').value,
            cpf: document.getElementById('educatorCPF').value,
            data_nascimento: document.getElementById('educatorBirthDate').value,
            endereco: document.getElementById('educatorAddress').value,
            cidade: document.getElementById('educatorCity').value,
            estado: document.getElementById('educatorState').value,
            cep: document.getElementById('educatorCEP').value,
            mesorregiao: document.getElementById('educatorMesoRegion').value,
            instagram: document.getElementById('educatorInstagram').value,
            seguidores: document.getElementById('educatorFollowers').value,
            site: document.getElementById('educatorWebsite').value,
            turma: document.getElementById('educatorClass').value,
            status: document.getElementById('educatorStatus').value,
            atuacao: document.getElementById('educatorActuation').value,
            tecnicas: document.getElementById('educatorTechniques').value,
            telefone: document.getElementById('educatorPhone').value,
            email: document.getElementById('educatorEmail').value
        };

        // Enviando os dados via fetch
        fetch('/portal/functions/Educators/addEducator.php', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(data)
        })
        .then(response => response.json())
        .then(result => {
            if (result.success) {
                alert('Educadora adicionada com sucesso!');
                // Recarrega a lista de educadoras
                loadEducators(); 
                // Limpa o formulário
                document.getElementById('addEducatorForm').reset();
                // Fecha o modal
                $('#addEducatorModal').modal('hide');
            } else {
                alert('Erro ao adicionar educadora: ' + result.message);
            }
        })
        .catch(error => {
            console.error('Erro ao adicionar educadora:', error);
            alert('Erro ao adicionar educadora. Verifique o console para mais detalhes.');
        });
    });
});
