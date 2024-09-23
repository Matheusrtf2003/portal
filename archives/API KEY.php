AIzaSyDYHtBjzk2_7Txe12fwST5jIVf2yyQP2YM



backup





<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="statics/css/styles.css">
    <title>Mapa de Lojas</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <!-- CSS personalizado -->
    <style>
        .sidebar {
            height: 100vh;
            overflow-y: auto;
            width: 400px; /* Aumentei a largura da sidebar */
            float: left;
        }
        #map {
            height: 100vh;
            width: calc(100% - 350px); /* Ajustei com base na nova largura da sidebar */
            float: right;
        }
        .status-indicator {
            height: 10px;
            width: 10px;
            border-radius: 50%;
            display: inline-block;
            margin-right: 10px;
        }
        .list-group-item {
            margin-bottom: 10px; /* Adiciona margem entre itens */
        }
    </style>
</head>
<body>
    <div class="sidebar">
        <button type="button" class="btn btn-success" data-toggle="modal" data-target="#addStoreModal">
            Adicionar Loja
        </button>
        <form id="uploadForm" action="functions_php/upload.php" method="post" enctype="multipart/form-data">
            <div class="input-group mb-3">
                <div class="custom-file">
                    <input type="file" class="custom-file-input" id="uploadFile" name="file" accept=".xlsx, .xls, .csv">
                    <label class="custom-file-label" for="uploadFile">Upload</label>
                </div>
                <div class="input-group-append">
                    <button class="btn btn-primary" type="submit">Enviar</button>
                </div>
            </div>
            <div class="d-flex align-items-center">
                <a class="arquivo-csv btn btn-primary mt-3" href="archives/planilha_modelo.csv" download="planilha_modelo.csv">Baixar CSV modelo</a>
            </div>
        </form>
        
        
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#filterModal">
            Filtrar
        </button>
        <div class="list-group" id="storeList">
            <!-- Lista de lojas será carregada aqui -->
        </div>
    </div>

    <div id="map"></div>

    <!-- Modal de Cadastro de Loja -->
    <div class="modal fade" id="addStoreModal" tabindex="-1" role="dialog" aria-labelledby="addStoreModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addStoreModalLabel">Adicionar Nova Loja</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="storeForm">
                        <!-- Campo Id OCULTO-->
                        <input type="hidden" id="storeId" name="storeId">
                        <!-- Campos do formulário de adição de loja -->
                        <div class="form-group">
                            <label for="storeName">Nome da Loja</label>
                            <input type="text" class="form-control" id="storeName" name="storeName" required>
                        </div>
                        <div class="form-group">
                            <label for="storeStatus">Status</label>
                            <select class="form-control" id="storeStatus" name="storeStatus" required>
                                <option value="Descoberto">Lead Descoberto</option>
                                <option value="Coberto">Lead Coberto</option>
                                <option value="Ativo">Lead Ativo</option>
                                <option value="Inativo">Lead Inativo</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="storeAddress">Endereço</label>
                            <input type="text" class="form-control" id="storeAddress" name="storeAddress" required>
                        </div>
                        <div class="form-group">
                            <label for="storeDescription">Descrição</label>
                            <textarea class="form-control" id="storeDescription" name="storeDescription" rows="3" required></textarea>
                        </div>
                        <div class="form-group">
                            <label for="storeSeller">Vendedor</label>
                            <input type="text" class="form-control" id="storeSeller" name="storeSeller" required>
                        </div>
                        <div class="form-group">
                            <label for="storePhone">Telefone</label>
                            <input type="tel" class="form-control" id="storePhone" name="storePhone" required>
                        </div>
                        <div class="form-group">
                            <label for="storeEmail">E-mail</label>
                            <input type="email" class="form-control" id="storeEmail" name="storeEmail" required>
                        </div>
                        <div class="form-group">
                            <label for="storeInstagram">Instagram</label>
                            <input type="text" class="form-control" id="storeInstagram" name="storeInstagram">
                        </div>
                        <div class="form-group">
                            <label for="storeWebsite">Site</label>
                            <input type="url" class="form-control" id="storeWebsite" name="storeWebsite">
                        </div>
                        <div class="form-group">
                            <label for="storeDecider">Nome do Decisor</label>
                            <input type="text" class="form-control" id="storeDecider" name="storeDecider" required>
                        </div>
                        <div class="form-group">
                            <label for="storeDeciderPhone">Telefone do Decisor</label>
                            <input type="tel" class="form-control" id="storeDeciderPhone" name="storeDeciderPhone" required>
                        </div>
                        <button type="submit" class="btn btn-primary">Salvar</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal de Detalhes da Loja -->
    <div class="modal fade" id="storeDetailModal" tabindex="-1" role="dialog" aria-labelledby="storeDetailModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="storeDetailModalLabel">Detalhes da Loja</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body" id="storeDetailContent">
                    <!-- Conteúdo dos detalhes da loja será carregado aqui -->
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                    <button type="button" class="btn btn-primary" id="editStoreButton">Editar</button>
                    <button type="button" class="btn btn-danger" id="deleteStoreButton">Excluir</button>

                </div>
            </div>
        </div>
    </div>

    <!-- Modal de Filtro -->
    <div class="modal fade" id="filterModal" tabindex="-1" role="dialog" aria-labelledby="filterModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="filterModalLabel">Selecionar Parâmetros de Filtro</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="filterStatus">Filtrar por Status:</label>
                        <select class="form-control" id="filterStatus">
                            <option value="">Todos</option>
                            <option value="Descoberto">Lead Descoberto</option>
                            <option value="Coberto">Lead Coberto</option>
                            <option value="Ativo">Lead Ativo</option>
                            <option value="Inativo">Lead Inativo</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="filterVendedor">Filtrar por Vendedor:</label>
                        <select class="form-control" id="filterVendedor">
                            <!-- Options serão carregadas dinamicamente via JavaScript -->
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="filterAddress">Filtrar por Endereço (Palavra-chave):</label>
                        <input type="text" class="form-control" id="filterAddress">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                    <button type="button" class="btn btn-primary" id="applyFilterButton">Aplicar Filtro</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal de Progresso do Upload -->
    <div class="modal fade" id="uploadProgressModal" tabindex="-1" role="dialog" aria-labelledby="uploadProgressModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="uploadProgressModalLabel">Progresso do Upload</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="progress">
                        <div id="uploadProgressBar" class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0%"></div>
                    </div>
                    <p id="uploadProgressText" class="mt-2 text-center">0%</p>
                </div>
            </div>
        </div>
    </div>

    <!-- Google Maps API -->
    <script>
        let map;
        let geocoder;
        let infowindow;

        function initMap() {
            map = new google.maps.Map(document.getElementById('map'), {
                center: { lat: -27.5969, lng: -48.5495 }, // São Paulo, Brasil (centrado por padrão)
                zoom: 10
            });

            geocoder = new google.maps.Geocoder();
            infowindow = new google.maps.InfoWindow();

            loadStores();
        }

        // Função para carregar lojas com base nos filtros selecionados
