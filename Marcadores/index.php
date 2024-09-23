<?php
session_start();
if (!isset($_SESSION['user_id'])) {
    header("Location: index.php");
    exit;
}

include '../functions/config.php';

// Obtendo os créditos do usuário
$userId = $_SESSION['user_id'];
$stmt = $pdo->prepare("SELECT credits FROM users WHERE id = ?");
$stmt->execute([$userId]);
$user = $stmt->fetch(PDO::FETCH_ASSOC);
$credits = $user['credits'];

// Consulta para obter os marcadores e a contagem de lojas associadas
$query = "
    SELECT markers.id, markers.nome, markers.cor, COUNT(stores_markers.loja_id) AS loja_count
    FROM markers
    LEFT JOIN stores_markers ON markers.id = stores_markers.marcador_id
    GROUP BY markers.id, markers.nome, markers.cor
";
$stmt = $pdo->prepare($query);
$stmt->execute();
$markers = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Marcadores</title>
    <link rel="icon" href="statics\img\favi-icon.png" type="image/x-icon">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../statics/css/style.css">
    <link rel="stylesheet" href="statics/css/marcadores.css">
    <link rel="stylesheet" href="../sidebar/css/sidebar.css">
</head>
<body>
    <?php include '../sidebar/sidebar.php'; ?>
    <?php include '../MenuUsuario/user_menu.php'; ?>
    
    <!-- Lista de Marcadores -->
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-8" style="margin-left: 300px;">
                <h1>Marcadores</h1>
                <button type="button" class="btn btn-success" data-toggle="modal" data-target="#addMarkerModal">Criar Marcador</button>
                
                <div class="row mt-3">
                    <?php foreach ($markers as $marker): ?>
                        <div class="col-md-4">
                            <div class="card mb-3" style="border-left: 20px solid <?php echo $marker['cor']; ?>;">
                                <div class="card-body">
                                    <h5 class="card-title"><?php echo htmlspecialchars($marker['nome']); ?></h5>
                                    <p class="card-text">Lojas associadas: <?php echo $marker['loja_count']; ?></p>
                                    <button class="btn btn-warning btn-sm" onclick="openEditModal(<?php echo $marker['id']; ?>, '<?php echo htmlspecialchars($marker['nome']); ?>', '<?php echo htmlspecialchars($marker['cor']); ?>')">Editar</button>
                                    <button class="btn btn-danger btn-sm" onclick="deleteMarker(<?php echo $marker['id']; ?>)">Excluir</button>
                                </div>
                            </div>
                        </div>
                    <?php endforeach; ?>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal Criar Marcador -->
    <div class="modal fade" id="addMarkerModal" tabindex="-1" aria-labelledby="addMarkerModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addMarkerModalLabel">Criar Marcador</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="markerForm">
                        <div class="form-group">
                            <label for="markerName">Nome:</label>
                            <input type="text" class="form-control" id="markerName" name="nome" required>
                        </div>
                        <div class="form-group">
                            <label for="markerColor">Cor:</label>
                            <input type="color" class="form-control" id="markerColor" name="cor" required>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                    <button type="submit" class="btn btn-primary" form="markerForm">Salvar</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal Editar Marcador -->
    <div class="modal fade" id="editMarkerModal" tabindex="-1" aria-labelledby="editMarkerModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="editMarkerModalLabel">Editar Marcador</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="editMarkerForm">
                        <input type="hidden" id="editMarkerId" name="id">
                        <div class="form-group">
                            <label for="editMarkerName">Nome:</label>
                            <input type="text" class="form-control" id="editMarkerName" name="nome" required>
                        </div>
                        <div class="form-group">
                            <label for="editMarkerColor">Cor:</label>
                            <input type="color" class="form-control" id="editMarkerColor" name="cor" required>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                    <button type="submit" class="btn btn-primary" form="editMarkerForm">Salvar</button>
                </div>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <script>
    // Adiciona a classe 'active' ao link do menu lateral correspondente à página atual
    const currentPath = window.location.pathname.split('/').pop();
    document.querySelectorAll('.sidebar-menu .nav-link').forEach(link => {
        if (link.getAttribute('href') === currentPath) {
            link.classList.add('active');
        }
    });

    document.addEventListener('DOMContentLoaded', function() {
        const markerForm = document.getElementById('markerForm');
        const editMarkerForm = document.getElementById('editMarkerForm');

        // Enviar formulário de criar marcador
        if (markerForm) {
            markerForm.addEventListener('submit', function(e) {
                e.preventDefault();
                
                const formData = new FormData(this);
                const data = {
                    nome: formData.get('nome'),
                    cor: formData.get('cor')
                };

                fetch('/portal/functions/Markers/addMarker.php', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify(data)
                })
                .then(response => response.json())
                .then(result => {
                    if (result.success) {
                        alert('Marcador criado com sucesso!');
                        $('#addMarkerModal').modal('hide');
                        loadMarkers(); // Atualize a lista de marcadores
                    } else {
                        alert('Erro ao criar marcador: ' + result.message);
                    }
                })
                .catch(error => console.error('Erro:', error));
            }, { once: true }); // Adicionar { once: true } para garantir que o evento seja vinculado apenas uma vez
        }

        // Função para carregar marcadores
        function loadMarkers() {
            fetch('/portal/functions/Markers/getMarkers.php')
                .then(response => response.json())
                .then(data => {
                    console.log('Data received from getMarkers.php:', data); // Logging the received data for debugging
                    if (data.success && Array.isArray(data.markers)) {
                        const markerList = document.getElementById('markerList');
                        markerList.innerHTML = '';
                        data.markers.forEach(marker => {
                            const row = document.createElement('tr');
                            row.innerHTML = `
                                <td>${marker.id}</td>
                                <td>${marker.nome}</td>
                                <td>
                                    <span style="display: inline-block; width: 20px; height: 20px; background-color: ${marker.cor};"></span>
                                </td>
                                <td>
                                    <button class="btn btn-warning btn-sm" onclick="openEditModal(${marker.id}, '${marker.nome}', '${marker.cor}')">Editar</button>
                                                                        <button class="btn btn-danger btn-sm" onclick="deleteMarker(${marker.id})">Excluir</button>
                                </td>
                            `;
                            markerList.appendChild(row);
                        });
                    } else {
                        alert('Erro ao carregar marcadores: ' + data.message);
                    }
                })
                .catch(error => console.error('Erro ao carregar marcadores:', error));
        }

        // Função para abrir o modal de edição com dados do marcador
        window.openEditModal = function(id, nome, cor) {
            document.getElementById('editMarkerId').value = id;
            document.getElementById('editMarkerName').value = nome;
            document.getElementById('editMarkerColor').value = cor;
            $('#editMarkerModal').modal('show');
        }

        // Função para excluir um marcador
        window.deleteMarker = function(id) {
            if (confirm('Tem certeza que deseja excluir este marcador?')) {
                fetch(`/portal/functions/Markers/deleteMarker.php?id=${id}`, {
                    method: 'GET'
                })
                .then(response => response.json())
                .then(data => {
                    if (data.success) {
                        loadMarkers();
                    } else {
                        alert('Erro ao excluir marcador.');
                    }
                })
                .catch(error => console.error('Erro ao excluir marcador:', error));
            }
        }

        // Enviar formulário de editar marcador
        if (editMarkerForm) {
            editMarkerForm.addEventListener('submit', function(e) {
                e.preventDefault();
                const formData = new FormData(this);

                fetch('/portal/functions/Markers/updateMarker.php', {
                    method: 'POST',
                    body: formData
                })
                .then(response => response.json())
                .then(data => {
                    if (data.success) {
                        $('#editMarkerModal').modal('hide');
                        loadMarkers();
                    } else {
                        alert('Erro ao atualizar marcador.');
                    }
                })
                .catch(error => console.error('Erro ao atualizar marcador:', error));
            }, { once: true }); // Adicionar { once: true } para garantir que o evento seja vinculado apenas uma vez
        }

        // Carregar os marcadores ao carregar a página
        loadMarkers();
    });

    </script>
</body>
</html>

