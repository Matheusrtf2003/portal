let currentPage = 1;
const itemsPerPage = 20;
let allSharpeners = [];
let filteredSharpeners = [];

document.addEventListener('DOMContentLoaded', function () {
    loadAllSharpeners();

    const searchInput = document.getElementById('searchInput');
    const selectAllCheckbox = document.getElementById('selectAll');
    const filterStatus = document.getElementById('filterStatus');
    const filterSituation = document.getElementById('filterSituation');
    const filterDateStart = document.getElementById('filterDateStart');
    const filterDateEnd = document.getElementById('filterDateEnd');

    if (searchInput) {
        searchInput.addEventListener('input', applyFilters);
    }

    if (filterStatus) {
        filterStatus.addEventListener('change', applyFilters);
    }

    if (filterSituation) {
        filterSituation.addEventListener('change', applyFilters);
    }

    if (filterDateStart) {
        filterDateStart.addEventListener('change', applyFilters);
    }

    if (filterDateEnd) {
        filterDateEnd.addEventListener('change', applyFilters);
    }

    if (selectAllCheckbox) {
        selectAllCheckbox.addEventListener('change', function () {
            const checkboxes = document.querySelectorAll('.select-sharpener');
            checkboxes.forEach(checkbox => checkbox.checked = this.checked);
        });
    }

    document.getElementById('sharpenerForm').addEventListener('submit', function(event) {
        event.preventDefault();

        const formData = new FormData(this);
        const sharpenerId = document.getElementById('sharpenerId').value;

        const url = sharpenerId ? 'functions/Sharpeners/updateSharpener.php' : 'functions/Sharpeners/addSharpener.php';

        console.log('Submitting form to URL:', url);
        console.log('FormData:', ...formData.entries());

        fetch(url, {
            method: 'POST',
            body: formData
        })
        .then(response => response.json())
        .then(data => {
            console.log('Response:', data);
            if (data.success) {
                alert('Afiador salvo com sucesso!');
                $('#addSharpenerModal').modal('hide');
                loadAllSharpeners();
            } else {
                alert('Erro ao salvar afiador: ' + data.message);
            }
        })
        .catch(error => {
            console.error('Erro ao salvar afiador:', error);
            alert('Erro ao salvar afiador. Verifique o console para mais detalhes.');
        });
    });
});

function loadAllSharpeners() {
    fetch('functions/Sharpeners/getSharpeners.php')
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                allSharpeners = data.sharpeners;
                applyFilters();
            } else {
                console.error('Erro ao carregar afiadores:', data.message);
                alert('Erro ao carregar afiadores: ' + data.message);
            }
        })
        .catch(error => {
            console.error('Erro ao carregar afiadores:', error);
            alert('Erro ao carregar afiadores. Verifique o console para mais detalhes.');
        });
}

function displaySharpeners(sharpeners) {
    const tbody = document.querySelector('#sharpenersTable tbody');
    tbody.innerHTML = '';

    const start = (currentPage - 1) * itemsPerPage;
    const end = start + itemsPerPage;
    const paginatedSharpeners = sharpeners.slice(start, end);

    paginatedSharpeners.forEach(sharpener => {
        const row = document.createElement('tr');
        row.innerHTML = `
            <td><input type="checkbox" class="select-sharpener" data-id="${sharpener.id}"></td>
            <td>${sharpener.id}</td>
            <td>${sharpener.nome}</td>
            <td>${sharpener.cpf}</td>
            <td>${sharpener.uf}</td>
            <td>${sharpener.status}</td>
            <td>${sharpener.situacao}</td>
            <td>
                <button class="btn btn-warning btn-sm" onclick="editSharpener(${sharpener.id})">Editar</button>
                <button class="btn btn-danger btn-sm" onclick="deleteSharpener(${sharpener.id})">Excluir</button>
            </td>
        `;
        tbody.appendChild(row);
    });

    const sharpenerCount = document.getElementById('sharpenerCount');
    if (sharpenerCount) {
        sharpenerCount.textContent = `Total de Afiadores: ${sharpeners.length}`;
    }

    document.getElementById('prevPage').disabled = currentPage === 1;
    document.getElementById('nextPage').disabled = end >= sharpeners.length;
}

function changePage(direction) {
    currentPage += direction;
    applyFilters();
}

function applyFilters() {
    const query = document.getElementById('searchInput') ? document.getElementById('searchInput').value.toLowerCase() : '';
    const status = document.getElementById('filterStatus') ? document.getElementById('filterStatus').value.toLowerCase() : '';
    const situation = document.getElementById('filterSituation') ? document.getElementById('filterSituation').value.toLowerCase() : '';
    const startDate = document.getElementById('filterDateStart') ? new Date(document.getElementById('filterDateStart').value) : new Date(NaN);
    const endDate = document.getElementById('filterDateEnd') ? new Date(document.getElementById('filterDateEnd').value) : new Date(NaN);

    filteredSharpeners = allSharpeners.filter(sharpener => {
        const id = sharpener.id.toString().toLowerCase();
        const nome = sharpener.nome ? sharpener.nome.toLowerCase() : '';
        const cpf = sharpener.cpf ? sharpener.cpf.toLowerCase() : '';
        const rowStatus = sharpener.status ? sharpener.status.toLowerCase() : '';
        const rowSituation = sharpener.situacao ? sharpener.situacao.toLowerCase() : '';
        const datetime = new Date(sharpener.datetime);

        const matchQuery = id.includes(query) || nome.includes(query) || cpf.includes(query);
        const matchStatus = !status || rowStatus === status;
        const matchSituation = !situation || rowSituation === situation;
        const matchDate = (!isNaN(startDate) && !        isNaN(endDate)) ? (datetime >= startDate && datetime <= endDate) : true;

        return matchQuery && matchStatus && matchSituation && matchDate;
    });

    displaySharpeners(filteredSharpeners);
}