function loadStores(status, vendedor, addressKeyword) {
    let url = `http://localhost/google-maps/functions_php/getLojas.php`;

    let params = [];
    if (status) params.push(`status=${encodeURIComponent(status)}`);
    if (vendedor) params.push(`vendedor=${encodeURIComponent(vendedor)}`);
    if (addressKeyword) params.push(`addressKeyword=${encodeURIComponent(addressKeyword)}`);

    if (params.length > 0) {
        url += '?' + params.join('&');
    }

    fetch(url)
        .then(response => response.json())
        .then(data => {
            clearStoreList(); // Limpar a lista existente antes de adicionar as lojas filtradas
            clearMarkers(); // Limpar marcadores existentes no mapa

            data.forEach(loja => {
                geocodeAddress(loja.endereco, function (location) {
                    addMarker(location, loja);
                });

                addStoreToList(loja);
            });
        })
        .catch(error => console.error('Erro ao carregar lojas:', error));
}

function clearStoreList() {
    document.getElementById('storeList').innerHTML = '';
}

// Aplicar filtro
document.getElementById('applyFilterButton').addEventListener('click', function () {
    let status = document.getElementById('filterStatus').value;
    let vendedor = document.getElementById('filterVendedor').value;
    let addressKeyword = document.getElementById('filterAddress').value;

    loadStores(status, vendedor, addressKeyword);

    $('#filterModal').modal('hide');
});


        function geocodeAddress(address, callback) {
            geocoder.geocode({ 'address': address }, function (results, status) {
                if (status === 'OK') {
                    callback(results[0].geometry.location);
                } else {
                    console.error('Geocode falhou para o seguinte motivo: ' + status);
                }
            });
        }

        function addMarker(location, loja) {
            let marker = new google.maps.Marker({
                position: location,
                map: map,
                title: loja.nome,
                animation: google.maps.Animation.DROP
            });

            marker.addListener('click', function () {
                showStoreDetails(loja);
            });

            markers.push(marker);
        }

        function clearMarkers() {
            markers.forEach(marker => {
                marker.setMap(null);
            });
            markers = [];
        }

        function addStoreToList(loja) {
    let statusClass = getStatusClass(loja.status);

    let storeItem = `
        <a href="#" class="list-group-item list-group-item-action mb-3" data-id="${loja.id}">
            <div class="d-flex w-100 justify-content-between">
                <h5 class="mb-1">${loja.nome}</h5>
                <small><span class="status-indicator ${statusClass}"></span>${loja.status}</small>
            </div>
            <p class="mb-1">${loja.endereco}</p>
            <small>Vendedor: ${loja.vendedor}</small>
        </a>`;

    document.getElementById('storeList').insertAdjacentHTML('beforeend', storeItem);
    document.querySelector(`[data-id="${loja.id}"]`).addEventListener('click', function() {
        showStoreDetails(loja);
    });
}

        function clearStoreList() {
            document.getElementById('storeList').innerHTML = '';
        }

        function showStoreOnMap(id) {
            let store = stores.find(store => store.id === id);
            if (store) {
                let position = { lat: parseFloat(store.latitude), lng: parseFloat(store.longitude) };
                map.setCenter(position);
                map.setZoom(15);

                let marker = markers.find(marker => marker.getTitle() === store.nome);
                if (marker) {
                    google.maps.event.trigger(marker, 'click');
                }
            }
        }

        function showStoreDetails(loja) {
            let detailContent = `
                <h4>${loja.nome}</h4>
                <p><strong>Status:</strong> ${loja.status}</p>
                <p><strong>Endereço:</strong> ${loja.endereco}</p>
                <p><strong>Descrição:</strong> ${loja.anotacao}</p>
                <p><strong>Vendedor:</strong> ${loja.vendedor}</p>
                <h5>Contato</h5>
                <p><strong>Telefone:</strong> ${loja.telefone}</p>
                <p><strong>E-mail:</strong> ${loja.email}</p>
                <p><strong>Instagram: </strong> ${loja.instagram}</p>
                <p><strong>Site: </strong> ${loja.site}</p>
                <p>_______________________________________</p>
                <p><strong>Nome Decisor: </strong> ${loja.decisor}</p>
                <p><strong>Contato Deciso: </strong> ${loja.telefone_decisor}</p>
            `;

            document.getElementById('storeDetailContent').innerHTML = detailContent;

            // Adiciona evento ao botão de editar
            document.getElementById('editStoreButton').addEventListener('click', function () {
                // Implementar função de edição aqui, se necessário
                console.log('Editar loja:', loja);
            });

            // Adiciona evento ao botão de excluir
            document.getElementById('deleteStoreButton').addEventListener('click', function () {
                // Implementar função de exclusão aqui, se necessário
                console.log('Excluir loja:', loja);
            });

            $('#storeDetailModal').modal('show');
        }

        function getStatusClass(status) {
            switch (status) {
                case 'Descoberto':
                    return 'bg-dark';
                case 'Coberto':
                    return 'bg-primary';
                case 'Ativo':
                    return 'bg-success';
                case 'Inativo':
                    return 'bg-danger';
                default:
                    return 'bg-secundary';
            }
        }

        // Carregar vendedores para o filtro
        function loadVendedores() {
    fetch('http://localhost/google-maps/functions_php/getVendedores.php')
        .then(response => response.json())
        .then(data => {
            let filterVendedorSelect = document.getElementById('filterVendedor');
            filterVendedorSelect.innerHTML = ''; // Limpar opções anteriores

            let defaultOption = document.createElement('option');
            defaultOption.value = '';
            defaultOption.textContent = 'Todos';
            filterVendedorSelect.appendChild(defaultOption);

            data.forEach(vendedor => {
                let option = document.createElement('option');
                option.value = vendedor;
                option.textContent = vendedor;
                filterVendedorSelect.appendChild(option);
            });
        })
        .catch(error => console.error('Erro ao carregar vendedores:', error));
}

