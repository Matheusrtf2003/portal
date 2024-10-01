<?php
session_start();
if (!isset($_SESSION['user_id'])) {
    header("Location: ../index.php");
    exit;
}

include '../functions/config.php';

$stmtUsuarios = $pdo->prepare("SELECT id, nome FROM users");
$stmtUsuarios->execute();
$usuarios = $stmtUsuarios->fetchAll(PDO::FETCH_ASSOC);
?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Cache-Control" content="no-cache" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="statics\img\favi-icon.png" type="image/x-icon">
    <link rel="stylesheet" href="statics/css/maps.css">
    <link rel="stylesheet" href="statics/css/legenda.css">
    <link rel="stylesheet" href="../sidebar/css/sidebar.css">
    <title>Lojas</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
</head>
<body>
    <?php include '../sidebar/sidebar.php'; ?>

    <div class="container-fluid d-flex flex-column" style="height: 100vh;">
        <div class="row flex-grow-1" style="margin-left: 100px;">
            <div class="col-lg-3 barra-lateral bg-light">
                <input type="text" id="searchInput" class="form-control mb-3" placeholder="Pesquisar por Nome, Cidade ou Estado">
                <!-- Botão para abrir o modal de filtro por estado -->
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#filterStateModal">
                    Filtrar por Estado
                </button>
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#filterUsuarioModal">
                    Filtrar por Usuário
                </button>
                <div class="d-flex mb-3">
                    <button type="button" class="btn btn-secondary mr-2" data-toggle="modal" data-target="#filterStatusModal">Filtrar por Status</button>
                    <button type="button" class="btn btn-secondary" data-toggle="modal" data-target="#filterMarkerModal">Filtrar por Marcador</button>
                </div>
                <!-- Botão Mapear 
                <button type="button" class="btn btn-success" id="mapButton" disabled onclick="mapSelectedState()">
                    Mapear
                </button> -->
                <div id="resultCount"></div> <!-- Elemento para mostrar o total de resultados -->
                <label>
                    <input type="checkbox" id="selectAllCheckbox"> Selecionar todas
                </label>
                <div class="list-group mt-0" id="storeList">
                    <!-- Lista de lojas será carregada aqui -->
                </div>
            </div>
            <div class="col-lg-9">
            <div class="map-legend">
            <h5>Legenda do Mapa</h5>
            <ul>
                <li><span class="status-descoberto"></span> Descoberto</li>
                <li><span class="status-coberto"></span> Coberto</li>
                <li><span class="status-ativo"></span> Ativo</li>
                <li><span class="status-inativo"></span> Inativo</li>
            </ul>
            </div>
                <div id="map"></div>
            </div>
        </div>
    </div>
    <?php include '../MenuUsuario/user_menu.php'; ?>

    <!-- Modal Filtrar por Status -->
    <div class="modal fade" id="filterStatusModal" tabindex="-1" aria-labelledby="filterStatusModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="filterStatusModalLabel">Filtrar por Status</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="filterStatusForm">
                        <div class="form-group">
                            <label for="filterStatusSelect">Status:</label>
                            <select class="form-control p-0" id="filterStatusSelect" name="status">
                                <option value="">Todos</option>
                                <option value="Descoberto">Descoberto</option>
                                <option value="Coberto">Coberto</option>
                                <option value="Ativo">Ativo</option>
                                <option value="Inativo">Inativo</option>
                            </select>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                    <button type="button" class="btn btn-primary" onclick="filterByStatus()">Filtrar</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal Filtrar por Marcador -->
<div class="modal fade" id="filterMarkerModal" tabindex="-1" aria-labelledby="filterMarkerModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="filterMarkerModalLabel">Filtrar por Marcador</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="filterMarkerForm">
                    <div class="form-group">
                        <label for="filterMarkerSelect">Marcador:</label>
                        <select class="form-control p-0" id="filterMarkerSelect" name="marker">
                            <option value="">Selecione um marker</option>
                            <option value="Cosméticos Geral">Cosméticos Geral</option>
                            <option value="ICP">ICP</option>
                        </select>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                <button type="button" class="btn btn-primary" onclick="filterByMarker()">Filtrar</button>
            </div>
        </div>
    </div>
</div>

    <!-- Modal de filtro por estado -->
    <div class="modal fade" id="filterStateModal" tabindex="-1" role="dialog" aria-labelledby="filterStateModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="filterStateModalLabel">Filtrar por Estado</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <select id="filterStateSelect" class="form-control p-0" onchange="activateMapButton()">
                        <option value="">Selecione um estado</option>
                        <option value="AC">Acre</option>
                        <option value="AL">Alagoas</option>
                        <option value="AP">Amapá</option>
                        <option value="AM">Amazonas</option>
                        <option value="BA">Bahia</option>
                        <option value="CE">Ceará</option>
                        <option value="DF">Distrito Federal</option>
                        <option value="ES">Espírito Santo</option>
                        <option value="GO">Goiás</option>
                        <option value="MA">Maranhão</option>
                        <option value="MT">Mato Grosso</option>
                        <option value="MS">Mato Grosso do Sul</option>
                        <option value="MG">Minas Gerais</option>
                        <option value="PA">Pará</option>
                        <option value="PB">Paraíba</option>
                        <option value="PR">Paraná</option>
                        <option value="PE">Pernambuco</option>
                        <option value="PI">Piauí</option>
                        <option value="RJ">Rio de Janeiro</option>
                        <option value="RN">Rio Grande do Norte</option>
                        <option value="RS">Rio Grande do Sul</option>
                        <option value="RO">Rondônia</option>
                        <option value="RR">Roraima</option>
                        <option value="SC">Santa Catarina</option>
                        <option value="SP">São Paulo</option>
                        <option value="SE">Sergipe</option>
                        <option value="TO">Tocantins</option>
                    </select>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                    <button type="button" class="btn btn-primary" onclick="filterByState()">Aplicar Filtro</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal de filtro por Usuário -->
    <div class="modal fade" id="filterUsuarioModal" tabindex="-1" role="dialog" aria-labelledby="filterUsuarioModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="filterUsuarioModalLabel">Filtrar por Usuário</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <select id="filterUsuarioSelect" class="form-control p-0">
                        <option value="">Selecione um Usuário</option>
                        <?php foreach ($usuarios as $usuario): ?>
                            <option value="<?php echo htmlspecialchars($usuario['id']); ?>"><?php echo htmlspecialchars($usuario['nome']); ?></option>
                        <?php endforeach; ?>
                    </select>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                    <button type="button" class="btn btn-primary" onclick="filterByUser()">Aplicar Filtro</button>
                </div>
            </div>
        </div>
    </div>

    <!-- jQuery, Popper.js, Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="statics/js/Maps/mapMarkers.js"></script>
    <script src="statics/js/Maps/geocoding.js"></script>
    <script src="statics/js/Maps/storeManagement.js"></script>
    <script src="statics/js/Maps/storeFilters.js"></script>
    <script src="statics/js/Maps/domEvents.js"></script>
    <script 
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAnqVbnVlRY2EaQL7pzLQMKMhBGxm6T02c&loading=async&callback=initMap" async>
    </script>
</body>
</html>

