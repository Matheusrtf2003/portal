<?php
session_start();
if (!isset($_SESSION['user_id'])) {
    header("Location: ../index.php");
    exit;
}
?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lojas</title>
    <link rel="icon" href="/statics/img/favi-icon.png" type="image/x-icon">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="statics/css/lojas.css">
    <link rel="stylesheet" href="../sidebar/css/sidebar.css">
</head>
<body>
    <?php include '../sidebar/sidebar.php'; ?>
    <?php include '../MenuUsuario/user_menu.php'; ?>

    <div class="container-fluid">
        <div class="row">
            <div class="col-md-10 offset-md-1">
                <h1 style="margin-top: 20px;">Lojas</h1>
                <button type="button" class="btn btn-info" data-toggle="modal" data-target="#addStoreModal">Adicionar Loja</button>
                <button type="button" class="btn btn-primary" onclick="checkAllCNPJs()">Verificar CNPJs no Tiny</button>
                <button id="updateMissingAddresses" class="btn btn-primary">Atualizar Endereços Faltantes</button>
                <input type="text" id="searchInput" class="form-control p-1 mt-3 mb-3" placeholder="Pesquisar por algo...">
                <button type="button" class="btn btn-secondary mt-3 mb-3" data-toggle="modal" data-target="#filterModal">Filtrar</button>
                <button type="button" class="btn btn-danger mt-3 mb-3" onclick="resetFilters()">Limpar Filtros</button>

                <!-- Botão para abrir o modal de importação -->
                <button type="button" class="btn btn-success mt-3" data-toggle="modal" data-target="#importLojasModal">
                    Importar Lojas
                </button>

                <!-- Exibir mensagem de status -->
                <div id="importStatus" class="mt-3"></div>
                
                <a href="archives/planilha_modelo.csv" class="btn btn-link mt-3 mb-3" download="CSV_Modelo_Lojas.csv">Baixar Planilha Modelo</a>
                <button type="button" class="btn btn-danger mt-3 mb-3 ml-3" onclick="deleteSelectedStores()">Excluir Selecionadas</button>
                <button type="button" class="btn btn-primary mt-3 mb-3" onclick="openAssignVendedorModalMultiple()">Atribuir Vendedor às Selecionadas</button>

                <?php if ($user && $user['tipo'] === 'Administrador'): ?>
                    <button onclick="exportAllDataToExcel()" class="btn btn-warning mt-3 mb-3">Exportar para Excel</button>
                <?php endif; ?>
                <div id="storeCount" class="mt-3 mb-3"></div> <!-- Elemento para mostrar a contagem de lojas -->
                <div class="table-responsive">
                    <table class="table table-bordered" id="storesTable">
                    <thead>
                        <tr>
                            <th><input type="checkbox" id="selectAll"></th>
                            <th>ID</th>
                            <th>Ações</th>
                            <th>Hunter</th>
                            <th>Vendedor</th>
                            <th>Nome</th>
                            <th>CNPJ</th>
                            <th>Status</th>
                            <th>Endereço</th>
                            <th>Cidade</th>
                            <th>Estado</th>
                            <th>Mesorregião</th>
                            <th>Especialidade</th>
                            <th>Telefone</th>
                            <th>Instagram</th>
                            <th>Site</th>
                            <th>Decisor</th>
                            <th>Telefone Decisor</th>
                            <th>E-mail</th>
                            <th>Perfil da Loja</th>
                            <th>Marcadores</th>
                            <th>Data Registro</th>
                        </tr>
                    </thead>

                        <tbody>
                            <!-- Lojas serão carregadas aqui -->
                        </tbody>
                    </table>
                </div>
                <div class="pagination-controls">
                    <button class="btn btn-secondary" id="prevPage" onclick="changePage(-1)">Anterior</button>
                    <span id="currentPageDisplay" style="margin: 0 15px;">Página 1 de 1</span>
                    <button class="btn btn-secondary" id="nextPage" onclick="changePage(1)">Próximo</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal Adicionar Loja -->
    <div class="modal fade" id="addStoreModal" tabindex="-1" aria-labelledby="addStoreModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addStoreModalLabel">Adicionar Loja</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="storeForm">
                    <input type="hidden" id="storeId" name="storeId">

                        <!-- Campo de seleção para Vendedores -->

                        <!-- Nome -->
                        <div class="form-group">
                            <label for="storeName">Nome:</label>
                            <input type="text" class="form-control p-1" id="storeName" autocomplete="name" name="nome">
                        </div>

                        <!-- CNPJ -->
                        <div class="form-group">
                            <label for="cnpj">CNPJ:</label>
                            <input type="text" class="form-control p-1" id="cnpj" name="cnpj" placeholder="Digite o CNPJ" maxlength="18">
                        </div>

                        <!-- Status -->
                        <div class="form-group">
                            <label for="storeStatus">Status:</label>
                            <select class="form-control p-1" id="storeStatus" name="status">
                                <option value="Descoberto">Descoberto</option>
                                <option value="Coberto">Coberto</option>
                                <option value="Ativo">Ativo</option>
                                <option value="Inativo">Inativo</option>
                            </select>
                        </div>

                        <!-- Endereço -->
                        <div class="form-group">
                            <label for="storeAddress">Endereço:</label>
                            <input type="text" class="form-control p-1" id="storeAddress" name="endereco">
                            <button type="button" class="btn btn-primary" id="pesquisar-cnpj" style="margin-top: 20px;">Pesquisar Endereço na Receita</button>
                        </div>

                        <!-- Cidade -->
                        <div class="form-group">
                            <label for="storeCity">Cidade:</label>
                            <input type="text" class="form-control p-1" id="storeCity" name="cidade">
                        </div>

                        <!-- Estado -->
                        <div class="form-group">
                            <label for="storeState">Estado (UF):</label>
                            <select class="form-control p-1" id="storeState" name="estado">
                                <option value="" disabled selected>Selecione um estado</option>
                            </select>
                        </div>

                        <!-- Mesorregião -->
                        <div class="form-group">
                            <label for="storeMesorregiao">Mesorregião:</label>
                            <select class="form-control p-1" id="storeMesorregiao" name="mesorregiao">
                                <option value="" disabled selected>Selecione uma mesorregião</option>
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="storeMarker">Marcadores:</label>
                            <?php
                            // Pegar os marcadores da tabela markers
                            $stmt = $pdo->prepare("SELECT id, nome FROM markers");
                            $stmt->execute();
                            $marcadores = $stmt->fetchAll(PDO::FETCH_ASSOC);

                            foreach ($marcadores as $marcador) {
                                echo '<div class="form-check">';
                                echo '<input class="form-check-input" type="checkbox" name="markers[]" value="' . $marcador['id'] . '" id="marker' . $marcador['id'] . '">';
                                echo '<label class="form-check-label" for="marker' . $marcador['id'] . '">' . $marcador['nome'] . '</label>';
                                echo '</div>';
                            }
                            ?>
                        </div>

                        <div class="form-group">
                            <label for="perfilLoja">Perfil da Loja:</label>
                            <select class="form-control p-1" id="perfilLoja" name="perfil_loja">
                                <option value="ICP">ICP</option>
                                <option value="Cosmético Geral">Cosmético Geral</option>
                            </select>
                        </div>



                        <div class="form-group">
                            <label for="storeAnotacao">Especialidade:</label>
                            <select class="form-control p-1" id="storeAnotacao" name="anotacao">
                                <option value="Geral">Geral</option>
                                <option value="Unhas">Unhas</option>
                                <option value="Cílios">Cílios</option>
                                <option value="Sobrancelha">Sobrancelha</option>
                                <option value="Unhas/Cílios">Unhas/Cílios</option>
                                <option value="Unhas/Sobrancelha">Unhas/Sobrancelha</option>
                                <option value="Cílios/Sobrancelha">Cílios/Sobrancelha</option>
                                <option value="Trio">Trio</option>
                            </select>
                        </div>

                        <!-- Telefone -->
                        <div class="form-group">
                            <label for="storePhone">Telefone:</label>
                            <input type="text" class="form-control p-1" id="storePhone" name="telefone">
                        </div>

                        <!-- Instagram -->
                        <div class="form-group">
                            <label for="storeInstagram">Instagram:</label>
                            <input type="text" class="form-control p-1" id="storeInstagram" name="instagram">
                        </div>

                        <!-- Site -->
                        <div class="form-group">
                            <label for="storeWebsite">Site:</label>
                            <input type="text" class="form-control p-1" id="storeWebsite" name="site">
                        </div>

                        <!-- Nome Decisor -->
                        <div class="form-group">
                            <label for="storeDecider">Nome Decisor:</label>
                            <input type="text" class="form-control p-1" id="storeDecider" name="decisor">
                        </div>

                        <!-- Telefone Decisor -->
                        <div class="form-group">
                            <label for="storeDeciderPhone">Telefone Decisor:</label>
                            <input type="text" class="form-control p-1" id="storeDeciderPhone" name="telefone_decisor">
                        </div>

                        <!-- E-mail -->
                        <div class="form-group">
                            <label for="storeEmail">E-mail:</label>
                            <input type="email" class="form-control p-1" id="storeEmail" name="email">
                        </div>

                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" -dismiss="modal">Cancelar</button>
                            <button type="submit" class="btn btn-primary" form="storeForm">Salvar</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal Filtrar -->