document.addEventListener('DOMContentLoaded', function () {
    loadVendedores();
});



        // Aplicar filtro
document.getElementById('applyFilterButton').addEventListener('click', function () {
    let status = document.getElementById('filterStatus').value;
    let vendedor = document.getElementById('filterVendedor').value;
    let addressKeyword = document.getElementById('filterAddress').value;

    loadStores(status, vendedor, addressKeyword);

    $('#filterModal').modal('hide');
});

// Função para carregar lojas com base nos filtros selecionados
function loadStores(status, vendedor, addressKeyword) {
    let url = `http://localhost/google-maps/functions_php/getLojas.php`;

    let params = [];
    if (status) params.push(`status=${encodeURIComponent(status)}`);
    if (vendedor) params.push(`vendedor=${encodeURIComponent(vendedor)}`);
    if (addressKeyword) params.push(`addressKeyword=${encodeURIComponent(addressKeyword)}`);

    if (params.length > 0) {
        url += '?' + params.join('&');
    }

    fetch(url)
        .then(response => response.json())
        .then(data => {
            clearStoreList(); // Limpar a lista existente antes de adicionar as lojas filtradas
            clearMarkers(); // Limpar marcadores existentes no mapa

            data.forEach(loja => {
                geocodeAddress(loja.endereco, function (location) {
                    addMarker(location, loja);
                });

                addStoreToList(loja);
            });
        })
        .catch(error => console.error('Erro ao carregar lojas:', error));
}


        // Enviar formulário de upload
        document.getElementById('uploadForm').addEventListener('submit', function (event) {
            event.preventDefault();

            let formData = new FormData(this);

            $('#uploadProgressModal').modal('show');

            fetch('functions_php/upload.php', {
                method: 'POST',
                body: formData,
                headers: {
                    'Accept': 'application/json'
                }
            })
            .then(response => response.json())
            .then(data => {
                $('#uploadProgressModal').modal('hide');
                alert('Upload concluído com sucesso!');
                console.log('Resposta do servidor:', data);
            })
            .catch(error => {
                $('#uploadProgressModal').modal('hide');
                alert('Erro ao realizar upload. Verifique o console para mais detalhes.');
                console.error('Erro no upload:', error);
            });
        });

        // Inicialização
        let markers = [];
        let stores = []; // Para armazenar todas as lojas carregadas

        document.addEventListener('DOMContentLoaded', function () {
            loadVendedores();
        });


        // Envio Formulário ADD LOJA

        document.getElementById('storeForm').addEventListener('submit', function (event) {
    event.preventDefault();

    let formData = new FormData(this);

    fetch('functions_php/addStore.php', {
        method: 'POST',
        body: formData
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            alert('Loja adicionada com sucesso!');
            $('#addStoreModal').modal('hide');
            loadStores(); // Recarregar as lojas para incluir a nova
        } else {
            alert('Erro ao adicionar loja: ' + data.message);
        }
    })
    .catch(error => {
        console.error('Erro ao adicionar loja:', error);
        alert('Erro ao adicionar loja. Verifique o console para mais detalhes.');
    });
});

