<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gerenciamento de Representantes</title>
    <link rel="icon" href="statics\img\favi-icon.png" type="image/x-icon">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../statics/css/style.css">
    <link rel="stylesheet" href="../sidebar/css/sidebar.css">
    <link rel="stylesheet" href="statics/css/representantes.css">
</head>
<body>
    <?php include '../sidebar/sidebar.php'; ?>
    <?php include '../MenuUsuario/user_menu.php'; ?>

    <div class="container-fluid">
        <div class="row">
            <div class="col-md-9 offset-md-2">
                <h1>Gerenciamento de Representantes</h1>
                <button type="button" class="btn btn-info" data-toggle="modal" data-target="#addRepresentativeModal">Adicionar Representante</button>
                <input type="text" id="searchInput" class="form-control mt-3 mb-3" placeholder="Pesquisar por Nome, E-mail ou Cidade">
                <button type="button" class="btn btn-secondary mt-3 mb-3" data-toggle="modal" data-target="#filterModal">Filtrar</button>
                <button type="button" class="btn btn-danger mt-3 mb-3" onclick="resetFilters()">Limpar Filtros</button>
                <div id="representativeCount" class="mt-3 mb-3"></div>
                <div class="table-responsive">
                    <table class="table table-bordered" id="representativesTable">
                        <thead>
                            <tr>
                                <th><input type="checkbox" id="selectAll"></th>
                                <th>ID</th>
                                <th>Nome</th>
                                <th>Telefone</th>
                                <th>E-mail</th>
                                <th>Cidade</th>
                                <th>Estado</th>
                                <th>Marcas</th>
                                <th>Status</th>
                                <th>Ações</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- Conteúdo será preenchido dinamicamente -->
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

    <!-- Modal Adicionar/Editar Representante -->
    <div class="modal fade" id="addRepresentativeModal" tabindex="-1" aria-labelledby="addRepresentativeModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addRepresentativeModalLabel">Adicionar Representante</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="representativeForm">
                        <input type="hidden" id="representativeId" name="id">
                        <div class="form-group">
                            <label for="representativeName">Nome:</label>
                            <input type="text" class="form-control" id="representativeName" name="nome" required>
                        </div>
                        <div class="form-group">
                            <label for="representativePhone">Telefone:</label>
                            <input type="text" class="form-control" id="representativePhone" name="telefone">
                        </div>
                        <div class="form-group">
                            <label for="representativeEmail">E-mail:</label>
                            <input type="email" class="form-control" id="representativeEmail" name="email">
                        </div>
                        <div class="form-group">
                            <label for="representativeCity">Cidade:</label>
                            <input type="text" class="form-control" id="representativeCity" name="cidade">
                        </div>
                        <div class="form-group">
                            <label for="representativeState">Estado:</label>
                            <input type="text" class="form-control" id="representativeState" name="estado" maxlength="2">
                        </div>
                        <div class="form-group">
                            <label for="representativeBrands">Marcas:</label>
                            <textarea class="form-control" id="representativeBrands" name="marcas"></textarea>
                        </div>
                        <div class="form-group">
                            <label for="representativeStatus">Status:</label>
                            <select class="form-control" id="representativeStatus" name="status" required>
                                <option value="Ativo">Ativo</option>
                                <option value="Inativo">Inativo</option>
                            </select>
                        </div>
                        <button type="submit" class="btn btn-primary">Salvar</button>
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
                    <h5 class="modal-title" id="filterModalLabel">Filtrar Representantes</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="filterForm">
                        <div class="form-group">
                            <label for="filterStatus">Status:</label>
                            <select class="form-control" id="filterStatus" name="status">
                                <option value="">Todos</option>
                                <option value="Ativo">Ativo</option>
                                <option value="Inativo">Inativo</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="filterDateStart">Data de Início:</label>
                            <input type="date" class="form-control" id="filterDateStart" name="date_start">
                        </div>
                        <div class="form-group">
                            <label for="filterDateEnd">Data de Fim:</label>
                            <input type="date" class="form-control" id="filterDateEnd" name="date_end">
                        </div>
                        <button type="button" class="btn btn-primary" onclick="applyFilters()">Aplicar Filtros</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="statics/js/representantes.js"></script>
</body>
</html>
