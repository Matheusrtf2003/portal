<?php
session_start();
if (!isset($_SESSION['user_id'])) {
    header("Location: index.php");
    exit;
}
?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Educadoras</title>
    <link rel="icon" href="../statics\img\favi-icon.png" type="image/x-icon">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="statics/css/educadoras.css">
    <link rel="stylesheet" href="../sidebar/css/sidebar.css">
    <style>
        
    </style>
</head>
<body>
    <?php include '../sidebar/sidebar.php'; ?>
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-10 offset-md-1">
                <?php include '../MenuUsuario/user_menu.php'; ?>
                <h1 style="margin-top: 20px; max-width: 100%;">Educadoras</h1>
                <button type="button" class="btn btn-info" data-toggle="modal" data-target="#addEducatorModal">Adicionar Educadora</button>
                <input style="max-width: 100%;" type="text" id="searchInput" class="form-control mt-3 mb-3" placeholder="Pesquisar por ID, Nome ou CPF">
                <button type="button" class="btn btn-secondary mt-3 mb-3" data-toggle="modal" data-target="#filterStatusModal">Filtrar</button>
                <button type="button" class="btn btn-primary mt-3 mb-3" data-toggle="modal" data-target="#importCSVModal">Importar CSV</button>
                <a href="archives/planilha_modelo.csv" class="btn btn-link mt-3 mb-3" download="educadoras_planilha_modelo.csv">Baixar Planilha Modelo</a>
                <button type="button" class="btn btn-danger mt-3 mb-3" onclick="deleteSelectedEducators()">Excluir Selecionadas</button>
                <!-- Dentro do <div class="col-11"> -->
                <div id="educatorCount" class="mt-2 mb-3"></div>
                <div class="table-responsive">
                    <table class="table table-bordered" id="educatorsTable">
                        <thead>
                            <tr>
                                <th><input type="checkbox" id="selectAll"></th>
                                <th>ID</th>
                                <th>Nome</th>
                                <th>CPF</th>
                                <th>Estado</th>
                                <th>Status</th>
                                <th>Ações</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- Educadoras serão carregadas aqui -->
                        </tbody>
                    </table>
                </div>
                <div class="pagination-controls">
                    <button class="btn btn-secondary" id="prevPage" onclick="changePage(-1)">Anterior</button>
                    <button class="btn btn-secondary" id="nextPage" onclick="changePage(1)">Próximo</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal Adicionar Educadora -->
    <div class="modal fade" id="addEducatorModal" tabindex="-1" aria-labelledby="addEducatorModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addEducatorModalLabel">Adicionar Educadora</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="educatorForm">
                        <input type="hidden" id="educatorId" name="id">
                        <div class="form-group">
                            <label for="educatorName">Nome:</label>
                            <input type="text" class="form-control" id="educatorName" name="nome" required>
                        </div>
                        <div class="form-group">
                            <label for="educatorCPF">CPF:</label>
                            <input type="text" class="form-control" id="educatorCPF" name="cpf" required>
                        </div>
                        <div class="form-group">
                            <label for="educatorBirthDate">Data de Nascimento:</label>
                            <input type="date" class="form-control" id="educatorBirthDate" name="data_nascimento" required>
                        </div>
                        <div class="form-group">
                            <label for="educatorAddress">Endereço:</label>
                            <textarea class="form-control" id="educatorAddress" name="endereco" required></textarea>
                        </div>
                        <div class="form-group">
                            <label for="educatorCity">Cidade:</label>
                            <input type="text" class="form-control" id="educatorCity" name="cidade" required>
                        </div>
                        <div class="form-group">
                            <label for="educatorState">Estado:</label>
                            <input type="text" class="form-control" id="educatorState" name="estado" required>
                        </div>
                        <div class="form-group">
                            <label for="educatorCEP">CEP:</label>
                            <input type="text" class="form-control" id="educatorCEP" name="cep" required>
                        </div>
                        <div class="form-group">
                            <label for="educatorMesoRegion">Mesorregião:</label>
                            <input type="text" class="form-control" id="educatorMesoRegion" name="mesorregiao" required>
                        </div>
                        <div class="form-group">
                            <label for="educatorInstagram">Instagram:</label>
                            <input type="text" class="form-control" id="educatorInstagram" name="instagram" required>
                        </div>
                        <div class="form-group">
                            <label for="educatorFollowers">Seguidores:</label>
                            <input type="number" class="form-control" id="educatorFollowers" name="seguidores" required>
                        </div>
                        <div class="form-group">
                            <label for="educatorWebsite">Site:</label>
                            <input type="text" class="form-control" id="educatorWebsite" name="site" required>
                        </div>
                        <div class="form-group">
                            <label for="educatorClass">Turma:</label>
                            <input type="date" class="form-control" id="educatorClass" name="turma" required>
                        </div>
                        <div class="form-group">
                            <label for="educatorStatus">Status:</label>
                            <select class="form-control" id="educatorStatus" name="status" required>
                                <option value="1">Ativo</option>
                                <option value="0">Inativo</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="educatorActuation">Atuação:</label>
                            <input type="text" class="form-control" id="educatorActuation" name="atuacao" required>
                        </div>
                        <div class="form-group">
                            <label for="educatorTechniques">Técnicas:</label>
                            <input type="text" class="form-control" id="educatorTechniques" name="tecnicas" required>
                        </div>
                        <div class="form-group">
                            <label for="educatorPhone">Telefone:</label>
                            <input type="text" class="form-control" id="educatorPhone" name="telefone" required>
                        </div>
                        <div class="form-group">
                            <label for="educatorEmail">Email:</label>
                            <input type="email" class="form-control" id="educatorEmail" name="email" required>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                    <button type="submit" class="btn btn-primary" form="educatorForm">Salvar</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal Ver Educadora -->
    <div class="modal fade" id="viewEducatorModal" tabindex="-1" aria-labelledby="viewEducatorModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="viewEducatorModalLabel">Detalhes da Educadora</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p><strong>ID:</strong> <span id="viewEducatorId"></span></p>
                    <p><strong>Nome:</strong> <span id="viewEducatorName"></span></p>
                    <p><strong>CPF:</strong> <span id="viewEducatorCPF"></span></p>
                    <p><strong>Data de Nascimento:</strong> <span id="viewEducatorBirthDate"></span></p>
                    <p><strong>Endereço:</strong> <span id="viewEducatorAddress"></span></p>
                    <p><strong>Cidade:</strong> <span id="viewEducatorCity"></span></p>
                    <p><strong>Estado:</strong> <span id="viewEducatorState"></span></p>
                    <p><strong>CEP:</strong> <span id="viewEducatorCEP"></span></p>
                    <p><strong>Mesorregião:</strong> <span id="viewEducatorMesoRegion"></span></p>
                    <p><strong>Instagram:</strong> <span id="viewEducatorInstagram"></span></p>
                    <p><strong>Seguidores:</strong> <span id="viewEducatorFollowers"></span></p>
                    <p><strong>Site:</strong> <span id="viewEducatorWebsite"></span></p>
                    <p><strong>Turma:</strong> <span id="viewEducatorClass"></span></p>
                    <p><strong>Status:</strong> <span id="viewEducatorStatus"></span></p>
                    <p><strong>Atuação:</strong> <span id="viewEducatorActuation"></span></p>
                    <p><strong>Técnicas:</strong> <span id="viewEducatorTechniques"></span></p>
                    <p><strong>Telefone:</strong> <span id="viewEducatorPhone"></span></p>
                    <p><strong>Email:</strong> <span id="viewEducatorEmail"></span></p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal Importar CSV -->
    <div class="modal fade" id="importCSVModal" tabindex="-1" aria-labelledby="importCSVModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="importCSVModalLabel">Importar CSV</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="importCSVForm" enctype="multipart/form-data" action="functions/Educators/importEducadoras.php" method="POST">
                        <div class="form-group">
                            <label for="csvFile">Arquivo CSV:</label>
                            <input type="file" class="form-control" id="csvFile" name="file" accept=".csv" required>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                            <button type="submit" class="btn btn-primary">Importar</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal Filtrar Educadoras -->
    <div class="modal fade" id="filterStatusModal" tabindex="-1" aria-labelledby="filterStatusModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="filterStatusModalLabel">Filtrar Educadoras</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="filterForm">
                        <div class="form-group">
                            <label for="filterStatus">Status:</label>
                            <select class="form-control" id="filterStatus">
                                <option value="">Todos</option>
                                <option value="1">Ativo</option>
                                <option value="0">Inativo</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="filterState">Estado:</label>
                            <select class="form-control" id="filterState">
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
    </div>

    <!-- jQuery, Popper.js, Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="statics/js/Educadores/init.js"></script>
    <script src="statics/js/Educadores/loadEducators.js"></script>
    <script src="statics/js/Educadores/displayEducators.js"></script>
    <script src="statics/js/Educadores/filters.js"></script>
    <script src="statics/js/Educadores/pagination.js"></script>
    <script src="statics/js/Educadores/viewEducator.js"></script>
    <script src="statics/js/Educadores/deleteEducator.js"></script>
    <script src="statics/js/Educadores/deleteSelectedEducators.js"></script>

</body>
</html>