// ATUALIZAR LOJA

document.getElementById('editStoreButton').addEventListener('click', function() {
    fillEditForm(currentStore);
    $('#addStoreModal').modal('show');
});

function fillEditForm(loja) {
    document.getElementById('storeId').value = loja.id;
    document.getElementById('storeName').value = loja.nome;
    document.getElementById('storeStatus').value = loja.status;
    document.getElementById('storeAddress').value = loja.endereco;
    document.getElementById('storeDescription').value = loja.anotacao;
    document.getElementById('storeSeller').value = loja.vendedor;
    document.getElementById('storePhone').value = loja.telefone;
    document.getElementById('storeEmail').value = loja.email;
    document.getElementById('storeInstagram').value = loja.instagram;
    document.getElementById('storeWebsite').value = loja.site;
    document.getElementById('storeDecider').value = loja.decisor;
    document.getElementById('storeDeciderPhone').value = loja.telefone_decisor;
}

document.getElementById('storeForm').addEventListener('submit', function(event) {
    event.preventDefault();

    let formData = new FormData(this);
    let storeId = document.getElementById('storeId').value;

    let url = storeId ? 'functions_php/updateStore.php' : 'functions_php/addStore.php';

    fetch(url, {
        method: 'POST',
        body: formData
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            alert('Operação realizada com sucesso!');
            $('#addStoreModal').modal('hide');
            loadStores(); // Recarregar as lojas para incluir as atualizações
        } else {
            alert('Erro ao realizar operação: ' + data.message);
        }
    })
    .catch(error => {
        console.error('Erro ao realizar operação:', error);
        alert('Erro ao realizar operação. Verifique o console para mais detalhes.');
    });
});