<div class="modal fade" id="filterModal" tabindex="-1" aria-labelledby="filterModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="filterModalLabel">Filtrar Lojas</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="filterForm">
                    <!-- Filtro de Status -->
                    <div class="form-group">
                        <label for="filterStatus">Status:</label>
                        <select class="form-control p-1" id="filterStatus" name="status">
                            <option value="">Todos</option>
                            <option value="Descoberto">Descoberto</option>
                            <option value="Coberto">Coberto</option>
                            <option value="Ativo">Ativo</option>
                            <option value="Inativo">Inativo</option>
                        </select>
                    </div>

                    <!-- Filtro de Marcador -->
                    <div class="form-group">
                        <label for="filterMarker">Marcador:</label>
                        <select class="form-control p-1" id="filterMarker">
                            <option value="">Todos</option>
                            <?php foreach ($marcadores as $marcador) {
                                echo '<option value="' . $marcador['id'] . '">' . $marcador['nome'] . '</option>';
                            }
                            ?>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="filterAnotacao">Especialidade:</label>
                        <select class="form-control p-1" id="filterAnotacao" name="filterAnotacao">
                            <option value="Geral">Geral</option>
                            <option value="Unhas">Unhas</option>
                            <option value="Cílios">Cílios</option>
                            <option value="Sobrancelha">Sobrancelha</option>
                            <option value="Unhas/Cílios">Unhas/Cílios</option>
                            <option value="Unhas/Sobrancelha">Unhas/Sobrancelha</option>
                            <option value="Cílios/Sobrancelha">Cílios/Sobrancelha</option>
                            <option value="Trio">Trio</option>
                        </select>
                    </div>

                    <!-- Filtro de Data Início -->
                    <div class="form-group">
                        <label for="filterDateStart">Data Início:</label>
                        <input type="date" class="form-control p-1" id="filterDateStart" name="date_start">
                    </div>

                    <!-- Filtro de Data Fim -->
                    <div class="form-group">
                        <label for="filterDateEnd">Data Fim:</label>
                        <input type="date" class="form-control p-1" id="filterDateEnd" name="date_end">
                    </div>

                    <!-- Filtro de Hunter -->
                    <div class="form-group">
                        <label for="hunter">Hunter:</label>
                        <select class="form-control p-1" id="hunter" name="hunter">
                            <option value="">Todos</option>
                            <?php
                            // Consultar hunters no banco de dados
                            $stmt = $pdo->prepare("SELECT id, nome FROM users WHERE function = 'Hunter'");
                            $stmt->execute();
                            $hunters = $stmt->fetchAll(PDO::FETCH_ASSOC);

                            // Exibir cada hunter como uma opção no select
                            foreach ($hunters as $hunter) {
                                echo '<option value="' . htmlspecialchars($hunter['id']) . '">' . htmlspecialchars($hunter['nome']) . '</option>';
                            }
                            ?>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="filterVendedor">Vendedor:</label>
                        <select class="form-control p-1" id="filterVendedor">
                            <option value="" disabled selected>Selecione um vendedor</option>
                            <?php
                            // Consultar a lista de vendedores no banco de dados
                            $stmt = $pdo->prepare("SELECT id, nome FROM users WHERE function = 'Vendedor' OR function = 'Representante'");
                            $stmt->execute();
                            $vendedores = $stmt->fetchAll(PDO::FETCH_ASSOC);
                            foreach ($vendedores as $vendedor) {
                                echo '<option value="' . $vendedor['nome'] . '">' . $vendedor['nome'] . '</option>';
                            }
                            ?>
                        </select>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                <button type="button" class="btn btn-primary" onclick="applyFilters()">Filtrar</button>
            </div>
        </div>
    </div>
