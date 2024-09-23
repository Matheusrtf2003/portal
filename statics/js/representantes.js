document.addEventListener('DOMContentLoaded', function () {
    // Carregar representantes
    loadRepresentatives();

    // Salvar Representante
    document.getElementById('representativeForm').addEventListener('submit', function (event) {
        event.preventDefault();
        const formData = new FormData(this);
        const url = formData.get('id') ? 'functions/representatives/updateRepresentative.php' : 'functions/representatives/addRepresentative.php';

        fetch(url, {
            method: 'POST',
            body: formData
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                alert('Representante salvo com sucesso!');
                $('#addRepresentativeModal').modal('hide');
                loadRepresentatives(); // Recarrega a lista de representantes
            } else {
                alert('Erro ao salvar representante: ' + data.message);
            }
        })
        .catch(error => console.error('Erro ao salvar representante:', error));
    });

    // Filtrar Representantes
    document.getElementById('applyFilterButton').addEventListener('click', function () {
        applyFilters();
    });
});

function loadRepresentatives(filters = {}) {
    fetch('functions/Representatives/getRepresentatives.php', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(filters)
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            const tbody = document.getElementById('representativesTable').querySelector('tbody');
            tbody.innerHTML = '';
            data.representatives.forEach(rep => {
                const row = document.createElement('tr');
                row.innerHTML = `
                    <td><input type="checkbox" class="select-representative" data-id="${rep.id}"></td>
                    <td>${rep.id}</td>
                    <td>${rep.nome}</td>
                    <td>${rep.telefone}</td>
                    <td>${rep.email}</td>
                    <td>${rep.cidade}</td>
                    <td>${rep.estado}</td>
                    <td>${rep.marcas}</td>
                    <td>${rep.status}</td>
                    <td>
                        <button class="btn btn-warning btn-sm" onclick="editRepresentative(${rep.id})">Editar</button>
                        <button class="btn btn-danger btn-sm" onclick="deleteRepresentative(${rep.id})">Excluir</button>
                    </td>
                `;
                tbody.appendChild(row);
            });
        } else {
            alert('Erro ao carregar representantes: ' + data.message);
        }
    })
    .catch(error => console.error('Erro ao carregar representantes:', error));
}

function applyFilters() {
    const status = document.getElementById('filterStatus').value;
    const dateStart = document.getElementById('filterDateStart').value;
    const dateEnd = document.getElementById('filterDateEnd').value;

    const filters = {
        status: status,
        dateStart: dateStart,
        dateEnd: dateEnd
    };

    loadRepresentatives(filters);

    // Fechar o modal após aplicar os filtros
    $('#filterModal').modal('hide');
}


function editRepresentative(id) {
    fetch(`functions/Representatives/getRepresentative.php?id=${id}`)
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                const rep = data.representative;
                document.getElementById('representativeId').value = rep.id;
                document.getElementById('representativeName').value = rep.nome;
                document.getElementById('representativePhone').value = rep.telefone;
                document.getElementById('representativeEmail').value = rep.email;
                document.getElementById('representativeCity').value = rep.cidade;
                document.getElementById('representativeState').value = rep.estado;
                document.getElementById('representativeBrands').value = rep.marcas;
                document.getElementById('representativeStatus').value = rep.status;

                $('#addRepresentativeModal').modal('show');
            } else {
                alert('Erro ao carregar dados do representante: ' + data.message);
            }
        })
        .catch(error => console.error('Erro ao carregar dados do representante:', error));
}

function deleteRepresentative(id) {
    if (confirm('Tem certeza que deseja excluir este representante?')) {
        fetch(`functions/Representatives/deleteRepresentative.php`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ id: id })
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                alert('Representante excluído com sucesso!');
                loadRepresentatives();
            } else {
                alert('Erro ao excluir representante: ' + data.message);
            }
        })
        .catch(error => {
            console.error('Erro ao excluir representante:', error);
            alert('Erro ao excluir representante. Verifique o console para mais detalhes.');
        });
    }
}
