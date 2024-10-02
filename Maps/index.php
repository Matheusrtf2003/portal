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
                <input type="text" id="searchInput" class="form-control p-1 mb-3" placeholder="Pesquisar por Nome, Cidade ou Estado">
                <!-- Botão para abrir o modal de filtro por estado -->
                    <!-- Botão para abrir o modal -->
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#filterModal">
                Filtrar Por
                </button>
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

<!-- Modal -->
<div class="modal fade" id="filterModal" tabindex="-1" role="dialog" aria-labelledby="filterModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="filterModalLabel">Filtros</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <!-- Campos de filtro -->
        <form id="filterForm">
          <div class="form-group">
            <label for="filterStatus">Status</label>
            <select class="form-control p-1" id="filterStatusSelect">
              <option value="">Todos</option>
              <option value="Ativo">Ativo</option>
              <option value="Inativo">Inativo</option>
              <option value="Coberto">Coberto</option>
              <option value="Descoberto">Descoberto</option>
              <!-- Adicione mais opções conforme necessário -->
            </select>
          </div>
          <div class="form-group">
            <label for="filterUsuario">Usuário</label>
            <select class="form-control p-1" id="filterUsuarioSelect">
              <!-- Carregar opções dinamicamente no JavaScript -->
            </select>
          </div>
          <div class="form-group">
            <label for="filterState">Estado</label>
            <select class="form-control p-1" id="filterStateSelect">
              <!-- Adicione estados aqui -->
              <option value="">Todos</option>
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
              <!-- Mais estados... -->
            </select>
          </div>
          <div class="form-group">
            <label for="filterMarker">Marcador</label>
            <select class="form-control p-1" id="filterMarkerSelect">
              <!-- Carregar opções dinamicamente no JavaScript -->
            </select>
          </div>

          <!-- Filtro de Cidade -->
          <div class="form-group">
            <label for="filterCity">Cidade</label>
            <select class="form-control p-1" id="filterCitySelect">
              <!-- Carregar opções dinamicamente -->
            </select>
          </div>

          <!-- Filtro de Mesorregião -->
          <div class="form-group">
            <label for="filterMesorregiao">Mesorregião</label>
            <select class="form-control p-1" id="filterMesorregiaoSelect">
              <!-- Carregar opções dinamicamente -->
            </select>
          </div>
          
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
        <button type="button" class="btn btn-primary" id="applyFilterButton">Aplicar Filtros</button>
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

