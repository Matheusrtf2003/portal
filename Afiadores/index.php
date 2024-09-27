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
    <title>Afiadores</title>
    <link rel="icon" href="statics\img\favi-icon.png" type="image/x-icon">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="statics/css/afiadores.css">
    <link rel="stylesheet" href="../sidebar/css/sidebar.css">
</head>
<body>
    <?php include '../sidebar/sidebar.php'; ?>
    <?php include '../MenuUsuario/user_menu.php'; ?>

    <div class="container-fluid">
        <div class="row">
            <div class="col-md-9 offset-md-2">
                <h1 class="title">Afiadores</h1>
                <button type="button" class="btn btn-info" data-toggle="modal" data-target="#addSharpenerModal">Adicionar Afiador</button>
                <input type="text" id="searchInput" class="form-control mt-3 mb-3" placeholder="Pesquisar por ID, Nome ou CPF">
                <button type="button" class="btn btn-secondary mt-3 mb-3" data-toggle="modal" data-target="#filterModal">Filtrar</button>
                <button type="button" class="btn btn-danger mt-3 mb-3" onclick="resetFilters()">Limpar Filtros</button>
                <button type="button" class="btn btn-primary mt-3 mb-3" data-toggle="modal" data-target="#importCSVModal">Importar CSV</button>
                <a href="archives/planilha_modelo.csv" class="btn btn-link mt-3 mb-3" download="planilha_modelo.csv">Baixar Planilha Modelo</a>
                <button type="button" class="btn btn-danger mt-3 mb-3 ml-3" onclick="deleteSelectedSharpeners()">Excluir Selecionadas</button>
                <div id="sharpenerCount" class="mt-3 mb-3"></div>
                <div class="table-responsive">
                    <table class="table table-bordered" id="sharpenersTable">
                        <thead>
                            <tr>
                                <th><input type="checkbox" id="selectAll"></th>
                                <th>ID</th>
                                <th style="width: 200px;">Nome</th>
                                <th style="max-width: 200px;">CPF</th>
                                <th>Estado</th>
                                <th>Status</th>
                                <th>Situação</th>
                                <th>Ações</th>
                            </tr>
                        </thead>
                        <tbody>
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

<!-- Modal Adicionar Afiador -->
<div class="modal fade" id="addSharpenerModal" tabindex="-1" aria-labelledby="addSharpenerModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addSharpenerModalLabel">Adicionar Afiador</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="sharpenerForm">
                    <input type="hidden" id="sharpenerId" name="id">
                    <div class="form-group">
                        <label for="sharpenerName">Nome:</label>
                        <input type="text" class="form-control" id="sharpenerName" name="nome" required>
                    </div>
                    <div class="form-group">
                        <label for="sharpenerCPF">CPF:</label>
                        <input type="text" class="form-control" id="sharpenerCPF" name="cpf" required>
                    </div>
                    <div class="form-group">
                        <label for="sharpenerStatus">Status:</label>
                        <select class="form-control" id="sharpenerStatus" name="status" required>
                            <option value="Aprovado">Aprovado</option>
                            <option value="Aprovado Parcialmente">Aprovado Parcialmente</option>
                            <option value="Reprovado">Reprovado</option>
                            <option value="Lead">Lead</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="sharpenerSituation">Situação:</label>
                        <select class="form-control" id="sharpenerSituation" name="situacao" required>
                            <option value="Ativo">Ativo</option>
                            <option value="Inativo">Inativo</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="sharpenerAddress">Endereço:</label>
                        <input type="text" class="form-control" id="sharpenerAddress" name="endereco">
                    </div>
                    <div class="form-group">
                        <label for="sharpenerCity">Cidade:</label>
                        <input type="text" class="form-control" id="sharpenerCity" name="cidade">
                    </div>
                    <div class="form-group">
                        <label for="sharpenerState">Estado:</label>
                        <input type="text" class="form-control" id="sharpenerState" name="uf">
                    </div>
                    <div class="form-group">
                        <label for="sharpenerPhone">Telefone:</label>
                        <input type="text" class="form-control" id="sharpenerPhone" name="telefone">
                    </div>
                    <div class="form-group">
                        <label for="sharpenerEmail">Email:</label>
                        <input type="email" class="form-control" id="sharpenerEmail" name="email">
                    </div>
                    <div class="form-group">
                        <label for="sharpenerInstagram">Instagram:</label>
                        <input type="text" class="form-control" id="sharpenerInstagram" name="instagram">
                    </div>
                    <div class="form-group">
                        <label for="sharpenerCep">CEP:</label>
                        <input type="text" class="form-control" id="sharpenerCep" name="cep">
                    </div>
                    <div class="form-group">
                        <label for="sharpenerBairro">Bairro:</label>
                        <input type="text" class="form-control" id="sharpenerBairro" name="bairro">
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
                <h5 class="modal-title" id="filterModalLabel">Filtrar Afiadores</h5>
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
                            <option value="Aprovado">Aprovado</option>
                            <option value="Aprovado Parcialmente">Aprovado Parcialmente</option>
                            <option value="Reprovado">Reprovado</option>
                            <option value="Lead">Lead</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="filterSituation">Situação:</label>
                        <select class="form-control" id="filterSituation" name="situacao">
                            <option value="">Todas</option>
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
<script src="statics/js/Afiadores/loadSharpeners.js"></script>
<script src="statics/js/Afiadores/displaySharpeners.js"></script>
<script src="statics/js/Afiadores/filters.js"></script>
<script src="statics/js/Afiadores/pagination.js"></script>
<script src="statics/js/Afiadores/sharpenerActions.js"></script>
<script src="statics/js/Afiadores/importCSV.js"></script>
<script src="statics/js/Afiadores/init.js"></script>

</body>
</html>