let currentStore = null;

function showStoreDetails(loja) {
    currentStore = loja; // Armazenar a loja atual para edição
    let detailContent = `
        <h4>${loja.nome}</h4>
        <p><strong>Status:</strong> ${loja.status}</p>
        <p><strong>Endereço:</strong> ${loja.endereco}</p>
        <p><strong>Descrição:</strong> ${loja.anotacao}</p>
        <p><strong>Vendedor:</strong> ${loja.vendedor}</p>
        <h5>Contato</h5>
        <p><strong>Telefone:</strong> ${loja.telefone}</p>
        <p><strong>E-mail:</strong> ${loja.email}</p>
        <p><strong>Instagram: </strong> ${loja.instagram}</p>
        <p><strong>Site: </strong> ${loja.site}</p>
        <p>_______________________________________</p>
        <p><strong>Nome Decisor: </strong> ${loja.decisor}</p>
        <p><strong>Contato Deciso: </strong> ${loja.telefone_decisor}</p>
    `;

    document.getElementById('storeDetailContent').innerHTML = detailContent;

    $('#storeDetailModal').modal('show');
}
// EXCLUIR LOJA 

document.getElementById('deleteStoreButton').addEventListener('click', function() {
    if (confirm('Tem certeza que deseja excluir esta loja?')) {
        deleteStore(currentStore.id);
    }
});


function deleteStore(id) {
    fetch(`functions_php/deleteStore.php?id=${id}`, {
        method: 'DELETE'
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            alert('Loja excluída com sucesso!');
            $('#storeDetailModal').modal('hide');
            loadStores(); // Recarregar as lojas após a exclusão
        } else {
            alert('Erro ao excluir loja: ' + data.message);
        }
    })
    .catch(error => {
        console.error('Erro ao excluir loja:', error);
        alert('Erro ao excluir loja. Verifique o console para mais detalhes.');
    });
}


    </script>

    <!-- Google Maps JavaScript API -->
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAKted5cWGD3ZbK7LuMDk9HSktO4FLF2oA&callback=initMap" async defer></script>
    <!-- jQuery, Popper.js, Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>

