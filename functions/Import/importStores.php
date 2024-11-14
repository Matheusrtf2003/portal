<?php
include '../config.php';
require '../../vendor/autoload.php';

use PhpOffice\PhpSpreadsheet\IOFactory;

header('Content-Type: application/json');

try {
    if (isset($_FILES['storeFile']) && $_FILES['storeFile']['error'] === UPLOAD_ERR_OK) {
        $fileTmpPath = $_FILES['storeFile']['tmp_name'];
        $spreadsheet = IOFactory::load($fileTmpPath);
        $sheet = $spreadsheet->getActiveSheet();

        $successCount = 0;
        $errorCount = 0;
        $errorMessages = [];

        foreach ($sheet->getRowIterator(2) as $row) {
            $cells = $row->getCellIterator();
            $cells->setIterateOnlyExistingCells(FALSE);

            $data = [];
            foreach ($cells as $cell) {
                $data[] = $cell->getValue();
            }

            // Mapear os índices corretamente de acordo com a ordem na planilha
            $nome = !empty($data[0]) ? $data[0] : "Indefinido";
            $cnpj = preg_replace('/\D/', '', $data[1] ?? "Indefinido"); // Limpar CNPJ
            $status = !empty($data[2]) ? $data[2] : "Indefinido";
            $endereco = !empty($data[3]) ? $data[3] : "Indefinido";
            $cidade = !empty($data[4]) ? $data[4] : "Indefinido";
            $estado_sigla = !empty($data[5]) ? $data[5] : "Indefinido";
            $mesorregiao_nome = !empty($data[6]) ? $data[6] : "Indefinido";
            $telefone = !empty($data[7]) ? $data[7] : "Indefinido";
            $instagram = !empty($data[8]) ? (str_starts_with($data[8], 'https://') ? $data[8] : 'https://' . $data[8]) : "Indefinido";
            $site = !empty($data[9]) ? (str_starts_with($data[9], 'https://') ? $data[9] : 'https://' . $data[9]) : "Indefinido";
            $decisor = !empty($data[10]) ? $data[10] : "Indefinido";
            $telefone_decisor = !empty($data[11]) ? $data[11] : "Indefinido";
            $email = !empty($data[12]) ? $data[12] : "Indefinido";
            $anotacao = !empty($data[13]) ? $data[13] : "Indefinido";
            $marcador_nome = !empty($data[14]) ? $data[14] : "Indefinido";
            $vendedor_nome = !empty($data[15]) ? $data[15] : "Indefinido";
            $hunter_nome = !empty($data[16]) ? $data[16] : "Indefinido";

            // Verificar se o CNPJ já existe no banco de dados
            $stmt = $pdo->prepare("SELECT id FROM stores WHERE cnpj = ?");
            $stmt->execute([$cnpj]);
            if ($stmt->fetch()) {
                $errorCount++;
                $errorMessages[] = "Linha {$row->getRowIndex()}: CNPJ '$cnpj' já existe no banco de dados e não foi importado.";
                continue;
            }

            // Obter `estado_id` a partir de `estado_sigla`
            $estado_id = null;
            if ($estado_sigla !== "Indefinido") {
                $stmt = $pdo->prepare("SELECT id FROM estados WHERE sigla = ?");
                $stmt->execute([strtoupper($estado_sigla)]);
                $estado = $stmt->fetch();
                if ($estado) {
                    $estado_id = $estado['id'];
                } else {
                    $errorCount++;
                    $errorMessages[] = "Linha {$row->getRowIndex()}: Estado com sigla '$estado_sigla' não encontrado.";
                    continue;
                }
            }

            // Obter ou criar `mesorregiao_id` a partir do nome
            $mesorregiao_id = null;
            if ($mesorregiao_nome !== "Indefinido") {
                $stmt = $pdo->prepare("SELECT id FROM mesorregioes WHERE nome = ?");
                $stmt->execute([$mesorregiao_nome]);
                $mesorregiao = $stmt->fetch();
                if ($mesorregiao) {
                    $mesorregiao_id = $mesorregiao['id'];
                } else {
                    // Insere a nova mesorregião se não existir
                    $stmt = $pdo->prepare("INSERT INTO mesorregioes (nome) VALUES (?)");
                    $stmt->execute([$mesorregiao_nome]);
                    $mesorregiao_id = $pdo->lastInsertId();
                }
            }

            // Obter `marcador_id`
            $marcador_id = null;
            if ($marcador_nome !== "Indefinido") {
                $stmt = $pdo->prepare("SELECT id FROM markers WHERE nome = ?");
                $stmt->execute([$marcador_nome]);
                $marcador = $stmt->fetch();
                if ($marcador) {
                    $marcador_id = $marcador['id'];
                } else {
                    $stmt = $pdo->prepare("INSERT INTO markers (nome) VALUES (?)");
                    $stmt->execute([$marcador_nome]);
                    $marcador_id = $pdo->lastInsertId();
                }
            }

            // Obter `vendedor_id`
            $vendedor_id = null;
            if ($vendedor_nome !== "Indefinido") {
                $stmt = $pdo->prepare("SELECT id FROM users WHERE nome = ?");
                $stmt->execute([$vendedor_nome]);
                $vendedor = $stmt->fetch();
                if ($vendedor) {
                    $vendedor_id = $vendedor['id'];
                } else {
                    $stmt = $pdo->prepare("INSERT INTO users (nome) VALUES (?)");
                    $stmt->execute([$vendedor_nome]);
                    $vendedor_id = $pdo->lastInsertId();
                }
            }

            // Obter `hunter_id`
            $hunter_id = null;
            if ($hunter_nome !== "Indefinido") {
                $stmt = $pdo->prepare("SELECT id FROM users WHERE nome = ?");
                $stmt->execute([$hunter_nome]);
                $hunter = $stmt->fetch();
                if ($hunter) {
                    $hunter_id = $hunter['id'];
                } else {
                    $stmt = $pdo->prepare("INSERT INTO users (nome) VALUES (?)");
                    $stmt->execute([$hunter_nome]);
                    $hunter_id = $pdo->lastInsertId();
                }
            }

            // Inserção dos dados na tabela `stores`
            try {
                $sql = "INSERT INTO stores (nome, cnpj, status, endereco, cidade, estado, mesorregiao, telefone, instagram, site, decisor, telefone_decisor, email, anotacao)
                        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
                $stmt = $pdo->prepare($sql);
                $stmt->execute([$nome, $cnpj, $status, $endereco, $cidade, $estado_id, $mesorregiao_id, $telefone, $instagram, $site, $decisor, $telefone_decisor, $email, $anotacao]);
                $store_id = $pdo->lastInsertId();

                // Inserções nas tabelas de relacionamento
                if ($marcador_id) {
                    $stmt = $pdo->prepare("INSERT INTO stores_markers (loja_id, marcador_id) VALUES (?, ?)");
                    $stmt->execute([$store_id, $marcador_id]);
                }
                if ($vendedor_id) {
                    $stmt = $pdo->prepare("INSERT INTO stores_seller (store_id, vendedor_id) VALUES (?, ?)");
                    $stmt->execute([$store_id, $vendedor_id]);
                }
                if ($hunter_id) {
                    $stmt = $pdo->prepare("INSERT INTO stores_users (store_id, user_id) VALUES (?, ?)");
                    $stmt->execute([$store_id, $hunter_id]);
                }

                $successCount++;
            } catch (Exception $e) {
                $errorCount++;
                $errorMessages[] = "Linha {$row->getRowIndex()}: Erro ao inserir loja - " . $e->getMessage();
            }
        }

        echo json_encode([
            'success' => true,
            'message' => "$successCount lojas importadas com sucesso. $errorCount erros durante a importação.",
            'errors' => $errorMessages
        ]);
    } else {
        echo json_encode([
            'success' => false,
            'message' => 'Erro ao fazer upload do arquivo.'
        ]);
    }
} catch (Exception $e) {
    echo json_encode([
        'success' => false,
        'message' => 'Erro: ' . $e->getMessage()
    ]);
}
?>