</div>

    <!-- Ícone de progresso no canto da tela -->
    <div id="tinyProgress" style="position: fixed; bottom: 20px; right: 20px; display: none;">
        <div class="spinner-border text-primary" role="status">
            <span class="sr-only">Buscando no Tiny...</span>
        </div>
    </div>

   <!-- Modal para o Formulário de Upload de Planilha -->
    <div class="modal fade" id="importLojasModal" tabindex="-1" aria-labelledby="importLojasModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="importLojasModalLabel">Importar Planilha de Lojas (.xlsx)</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <!-- Formulário de Upload dentro do Modal -->
                    <form id="importForm" enctype="multipart/form-data">
                        <div class="form-group">
                            <label for="storeFile">Selecione a planilha de lojas (.xlsx):</label>
                            <input type="file" name="storeFile" id="storeFile" accept=".xlsx" required class="form-control">
                        </div>
                    </form>
                    <div id="importStatus" class="mt-3"></div> <!-- Exibição de mensagem de status -->
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                    <button type="button" class="btn btn-primary" onclick="importStores()">Importar Lojas</button>
                </div>
            </div>
        </div>
    </div>

<!-- Modal Atribuir Vendedor às Lojas Selecionadas -->
<div class="modal fade" id="assignVendedorModal" tabindex="-1" role="dialog" aria-labelledby="assignVendedorModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="assignVendedorModalLabel">Atribuir Vendedor às Lojas Selecionadas</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <label for="vendedorSelect">Selecione um Vendedor</label>
        <select class="form-control p-1" id="vendedorSelect">
          <option value="" disabled selected>Selecione um vendedor</option>
        </select>

        <!-- Campo oculto para armazenar IDs das lojas selecionadas -->
        <input type="hidden" id="storeIds" name="storeIds">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
        <button type="button" class="btn btn-primary" onclick="assignVendedor()">Confirmar</button>
      </div>
    </div>
  </div>
</div>


    <!-- jQuery, Popper.js, Bootstrap JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.16.9/xlsx.full.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="statics/js/checkCNPJInTiny.js"></script>
    <script src="statics/js/cnpjAddressUpdater.js"></script>
    <script src="statics/js/pagination.js"></script>
    <script src="statics/js/storeFilters.js"></script>
    <script src="statics/js/storeManagement.js"></script>
    <script src="statics/js/utils.js"></script>
    <script src="statics/js/checkAllCNPJs.js"></script>
    <script src="statics/js/vendorAssignment.js"></script>
    <script src="statics/js/estadoMeso.js"></script>
    <script src="statics/js/deleteStore.js"></script>
    <script src="statics/js/deleteSelectedStores.js"></script>
    <script src="statics/js/atribuirVendedorSelecionadas.js"></script>
    <script src="statics/js/selecionarLojas.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.17.0/xlsx.full.min.js"></script>
    <script src="statics/js/exportDataToExcell.js"></script>
    <script src="statics/js/importExcelData.js"></script>
</body>
</html>