function filterByStatus() {
    applyFilters();
    $('#filterStatusModal').modal('hide');
}

function filterByDate() {
    applyFilters();
    $('#filterDateModal').modal('hide');
}

function filterBySituation() {
    applyFilters();
    $('#filterSituationModal').modal('hide');
}

function resetFilters() {
    document.getElementById('filterStatus').value = '';
    document.getElementById('filterSituation').value = '';
    document.getElementById('filterDateStart').value = '';
    document.getElementById('filterDateEnd').value = '';
    applyFilters();
    $('#filterModal').modal('hide');
}

function importCSV() {
    const formData = new FormData(document.getElementById('importCSVForm'));

    fetch('functions/Sharpeners/importCSV.php', {
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

function editSharpener(id) {
    console.log('Editing sharpener with ID:', id);
    fetch(`functions/Sharpeners/getSharpener.php?id=${id}`)
        .then(response => response.json())
        .then(data => {
            console.log('Data received for sharpener:', data);
            if (data.success) {
                const sharpener = data.sharpener;
                console.log('Sharpener Data:', sharpener); // Log adicional

                const sharpenerId = document.getElementById('sharpenerId');
                const sharpenerName = document.getElementById('sharpenerName');
                const sharpenerCPF = document.getElementById('sharpenerCPF');
                const sharpenerStatus = document.getElementById('sharpenerStatus');
                const sharpenerSituation = document.getElementById('sharpenerSituation');
                const sharpenerAddress = document.getElementById('sharpenerAddress');
                const sharpenerCity = document.getElementById('sharpenerCity');
                const sharpenerState = document.getElementById('sharpenerState');
                const sharpenerPhone = document.getElementById('sharpenerPhone');
                const sharpenerEmail = document.getElementById('sharpenerEmail');
                const sharpenerInstagram = document.getElementById('sharpenerInstagram');
                const sharpenerWebsite = document.getElementById('sharpenerWebsite');
                const sharpenerDecider = document.getElementById('sharpenerDecider');
                const sharpenerDeciderPhone = document.getElementById('sharpenerDeciderPhone');
                const sharpenerCep = document.getElementById('sharpenerCep');
                const sharpenerBairro = document.getElementById('sharpenerBairro');
                const sharpenerSelo = document.getElementById('sharpenerSelo');

                if (sharpenerId && sharpener.id) sharpenerId.value = sharpener.id;
                if (sharpenerName && sharpener.nome) sharpenerName.value = sharpener.nome;
                if (sharpenerCPF && sharpener.cpf) sharpenerCPF.value = sharpener.cpf;
                if (sharpenerStatus && sharpener.status) sharpenerStatus.value = sharpener.status;
                if (sharpenerSituation && sharpener.situacao) sharpenerSituation.value = sharpener.situacao;
                if (sharpenerAddress && sharpener.endereco) sharpenerAddress.value = sharpener.endereco;
                if (sharpenerCity && sharpener.cidade) sharpenerCity.value = sharpener.cidade;
                if (sharpenerState && sharpener.uf) sharpenerState.value = sharpener.uf;
                if (sharpenerPhone && sharpener.telefone) sharpenerPhone.value = sharpener.telefone;
                if (sharpenerEmail && sharpener.email) sharpenerEmail.value = sharpener.email;
                if (sharpenerInstagram && sharpener.instagram) sharpenerInstagram.value = sharpener.instagram;
                if (sharpenerWebsite && sharpener.site) sharpenerWebsite.value = sharpener.site;
                if (sharpenerDecider && sharpener.decisor) sharpenerDecider.value = sharpener.decisor;
                if (sharpenerDeciderPhone && sharpener.telefone_decisor) sharpenerDeciderPhone.value = sharpener.telefone_decisor;
                if (sharpenerCep && sharpener.cep) sharpenerCep.value = sharpener.cep;
                if (sharpenerBairro && sharpener.bairro) sharpenerBairro.value = sharpener.bairro;
                if (sharpenerSelo && sharpener.selo) sharpenerSelo.value = sharpener.selo;

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
        console.log('ID do afiador:', id); // Adicione isso para garantir que o ID está correto
        fetch(`functions/Sharpeners/deleteSharpener.php?id=${id}`, { 
            method: 'DELETE' 
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
    const selectedSharpeners = [];
    document.querySelectorAll('.select-sharpener:checked').forEach(checkbox => {
        selectedSharpeners.push(checkbox.getAttribute('data-id'));
    });

    if (selectedSharpeners.length === 0) {
        alert('Nenhum afiador selecionado.');
        return;
    }

    if (confirm('Tem certeza que deseja excluir os afiadores selecionados?')) {
        fetch('functions/Sharpeners/deleteSelectedSharpeners.php', {
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
                loadAllSharpeners();
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

