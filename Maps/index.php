<?php
session_start();
if (!isset($_SESSION['user_id'])) {
    echo json_encode(["success" => false, "error" => "Usuário não autenticado."]);
    exit();
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
  <link rel="icon" href="../statics/img/favi-icon.png" type="image/x-icon">
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
        <button id="clearFiltersButton" class="btn btn-secondary" style="margin-top: 10px;">Limpar Filtros</button>
        <!-- Botão Mapear 
                <button type="button" class="btn btn-success" id="mapButton" disabled onclick="mapSelectedState()">
                    Mapear
                </button> -->
        <div id="resultCount"></div> <!-- Elemento para mostrar o total de resultados -->
        <div id="loading">
            <img style='max-width: 50px;' src="https://lh3.googleusercontent.com/proxy/9rLje0-3FNznCiW_PB26zLjadDVYYEDc6WyBUIcYBKXfbLZN8VMuPw_lBCo2FRl6ap4JPSUJGCqL8Q6FFb3oNEOY2JGJPKfGq_LdtfcP6nnp3dCWqZwQ27aW8_hbp3Zxcy9_rWFxryXb" alt="Loading..." />
        </div>
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
              <label for="filterPerfil">Perfil da Loja</label>
              <select class="form-control p-1" id="filterPerfilSelect">
                  <option value="">Todos os perfis</option>
                  <option value="ICP">ICP</option>
                  <option value="Cosmético Geral">Cosmético Geral</option>
                  <!-- Adicione outros perfis conforme necessário -->
              </select>
          </div>
            <div class="form-group">
              <label for="filterUsuario">Hunter</label>
              <select class="form-control p-1" id="filterHunterSelect">
                  <option value="">Todos os hunters</option>
              </select>
            </div>
            <div class="form-group">
              <label for="filterVendedor">Vendedor</label>
              <select id="filterVendedorSelect" class="form-control p-1">
                <option value="">Todos os vendedores</option>
                <!-- As opções serão carregadas dinamicamente -->
              </select>
            </div>
            <div class="form-group">
              <label for="filterState">Estado</label>
              <select class="form-control p-1" id="filterStateSelect">
                <!-- Adicione estados aqui -->
                <option value="">Todos</option>
                <option value="1">Acre</option>
                <option value="2">Alagoas</option>
                <option value="3">Amapá</option>
                <option value="4">Amazonas</option>
                <option value="5">Bahia</option>
                <option value="6">Ceará</option>
                <option value="7">Distrito Federal</option>
                <option value="8">Espírito Santo</option>
                <option value="9">Goiás</option>
                <option value="10">Maranhão</option>
                <option value="11">Mato Grosso</option>
                <option value="12">Mato Grosso do Sul</option>
                <option value="13">Minas Gerais</option>
                <option value="14">Pará</option>
                <option value="15">Paraíba</option>
                <option value="16">Paraná</option>
                <option value="17">Pernambuco</option>
                <option value="18">Piauí</option>
                <option value="19">Rio de Janeiro</option>
                <option value="20">Rio Grande do Norte</option>
                <option value="21">Rio Grande do Sul</option>
                <option value="22">Rondônia</option>
                <option value="23">Roraima</option>
                <option value="24">Santa Catarina</option>
                <option value="25">São Paulo</option>
                <option value="26">Sergipe</option>
                <option value="27">Tocantins</option>
              </select>
            <!--</div>
             Filtro de Cidade -->
            <!-- Adicione estados aqui <div class="form-group">
              <label for="filterCity">Cidade</label>
              <select class="form-control p-1" id="filterCitySelect"> 
               Carregar opções dinamicamente
              </select> 
            </div> -->
          </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
          <button type="button" class="btn btn-primary" id="applyFilterButton">Aplicar Filtros</button>
        </div>
      </div>
    </div>
  </div>

  <!-- Modal para Adicionar Vendedor -->
<div class="modal fade" id="addVendedorModal" tabindex="-1" aria-labelledby="addVendedorModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addVendedorModalLabel">Adicionar Vendedor</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
              <form id="addVendedorForm">
                  <div class="form-group">
                      <label for="goalUsers">Escolha o Vendedor:</label>
                      <select class="form-control p-0" id="goalUsers" required>
                          <option value="">Selecione um vendedor</option>
                          <!-- As opções de vendedores serão inseridas aqui -->
                      </select>
                    </div>
                    <button type="submit" id="addVendedorButton" class="btn btn-primary">Adicionar</button>
                </form>
            </div>
        </div>
    </div>
</div>
  

  <!-- jQuery, Popper.js, Bootstrap JS -->
  <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <script src="statics/js/mapMarkers.js" type="module"></script>
  <script src="statics/js/geocoding.js" type="module"></script>
  <script src="statics/js/storeManagement.js" type="module"></script>
  <script src="statics/js/storeFilters.js" type="module"></script>
  <script src="statics/js/domEvents.js" type="module"></script>
  <script src="statics/js/enviaAgendor.js"></script>
  <script type='module' src="statics/js/apis.js"></script>
  <script type='module' src="statics/js/coordinates.js"></script>
  <script type='module' src="statics/js/utils.js"></script>
  <script type='module' src="statics/js/loadMarkers.js"></script>
  <script
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAnqVbnVlRY2EaQL7pzLQMKMhBGxm6T02c&loading=async&callback=initMap" async>
  </script>
</body>

</html>