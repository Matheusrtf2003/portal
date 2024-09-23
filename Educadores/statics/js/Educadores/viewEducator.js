// viewEducator.js

function viewEducator(id) {
    const educator = allEducators.find(ed => ed.id === id);
    if (educator) {
        document.getElementById('viewEducatorId').textContent = educator.id;
        document.getElementById('viewEducatorName').textContent = educator.nome;
        document.getElementById('viewEducatorCPF').textContent = educator.cpf;
        document.getElementById('viewEducatorBirthDate').textContent = educator.data_nascimento;
        document.getElementById('viewEducatorAddress').textContent = educator.endereco;
        document.getElementById('viewEducatorCity').textContent = educator.cidade;
        document.getElementById('viewEducatorState').textContent = educator.estado;
        document.getElementById('viewEducatorCEP').textContent = educator.cep;
        document.getElementById('viewEducatorMesoRegion').textContent = educator.mesorregiao;
        document.getElementById('viewEducatorInstagram').textContent = educator.instagram;
        document.getElementById('viewEducatorFollowers').textContent = educator.seguidores;
        document.getElementById('viewEducatorWebsite').textContent = educator.site;
        document.getElementById('viewEducatorClass').textContent = educator.turma;
        document.getElementById('viewEducatorStatus').textContent = educator.status ? 'Ativo' : 'Inativo';
        document.getElementById('viewEducatorActuation').textContent = educator.atuacao;
        document.getElementById('viewEducatorTechniques').textContent = educator.tecnicas;
        document.getElementById('viewEducatorPhone').textContent = educator.telefone;
        document.getElementById('viewEducatorEmail').textContent = educator.email;

        $('#viewEducatorModal').modal('show');
    }
}
