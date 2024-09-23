-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 23/09/2024 às 15:04
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `b2pro-maps`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `credits`
--

CREATE TABLE `credits` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `credits` int(11) NOT NULL DEFAULT 40000,
  `last_reset` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `educators`
--

CREATE TABLE `educators` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `cpf` varchar(28) NOT NULL,
  `data_nascimento` date NOT NULL,
  `endereco` text NOT NULL,
  `cidade` varchar(50) NOT NULL,
  `estado` varchar(2) NOT NULL,
  `cep` varchar(15) NOT NULL,
  `mesorregiao` varchar(50) NOT NULL,
  `instagram` varchar(100) NOT NULL,
  `seguidores` int(11) NOT NULL,
  `site` varchar(200) NOT NULL,
  `datetime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `turma` varchar(15) NOT NULL,
  `status` varchar(11) NOT NULL,
  `atuacao` varchar(100) NOT NULL,
  `tecnicas` varchar(100) NOT NULL,
  `telefone` varchar(25) NOT NULL,
  `email` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `educators`
--

INSERT INTO `educators` (`id`, `nome`, `cpf`, `data_nascimento`, `endereco`, `cidade`, `estado`, `cep`, `mesorregiao`, `instagram`, `seguidores`, `site`, `datetime`, `turma`, `status`, `atuacao`, `tecnicas`, `telefone`, `email`) VALUES
(1047, 'Antônia Fernanda de Sousa Mota', '598272380', '0000-00-00', 'Rua Dr. Almir Farias, 594, Timbaúba', 'Nova Russas', 'CE', '62200000', ' Sertões Cearenses', 'https://www.instagram.com/____studiofernandasousa______/', 5600, '', '2024-08-01 05:01:32', '2018', '1', 'atendimento | cursos', 'alongamentos', '(21) 981820766', 'fernandasousamota23@gmail.com'),
(1048, 'Blanca Rosmery Cristaldo Zalazar', '80034034994', '0000-00-00', 'Alameda Dr. Carlos de Carvalho, 655, Conjunto 10, Centro', 'Curitiba', 'PR', '80430180', 'Metropolitana ', 'https://www.instagram.com/blancacristaldonails/', 5335, '', '2024-08-01 05:01:32', '2021', '1', 'atendimento | cursos', 'alongamentos | esmaltação em gel | manicure russa', '(41) 997038206', 'studioblancacristaldo09@gmail.com'),
(1049, 'Bruna Adriane de Pinto Martins', '2028882077', '0000-00-00', 'Rua Doutor Selbach, 310, Nossa Senhora das Graças', 'Canoas', 'RS', '92025310', 'Metropolitana', 'https://www.instagram.com/brunamartins.educadora/', 5368, '', '2024-08-01 05:01:32', '2023/2', '1', '', '', '(51) 982770250', 'brunap_martins@outlook.com'),
(1050, 'Bruna Búrigo Medeiros', '7386607954', '0000-00-00', 'General Osvaldo Pinto da Veiga, 389, Centro', 'Urussanga', 'SC', '88840000', 'Sul Caterinense ', 'https://www.instagram.com/bruburigo/', 1527, '', '2024-08-01 05:01:32', '2023/1', '1', '', '', '(48) 996106618', 'bruburigonails@gmail.com'),
(1051, 'Carla Paola Paz', '8431414928', '0000-00-00', 'Rua José Corbari, 212, Princesa Isabel', 'Santo Antônio do Sudoeste', 'PR', '85710000', 'Sudoeste', 'https://www.instagram.com/carlapaola_paz/', 4413, '', '2024-08-01 05:01:32', '2018', '1', 'atendimento | cursos', 'alongamentos | blindagem | esmaltação em gel | manicure russa', '(46) 999785014', 'carlapaz2017@gmail.com'),
(1052, 'Carliene Domingos Araujo (Karly)', '11588073769', '0000-00-00', 'Rua Ramon Martins, 25, Vila Batista', 'Vila Velha', 'ES', '29116170', 'Central', 'https://www.instagram.com/karlyaraujo_/', 114000, '', '2024-08-01 05:01:32', '2018', '1', 'cursos', 'mentoria | manicure perfeita | acrílico', '(27) 997162800', 'lojinhadakarly@gmail.com'),
(1053, 'Carlos Alberto Ferreira Santos Filho', '70444930175', '0000-00-00', ' Rua Carlinhos José Ribeiro, 180, apto 1104, bloco B, Condomínio Torres dos Mirantes, Jaiara', 'Anápolis', 'GO', '75064350', 'Centro ', 'https://www.instagram.com/carlosalbertonails/', 314000, '', '2024-08-01 05:01:32', '2021', '1', 'atendimento | cursos', 'alongamentos | cutilagem | esmaltação em gel', '(64) 992613178', 'carlosalbertonailsdesigner@gmail.com'),
(1054, 'Carolina Nunes de Lucena', '3149572002', '0000-00-00', 'Rua Antônio Ribeiro Mendes, 2638, Santa Catarina', 'Caxias do Sul', 'RS', '95032600', 'Nordeste Rio-Grandense	', 'https://www.instagram.com/carollucenaoficial/', 17400, '', '2024-08-01 05:01:32', '2019', '1', 'cursos', 'manicure perfeita | esmaltação em gel', '(54) 992707007', 'carol_lucena20@hotmail.com'),
(1055, 'Caroline Andrize Back', '895082039', '0000-00-00', 'Rua Voluntários da Pátria, 1152, Sala 31, Centro', 'Venâncio Aires', 'RS', '95800000', 'Centro Oriental', 'https://www.instagram.com/carolinebacknailsacademy/', 4221, '', '2024-08-01 05:01:32', '2023/1', '1', '', '', '(51) 995802487', 'carolback_@hotmail.com'),
(1056, 'Caroline Gomes do Amarante', '8109295975', '0000-00-00', 'Rua Paraná, 774, Jardim Brussioli', 'Douradina', 'PR', '87485000', 'Noroeste ', 'https://www.instagram.com/carolineamarantenails/', 3500, '', '2024-08-01 05:01:32', '2022', '1', '', '', '(44) 999177579', 'carol-gomes123@hotmail.com'),
(1057, 'Cássia Pannebecker', '1986770060', '0000-00-00', 'Rua Augusto Jung, 466, Apto 301, Centro', 'Novo Hamburgo', 'RS', '93510340', 'Metropolitana', 'https://www.instagram.com/cassiabecker.nails/', 2100, '', '2024-08-01 05:01:32', '2022', '1', '', '', '(51) 985039175', 'pannebeckercassia@gmail.com'),
(1058, 'Cíntia Gomes da Silva Fernandes', '9672479778', '0000-00-00', 'Alameda São Boaventura, 612, Bloco 2, apto 503, Fonseca', 'Niterói', 'RJ', '24120191', 'Metropolitana ', 'https://www.instagram.com/cintiagomes.nailartist/', 24000, '', '2024-08-01 05:01:32', '2021', '1', 'atendimento | cursos', 'alongamentos', '(21) 997998477', 'cintia.silva.598@gmail.com '),
(1059, 'Andréia Aparecida Pereira Gonçalves', '34904096800', '0000-00-00', 'Rua Vereador Olien do Nascimento, 78, Casa Grande II', 'Francisco Morato', 'SP', '7906075', 'Metropolitana de SP', 'https://www.instagram.com/andreiagoncalvesunhas/', 10800, '', '2024-08-01 05:01:32', '2023/2', '1', '', '', '(11) 996921160', 'deiatoschi@gmail.com'),
(1060, 'Crisele Fiorentin', '3164151039', '0000-00-00', 'Rua Júlio de Castilhos, 42, Galeria, Centro', 'Garibaldi', 'RS', '95720000', 'Nordeste Rio-Grandense	', 'https://www.instagram.com/crisfiorentinnail/', 11300, '', '2024-08-01 05:01:32', '2023/1', '1', '', '', '(54) 997043772', 'cris.fiorentin14@gmail.com'),
(1061, 'Cristiane Strada', '3017530086', '0000-00-00', 'Rua Domênico Fin, 873, Lumiere Ateliê, Cruzeiro', 'Farroupilha', 'RS', '95176304', 'Nordeste Rio-Grandense	', 'https://www.instagram.com/crisstrada.nails/', 2781, '', '2024-08-01 05:01:32', '2023/1', '1', '', '', '(54) 999531125', 'cstrada134@gmail.com'),
(1062, 'Cristiani Fenske', '4083565101', '0000-00-00', 'Rua Deodoro, 200, Sala 61 e 62, Centro', 'Florianópolis', 'SC', '88010020', 'Grande Florianópolis	', 'https://www.instagram.com/crisfenskenails/', 106000, '', '2024-08-01 05:01:32', '2023/1', '1', '', '', '(48) 991608428', 'cristianifenske@hotmail.com'),
(1063, 'Daiane do Amaral (Daia Amaral)', '1999898001', '0000-00-00', 'Rua Cariri, 77, Sala 21, Jardim Mauá', 'Novo Hamburgo', 'RS', '93548510', 'Metropolitana', 'https://www.instagram.com/daia.amarall', 15600, '', '2024-08-01 05:01:32', '2023/2', '1', '', '', '(51) 998411757', 'dai88amaral@gmail.com'),
(1064, 'Dienifer Caseres', '2728853045', '0000-00-00', 'Rua Vidal de Negreiros, 503, Vila Junção', 'Rio Grande', 'RS', '96212400', 'Sudeste Rio-Grandense	', 'https://www.instagram.com/dienifer_caseres/', 3789, '', '2024-08-01 05:01:32', '2023/1', '1', '', '', '(53) 991612878', 'dieniferfc2015@gmail.com'),
(1066, 'Dilma da Silva Minusculi', '850089905', '0000-00-00', 'Rua Piauí, 251, São Cristóvão', 'Lages', 'SC', '88509170', 'Serrana', 'https://www.instagram.com/dilmaminusculi/', 2700, '', '2024-08-01 05:01:32', '2022', '1', '', '', '(49) 988245040', 'didilms@hotmail.com'),
(1067, 'Edilane dos Santos Leite', '1098857593', '0000-00-00', 'Rua Cláudio Vilela Santos, 33, Portal das Colinas', 'Guaratinguetá', 'SP', '12516180', 'Vale do Paraíba Paulista	', 'https://www.instagram.com/edilanesantos_designerdeunhas/', 5000, '', '2024-08-01 05:01:32', '2018', '1', 'atendimento', 'alongamentos | manicure russa', '(12) 981734259', 'edilanes1985@gmail.com'),
(1068, 'Edinéia Cristina Silva da Cunha', '127039074', '0000-00-00', 'Rua Arnaldo Martins, 37, Vera Cruz', 'Gravataí', 'RS', '94090570', 'Metropolitana', 'https://www.instagram.com/unica.edineiacristina/', 1771, '', '2024-08-01 05:01:32', '2018', '1', 'atendimento | cursos', 'alongamentos | esmaltação em gel | manicure russa', '(51) 981672740', 'edicrist2010@gmail.com '),
(1069, 'Elaine Cristina Couto Simão (Nany Couto)', '7898074912', '0000-00-00', 'Rua Carlos Schroeder, 30, São Vicente', 'Itajaí', 'SC', '88309260', 'Vale do Itajaí', 'https://www.instagram.com/nanyycouto/', 13300, '', '2024-08-01 05:01:32', '2023/2', '1', '', '', '(47) 988593566', 'nanypodologia2021@hotmail.com'),
(1070, 'Napoleão Afonso Canela Junior', '32367557845', '0000-00-00', 'Avenida Guarulhos, 2845, Torre 13, Apto 165, Ponte Grande', 'Guarulhos', 'SP', '7031000', 'Metropolitana de SP	', 'https://www.instagram.com/napoleao_canela/', 22934, '', '2024-08-01 05:01:32', '2023/2', '1', '', '', '(11) 986317758', 'napoleao.canela@gmail.com'),
(1071, 'Fernanda Ferreira Da Silva', '70227384407', '0000-00-00', 'Rua Fritz Muller, 50, Sala 501, Coqueiros', 'Florianópolis', 'SC', '88080720', 'Grande Florianópolis	', 'https://www.instagram.com/fernandaferreira.nails/', 14000, '', '2024-08-01 05:01:32', '2022', '1', '', '', '(27) 998888257', 'fernandaa703@gmail.com'),
(1072, 'Fernanda Salvador ', '34069432841', '0000-00-00', 'Rua VN 72 - Hennio de Paula Barbosa, 1361, Conjunto Habitacional Vida Nova', 'Barretos', 'SP', '14784864', 'Ribeirão Preto	', 'https://www.instagram.com/fernandasalvadornail/', 3503, '', '2024-08-01 05:01:32', '2023/2', '1', '', '', '(17) 996644000', 'fernandasalvador1@hotmail.com'),
(1073, 'Francieli Fátima dos Santos', '1751074080', '0000-00-00', 'Rua Fiorelo Baú, 120, Jardim Glória', 'Bento Gonçalves', 'RS', '95700000', 'Nordeste Rio-Grandense	', 'https://www.instagram.com/francisantos_esmalteria/', 2150, '', '2024-08-01 05:01:32', '2021', '1', 'atendimento | cursos', 'alongamentos | esmaltação em gel | manicure russa', '(54) 984026753', 'francifjbento@gmail.com'),
(1074, 'Gabriela Costa Pereira', '41248185803', '0000-00-00', 'Rua Professora Maria de Lourdes Almeida Sinisgalli, 372, Jardim Wanderley', 'Tatuí', 'SP', '18277560', 'Itapetininga	', 'https://www.instagram.com/gabrielacostaunhas/', 3451, '', '2024-08-01 05:01:32', '2023/1', '1', '', '', '(15) 996774498', 'gabicostapereira@hotmail.com'),
(1075, 'Gabriela Savaris', '8765563905', '0000-00-00', 'Rua Osvaldo Cruz, 447, Centro', 'Videira', 'SC', '89560142', 'Oeste Catarinense', 'https://www.instagram.com/gabisavaris/', 4990, '', '2024-08-01 05:01:32', '2022', '1', '', '', '(49) 998035253', 'gbsavaris@gmail.com'),
(1076, 'Gabriele Feltran da Costa Lima', '37626157800', '0000-00-00', 'Rua Coronel Marçal, 320, Centro', 'São José do Rio Pardo', 'SP', '13720000', 'Campinas ', 'https://www.instagram.com/_gabicostalima/', 10600, '', '2024-08-01 05:01:32', '2021', '1', 'atendimento | cursos', 'esmaltação em gel | manicure perfeita', '(19) 995196598', 'gabi_nailart01@hotmail.com'),
(1077, 'Gabrielli Da Silva Pio Bertoldi', '777882060', '0000-00-00', 'Rua Coronel Fonseca, 181, Centro', 'Gravataí', 'RS', '94035330', 'Metropolitana', 'https://www.instagram.com/gabriellibertoldiunhas/', 7018, '', '2024-08-01 05:01:32', '2022', '1', '', '', '(51) 991518606', 'gabriellibertoldiestudio@gmail.com'),
(1078, 'Fabiana Cristina Alves Nery (Fabi Nery)', '34990202899', '0000-00-00', 'Rua Willian Waddel, 526, Centro', 'Jandira', 'SP', '6606410', 'Metropolitana de SP', 'https://www.instagram.com/fabinery.oficial/', 122000, '', '2024-08-01 05:01:32', '2021', '1', 'atendimento | workshops', 'fibra de vidro', '(11) 999442508', 'fabibibi1986@hotmail.com'),
(1079, 'Viviane Xavier da Silva', '36308139840', '0000-00-00', 'Rua João Cardoso Pereira, 80, Parque Monte Líbano', 'Mogi das Cruzes', 'SP', '8780260', 'Metropolitana de SP	', 'https://www.instagram.com/manirussa/', 3909, '', '2024-08-01 05:01:32', '2023/1', '1', '', '', '(11) 983269704', 'viviris.xavier@hotmail.com'),
(1080, 'Graziela Maria Simas', '7148851939', '0000-00-00', 'Rua Benjamin Constant, 291, Centro', 'Ascurra', 'SC', '89138000', 'Vale do Itajaí', 'https://www.instagram.com/grazisimasmani/', 2100, '', '2024-08-01 05:01:32', '2022', '1', '', '', '(47) 991417389', 'grazielasimas7@gmail.com'),
(1081, 'Graziela Santos Brum', '436931052', '0000-00-00', 'Rua Santa Terezinha, nº 48\nBairro São Francisco de Assis \nCEP: 88340-724\nCamboriú/SC', 'Balneário Camboriú', 'SC', '88330296', 'Vale do Itajaí', 'https://www.instagram.com/grazielabrum/', 447000, '', '2024-08-01 05:01:32', '2021', '1', 'atendimento | cursos', 'cutilagem | esmaltação em gel', '(47) 996656779', 'brum.santos.83@gmail.com'),
(1082, 'Hellen Gomes Machado', '3020615097', '0000-00-00', 'Rua Maranguapé, 72, Sala 702, Petrópolis', 'Porto Alegre', 'RS', '90690380', 'Metropolitana', 'https://www.instagram.com/hellengomes.m/', 2670, '', '2024-08-01 05:01:32', '2021', '1', 'atendimento | cursos', 'alongamentos | esmaltação em gel | manicure russa', '(51) 985957387', 'hellengmachado@gmail.com'),
(1083, 'Iranete Souza', '7529322680', '0000-00-00', 'Avenida Araçuaí, 505, Casa B, São Jorge', 'Itaobim', 'MG', '39625000', 'Jequitinhonha', 'https://www.instagram.com/iranete.educadoranails/', 2258, '', '2024-08-01 05:01:32', '2023/1', '1', '', '', '(33) 998089669', 'iranetesouza@hotmail.com'),
(1084, 'Isabele Aurélia Barbosa da Cruz', '39516964869', '0000-00-00', 'Rua Casemiro Dias, 1131, Vila Nova', 'Presidente Prudente', 'SP', '19015250', 'Presidente Prudente	', 'https://www.instagram.com/isahbarbosanails/', 2784, '', '2024-08-01 05:01:32', '2023/2', '1', '', '', '(18) 997197367', 'isabelee19@hotmail.com'),
(1085, 'Isaura Mendes Corrêa ', '4117329359', '0000-00-00', 'Rua Pernambuco, s/n, Chácara Brasil Turu', 'São Luís', 'MA', '65066851', 'Norte', 'https://www.instagram.com/isauramendesnails/', 11800, '', '2024-08-01 05:01:32', '2019', '1', 'atendimento | cursos', 'alongamentos | esmaltação em gel | manicure russa', '(98) 991227319', 'isauramendescorrea@icloud.com'),
(1086, 'Itaiane de Jesus ', '8599766155', '0000-00-00', 'Alameda Bela Vista, Conj. Fazenda Grande III, Quadra D, bloco 46, apartamento 204, Cajazeiras', 'Salvador', 'BA', '41340160', 'Metropolitana', 'https://www.instagram.com/itaianedjesus/', 48000, '', '2024-08-01 05:01:32', '2019', '1', 'atendimento | cursos', 'alongamentos', '(71) 987976047', 'itaianedejesus@outlook.com'),
(1087, 'Janaína Esthefani Rodrigues', '1037485980', '0000-00-00', 'Rua Frei Edgar, 162, Centro', 'Joaçaba', 'SC', '89600000', 'Oeste Catarinense', 'https://www.instagram.com/janainarodrigues.rainha/', 244000, '', '2024-08-01 05:01:32', '2019', '1', 'cursos', 'alongamentos | manicure russa', '(49) 985019964', 'jrnailschool@gmail.com'),
(1088, 'Jeniffer Da Silva Almeida', '36952123814', '0000-00-00', 'Rua Roque Issa, 450, Jardim das Palmeiras', 'Boituva', 'SP', '18550208', 'Itapetininga	', 'https://www.instagram.com/jenifferalmeida.nails/', 8147, '', '2024-08-01 05:01:32', '2022', '1', '', '', '(15) 981024334', 'jeniffer.s.almeida@hotmail.com'),
(1089, 'Jéssica Adriele Bernardes', '42624416870', '0000-00-00', 'Avenida Luís Alberto 855, Vila Velosa', 'Araraquara', 'SP', '14806005', 'Araraquara', 'https://www.instagram.com/jebernardesnails/', 5400, '', '2024-08-01 05:01:32', '2019', '1', 'atendimento | cursos', 'alongamentos | blindagem | esmaltação em gel | manicure russa', '(16) 991677213', 'studiojessicabernardes@outlook.com'),
(1090, 'Jéssica Fernanda Macedo Godlinski dos Santos', '7444820970', '0000-00-00', 'Rua Holanda, 719, Loja 8', 'Curitiba', 'PR', '82540040', 'Metropolitana ', 'https://www.instagram.com/jessicamacedounhas/', 1279, '', '2024-08-01 05:01:32', '2021', '1', 'atendimento | cursos', 'alongamentos | manicure russa', '(41) 996221526', 'jessicamacedomaster@gmail.com'),
(1091, 'Jéssica Santana', '7595863902', '0000-00-00', 'Rua Padre Anchieta, 2540, Sala 907, Bigorrilho', 'Curitiba', 'PR', '80730000', 'Metropolitana ', 'https://www.instagram.com/manicurejessicasantana/', 414, '', '2024-08-01 05:01:32', '2023/1', '1', '', '', '(41) 999848152', 'studiojessicasantananails@gmail.com'),
(1092, 'Josiane Lima Guerra', '4074829037', '0000-00-00', 'Rua Venâncio Aires, 816, Sala 10, Centro', 'Soledade', 'RS', '99300000', 'Noroeste Rio-Grandense', 'https://www.instagram.com/josiane_guerra/', 4600, '', '2024-08-01 05:01:32', '2022', '1', '', '', '(54) 996966040', 'josianeguerra22@gmail.com'),
(1093, 'Josieli Fonseca Garcia', '3904166069', '0000-00-00', 'Rua Barão do Cerro Largo, 291, Florestal', 'Lajeado', 'RS', '95900672', 'Centro Oriental', 'https://www.instagram.com/josielifonseca.nails/', 4837, '', '2024-08-01 05:01:32', '2023/2', '1', '', '', '(55) 997714061', 'josigarcia1312@gmail.com'),
(1094, 'Juliana da Cunha Garcia', '2897853085', '0000-00-00', 'Rua Reverendo Antônio Joaquim Teixeira Guedes, 280, Antiga Rua 746, Prado Velho', 'Bagé', 'RS', '96418525', 'Sudoeste Rio-Grandense', 'https://www.instagram.com/unhas_julianagarcia/', 28200, '', '2024-08-01 05:01:32', '2023/2', '1', '', '', '(53) 999046058', 'julianagarcia9876@gmail.com'),
(1095, 'Kátia Buffon', '2199402070', '0000-00-00', 'Avenida Planalto 1235, sala 101, São Bento', 'Bento Gonçalves', 'RS', '95703114', 'Nordeste Rio-Grandense	', 'https://www.instagram.com/katia.buffon/', 12700, '', '2024-08-01 05:01:32', '2021', '1', 'atendimento | cursos', 'manicure | manicure russa', '(54) 996052579', 'katiabuffon89@gmail.com'),
(1096, 'Kelly Menon', '1717192041', '0000-00-00', 'Avenida Valdomiro Bocchese, 835, apto 01, Centro', 'Antônio Prado', 'RS', '95250000', 'Nordeste Rio-Grandense	', 'https://www.instagram.com/kelly_menon/', 40800, '', '2024-08-01 05:01:32', '2023/1', '1', '', '', '(54) 999602656', 'c.ekellymenon@gmail.com'),
(1097, 'Lilian Alves Vieira', '4055327684', '0000-00-00', 'Rua Engenheiro Gaffree, 752, Mar Grosso', 'Laguna', 'SC', '88790000', 'Sul Caterinense ', 'https://www.instagram.com/lilianvieiraoficial/', 85200, '', '2024-08-01 05:01:32', '2021', '1', 'cursos', 'alongamentos', '(48) 991088010', 'oficial.lilianvieira@gmail.com'),
(1098, 'Luana Vizeu (Belcompany)', '1622656032', '0000-00-00', 'Rua dos Andradas, 1276, 1302, Centro Histórico', 'Porto Alegre', 'RS', '90020008', 'Metropolitana', 'https://www.instagram.com/luanavizeu_educadoramaster/', 2800, '', '2024-08-01 05:01:32', '2019', '1', 'cursos', 'alongamentos', '(51) 986094376', 'luanavizeu@hotmail.com'),
(1099, 'Lucélia De Oliveira', '365345016', '0000-00-00', 'Travessa Harmonia, 294, Santo Inácio', 'Santa Cruz do Sul', 'RS', '96820490', 'Centro Oriental', 'https://www.instagram.com/lucelia_oliveirastudio/', 4339, '', '2024-08-01 05:01:32', '2022', '1', '', '', '(51) 997851270', 'luceliaoliveirastudio@gmail.com'),
(1100, 'Marcella Adriana Magnaguagno (Marcella Vieira)', '6196908952', '0000-00-00', 'Rua São Pedro, 833, Sala 07, São Pedro', 'Brusque', 'SC', '88351404', 'Vale do Itajaí', 'https://www.instagram.com/marcellavieiraa_/', 6658, '', '2024-08-01 05:01:32', '2022', '1', '', '', '(47) 992512787', 'marcelladriana@yahoo.com.br'),
(1101, 'Maria Alziane Alves Ribeiro', '1077420200', '0000-00-00', 'Rua das Orquídeas, 325, Bosque da Saude', 'Cuiabá', 'MT', '78050010', 'Centro-Sul', 'https://www.instagram.com/alzianealves/', 47400, '', '2024-08-01 05:01:32', '2018', '1', 'atendimento | cursos', 'alongamentos | manicure russa', '(65) 996101275', 'alzianealvesribeiro@hotmail.com'),
(1102, 'Gisele Varela Silva', '37243120830', '0000-00-00', 'Avenida Senador Vergueiro, 823, apto 103, Jd. Mar SBC, Centro', 'São Bernardo do Campo', 'SP', '9750000', ' Metropolitana de SP', 'https://www.instagram.com/giselevarelas/', 13800, '', '2024-08-01 05:01:32', '2022', '1', '', '', '(11) 947787925', 'giselevarelanailartist@gmail.com'),
(1103, 'Michele Carine Arruda Lima Veras', '2744204498', '0000-00-00', 'Av. Norte Miguel Arraes de Alencar, 3003, Térreo, CXP 1870, Encruzilhada', 'Recife', 'PE', '52041080', 'Metropolitana ', 'https://www.instagram.com/michele_carine/', 33100, '', '2024-08-01 05:01:32', '2019', '1', 'cursos | loja', 'blindagem | esmaltação em gel | manicure russa', '(81) 995188888', 'michele_carine@hotmail.com'),
(1104, 'Miriam Rodrigues Felix Vasconcelos', '2315712165', '0000-00-00', 'SDS, Bloco A, Lote 44, Ed. Boulevard Center, Sobreloja 5, Asa Sul', 'Brasília', 'DF', '70391900', 'Distrito Federal', 'https://www.instagram.com/miriamvasconcelos.master/', 10600, '', '2024-08-01 05:01:32', '2019', '1', 'atendimento | cursos', 'alongamentos | manicure russa', '(61) 981724242', 'madambe.studio@gmail.com'),
(1105, 'Mônica Ferreira de Sousa Lima Moura', '398045186', '0000-00-00', 'Rua 4, s/n, Quadra 21, Lote 5, Conjunto Residencial Patrocínio', 'Araguaína', 'TO', '77826608', 'Ocidental do Tocantins	', 'https://www.instagram.com/monicasnailsdesigner', 11000, '', '2024-08-01 05:01:32', '2023/2', '1', '', '', '(63) 992656424', 'monicaslimoura@gmail.com'),
(1106, 'Nágila Torres Oliveira Pinheiro', '42617633896', '0000-00-00', 'Rua Marcílio Dias, 361, São Vicente', 'Araçatuba', 'SP', '16050095', 'Araçatuba	', 'https://www.instagram.com/manicuresinceraoficial/', 283000, '', '2024-08-01 05:01:32', '2022', '1', 'atendimento | cursos', 'alongamentos', '(18) 996913691', 'nagilatorresoliveira94@gmail.com'),
(1107, 'Naime Maiara Machado', '2244051013', '0000-00-00', 'Duque de Caxias, 1060, Cruzeiro ', 'Passo Fundo', 'RS', '99070210', 'Noroeste Rio-Grandense', 'https://www.instagram.com/naime.maiara_unhas/', 7513, '', '2024-08-01 05:01:32', '2019', '1', 'atendimento | cursos', 'alongamentos | cutilagem | esmaltação em gel', '(54) 984093256', 'nailmeschool@gmail.com'),
(1108, 'Cleonice Ribeiro Junior (Cléo Júnior)', '26256040856', '0000-00-00', 'Rua Manuel Bueno da Fonseca, 27, Casa 2, Jardim São Luís', 'Sâo Paulo', 'SP', '8121000', 'Metropolitana de SP', 'https://www.instagram.com/cleojunior.unhas', 7671, '', '2024-08-01 05:01:32', '2023/2', '1', '', '', '(11) 977733267', 'cleonicejunior@hotmail.com'),
(1109, 'Niceia Santos Cruz Borel', '2633853374', '0000-00-00', 'Rua Santa Rita de Cássia, 105, Casa A, Santa Júlia', 'Itupeva', 'SP', '13295640', 'Metropolitana Paulista', 'https://www.instagram.com/niceiaborel/', 5121, '', '2024-08-01 05:01:32', '2023/2', '1', '', '', '(11) 971438110', 'niceiasborel@gmail.com'),
(1110, 'Nilcedes Pinheiro Piva (Nill Pinheiro)', '28191532832', '0000-00-00', 'Rua Mercídio Pazelli, 196, Jardim São Luiz', 'Valinhos', 'SP', '13272706', 'Campinas', 'https://www.instagram.com/nill_pinheironails/', 30600, '', '2024-08-01 05:01:32', '2021', '1', 'cursos', 'blindagem | esmaltação em gel', '(19) 996175861', 'nilcedespinheiro@yahoo.com.br'),
(1111, 'Gláucia Helena Silva Ribeiro (Gau Helena)', '39607699890', '0000-00-00', 'Rua Monsenhor Marinho de Oliveira, 229, Limoeiro', 'São Paulo', 'SP', '8051460', 'Metropolitana de SP', 'https://www.instagram.com/gauhelena/', 41900, '', '2024-08-01 05:01:32', '2018', '1', 'atendimento | cursos', 'manicure perfeita | blindagem', '(11) 973488581', 'gau.helena@hotmail.com'),
(1112, 'Patrícia Rodrigues Duarte', '99340607600', '0000-00-00', 'Av. Santa leopoldina, 2200, Ed. Moldávia, apto 301, Coqueiral de Itaparica', 'Vila Velha', 'ES', '29102385', 'Central', 'https://www.instagram.com/patriciaduartenails/', 1500, '', '2024-08-01 05:01:32', '2021', '1', 'atendimento | cursos', 'alongamentos | manicure russa', '(27) 981733219', 'patriciaduartedepiladora@gmail.com'),
(1113, 'Paula Andryely Brites Ramos', '8940296907', '0000-00-00', 'Rua Cap. Jonas Mateus Almeida, 146, Palmital', 'Colombo', 'PR', '83413137', 'Metropolitana ', 'https://www.instagram.com/paulaandryely_nails/', 3382, '', '2024-08-01 05:01:32', '2019', '1', 'atendimento | cursos', 'alongamentos | manicure russa | pedicure', '(41) 996416878', 'educadora.paulaandryely@gmail.com'),
(1114, 'Paula Becker Vieira', '2687484032', '0000-00-00', 'Rua General Gomes Carneiro, 436, Maria Goretti', 'Bento Gonçalves', 'RS', '95707000', 'Nordeste Rio-Grandense	', 'https://www.instagram.com/paulabecker_unhas/', 4883, '', '2024-08-01 05:01:32', '2022', '1', '', '', '(54) 999628807', 'pbeckervieira@gmail.com'),
(1115, 'Rafaela Fernandes', '10154967920', '0000-00-00', 'Rua Carlos de Carvalho, 900, Parque São Paulo', 'Cascavel', 'PR', '85803780', 'Oeste', 'https://www.instagram.com/rafafernandesnail/', 3973, '', '2024-08-01 05:01:32', '2023/1', '1', '', '', '(45) 998262698', 'raafa.fernandes@hotmail.com'),
(1116, 'Rafaella Colares da Silva', '1625800029', '0000-00-00', 'Rua Campolino Alves, 1199, bloco B, apto 207, Abraão', 'Florianópolis', 'SC', '88085155', 'Grande Florianópolis	', 'https://www.instagram.com/rafaella.colares/', 4800, '', '2024-08-01 05:01:32', '2019', '1', 'atendimento | cursos', 'alongamentos | manicure russa', '(53) 999511124', 'rafaellacolaressilva@gmail.com'),
(1117, 'Renata Pedroso Mendes', '36996732867', '0000-00-00', 'Rua Giuliano Rodrigues Haak, 146, Vila Guilhermina', 'São Roque', 'SP', '18133503', 'Metropolitana Paulista', 'https://www.instagram.com/renatamendesnaildesigner/', 3078, '', '2024-08-01 05:01:32', '2023/2', '1', '', '', '(11) 975161165', 'rena.uni@gmail.com'),
(1118, 'Renato da Cruz Irineu (Renato Irineu)', '8445652532', '0000-00-00', 'Estrada do Rio Grande, 2034, bloco 3, apto 110, Taquara', 'Rio de Janeiro', 'RJ', '22720011', 'Metropolitana ', 'https://www.instagram.com/renato.irineu.nails/\n', 134000, '', '2024-08-01 05:01:32', '2022', '1', 'cursos', 'alongamentos | cutilagem', '(11) 946367580', 'rennatobergamachy@hotmail.com'),
(1119, 'Rosana Rodrigues da Cruz', '36662646890', '0000-00-00', 'Prefeito Francisco Gonzaga Franco, 703, Jardim Aeroporto', 'São José do Rio Pardo', 'SP', '13720000', 'Campinas', 'https://www.instagram.com/rosanarodrigues.unhas/', 37000, '', '2024-08-01 05:01:32', '2023/1', '1', '', '', '(19) 989020655', 'rosanadivascruz@gmail.com'),
(1120, 'Valdinéia Cristina Nogueira Biela', '2513303113', '0000-00-00', 'Rua Sergipe, 516, apto 51, Centro', 'Catanduva', 'SP', '15800100', 'São José do Rio Preto	', 'https://www.instagram.com/cristina_biela/', 43200, '', '2024-08-01 05:01:32', '2018', '1', 'cursos', 'alongamentos | manicure russa', '(17) 992509933', 'cristina.biela@muybiela.com.br'),
(1121, 'Sabrina Venturin', '2220495027', '0000-00-00', 'Rua Espírito Santo, 296, Centro | CNPJ 34.569.110/0001-90', 'Erechim', 'RS', '99700244', 'Noroeste Rio-Grandense', 'https://www.instagram.com/saventurin/', 1888, '', '2024-08-01 05:01:32', '2021', '1', 'atendimento | cursos', 'alongamentos | manicure russa', '(54) 999720971', 'sa.venturin@gmail.com'),
(1122, 'Simone Maiara Dalcin Sutil', '7806384928', '0000-00-00', 'Rua 123B, 162, Centro', 'Itapema', 'SC', '88220000', 'Vale do Itajaí', 'https://www.instagram.com/simoneunhasdefibra/', 17100, '', '2024-08-01 05:01:32', '2021', '1', 'atendimento | cursos', 'alongamentos | manicure russa', '(47) 999443892', 'simonemaiara2302@hotmail.com'),
(1123, 'Simone Miguel Zuniga Baptista Mendes (Simone Mendes)', '8619097717', '0000-00-00', 'Rua Paulo Burle, 51, Casa 2', 'Cabo Frio', 'RJ', '28911280', 'Baixadas Litorâneas', 'https://www.instagram.com/simonemendes.nailtrainer/', 46400, '', '2024-08-01 05:01:32', '2023/2', '1', '', '', '(21) 964156215', 'sm.nailtrainer@gmail.com'),
(1124, 'Sofia Paula Vendramini', '6419343941', '0000-00-00', 'Rua Marechal Cândido Rondon, 1735, Sagrada Família', 'Dois Vizinhos', 'PR', '85660000', 'Sudoeste ', 'https://www.instagram.com/sofiapaula.nails/', 4130, '', '2024-08-01 05:01:32', '2022', '1', '', '', '(46) 999776001', 'sofia_vendramini_25@hotmail.com'),
(1125, 'Suelen Menegusso', '7495621966', '0000-00-00', 'Rua 2300, 550, Sala 02, Centro', 'Balneário Camboriú', 'SC', '88330428', 'Vale do Itajaí', 'https://www.instagram.com/suelenmenegusso/', 38500, '', '2024-08-01 05:01:32', '2023/1', '1', '', '', '(47) 996690398', 'suzynha_menegusso@hotmail.com'),
(1126, 'Taiara Aguilera', '1869235207', '0000-00-00', 'Rua Teófilo Otoni, 2956, Lagoinha', 'Porto Velho', 'RO', '76829724', 'Madeira-Guaporé	', 'https://www.instagram.com/taiaraaguileraunhas/', 15500, '', '2024-08-01 05:01:32', '2023/1', '1', '', '', '(69) 993934748', 'thaiara.aguilera@hotmail.com'),
(1127, 'Tamiris Torres', '44627630840', '0000-00-00', 'Rua Santa Maria, 356, São Sebastiao', 'Araçatuba', 'SP', '16075063', 'Araçatuba', 'https://www.instagram.com/tamiristorresnaildesigner/', 1817, '', '2024-08-01 05:01:32', '2023/2', '1', '', '', '(18) 997312019', 'tamiristorres.95@gmail.com'),
(1128, 'Tássia Leite Dutra', '2325919030', '0000-00-00', 'Rua Camila Baggio Bacchi, 797, Ana Rech', 'Caxias do Sul', '', '95060703', 'Nordeste Rio-Grandense', 'https://www.instagram.com/tassiadutranails/', 11000, '', '2024-08-01 05:01:32', '2019', '1', 'atendimento | cursos', 'blindagem | esmaltação em gel | manicure russa', '(53) 981277225', 'tassialda@gmail.com'),
(1129, 'Rosângela Alves de Souza Baron', '21879529831', '0000-00-00', 'Rua Rubião Júnior, 3232, Apto 101, Centro', 'São José do Rio Preto', 'SP', '15010090', 'São José do Rio Preto', 'https://www.instagram.com/ro_baron/', 22900, '', '2024-08-01 05:01:32', '2019', '1', 'atendimento', 'alongamentos | esmaltação em gel | manicure russa', '(17) 991129153', 'ro_asbaron@hotmail.com'),
(1130, 'Tatiane Cristina Natal Figueiredo', '1536014699', '0000-00-00', 'Rua Antônio Bernardino Muniz, 173, Centro', 'Contagem', 'MG', '32040630', 'Metropolitana', 'https://www.instagram.com/tatianefigueiredo_nails/', 36100, '', '2024-08-01 05:01:32', '2019', '1', 'atendimento | cursos', 'alongamentos', '(31) 987725330', 'tattynatall@hotmail.com'),
(1131, 'Tatiane Cristine Spaniol', '2055956000', '0000-00-00', 'Avenida Presidente Lucena, 3816, Sala 03, Centro', 'Presidente Lucena', 'RS', '93945000', 'Metropolitana', 'https://www.instagram.com/tatianespaniol/', 2686, '', '2024-08-01 05:01:32', '2023/2', '1', '', '', '(51) 995111606', 'spaniolcristine17@gmail.com'),
(1132, 'Tatiane Regina Reis (Tati Baron)', '6190181945', '0000-00-00', 'Rua Lorena Hercílio Caetano, 30, São Pedro', 'Guabiruba', 'SC', '88360000', 'Vale do Itajaí', 'https://www.instagram.com/tatirreis.nails/', 62900, '', '2024-08-01 05:01:32', '2019', '1', 'atendimento | cursos', 'alongamentos | esmaltação em gel | manicure russa', '(47) 991847427', 'tatianereisbaron1988@gmail.com'),
(1133, 'Thalita Santana Silva Lima', '14066131778', '0000-00-00', 'Rua Vinte e Sete, 48, Santa Mônica Popular', 'Vila Velha', 'ES', '29105470', 'Central', 'https://www.instagram.com/espacothalitalima/', 10900, '', '2024-08-01 05:01:32', '2023/2', '1', '', '', '(27) 997843554', 'thalitassl@gmail.com'),
(1134, 'Thatianne Regina Souza Santana (Belas Unhas)', '14285829754', '0000-00-00', 'Estrada João Pinto, 115, Parque Xerém', 'Duque de Caxias', 'RJ', '25245520', 'Metropolitana ', 'https://www.instagram.com/thatianne_santanamaster/', 12600, '', '2024-08-01 05:01:32', '2019', '1', 'atendimento | cursos', 'alongamentos | blindagem | manicure russa', '(21) 968153071', 'thatisantana1@gmail.com'),
(1135, 'Tatiana Soares', '16979350870', '0000-00-00', 'Rua Santa Maria, 417, Vila Aurora', 'São José do Rio Preto', 'SP', '15014330', 'São José do Rio Preto', 'https://www.instagram.com/tatianasoaresunhas/', 65900, '', '2024-08-01 05:01:32', '2019', '1', 'atendimento | cursos', 'alongamentos', '(17) 991525774', 'tatiateliedasunhas@gmail.com'),
(1136, 'Vanessa Fernanda da Costa Marques dos Reis (Fernanda Reis)', '6191513909', '0000-00-00', 'Rua Neide Gomes Leomil, 134, Loteamento Residencial Uirapuru', 'Apucarana', 'PR', '86803707', 'Norte Central', 'https://www.instagram.com/fermartineznails/', 3881, '', '2024-08-01 05:01:32', '2023/2', '1', '', '', '(43) 999724853', 'fermreis@outlook.com'),
(1137, 'Vanessa Lecardelli', '7130591927', '0000-00-00', 'Rua Anita Garibaldi, 2220, Primavera', 'Concórdia', 'SC', '89701130', 'Oeste Catarinense', 'https://www.instagram.com/vane.lecardelli/', 2690, '', '2024-08-01 05:01:32', '2022', '1', '', '', '(98) 988924974', 'vane.lecardelli@gmail.com'),
(1138, 'Letica Gonçalves Gomes ', '39180052835', '0000-00-00', 'Rua Carlos Bigatti, 116, Jardim Castelo', 'São Paulo', 'SP', '3728210', 'Metropolitana de SP', 'https://www.instagram.com/leticiagomes__nails/', 11300, '', '2024-08-01 05:01:32', '2023/1', '1', '', '', '(11) 989151417', 'leticia_violet@hotmail.com'),
(1139, 'Wellerson Reolon Farias (Leco Ceccato)', '47174973841', '0000-00-00', 'Rua Cintra, 470, Penha Circular', 'Rio de Janeiro', 'RJ', '21011520', 'Metropolitana ', 'https://www.instagram.com/baraodasunhas/', 67300, '', '2024-08-01 05:01:32', '2019', '1', 'atendimento | cursos', 'alongamentos ', '(21) 992846826', 'lecoceccato@gmail.com');

-- --------------------------------------------------------

--
-- Estrutura para tabela `estados`
--

CREATE TABLE `estados` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `sigla` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `estados`
--

INSERT INTO `estados` (`id`, `nome`, `sigla`) VALUES
(1, 'Acre', 'AC'),
(2, 'Alagoas', 'AL'),
(3, 'Amapá', 'AP'),
(4, 'Amazonas', 'AM'),
(5, 'Bahia', 'BA'),
(6, 'Ceará', 'CE'),
(7, 'Distrito Federal', 'DF'),
(8, 'Espírito Santo', 'ES'),
(9, 'Goiás', 'GO'),
(10, 'Maranhão', 'MA'),
(11, 'Mato Grosso', 'MT'),
(12, 'Mato Grosso do Sul', 'MS'),
(13, 'Minas Gerais', 'MG'),
(14, 'Pará', 'PA'),
(15, 'Paraíba', 'PB'),
(16, 'Paraná', 'PR'),
(17, 'Pernambuco', 'PE'),
(18, 'Piauí', 'PI'),
(19, 'Rio de Janeiro', 'RJ'),
(20, 'Rio Grande do Norte', 'RN'),
(21, 'Rio Grande do Sul', 'RS'),
(22, 'Rondônia', 'RO'),
(23, 'Roraima', 'RR'),
(24, 'Santa Catarina', 'SC'),
(25, 'São Paulo', 'SP'),
(26, 'Sergipe', 'SE'),
(27, 'Tocantins', 'TO');

-- --------------------------------------------------------

--
-- Estrutura para tabela `geocoded_addresses`
--

CREATE TABLE `geocoded_addresses` (
  `id` int(11) NOT NULL,
  `endereco` varchar(255) NOT NULL,
  `latitude` decimal(10,8) NOT NULL,
  `longitude` decimal(11,8) NOT NULL,
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `geocoded_addresses`
--

INSERT INTO `geocoded_addresses` (`id`, `endereco`, `latitude`, `longitude`, `last_updated`) VALUES
(1, 'TRAVESSA GUAIO, 381 - CENTRO - SUZANO/SP 08674-150', -23.53898070, -46.31038190, '2024-08-26 19:44:35'),
(2, 'RUA VEREADOR JULIO AGOSTINHO - 57 - PIRAPORINHA - Diadema - SP - 09950-480', -23.67646630, -46.58370770, '2024-08-26 19:44:35'),
(3, 'RUA PRUDENTE DE MORAES, 560 - CENTRO - SUZANO/SP 08674-015', -23.53503840, -46.30711220, '2024-08-26 19:44:35'),
(4, 'RUA GUARAPARI, 107 - BOSQUE DE JANDIRA - JANDIRA/SP 06620-350', -23.55129770, -46.89200100, '2024-08-26 19:44:35'),
(5, 'Rua Pedro Álvares Cabral, 135 - Jd. Maricá - Mogi das Cruzes-SP - 08775-390', -23.49978020, -46.18123720, '2024-08-26 19:44:35'),
(6, 'AVENIDA CONSELHEIRO NEBIAS, 756 - BOQUEIRAO - SANTOS/SP 11045-002', -23.96735360, -46.32421860, '2024-08-26 20:10:19'),
(7, 'RUA OSVALDO CRUZ, 141 - SANTA PAULA - SÃO CAETANO DO SUL/SP 09541-270', -23.61767180, -46.56782790, '2024-08-26 20:10:19'),
(8, 'AVENIDA JOSE BRUMATTI, 3289 - JARDIM SANTO EXPEDITO - GUARULHOS/SP 07160-170', -23.40022300, -46.43146280, '2024-08-26 20:10:19'),
(9, 'RUA MANOEL COELHO, 303 - CENTRO - SÃO CAETANO DO SUL/SP 09510-110', -23.61231690, -46.57204370, '2024-08-26 20:10:19'),
(10, 'AVENIDA DOM PEDRO I, 1060 - VILA PIRES - SANTO ANDRÉ/SP 09130-012', -23.67411990, -46.51336730, '2024-08-26 20:10:19'),
(11, 'AVENIDA AYRTON SENNA, 101 - SANTA MARIA - OSASCO/SP 06149-201', -23.58409530, -46.81014100, '2024-08-26 20:10:19'),
(12, 'ESTRADA DE SAO BENTO, 343 - JARDIM ODETE - ITAQUAQUECETUBA/SP 08598-100', -23.46414190, -46.33225290, '2024-08-26 20:10:20'),
(13, 'ESTRADA AGUA CHATA, 323 - PARQUE PIRATININGA - ITAQUAQUECETUBA/SP 08583-370', -23.43791500, -46.38364140, '2024-08-26 20:10:20'),
(14, 'RUA DONA LAURINDA, 500 - CENTRO - GUARAREMA/SP 08900-000', -23.41306200, -46.03830640, '2024-08-26 20:10:20'),
(15, 'RUA CAPITAO GABRIEL, 70 - CENTRO - GUARULHOS/SP 07011-010', -23.46939450, -46.53073730, '2024-08-26 20:10:20'),
(16, 'RUA CORONEL RAMALHO, 37 - CENTRO - GUARAREMA/SP 08900-000', -23.41244130, -46.03653060, '2024-08-26 20:10:20'),
(17, 'AVENIDA VEREADOR NARCISO YAGUE GUIMARAES 1001, 1001 - JARDIM ARMENIA - MOGI DAS CRUZES/SP 08780-910', -23.51595000, -46.17957470, '2024-08-26 20:10:20'),
(18, 'RUA SANTA CRUZ, 27 - CENTRO - SANTA ISABEL/SP 07500-000', -23.31900280, -46.22666790, '2024-08-26 20:10:20'),
(19, 'Av. da Republica, 372 - Jardim Monte Serrat, Santa Isabel - SP, 07500-000', -23.31984780, -46.22830140, '2024-08-26 20:10:21'),
(20, 'AVENIDA ANTONIO AFONSO DE LIMA, 93 - VILA FLORA REGINA - ARUJÁ/SP 07400-530', -23.40014430, -46.31876300, '2024-08-26 20:10:21'),
(21, 'AVENIDA DA REPUBLICA, 678 - MONTE SERRAT - SANTA ISABEL/SP 07500-000', -23.31759300, -46.22665460, '2024-08-26 20:10:21'),
(22, 'R. Prof. Flaviano de Melo, 878 - Centro, Mogi das Cruzes - SP, 08710-000', -23.52302280, -46.19433600, '2024-08-26 20:10:21'),
(23, 'AVENIDA ANTONIO AFONSO DE LIMA, 458 - VILA FLORA REGINA - ARUJÁ/SP 07400-530', -23.39689190, -46.32006170, '2024-08-26 20:10:21'),
(24, 'RUA FRANCISCO FRANCO - 465 - CENTRO - Mogi das cruzes - SP - 08710-590', -23.52865390, -46.19712800, '2024-08-26 20:10:21'),
(25, 'RUA DR. PAULO FRONTIN, 106 - CENTRO - MOGI DAS CRUZES/SP 08710-050', -23.52333040, -46.19359280, '2024-08-26 20:10:21'),
(26, 'RUA TENENTE MANOEL ALVES DOS ANJOS - 32 - CENTRO - Mogi das cruzes - SP - 08710-680', -23.52227760, -46.19807530, '2024-08-26 20:10:22'),
(27, 'RUA HORACE MANLEY LANE, 154 - RAPOSO TAVARES - OSASCO/SP 06149-060', -23.58797830, -46.81166280, '2024-08-26 20:10:22'),
(28, 'R. Gen. Francisco Glicério, 568 - Centro, Suzano - SP, 08674-000', -23.53947860, -46.31010930, '2024-08-26 20:10:22'),
(29, 'AVENIDA VOLUNTARIO FERNANDO PINHEIRO FRANCO - 291 - CENTRO - Mogi das cruzes - SP - 08710-500', -23.52459820, -46.19742850, '2024-08-26 20:10:22'),
(30, 'PRACA PADRE JOAO ALVARES - 37 - CENTRO - Itaquaquecetuba - SP - 08570-050', -23.47521970, -46.35183050, '2024-08-26 20:10:22'),
(31, 'Estr. de São Bento, 410 - Jardim Odete, Itaquaquecetuba - SP, 08598-100', -23.46426700, -46.33186860, '2024-08-26 20:10:22'),
(32, 'AVENIDA ESPERANCA, 74 - CENTRO - GUARULHOS/SP 07095-005', -23.46477400, -46.53131190, '2024-08-26 20:10:23'),
(33, 'RUA REPUBLICA DO LIBANO, 40 - CENTRO - OSASCO/SP 06013-060', -23.53014840, -46.77591200, '2024-08-26 20:10:23'),
(34, 'AVENIDA SILVESTRE PIRES DE FREITAS, 78 - JARDIM PARAISO - GUARULHOS/SP 07144-000', -23.42988680, -46.50245250, '2024-08-26 20:10:23'),
(35, 'Av. José Brumatti, 3596 - Jardim Santo Expedito, Guarulhos - SP, 07160-170', -23.39812880, -46.42941990, '2024-08-26 20:10:23'),
(36, 'Estr. do Sacramento, 988b - Cidade Tupinambá, Guarulhos - SP, 07260-100', -23.46266960, -46.40623830, '2024-08-26 20:10:23'),
(37, 'ESTRADA DO SACRAMENTO, 1161 - CIDADE TUPINAMBA - GUARULHOS/SP 07263-000', -23.46348750, -46.40475670, '2024-08-26 20:10:23'),
(38, 'Av. Cap. Aviador Walter Ribeiro, 400- Cumbica, Guarulhos', -23.44649850, -46.46868540, '2024-08-26 20:10:23'),
(39, 'R. João Gomes - Jardim Adriana, 32,  Guarulhos - SP, 07135-160', -23.42660710, -46.52196010, '2024-08-26 20:10:23'),
(40, 'AVENIDA SETE DE SETEMBRO - 1580 - VILA GALVAO - Guarulhos - SP - 07064-000', -23.45687310, -46.56603600, '2024-08-26 20:10:24'),
(41, 'AVENIDA VINTE E SEIS DE MARCO, 210 - CENTRO - POÁ/SP 08562-140', -23.52791770, -46.34526490, '2024-08-26 20:10:24'),
(42, 'RUA MIGUEL PRISCO, 59 - CENTRO - RIBEIRÃO PIRES/SP 09401-000', -23.71037080, -46.41436160, '2024-08-26 20:10:24'),
(43, 'AVENIDA JOSE MOREIRA - 492 - JARDIM QUARTO CENTENARIO - Mauá - SP - 09341-120', -23.68054890, -46.41757440, '2024-08-26 20:10:24'),
(44, 'AVENIDA DOM JOSE GASPAR, 1490 A - MATRIZ - MAUÁ/SP 09370-670', -23.68209040, -46.46082850, '2024-08-26 20:10:24'),
(45, 'AVENIDA BARAO DE MAUA, 31 - VILA BOCAINA - MAUÁ/SP 09310-000', -23.66691490, -46.46222560, '2024-08-26 20:10:24'),
(46, 'AVENIDA GOVERNADOR MARIO COVAS JUNIOR (VL F N MORELLI) - 01 - CENTRO - Mauá - SP - 09390-040', -23.66673720, -46.45982630, '2024-08-26 20:10:24'),
(47, 'RUA PRESIDENTE ARTHUR DA COSTA E SILVA, 414 - PARQUE SAO VICENTE - MAUÁ/SP 09371-490', -23.66648870, -46.48051680, '2024-08-26 20:10:24'),
(48, 'AVENIDA AYRTON SENNA DA SILVA, 510 - VILA SANTA CECILIA - MAUÁ/SP 09380-440', -23.65590520, -46.46832850, '2024-08-26 20:10:24'),
(49, 'R. HAVANA, 14A - PARQUE DAS AMÉRICAS, MAUÁ - SP, 09351-020', -23.69187600, -46.44827900, '2024-08-26 20:10:25'),
(50, 'RUA ALFREDO FIGLIA, 25 - JARDIM ITAPEVA - MAUÁ/SP 09330-070', -23.67597630, -46.41568800, '2024-08-26 20:10:25'),
(51, 'RUA SENADOR FLAQUER, 391 - CENTRO - SANTO ANDRÉ/SP 09010-160', -23.66183340, -46.52420170, '2024-08-26 20:10:25'),
(52, 'Av. Dom Pedro I, 4101 - Vila Luzita, Santo André - SP, 09130-400', -23.69964600, -46.50511310, '2024-08-26 20:10:25'),
(53, 'AVENIDA QUEIROS FILHO - 781 - VILA AMERICA - Santo andré - SP - 09110-260', -23.67054300, -46.50527630, '2024-08-26 20:10:25'),
(54, 'AVENIDA DOM PEDRO I, 3264 - VILA TIBIRICA - SANTO ANDRÉ/SP 09130-400', -23.69269630, -46.50631750, '2024-08-26 20:10:25'),
(55, 'RUA ORATORIO, 1628 - PARQUE DAS NACOES - SANTO ANDRÉ/SP 09280-000', -23.63764800, -46.51748390, '2024-08-26 20:10:25'),
(56, 'RUA MARTIM FRANCISCO - 316 - SANTA PAULA - São caetano do sul - SP - 09541-330', -23.61919400, -46.56157500, '2024-08-26 20:10:26'),
(57, 'AVENIDA ANTONIO PIRANGA - 142 - CENTRO - Diadema - SP - 09911-160', -23.68662100, -46.62299190, '2024-08-26 20:10:26'),
(58, 'AVENIDA PRESIDENTE KENNEDY (JD PITANGUEIRAS), 39 - CENTRO - DIADEMA/SP 09913-000', -23.68553700, -46.62647300, '2024-08-26 20:10:26'),
(59, 'RUA PAU DO CAFE, 1217 - CASA GRANDE - DIADEMA/SP 09962-375', -23.69919720, -46.59871180, '2024-08-26 20:10:26'),
(60, 'RUA ANTONIO DIAS ADORNO, 463 - VILA NOGUEIRA - DIADEMA/SP 09951-000', -23.68941050, -46.59492280, '2024-08-26 20:10:26'),
(61, 'AVENIDA ANTONIO SYLVIO CUNHA BUENO - 921 - INAMAR - Diadema - SP - 09970-160', -23.71758660, -46.61198340, '2024-08-26 20:10:26'),
(62, 'Av. Lico Maia, 497 - Conceição, Diadema - SP, 09981-420', -23.69960610, -46.61306370, '2024-08-26 20:10:27'),
(63, 'PRACA BOM JESUS DE PIRAPORINHA - 336 - PIRAPORINHA - Diadema - SP - 09951-550', -23.69156180, -46.58059060, '2024-08-26 20:10:27'),
(64, 'RUA ALVARENGA PEIXOTO, 55 - VILA NOGUEIRA - DIADEMA/SP 09960-440', -23.69352030, -46.59659340, '2024-08-26 20:10:27'),
(65, 'AVENIDA ITAMARATI, 1711 - VILA CURUCA - SANTO ANDRÉ/SP 09290-730', -23.64206000, -46.51068720, '2024-08-26 20:10:27'),
(66, 'PRACA BOM JESUS DE PIRAPORINHA, 49 - PIRAPORINHA - DIADEMA/SP 09951-550', -23.69161070, -46.58318880, '2024-08-26 20:10:27'),
(67, 'AVENIDA PRESIDENTE JUSCELINO, 1099 - PIRAPORINHA - DIADEMA/SP 09950-370', -23.68254390, -46.58683220, '2024-08-26 20:10:27'),
(68, 'AVENIDA ALBERTO JAFET (VL ANA SOFIA) - 870 - VILA NOGUEIRA - Diadema - SP - 09951-110', -23.69061730, -46.59914220, '2024-08-26 20:10:28'),
(69, 'AVENIDA ELIAS ALVES DA COSTA - 281 - CENTRO - Vargem grande paulista - SP - 06730-000', -23.60539890, -47.02689630, '2024-08-26 20:10:28'),
(70, 'AVENIDA INOCENCIO SERAFICO, 3597 - VILA SILVA RIBEIRO - CARAPICUÍBA/SP 06380-021', -23.55402490, -46.83567170, '2024-08-26 20:10:28'),
(71, 'AVENIDA INOCENCIO SERAFICO, 3644 - VILA DIRCE - CARAPICUÍBA/SP 06343-410', -23.55450710, -46.83637600, '2024-08-26 20:10:28'),
(72, 'Avenida Inocêncio Seráfico, 1653, Carapicuíba, Brazil 06380-020', -23.53552390, -46.83575900, '2024-08-26 20:10:28'),
(73, 'ESTRADA DO COPIUVA, 1780 - PARQUE JANDAIA - CARAPICUÍBA/SP 06330-000', -23.55765120, -46.82920520, '2024-08-26 20:10:28'),
(74, 'AVENIDA BRIGADEIRO MANOEL RODRIGUES JORDAO - 1509 - JARDIM SILVEIRA - Barueri - SP - 06433-010', -23.53173740, -46.88542350, '2024-08-26 20:10:29'),
(75, 'RUA ANTONIO AGU - 617 - CENTRO - Osasco - SP - 06013-003', -23.53291700, -46.77858610, '2024-08-26 20:10:29'),
(76, 'Avenida Zélia, 569, Barueri, Brazil 06436000', -23.53639170, -46.88850720, '2024-08-26 20:10:29'),
(77, 'RUA DAS AMAZONAS - 240 - PORTAIS (POLVILHO) - Cajamar - SP - 07790-850', -23.40589330, -46.85898330, '2024-08-26 20:10:29'),
(78, 'AVENIDA TENENTE MARQUES - 2051 - PANORAMA (POLVILHO) - Cajamar - SP - 07792-820', -23.40963190, -46.84295770, '2024-08-26 20:10:29'),
(79, 'AVENIDA DEOVAIR CRUZ DE OLIVEIRA - 385 - CONDOMINIO PENTEADO - Cajamar - SP - 07776-435', -23.33593270, -46.83987920, '2024-08-26 20:10:30'),
(80, 'Av. Ver. Joaquim Pereira Barbosa, 227 - Jardim Nova Jordanésia, Cajamar - SP, 07770-000', -23.33457200, -46.83942110, '2024-08-26 20:10:30'),
(81, 'Av. Prof. Carvalho Pinto, 72 - Centro, Caieiras - SP, 07700-000', -23.36257550, -46.74658360, '2024-08-26 20:10:30'),
(82, 'Rua Danilo Valbuza, 728, Caieiras 07747300', -23.39107580, -46.71532550, '2024-08-26 20:10:30'),
(83, 'RUA PROGRESSO - 830 - CENTRO - Francisco morato - SP - 07901-080', -23.28529370, -46.74379740, '2024-08-26 20:10:31'),
(84, 'RUA GERONIMO CAETANO GARCIA, 111 - CENTRO - FRANCISCO MORATO/SP 07901-970', -23.27919910, -46.74327800, '2024-08-26 20:10:31'),
(85, 'AVENIDA PREFEITO CASSIANO GONCALVES PASSOS, 43 - CENTRO - FRANCISCO MORATO/SP 07901-005', -23.27945500, -46.74387260, '2024-08-26 20:10:31'),
(86, 'Av. Crisântemo, 136 - Jardim das Flores, Osasco - SP, 06112-100', -23.53320490, -46.79398180, '2024-08-26 20:10:31'),
(87, 'RUA DANTE BATTISTON - 277 - CENTRO - Osasco - SP - 06013-030', -23.53260360, -46.77805230, '2024-08-26 20:10:31'),
(88, 'AVENIDA DR JOAO DE ANDRADE, 1874 - JD STO ANTONIO - OSASCO/SP 06132-006', -23.56248950, -46.79847260, '2024-08-26 20:10:31'),
(89, 'RUA REPUBLICA DO LIBANO, 101 - CENTRO - OSASCO/SP 06013-060', -23.53015790, -46.77655550, '2024-08-26 20:10:32'),
(90, 'AVENIDA JOAO DE ANDRADE, 1180 / 1186 - SANTO ANTONIO - OSASCO/SP 06132-002', -23.55655820, -46.80143710, '2024-08-26 20:10:32'),
(91, 'Rua doutor bento vidal 38, Osasco, Sao Paulo', -23.57032880, -46.79366340, '2024-08-26 20:10:32'),
(92, 'Av. Cruzeiro do Sul, 1258 - Rochdale, Osasco - SP, 06226-000', -23.51004700, -46.77749700, '2024-08-26 20:10:32'),
(93, 'AVENIDA PAULO AYRES, 604 - PARQUE PINHEIROS - TABOÃO DA SERRA/SP 06767-220', -23.62138020, -46.78507000, '2024-08-26 20:10:32'),
(94, 'AVENIDA DOUTOR JOSE MACIEL, 727 - JARDIM MARIA ROSA - TABOÃO DA SERRA/SP 06763-270', -23.61346590, -46.76366460, '2024-08-26 20:10:32'),
(95, 'RUA OSWALDO CRUZ - 319 - BOQUEIRAO - Santos - SP - 11045-100', -23.96485110, -46.32061980, '2024-08-26 20:10:32'),
(96, 'RUA JOAO PESSOA, 137 - CENTRO - SANTOS/SP 11013-001', -23.93474270, -46.32692460, '2024-08-26 20:10:33'),
(97, 'Av. Ademar de Barros, 1634 - Jardim Primavera, Guarujá - SP, 11430-002', -23.99137960, -46.27589610, '2024-08-26 20:10:33'),
(98, 'AVENIDA DOS EXPEDICIONARIOS - 77 - Franco da rocha - SP - 07803-010 (Shopping Franco da rocha - Loja 116/117)  ', -23.32897200, -46.72742420, '2024-08-26 20:10:33'),
(99, 'RUA SANTA ELIZABETH, 361 - VILA PARAISO - GUARULHOS/SP 07241-170', -23.44245780, -46.42685070, '2024-08-26 20:10:33'),
(100, 'AVENIDA ALVARO GUIMARAES, 924 - PLANALTO - SÃO BERNARDO DO CAMPO/SP 09890-003', -23.69811200, -46.56631080, '2024-08-26 20:10:33'),
(101, 'AVENIDA CONCEICAO DE SAMMARTINO, 528 - CENTRO - JANDIRA/SP 06600-080', -23.52983630, -46.90379570, '2024-08-26 20:10:33'),
(102, 'AVENIDA EMANCIPACAO, 40 - CENTRO - ITAQUAQUECETUBA/SP 08570-002', -23.47733310, -46.35349090, '2024-08-26 20:10:34'),
(103, 'RUA FREI GASPAR, 531 - CENTRO - SÃO VICENTE/SP 11310-060', -23.96657050, -46.38487880, '2024-08-26 20:10:34'),
(104, 'PRAÇA JOÃO PESSOA, 46 - CENTRO, ITAPECERICA DA SERRA - SP, 06850-710, BRAZIL', -23.71624000, -46.85008060, '2024-08-26 20:10:34'),
(105, 'AVENIDA WASHINGTON LUIS, 500 - GONZAGA - SANTOS/SP 11055-000', -23.96649940, -46.32915710, '2024-08-26 20:10:34'),
(106, 'ESTRADA KIZAEMON TAKEUTI, 2560 - PARQUE SAO JOAQUIM - TABOÃO DA SERRA/SP 06775-003', -23.63948670, -46.80038170, '2024-08-26 20:10:34'),
(107, 'AVENIDA PROFESSOR JOSE BARRETO - 101 - CENTRO - Cotia - SP - 06703-001', -23.60509320, -46.92689230, '2024-08-26 20:10:34'),
(108, 'AVENIDA DO TABOAO, 4.345 - TABOAO - SÃO BERNARDO DO CAMPO/SP 09657-000', -23.66540660, -46.60811420, '2024-08-26 20:10:35'),
(109, 'ESTRADA DE ITAPECERICA A CAMPO LIMPO, 2.647 - JARDIM SANTO EDUARDO - EMBU DAS ARTES/SP 06823-300', -23.67165550, -46.80349880, '2024-08-26 20:10:35'),
(110, 'RUA CARVALHO DE MENDONCA, 284 - VILA MATHIAS - SANTOS/SP 11070-101', -23.95257380, -46.33301970, '2024-08-26 20:10:35'),
(111, 'RUA ORATORIO, 1679 - PARQUE DAS NACOES - SANTO ANDRÉ/SP 09280-000', -23.63729020, -46.51733390, '2024-08-26 20:10:35'),
(112, 'RUA DOUTOR VICENTE DE CARVALHO, 507 - OCIAN - PRAIA GRANDE/SP 11704-300', -24.02636070, -46.47717720, '2024-08-26 20:10:35'),
(113, 'AVENIDA TENENTE MARQUES, 4886 - FAZENDINHA - SANTANA DE PARNAÍBA/SP 06530-001', -23.40668250, -46.88775670, '2024-08-26 20:10:35'),
(114, 'Avenida Dom Pedro II, 236, Barueri, Brazil 06401060', -23.51193290, -46.87735810, '2024-08-26 20:10:35'),
(115, 'AVENIDA GENERAL BARRETO DE MENEZES, 308 - JARDIM SILVINA - SÃO BERNARDO DO CAMPO/SP 09791-150', -23.73598860, -46.53614060, '2024-08-26 20:10:36'),
(116, 'Avenida Marcos Antonio Oggiano, 411, Morrinhos - Guarujá - SP - CEP 11495-011', -23.96666100, -46.25936090, '2024-08-26 20:10:36'),
(117, 'AVENIDA ANTONIO EMMERICK, 590 - VILA CASCATINHA - SÃO VICENTE/SP 11390-000', -23.96118280, -46.37715570, '2024-08-26 20:10:36'),
(118, 'RUA PORTO VELHO - 716 - JARDIM CUMBICA - Guarulhos - SP - 07240-060', -23.44469930, -46.43808750, '2024-08-26 20:10:36'),
(119, 'RUA ALEXANDRE MARTINS - 51 - APARECIDA - Santos - SP - 11025-201', -23.97716310, -46.31167880, '2024-08-26 20:10:36'),
(120, 'RUA JOSE DOMINGOS BRANCO - 39 - CENTRO - Santana de parnaíba - SP - 06501-140', -23.44470910, -46.91748240, '2024-08-26 20:10:36'),
(121, 'AVENIDA ANCHIETA, 1215 - CENTRO - BERTIOGA/SP 11250-285', -23.84472130, -46.13615020, '2024-08-26 20:10:36'),
(122, 'AVENIDA ROTARY - 166 - VILA SANTA MARIA - Diadema - SP - 09980-600', -23.70094920, -46.61290860, '2024-08-26 20:10:37'),
(123, 'R. RUI BARBOSA, 38 - VILA COSTA, SUZANO - SP, 08675-060', -23.54199880, -46.31013090, '2024-08-26 20:10:37'),
(124, 'RUA M.M.D.C., 276 - PAULICEIA - SÃO BERNARDO DO CAMPO/SP 09690-000', -23.66744460, -46.58796680, '2024-08-26 20:10:37'),
(125, 'AVENIDA SENADOR PINHEIRO MACHADO, 836 - MARAPE - SANTOS/SP 11075-002', -23.96103580, -46.34537290, '2024-08-26 20:10:37'),
(126, 'AVENIDA 19 DE MAIO, 367 - JARDIM ALBATROZ - BERTIOGA/SP 11250-003', -23.83442070, -46.13284460, '2024-08-26 20:10:37'),
(127, 'RUA PRESIDENTE COSTA E SILVA, 312 - HELENA MARIA - OSASCO/SP 06253-000', -23.50229320, -46.79072400, '2024-08-26 20:10:37'),
(128, 'RUA IMIRIM, 396 - JARDIM NOSSA SENHORA DE FATIMA - JANDIRA/SP 06624-010', -23.55128750, -46.90629720, '2024-08-26 20:10:37'),
(129, 'AVENIDA ANTONIO EMMERICK, 1513 - VILA CASCATINHA - SÃO VICENTE/SP 11390-001', -23.95268190, -46.37437150, '2024-08-26 20:10:38'),
(130, 'RUA WALDEMAR DE PAULA FERREIRA - 108 - JARDIM PRESIDENTE DUTRA - Guarulhos - SP - 07172-010', -23.42512530, -46.43301660, '2024-08-26 20:10:38'),
(131, 'AVENIDA SANTOS DUMONT, 291 - CIDADE JARDIM CUMBICA - GUARULHOS/SP 07180-270', -23.45088270, -46.47393950, '2024-08-26 20:10:38'),
(132, 'AVENIDA DEPUTADO ULISSES GUIMARAES, 1009 - LOJA 01 - JARDIM RIO BRANCO - SÃO VICENTE/SP 11347-000', -23.98093450, -46.47174560, '2024-08-26 20:10:38'),
(133, 'RUA ANTONIO PEREIRA DA CRUZ - 28 - CENTRO - Caieiras - SP - 07700-001', -23.36209660, -46.74479190, '2024-08-26 20:10:38'),
(134, 'PRACA PRESIDENTE CASTELO BRANCO, 173 - CENTRO - DIADEMA/SP 09911-130', -23.68610980, -46.62434540, '2024-08-26 20:10:39'),
(135, 'AVENIDA JOAO DE ANDRADE, 1186 - SANTO ANTONIO - OSASCO/SP 06132-002', -23.55660000, -46.80146300, '2024-08-26 20:10:39'),
(136, 'RUA DOUTOR DEODATO WERTHEIMER, 146 - BRAS CUBAS - MOGI DAS CRUZES/SP 08740-270', -23.53780470, -46.22170050, '2024-08-26 20:10:39'),
(137, 'RUA PORTO VELHO - 627 - JARDIM CUMBICA - Guarulhos - SP - 07240-060', -23.44524140, -46.43882670, '2024-08-26 20:10:39'),
(138, 'AV, Estr. Pres. Juscelino K. de Oliveira, 1089 - Jardim dos Pimentas, Guarulhos - SP, 07272-341', -23.46541960, -46.41935720, '2024-08-26 20:10:39'),
(139, 'RUA 26, 20 - CONJUNTO MARCOS FREIRE - GUARULHOS/SP 07263-730', -23.46302890, -46.40531630, '2024-08-26 20:10:39'),
(140, 'AVENIDA RUBENS CARAMEZ, 25 - VILA AURORA - ITAPEVI/SP 06657-000', -23.54657840, -46.93493710, '2024-08-26 20:10:40'),
(141, 'RUA IPACAETA, 443 - JARDIM PRESIDENTE DUTRA - GUARULHOS/SP 07171-150', -23.41853070, -46.43692120, '2024-08-26 20:10:40'),
(142, 'ESTRADA AGUA CHATA, 208 - PARQUE PIRATININGA - ITAQUAQUECETUBA/SP 08583-370', -23.43904970, -46.38430270, '2024-08-26 20:10:40'),
(143, 'RUA BRAZILINA BEU, 55 - VILA INDIANA - TABOÃO DA SERRA/SP 06786-450', -23.62574420, -46.80580050, '2024-08-26 20:10:40'),
(144, 'RUA JOSE NOGUEIRA, 13 A - CENTRO-CIPO - EMBU-GUAÇU/SP 06929-050', -23.87771620, -46.79268830, '2024-08-26 20:10:40'),
(145, 'AVENIDA GOVERNADOR JANIO QUADROS - 938 - PARQUE SAO FRANCISCO - Ferraz de vasconcelos - SP - 08526-000', -23.55419920, -46.38189560, '2024-08-26 20:10:40'),
(146, 'RUA HELENA JACQUEY (VL HELENA) - 123 - RUDGE RAMOS - São bernardo do campo - SP - 09635-060', -23.65349220, -46.57083900, '2024-08-26 20:10:40'),
(147, 'R. Luiz Coladello, 26 - Parque Continental II Guarulhos - SP, 07084-410', -23.42709220, -46.54918080, '2024-08-26 20:10:40'),
(148, 'ESTRADA AGUA CHATA, 200 - PARQUE PIRATININGA - ITAQUAQUECETUBA/SP 08583-370', -23.43913970, -46.38430360, '2024-08-26 20:10:41'),
(149, 'AVENIDA SAO PAULO - 584 - CIDADE SAO JORGE - Santo andré - SP - 09111-410', -23.66926950, -46.48763350, '2024-08-26 20:10:41'),
(150, 'BOULEVARD MAJOR PAULA LOPES, 106 - CENTRO - GUARAREMA/SP 08900-000', -23.41360080, -46.03537850, '2024-08-26 20:10:41'),
(151, 'AVENIDA MIGUEL BADRA, 1454 - CIDADE MIGUEL BADRA - SUZANO/SP 08690-010', -23.49755730, -46.31608640, '2024-08-26 20:10:41'),
(152, 'RUA PADRE CLAUDIO ARENAL - 52 - VILA BARROS - Guarulhos - SP - 07192-010', -23.45715710, -46.50943700, '2024-08-26 20:10:41'),
(153, 'RUA CELSO RAMOS DE OLIVEIRA - 27868 - ANTARTICA - Praia grande - SP - 11721-010', -24.01137790, -46.45475530, '2024-08-26 20:10:41'),
(154, 'RUA MARIA SAYEG, 44 - JARDIM DAS OLIVEIRAS - ITAPECERICA DA SERRA/SP 06867-420', -23.75773000, -46.80866000, '2024-08-26 20:10:41'),
(155, 'RUA ITIRUCU - 648 - JARDIM PRESIDENTE DUTRA - Guarulhos - SP - 07171-160', -23.42220280, -46.43400130, '2024-08-26 20:10:42'),
(156, 'RUA JOSE MARIA DIAS DA SILVA - 27 - PARQUE MIKAIL - Guarulhos - SP - 07142-400', -23.41037990, -46.49806720, '2024-08-26 20:10:42'),
(157, 'Avenida Costa e Silva 70 Box 80B, Praia Grande 11700005', -24.01326120, -46.41455730, '2024-08-26 20:10:42'),
(158, 'RUA JOAO GOMES - 32 - JARDIM ADRIANA - Guarulhos - SP - 07135-160', -23.42660710, -46.52196010, '2024-08-26 20:10:42'),
(159, 'AVENIDA SAO PAULO - 11 - QUARENTENARIO - São vicente - SP - 11347-650', -23.98081770, -46.45324770, '2024-08-26 20:10:42'),
(160, 'AVENIDA MARIA CAVALCANTE DA SILVA, 31533 - SAMAMBAIA - PRAIA GRANDE/SP 11712-560', -24.03422290, -46.52810930, '2024-08-26 20:10:42'),
(161, 'AVENIDA DOM PEDRO II, 1085 - CIDADE NAUTICA - SÃO VICENTE/SP 11350-100', -23.94235150, -46.41576080, '2024-08-26 20:10:42'),
(162, 'RUA DA LIBERDADE, 70 - CENTRO - ITAQUAQUECETUBA/SP 08570-170', -23.47445200, -46.35018990, '2024-08-26 20:10:43'),
(163, 'RUA RICARDO PINTO, 180 - APARECIDA - SANTOS/SP 11035-170', -23.97909050, -46.30416060, '2024-08-26 20:10:43'),
(164, 'RUA MIQUELINA, 473 - VILA CAMILOPOLIS - SANTO ANDRÉ/SP 09230-280', -23.62121790, -46.52788560, '2024-08-26 20:10:43'),
(165, 'RUA DR ROBERTO DOMINGOS JOAO ROSIA, 17 - PARQUE MIKAIL - GUARULHOS/SP 07142-500', -23.41056480, -46.49843260, '2024-08-26 20:10:43'),
(166, 'AVENIDA ANA COSTA - 480 - GONZAGA - Santos - SP - 11060-002', -23.96559250, -46.33289230, '2024-08-26 20:10:43'),
(167, 'R. Antônio Cândido da Silva, 136 - Vila Sonia, Praia Grande - SP, 11722-000', -24.00489700, -46.44460920, '2024-08-26 20:10:43'),
(168, 'AVENIDA THIAGO FERREIRA - 1.092 - VICENTE DE CARVALHO - Guarujá - SP - 11450-002', -23.93980490, -46.30720660, '2024-08-26 20:10:44'),
(169, 'R Oratório, 1864 - Parque das Nações, Santo André - SP, 09280-000', -23.63626720, -46.51570530, '2024-08-26 20:10:44'),
(170, 'AVENIDA BRIGADEIRO FARIA LIMA, 1401 - COCAIA - GUARULHOS/SP 07130-000', -23.44289300, -46.52128440, '2024-08-26 20:10:44'),
(171, 'AVENIDA SAO PAULO, 177 - CIDADE INTERCAP - TABOÃO DA SERRA/SP 06757-170', -23.61018930, -46.77681760, '2024-08-26 20:10:44'),
(172, 'ESTRADA SAO JOSE - 1310 - JARDIM VAZAME - Embu das artes - SP - 06814-160', -23.65760240, -46.80361690, '2024-08-26 20:10:44'),
(173, 'Estr. dos Casa, 3440 - Bairro dos Casa - São Bernardo do Campo - SP, 09840-000', -23.74174500, -46.57366960, '2024-08-26 20:10:44'),
(174, 'RUA VITAL BRASIL, 525 - VILA NOVA CUMBICA - GUARULHOS/SP 07231-370', -23.45837680, -46.46520760, '2024-08-26 20:10:45'),
(175, 'RUA ENGENHEIRO OSCAR KESSELRING, 91 - JARDIM BELVAL - BARUERI/SP 06420-160', -23.50954970, -46.89207720, '2024-08-26 20:10:45'),
(176, 'AVENIDA DOUTOR TIMOTEO PENTEADO, 3411 - VILA GALVAO - GUARULHOS/SP 07061-001', -23.45412300, -46.55592690, '2024-08-26 20:10:45'),
(177, 'AVENIDA PRESIDENCIAL (JD CLAUDIA), 120 - DOS CASA - SÃO BERNARDO DO CAMPO/SP 09850-605', -23.73243460, -46.57600500, '2024-08-26 20:10:45'),
(178, 'AVENIDA OTAVIO BRAGA DE MESQUITA, 1980 - VILA FLORIDA - GUARULHOS/SP 07191-000', -23.44771840, -46.50832290, '2024-08-26 20:10:45'),
(179, 'Praça Padre João Álvares, 93 - Centro - Itaquaquecetuba - SP, 08570-050', -23.47563340, -46.35164850, '2024-08-26 20:10:45'),
(180, 'RUA CORONEL OLIVEIRA LIMA, 350 - CENTRO - SANTO ANDRÉ/SP 09010-000', -23.65730440, -46.52738510, '2024-08-26 20:10:46'),
(181, 'AVENIDA RICIERI JOSE MARCATTO, 2.391 - VILA SUISSA - MOGI DAS CRUZES/SP 08810-020', -23.50215470, -46.16283610, '2024-08-26 20:10:46'),
(182, 'AVENIDA JOAO PAULO II, 1096 - JARDIM SANTA TEREZA - EMBU DAS ARTES/SP 06813-015', -23.64796320, -46.80290650, '2024-08-26 20:10:46'),
(183, 'AVENIDA INOCENCIO SERAFICO, 1948 - VL SANTA RIBEIRO - CARAPICUÍBA/SP 06380-021', -23.53759730, -46.83562790, '2024-08-26 20:10:46'),
(184, 'PRACA ANTONIO SIQUEIRA (JD STO ANTONIO), 57 - REGIAO CENTRAL - CAIEIRAS/SP 07700-205', -23.36427710, -46.74862080, '2024-08-26 20:10:46'),
(185, 'PRACA PROFESSOR JOSE OLIVEIRA LOPES, 150 - RADIO CLUBE - SANTOS/SP 11088-190', -23.94337710, -46.38128800, '2024-08-26 20:10:46'),
(186, 'ESTRADA ITAPECERICA-CAMPO LIMPO, 2954 - JARDIM DOM JOSE - EMBU DAS ARTES/SP 06823-301', -23.67306630, -46.80370130, '2024-08-26 20:10:46'),
(187, 'RUA JOAO MIRASSOL, 571 - PESTANA - OSASCO/SP 06122-170', -23.54312150, -46.80272740, '2024-08-26 20:10:47'),
(188, 'AVENIDA ARMANDO BEI - 463 - VILA NOVA BONSUCESSO - Guarulhos - SP - 07175-000', -23.40632260, -46.40280160, '2024-08-26 20:10:47'),
(189, 'RUA RENATO MARCHIONNO, 531 - BARONESA - OSASCO/SP 06266-020', -23.49472040, -46.78840430, '2024-08-26 20:10:47'),
(190, 'RUA REPUBLICA DO LIBANO, 71 - CENTRO - OSASCO/SP 06013-060', -23.53034970, -46.77628200, '2024-08-26 20:10:47'),
(191, 'RUA TEODORO SAMPAIO, 1009 - PINHEIROS - SÃO PAULO/SP 05405-100', -23.55894980, -46.67965360, '2024-08-26 20:10:47'),
(192, 'ESTRADA PIMENTAS-SAO MIGUEL, 281 - VILA ALZIRA - GUARULHOS/SP 07210-380', -23.45684660, -46.43721850, '2024-08-26 20:10:47'),
(193, 'RUA CAPRICORNIO, 637 - PARQUE SANTANA - SANTANA DE PARNAÍBA/SP 06515-090', -23.47750940, -46.89622490, '2024-08-26 20:10:47'),
(194, 'PRACA ALMEIDA JUNIOR - 34 - VILA ASSUNCAO - Santo andré - SP - 09030-525', -23.67502590, -46.52543240, '2024-08-26 20:10:47'),
(195, 'RUA ENGENHEIRO JOSE SANCHES FERRARI, 912 - JARDIM VICENTE DE CARVALHO - BERTIOGA/SP 11250-518', -23.83048600, -46.14684010, '2024-08-26 20:10:48'),
(196, 'RUA DOUTOR DEODATO WERTHEIMER, 1709 - CENTRO - MOGI DAS CRUZES/SP 08710-430', -23.52602710, -46.19416440, '2024-08-26 20:10:48'),
(197, 'Rua Silvina de Camargo, 53, Centro, Arujá, CEP 07402135', -23.39730040, -46.31892600, '2024-08-26 20:10:48'),
(198, 'R. Sen. Dantas, 339 - Centro, Mogi das Cruzes - SP, 08710-690', -23.52387130, -46.19177030, '2024-08-26 20:10:48'),
(199, 'Rua Francisco Franco, 110 - Centro / Mogi das Cruzes / SP', -23.52575360, -46.19806830, '2024-08-26 20:10:48'),
(200, 'Praça do Carmo, 71 - Loja 33 - Centro, Santo André - SP, 09010-020', -23.65654020, -46.52564550, '2024-08-26 20:10:48'),
(201, 'RUA SANTA CLARA, 310 - CANHEMA - DIADEMA/SP 09941-260', -23.67599450, -46.60526030, '2024-08-26 20:10:48'),
(202, 'Av. Conde Francisco Matarazzo, 85 - Sala 36 - Centro, São Caetano do Sul 09520100', -23.61088030, -46.57171820, '2024-08-26 20:10:49'),
(203, 'TRAVESSA JOAQUIM HORACIO PEDROSO - 32 - CENTRO - Cotia - SP - 06700-060', -23.60400490, -46.92851930, '2024-08-26 20:10:49'),
(204, 'RUA DONA PRIMITIVA VIANCO, 200 - CENTRO - OSASCO/SP 06016-000', -23.52997920, -46.77568170, '2024-08-26 20:10:49'),
(205, 'R. Dona Primitiva Vianco, 244 - Centro, Osasco - SP, 06010-004', -23.53058660, -46.77576080, '2024-08-26 20:10:49'),
(206, 'R. Manoel da Nóbrega, 598 - sala 36 - Centro, Diadema - SP, 09910-720', -23.69026490, -46.62325370, '2024-08-26 20:10:49'),
(207, 'RUA DA MATRIZ, 63 - MATRIZ - MAUÁ/SP 09370-100', -23.66939340, -46.46177090, '2024-08-26 20:10:49'),
(208, 'RUA ALMEIDA NOGUEIRA - 23 - JARDIM PROFESSOR FRANCISCO MORATO - Francisco morato - SP - 07910-150', -23.27831560, -46.74358490, '2024-08-26 20:10:49'),
(209, 'RUA SEBASTIAO DE OLIVEIRA, 129 - BOQUEIRAO - PRAIA GRANDE/SP 11701-200', -24.00651280, -46.41479420, '2024-08-26 20:10:50'),
(210, 'R. Dona Amália Sestini, 223 - 1 andar - Centro, Franco da Rocha - SP, 07802-260', -23.32710480, -46.72579960, '2024-08-26 20:10:50'),
(211, 'RUA MOCOCA, 31 - BOQUEIRAO - PRAIA GRANDE/SP 11701-100', -24.00919360, -46.41481260, '2024-08-26 20:10:50'),
(212, 'RUA FREI GASPAR, 941- SALA 06 - CENTRO - SÃO BERNARDO DO CAMPO/SP 09720-440', -23.71762150, -46.55708770, '2024-08-26 20:10:50'),
(213, 'Av. Conselheiro Nébias 754 - Sala 1319 - Santos, SP ', -23.96751590, -46.32400430, '2024-08-26 20:10:50'),
(214, 'RUA ALAGOAS, 61 - GONZAGA - SANTOS/SP 11065-120', -23.96638560, -46.33607420, '2024-08-26 20:10:50'),
(215, 'RUA EVANGELISTA DE SOUZA - 1782 - PARQUE CAPUAVA - Santo andré - SP - 09260-411', -23.63997680, -46.49060150, '2024-08-26 20:10:51'),
(216, 'R. Luiz Gama,n°4 - Centro • Itapecerica Da Serra - SP', -23.71752530, -46.85004520, '2024-08-26 20:10:51'),
(217, 'RUA ITIRUCU, 590 - JARDIM PRESIDENTE DUTRA - GUARULHOS/SP 07171-160', -23.42219960, -46.43458020, '2024-08-26 20:10:51'),
(218, 'AVENIDA FERNANDO FERNANDES - 800 - JARDIM MITUZI - Taboão da serra - SP - 06775-290', -23.64178610, -46.80533980, '2024-08-26 20:10:51'),
(219, 'RUA SARUTAIA - 363 - JARDIM SAO PAULO - Guarulhos - SP - 07131-000', -23.43892300, -46.52785330, '2024-08-26 20:10:51'),
(220, 'RUA DOUTOR CESARIO MOTA, 210 - CENTRO - SANTO ANDRÉ/SP 09010-100', -23.65856480, -46.52502650, '2024-08-26 20:10:51'),
(221, 'rua dos italianos 981', -23.52174770, -46.64570000, '2024-08-26 20:10:52'),
(222, 'Praça da Liberdade, 80 Sala 31', -23.55460050, -46.63581340, '2024-08-26 20:10:52'),
(223, 'RUA XV DE NOVEMBRO, 64 - CENTRO - MAIRIPORÃ/SP 07600-057', -23.31927970, -46.58517630, '2024-08-26 20:10:52'),
(224, 'R. Bela Cintra, 2073 -', -23.56293090, -46.66833060, '2024-08-26 20:10:52'),
(225, 'AVENIDA DO CORRETOR DE IMOVEIS, 234 - SAMAMBAIA - PRAIA GRANDE/SP 11712-400', -24.03705490, -46.52340760, '2024-08-26 20:10:52'),
(226, 'RUA ORIENTE, 144 - BRAS - SÃO PAULO/SP 03016-000', -23.53812210, -46.62076600, '2024-08-26 20:10:52'),
(227, 'R. Dr. César, 264 - Santana', -23.50201110, -46.62887660, '2024-08-26 20:10:53'),
(228, 'RUA VINTE E QUATRO DE MAIO, 242 - REPUBLICA - SÃO PAULO/SP 01041-000', -23.54338000, -46.64059300, '2024-08-26 20:10:53'),
(229, 'Avenida Presidente Castelo Branco, 1033', -24.01957950, -46.44540340, '2024-08-26 20:10:53'),
(230, 'AVENIDA RANGEL PESTANA, 2118 - BRAS - SÃO PAULO/SP 03002-000', -23.54211580, -46.61499620, '2024-08-26 20:10:53'),
(231, 'Rua Ceára,283 Vila Cristovam', -22.57390420, -47.40479390, '2024-08-26 20:10:53'),
(232, 'RUA JOSE PAULINO, 520 - BOM RETIRO - SÃO PAULO/SP 01120-000', -23.52964420, -46.63969130, '2024-08-26 20:10:53'),
(233, 'Rua barão da ladario 512', -19.00363860, -57.60306350, '2024-08-26 20:10:53'),
(234, 'rua hannemann, 415 - galeria pajé brás ', -23.53186510, -46.61932780, '2024-08-26 20:10:54'),
(235, 'Rua Paula Sousa N 19 - Centro', -22.90122490, -43.17917470, '2024-08-26 20:10:54'),
(236, 'RUA SETE DE ABRIL, 356 - REPUBLICA - SÃO PAULO/SP 01044-000', -23.54480740, -46.64189930, '2024-08-26 20:10:54'),
(237, 'RUA MARCONI, 113 - REPUBLICA - SÃO PAULO/SP 01047-000', -23.54542590, -46.64019870, '2024-08-26 20:10:54'),
(238, 'rua paula sousa, 313 - centro historico sp prox 25 de março', -23.53844720, -46.62997020, '2024-08-26 20:10:54'),
(239, 'RUA BARAO DE ITAPETININGA, 254 - REPUBLICA - SÃO PAULO/SP 01042-000', -23.54407120, -46.64119600, '2024-08-26 20:10:54'),
(240, 'RUA HENRIQUE DIAS, 44 - BRAS - SÃO PAULO/SP 03009-020', -23.53679120, -46.62180100, '2024-08-26 20:10:54'),
(241, 'RUA POLIGNANO A MARE, 41 - BRAS - SÃO PAULO/SP 03005-040', -23.54295900, -46.62639110, '2024-08-26 20:10:55'),
(242, 'AVENIDA BRIGADEIRO LUIS ANTONIO - 2163 - BELA VISTA - Sao paulo - SP - 01317-002', -23.56690680, -46.64842390, '2024-08-26 20:10:55'),
(243, 'RUA MILLER, 99 - BRAS - SÃO PAULO/SP 03011-011', -23.54071720, -46.61718200, '2024-08-26 20:10:55'),
(244, 'RUA BARAO DE ITAPETININGA, 262 - REPUBLICA / R. PADRE JOÃO DA CUNHA, 504-510 - JARDIM JOAO XXIII', -23.60136500, -46.79467690, '2024-08-26 20:10:55'),
(245, 'RUA JOAQUIM CARLOS, 1122 - BRÁS - SÃO PAULO/SP 03019-000   loja de esquina ', -23.52688790, -46.60725200, '2024-08-26 20:10:55'),
(246, 'RUA ORIENTE, 55 - BRÁS - SÃO PAULO/SP 03016-001', -23.53794630, -46.62163440, '2024-08-26 20:10:55'),
(247, 'AVENIDA PAULISTA, 1765 - BELA VISTA - SÃO PAULO/SP 01311-930', -23.56005440, -46.65377870, '2024-08-26 20:10:56'),
(248, 'R. Barão do Rio Branco, 278 - Santo Amaro, São Paulo - SP, 04753-000', -23.65279130, -46.70853130, '2024-08-26 20:10:56'),
(249, 'RUA PROMOTOR GABRIEL NETTUZZI PEREZ - 173 - SANTO AMARO - São paulo - SP - 04743-020', -23.65238770, -46.70366270, '2024-08-26 20:10:56'),
(250, 'RUA GAIVOTA - 1327 - MOEMA - Sao paulo - SP - 04522-033', -23.60672830, -46.67043320, '2024-08-26 20:10:56'),
(251, 'AVENIDA DONA BELMIRA MARIM - 508 - GRAJAU - Sao paulo - SP - 04846-000', -23.73587630, -46.69514050, '2024-08-26 20:10:56'),
(252, 'AVENIDA DR LUIS ROCHA MIRANDA - 100 - JABAQUARA - São paulo - SP - 04344-010', -23.63449490, -46.64414720, '2024-08-26 20:10:56'),
(253, 'AVENIDA DO CURSINO - 135 - SAUDE - São paulo - SP - 04133-000', -23.60387760, -46.61533340, '2024-08-26 20:10:56'),
(254, 'RUA DOMINGOS DE MORAIS - 1014 - VILA MARIANA - São paulo - SP - 04010-100', -23.58540720, -46.63695040, '2024-08-26 20:10:56'),
(255, 'RUA CLODOMIRO AMAZONAS, 137 - ITAIM BIBI - SÃO PAULO/SP 04537-010', -23.58548070, -46.67956810, '2024-08-26 20:10:57'),
(256, 'RUA HENRIQUE SAM MINDLIN, 1331 - CAPAO REDONDO - SÃO PAULO/SP 05882-000', -23.67664210, -46.78326690, '2024-08-26 20:10:57'),
(257, 'RUA SANTA C RUZ - 2423 - IPIRANGA - São paulo - SP - 04121-002', -23.60255410, -46.61538930, '2024-08-26 20:10:57'),
(258, 'ESTRADA DAS LAGRIMAS, 1366 - IPIRANGA - SÃO PAULO/SP 04232-000', -23.61328710, -46.59436800, '2024-08-26 20:10:57'),
(259, 'AVENIDA DO CURSINO - 3670 - SAUDE - São paulo - SP - 04132-002', -23.63343720, -46.61650530, '2024-08-26 20:10:57'),
(260, 'AVENIDA CARLOS CALDEIRA FILHO - 2548 - VILA ANDRADE - São paulo - SP - 05730-190', -23.64604890, -46.75478810, '2024-08-26 20:10:57'),
(261, 'RUA JOAO FERNANDES C. NOVA JUNIOR - 510 - JARDIM SAO LUIS - São paulo - SP - 05844-000', -23.65334260, -46.74132500, '2024-08-26 20:10:57'),
(262, 'RUA GEORGIA - 170 - BROOKLIN PAULISTA - São paulo - SP - 04559-010', -23.61159770, -46.67634820, '2024-08-26 20:10:58'),
(263, 'AVENIDA DONA BELMIRA MARIN - 1124 - PARQUE BRASIL - São paulo - SP - 04846-000', -23.74024890, -46.69162530, '2024-08-26 20:10:58'),
(264, 'AVENIDA STA CATARINA - 1929 - VILA MASCOTE - São paulo - SP - 04378-400', -23.65138450, -46.65933310, '2024-08-26 20:10:58'),
(265, 'AVENIDA DO CURSINO - 1407 - JARDIM DA SAUDE - São paulo - SP - 04133-100', -23.61496740, -46.61709110, '2024-08-26 20:10:58'),
(266, 'R. HILDEBRANDO SIQUEIRA, 552 - VILA FACHINI, SÃO PAULO - SP, 04334-150', -23.66133530, -46.63960530, '2024-08-26 20:10:58'),
(267, 'RUA SINFONIA ITALIANA - 1326 D - JARDIM SAO BERNARDO - São paulo - SP - 04844-610', -23.75729560, -46.70694000, '2024-08-26 20:10:58'),
(268, 'ESTRADA DE ITAPECERICA - 4031 - VILA MARACANA - São paulo - SP - 05835-005', -23.66034660, -46.76693210, '2024-08-26 20:10:58'),
(269, 'RUA CRISTO REDENTOR, 6 - CIDADE NOVA HELIOPOLIS - SÃO PAULO/SP 04236-260', -23.61057480, -46.59288270, '2024-08-26 20:10:58'),
(270, 'ESTRADA DO M BOI MIRIM, 954 - JARDIM DAS FLORES - SÃO PAULO/SP 04905-000', -23.67186820, -46.74204080, '2024-08-26 20:10:59'),
(271, 'RUA GUARARAPES, 401 - BROOKLIN NOVO - SÃO PAULO/SP 04561-000', -23.61163640, -46.68180060, '2024-08-26 20:10:59'),
(272, 'AVENIDA LEBLON, 504 - JARDIM DOS LAGOS - SÃO PAULO/SP 04771-050', -23.68313090, -46.71032290, '2024-08-26 20:10:59'),
(273, 'AVENIDA JOAO CARLOS DA SILVA BORGES, 830 - VILA CRUZEIRO - SÃO PAULO/SP 04726-001', -23.63801360, -46.71163790, '2024-08-26 20:10:59'),
(274, 'AVENIDA DAMASCENO VIEIRA - 1068 - VILA MASCOTE - São paulo - SP - 04363-040', -23.64774990, -46.66860660, '2024-08-26 20:10:59'),
(275, 'Rua: Demas zitto, 501 Parque residencial cocaia▪︎Grajaú, SP', -23.74479360, -46.66992610, '2024-08-26 20:10:59'),
(276, 'ESTRADA DO MBOI MIRIM - 4350 - PARQUE DO LAGO - São paulo - SP - 04948-030', -23.68438320, -46.77022020, '2024-08-26 20:10:59'),
(277, 'AVENIDA SENADOR TEOTONIO VILELA - 1271 - VILA SANTA CATARINA - São paulo - SP - 04801-010', -23.71260210, -46.69834040, '2024-08-26 20:11:00'),
(278, 'AVENIDA SILVIO RIBEIRO ARAGAO - 261 - VILA FRANCA - São paulo - SP - 05776-510', -23.64006680, -46.74767920, '2024-08-26 20:11:00'),
(279, 'Rua Moliére, 226 - Vila Sofia, São Paulo - SP, 04671-090', -23.65755310, -46.69277800, '2024-08-26 20:11:00'),
(280, 'ESTRADA DO ALVARENGA - 1844 - BALNEARIO MAR PAULISTA - Sao paulo - SP - 04467-000', -23.69359760, -46.65770270, '2024-08-26 20:11:00'),
(281, 'RUA SATURNINO DE OLIVEIRA, 503 - JARDIM SAO LUIZ - SÃO PAULO/SP 05813-080', -23.65655730, -46.73114950, '2024-08-26 20:11:00'),
(282, 'ESTRADA DO M BOI MIRIM, 9832 - PARQUE DO LAGO - SÃO PAULO/SP 04945-046', -23.72870720, -46.78636080, '2024-08-26 20:11:00'),
(283, 'AVENIDA IRAI - 614 - INDIANOPOLIS - São paulo - SP - 04082-002', -23.61170580, -46.66206760, '2024-08-26 20:11:00'),
(284, 'RUA GUILHERME RULE - 2770 - CHACARA GAIVOTAS - São paulo - SP - 04849-310', -23.73326550, -46.66434790, '2024-08-26 20:11:01'),
(285, 'RUA JOAO DA CRUZ E SOUSA, 379 - JARDIM DAS ROSAS (ZONA SUL) - SÃO PAULO/SP 05893-000', -23.65878410, -46.78927750, '2024-08-26 20:11:01'),
(286, 'ALAMEDA DOS MARACATINS - 738 - INDIANOPOLIS - São paulo - SP - 04089-001', -23.60715870, -46.66108950, '2024-08-26 20:11:01'),
(287, 'AVENIDA YERVANT KISSAJIKIAN, 2248 - VILA JOANIZA - SÃO PAULO/SP 04428-000', -23.67618500, -46.66003500, '2024-08-26 20:11:01'),
(288, 'AVENIDA ENGENHEIRO HEITOR ANTONIO EIRAS GARCIA - 4013 - JARDIM ESMERALDA - São paulo - SP - 05564-100', -23.58955660, -46.76708330, '2024-08-26 20:11:01'),
(289, 'AVENIDA CUPECE, 3320 - JARDIM PRUDENCIA - SÃO PAULO/SP 04366-000', -23.66773640, -46.65328610, '2024-08-26 20:11:01'),
(290, 'AVENIDA ENGENHEIRO HEITOR ANTONIO EIRAS GARCIA, 6404 - JARDIM ESMERALDA - SÃO PAULO/SP 05564-200', -23.59877890, -46.78526390, '2024-08-26 20:11:01'),
(291, 'ESTRADA M\'BOI MIRIM, 5936 - PARQUE BOLOGNE - SÃO PAULO/SP 04941-006', -23.69548490, -46.77989040, '2024-08-26 20:11:02'),
(292, 'ESTRADA DO ALVARENGA - 3071 - BALNEARIO SAO FRANCISCO - São paulo - SP - 04474-340', -23.69893500, -46.64718250, '2024-08-26 20:11:02'),
(293, 'ESTRADA DE ITAPECERICA - 3850 - VILA PREL - São paulo - SP - 05835-004', -23.65879340, -46.76621400, '2024-08-26 20:11:02'),
(294, 'RUA DAS TRES MARIAS - 592 - PARQUE NOVO SANTO AMARO - São paulo - SP - 05874-180', -23.70018910, -46.78867700, '2024-08-26 20:11:02'),
(295, 'AVENIDA ANDORINHA DOS BEIRAIS, 480 - JARDIM DOM JOSE - SÃO PAULO/SP 05887-000', -23.67404410, -46.79676320, '2024-08-26 20:11:02'),
(296, 'RUA MARECHAL DEODORO, 1728 - CENTRO - SÃO BERNARDO DO CAMPO/SP 09710-201', -23.71342170, -46.55028960, '2024-08-26 20:11:02'),
(297, 'RUA HENRIQUE SAM MINDLIN - 1331 - JARDIM SAO BENTO NOVO - São paulo - SP - 05882-000', -23.67664210, -46.78326690, '2024-08-26 20:11:02'),
(298, 'RUA GIOVANNI BONONCINI, 183 - PARQUE BRASIL - SÃO PAULO/SP 04843-020', -23.73679740, -46.69646500, '2024-08-26 20:11:02'),
(299, 'AVENIDA IRAI, 212 - INDIANÓPOLIS - SÃO PAULO/SP 04082-000', -23.60940910, -46.66493400, '2024-08-26 20:11:02'),
(300, 'AVENIDA ENG LUIZ CARLOS BERRINI, 1315 - CIDADE MONCOES - SÃO PAULO/SP 04571-010', -23.60833290, -46.69380380, '2024-08-26 20:11:03'),
(301, 'AVENIDA DIEDERICHSEN, 1291 - VILA GUARANI (Z SUL) - SÃO PAULO/SP 04310-001', -23.63326450, -46.63704110, '2024-08-26 20:11:03'),
(302, 'AVENIDA YERVANT KISSAJIKIAN, 3060 - VILA JOANIZA - SÃO PAULO/SP 04428-000', -23.68151800, -46.65340280, '2024-08-26 20:11:03'),
(303, 'AVENIDA JABAQUARA, 1327 - MIRANDOPOLIS - SÃO PAULO/SP 04045-002', -23.61591800, -46.63843950, '2024-08-26 20:11:03'),
(304, 'RUA SILVA BUENO - 1805 - IPIRANGA - São paulo - SP - 04208-052', -23.59439930, -46.60093390, '2024-08-26 20:11:03'),
(305, 'PRACA FLORIANO PEIXOTO - 408 - SANTO AMARO - São paulo - SP - 04751-030', -23.65222520, -46.70748700, '2024-08-26 20:11:03'),
(306, 'AVENIDA JORGE JOAO SAAD - 1120 - VILA PROGREDIOR - São paulo - SP - 05618-001', -23.59474580, -46.72076780, '2024-08-26 20:11:03'),
(307, 'RUA DOMENICO LANZETTI, 6 - PARELHEIROS - SÃO PAULO/SP 04884-210', -23.81741880, -46.70586000, '2024-08-26 20:11:03'),
(308, 'AVENIDA DOS EUCALIPTOS - 671 - INDIANOPOLIS - São paulo - SP - 04517-050', -23.60893710, -46.67014750, '2024-08-26 20:11:03'),
(309, 'Av. Prof. Oscar Campiglia, 81 - Parque Ipe, São Paulo - SP, 05762-230', -23.64377280, -46.76374730, '2024-08-26 20:11:04'),
(310, 'RUA SAMUEL KLEIN - 182 - CENTRO - São caetano do sul - SP - 09510-125', -23.61220840, -46.57014090, '2024-08-26 20:11:04'),
(311, 'Av. Rosália Iannini Conde, 320 - Parque America, São Paulo - SP, 04841-150', -23.73851540, -46.68861320, '2024-08-26 20:11:04'),
(312, 'AVENIDA NOSSA SENHORA DA ENCARNACAO - DE 401/402 AO FIM, 925 - JARDIM MARIA ESTELA - SÃO PAULO/SP 04180-081', -23.63378890, -46.60020980, '2024-08-26 20:11:04'),
(313, 'AVENIDA DO RIO PEQUENO - 880 - RIO PEQUENO - São paulo - SP - 05379-000', -23.56658990, -46.75377480, '2024-08-26 20:11:04'),
(314, 'AVENIDA DO RIO PEQUENO - 814 - RIO PEQUENO - São paulo - SP - 05379-000', -23.56643510, -46.75336460, '2024-08-26 20:11:04'),
(315, 'RUA MONTEIRO DE MELO - 102 - LAPA - São paulo - SP - 05050-000', -23.52233520, -46.70319770, '2024-08-26 20:11:04'),
(316, 'AVENIDA DR SYLVIO DE CAMPOS, 58 - PERUS - SÃO PAULO/SP 05204-000', -23.40590620, -46.75422710, '2024-08-26 20:11:04'),
(317, 'AVENIDA MUTINGA - 2590 - PIRITUBA - São paulo - SP - 05110-000', -23.48810490, -46.74856810, '2024-08-26 20:11:05'),
(318, 'AVENIDA VITAL BRASIL, 326 - BUTANTA - SÃO PAULO/SP 05503-000', -23.57148690, -46.70739720, '2024-08-26 20:11:05'),
(319, 'AVENIDA MOFARREJ, 348 - VILA LEOPOLDINA - SÃO PAULO/SP 05311-000', -23.52610150, -46.73924040, '2024-08-26 20:11:05'),
(320, 'AVENIDA DEP JACOB SALVADOR ZVEIBIL, S/N - BUTANTA - SÃO PAULO/SP 05512-390', -23.58493770, -46.72436970, '2024-08-26 20:11:05'),
(321, 'AVENIDA DOUTOR VITAL BRASIL - 569 - BUTANTA - São paulo - SP - 05503-001', -23.57104570, -46.70962660, '2024-08-26 20:11:05'),
(322, 'AVENIDA LEAO MACHADO, 100 - PARQUE CONTINENTAL - SÃO PAULO/SP 05328-020', -23.54744280, -46.75706860, '2024-08-26 20:11:05'),
(323, 'Estr. do Campo Limpo, 3996 - Vila Pirajussara', -23.62860580, -46.76790620, '2024-08-26 20:11:05'),
(324, 'Av Corifeu de Azevedo Marques, 5069 - loja 7 - Open Mall Pátio Jaguaré - São Paulo/SP', -23.55508590, -46.75156330, '2024-08-26 20:11:06'),
(325, 'AVENIDA ALEXIOS JAFET, 1240 - JARDIM IPANEMA (ZONA OESTE) - SÃO PAULO/SP 05187-010', -23.44538130, -46.74798350, '2024-08-26 20:11:06'),
(326, 'PRACA ISAI LEINER, 131 - JARDIM BONFIGLIOLI - SÃO PAULO/SP 05592-140', -23.57717800, -46.74190200, '2024-08-26 20:11:06'),
(327, 'R. Teodoro Sampaio, 1900 - Pinheiros, São Paulo - SP, 05406-150', -23.56312560, -46.68713760, '2024-08-26 20:11:06'),
(328, 'AVENIDA ELISIO CORDEIRO DE SIQUEIRA, 779 - JARDIM SANTO ELIAS - SÃO PAULO/SP 05136-000', -23.49978080, -46.74736720, '2024-08-26 20:11:06'),
(329, 'RUA TEODORO SAMPAIO - 2472 - PINHEIROS - São paulo - SP - 05406-200', -23.56593660, -46.69179600, '2024-08-26 20:11:06'),
(330, 'AVENIDA CORIFEU DE A. MARQUES - 2144 - JARDIM RIZZO - São paulo - SP - 05582-001', -23.57417040, -46.73041850, '2024-08-26 20:11:06'),
(331, 'RUA CEL RUBENS REIS REZENDE, 98 - JARDIM ARPOADOR - SÃO PAULO/SP 05565-180', -23.59576310, -46.78942030, '2024-08-26 20:11:06'),
(332, 'RUA PADRE JOAO DA CUNHA, 510 - JARDIM JOAO XXIII - SÃO PAULO/SP 05569-050', -23.60163030, -46.79471970, '2024-08-26 20:11:07'),
(333, 'ESTRADA DO M BOI MIRIM, 1179 - JARDIM DAS FLORES - SÃO PAULO/SP 04905-021', -23.67296500, -46.74393500, '2024-08-26 20:11:07'),
(334, 'RUA JOSE FILIPE DA SILVA, 274 - JARDIM ESTER - SÃO PAULO/SP 05372-040', -23.58182790, -46.75997180, '2024-08-26 20:11:07'),
(335, 'R. Prof. José Horácio Meirelles Teixeira, 1041 - LOJA 07 - Vila Suzana, São Paulo - SP, 05630-130', -23.61329900, -46.74146470, '2024-08-26 20:11:07'),
(336, 'RUA HEITOR PENTEADO - 1240 - SUMAREZINHO - São paulo - SP - 05438-100', -23.54661270, -46.69024170, '2024-08-26 20:11:07'),
(337, 'ESTRADA CORONEL JOSE GLADIADOR, 120 - JARDIM ANHANGUERA - SÃO PAULO/SP 05267-000', -23.43416470, -46.79256400, '2024-08-26 20:11:07'),
(338, 'RUA IRMAO JOAQUIM DO LIVRAMENTO, 76 - JARDIM JOAO XXIII - SÃO PAULO/SP 05569-000', -23.60183320, -46.79211020, '2024-08-26 20:11:07'),
(339, 'RUA FRANCISCO DE SALES, 54 - JARDIM DAS PALMAS - SÃO PAULO/SP 05749-280', -23.62224470, -46.74654650, '2024-08-26 20:11:08'),
(340, 'AVENIDA DR CARDOSO DE MELO, 1655 - VILA OLIMPIA - SÃO PAULO/SP 04548-005', -23.59659410, -46.68919130, '2024-08-26 20:11:08'),
(341, 'Estr. Pres. Juscelino K. de Oliveira, 4265 - Pimentas, Guarulhos - SP, 07252-000', -23.44226100, -46.40818850, '2024-08-26 20:11:08'),
(342, 'AVENIDA DIOGENES RIBEIRO DE LIMA, 2407 - ALTO DE PINHEIROS - SÃO PAULO/SP 05458-001', -23.53935740, -46.71882220, '2024-08-26 20:11:08'),
(343, 'RUA JOSE MARIA PINTO ZILLI, 328 - JARDIM DAS PALMAS - SÃO PAULO/SP 05749-300', -23.61885470, -46.74835070, '2024-08-26 20:11:08'),
(344, 'RUA TEODORO SAMPAIO, 515 - PINHEIROS - SÃO PAULO/SP 05405-000', -23.55652040, -46.67555880, '2024-08-26 20:11:08'),
(345, 'PRACA ISAI LEIRNER, 131 - JARDIM BONFIGLIOLI - SÃO PAULO/SP 05592-140', -23.57724970, -46.74198510, '2024-08-26 20:11:08'),
(346, 'RUA PRESIDENTE CASTELO BRANCO - 253 - CENTRO - Osasco - SP - 06016-020', -23.53563280, -46.77824680, '2024-08-26 20:11:08'),
(347, 'AVENIDA CRISANTEMO - 169 - JARDIM DAS FLORES - Osasco - SP - 06112-100', -23.53370000, -46.79359000, '2024-08-26 20:11:08'),
(348, 'ESTRADA SANTA EUGENIA, 19 - LOJA C -  PACIENCIA - RIO DE JANEIRO/RJ 23585-430', -22.92598400, -43.63499740, '2024-08-26 20:11:09'),
(349, 'RUA LEITE DE MORAIS, 100 - SANTANA - SÃO PAULO/SP 02034-020', -23.50328670, -46.62544130, '2024-08-26 20:11:09'),
(350, 'RUA VOLUNTARIOS DA PATRIA - 2181 - SANTANA - São paulo - SP - 02011-500', -23.50107890, -46.62635080, '2024-08-26 20:11:09'),
(351, 'AVENIDA GUILHERME COTCHING - 1933 - VILA MARIA - São paulo - SP - 02113-017 - Unidade de Vila Maria', -23.51315000, -46.58574500, '2024-08-26 20:11:09'),
(352, 'RUA DOUTOR CESAR, 262 - SANTANA - SÃO PAULO/SP 02013-001', -23.50215580, -46.62882310, '2024-08-26 20:11:09'),
(353, 'RUA DR. CESAR CASTIGLIONI JUNIOR - 310 - CASA VERDE - São paulo - SP - 02515-000', -23.51066990, -46.65910660, '2024-08-26 20:11:09'),
(354, 'AVENIDA CEL SEZEFREDO FAGUNDES - 2727 - TUCURUVI - São paulo - SP - 02306-003', -23.45506090, -46.60261060, '2024-08-26 20:11:09'),
(355, 'PRACA DOM PEDRO FULCO MORVIDI - 14 - VILA PEREIRA BARRETO - PIRITUBA - São paulo - SP - 02920-020', -23.49058590, -46.71984270, '2024-08-26 20:11:09'),
(356, 'R. Bonifácio Cubas, 164 - Vila Albertina São Paulo - SP', -23.50143320, -46.69414360, '2024-08-26 20:11:09'),
(357, 'RUA ALCANTARA - 195 - VILA MARIA BAIXA - São paulo - SP - 02110-010', -23.52022560, -46.59580840, '2024-08-26 20:11:10'),
(358, 'RUA ANTONIO DE NAPOLI - 68 - PARADA - São paulo - SP - 02987-030', -23.43462150, -46.71725210, '2024-08-26 20:11:10'),
(359, 'AVENIDA DEP EMILIO CARLOS, 1240 - BAIRRO DO LIMAO - SÃO PAULO/SP 02720-100', -23.49496800, -46.67726860, '2024-08-26 20:11:10'),
(360, 'AVENIDA ROLAND GARROS - 1.641 - JARDIM BRASIL (ZONA NORTE) - São paulo - SP - 02235-001', -23.47717510, -46.57400970, '2024-08-26 20:11:10'),
(361, 'AVENIDA PARADA PINTO - 164 - VILA NOVA CACHOEIRINHA - São paulo - SP - 02611-002', -23.47256440, -46.66652620, '2024-08-26 20:11:10'),
(362, 'RUA PAULINO DE BRITO - 29 - JARDIM BRASIL (ZONA NORTE) - São paulo - SP - 02223-010', -23.47909000, -46.58201930, '2024-08-26 20:11:10'),
(363, 'AVENIDA PAULA FERREIRA - 1690 - FREGUESIA DO O - São paulo - SP - 02916-000', -23.49656620, -46.71246700, '2024-08-26 20:11:10'),
(364, 'AVENIDA IMIRIM, 2191 - IMIRIM - SÃO PAULO/SP 02465-200', -23.48803720, -46.65245150, '2024-08-26 20:11:10'),
(365, 'AVENIDA DAS CEREJEIRAS, 1333 - JARDIM JAPAO - SÃO PAULO/SP 02124-001', -23.50574000, -46.57714420, '2024-08-26 20:11:10'),
(366, 'AVENIDA ITABERABA, 1939 - ITABERABA - SÃO PAULO/SP 02739-000', -23.48558330, -46.69210070, '2024-08-26 20:11:11'),
(367, 'RUA FRIEDRICH VON VOITH, 53 - JARDIM SAO JOAO (JARAGUA) - SÃO PAULO/SP 02995-000', -23.44817090, -46.73533620, '2024-08-26 20:11:11'),
(368, 'AVENIDA ADOLFO COELHO, 925 - LAUZANE PAULISTA - SÃO PAULO/SP 02443-000', -23.47688230, -46.64604010, '2024-08-26 20:11:11'),
(369, 'AVENIDA JULIO BUONO, 1987 - VILA GUSTAVO - SÃO PAULO/SP 02201-001', -23.48286270, -46.59031010, '2024-08-26 20:11:11'),
(370, 'AVENIDA GENERAL ATALIBA LEONEL, 2780 - PARADA INGLESA - SÃO PAULO/SP 02242-000', -23.49158070, -46.60871740, '2024-08-26 20:11:11'),
(371, 'AVENIDA AGUIA DE HAIA, 3856 - JARDIM SORAIA - SÃO PAULO/SP 03889-000', -23.51202780, -46.47685750, '2024-08-26 20:11:11'),
(372, 'RUA ZILDA - 527 - CASA VERDE ALTA - São paulo - SP - 02545-000', -23.49518470, -46.66173900, '2024-08-26 20:11:11'),
(373, 'RUA APARECIDA DO TABOADO - 1166 - JARDIM PAULISTANO (ZONA NORTE) - São paulo - SP - 02814-000', -23.45758940, -46.70546340, '2024-08-26 20:11:12'),
(374, 'AVENIDA MIGUEL DE CASTRO, 1678 - VILA PEREIRA BARRETO - SÃO PAULO/SP 02950-000', -23.47197300, -46.72069400, '2024-08-26 20:11:12'),
(375, 'RUA BONIFACIO CUBAS, 164 - VILA ALBERTINA - SÃO PAULO/SP 02731-000', -23.50143320, -46.69414360, '2024-08-26 20:11:12'),
(376, 'RUA BARAO DE JUNDIAI, 976 - CENTRO - JUNDIAÍ/SP 13201-012', -23.18655300, -46.88546800, '2024-08-26 20:11:12'),
(377, 'AVENIDA EDE, 97 - VILA EDE - SÃO PAULO/SP 02203-000', -23.49785410, -46.59474660, '2024-08-26 20:11:12'),
(378, 'RUA CAPITAO LUIS RAMOS - 306 - VILA GUILHERME - São paulo - SP - 02066-011', -23.50627120, -46.60717710, '2024-08-26 20:11:12'),
(379, 'AVENIDA ITABERABA, 456 - NOSSA SENHORA DO O - SÃO PAULO/SP 02734-000', -23.49718890, -46.69781250, '2024-08-26 20:11:12'),
(380, 'AVENIDA EDU CHAVES, 694 - PARQUE EDU CHAVES - SÃO PAULO/SP 02229-000', -23.47365550, -46.57105040, '2024-08-26 20:11:12'),
(381, 'RUA FELICIO MARCONDES - 440 - CENTRO - Guarulhos - SP - 07010-030', -23.46619730, -46.53008670, '2024-08-26 20:11:13'),
(382, 'RUA VINTE DE MARCO - 05 - JARDIM FELICIDADE - São paulo - SP - 02326-115', -23.43888370, -46.57487140, '2024-08-26 20:11:13'),
(383, 'RUA COELHO LISBOA - 382 - TATUAPE - São paulo - SP - 03323-040', -23.54769040, -46.57238110, '2024-08-26 20:11:13'),
(384, 'AVENIDA MATEO BEI - 3282 - SAO MATEUS - São paulo - SP - 03949-300', -23.60945450, -46.47750700, '2024-08-26 20:11:13'),
(385, 'RUA PADRE VIEGAS DE MENEZES - 365 - ITAQUERA - São paulo - SP - 08220-510', -23.53600050, -46.45660000, '2024-08-26 20:11:13'),
(386, 'RUA VICTORIO SANTIM - 29 - ITAQUERA - São paulo - SP - 08290-001', -23.53644010, -46.45406360, '2024-08-26 20:11:13');
INSERT INTO `geocoded_addresses` (`id`, `endereco`, `latitude`, `longitude`, `last_updated`) VALUES
(387, 'RUA TUIUTI - 1.443 - TATUAPE - São paulo - SP - 03081-012', -23.52514100, -46.57584060, '2024-08-26 20:11:13'),
(388, 'RUA DOS CAMPINEIROS - 441 - MOOCA - São paulo - SP - 03167-020', -23.55560070, -46.59386900, '2024-08-26 20:11:13'),
(389, 'AVENIDA TENENTE LAUDELINO FERREIRA DO AMARAL - 141 - VILA JACUI - São paulo - SP - 08060-000', -23.49950210, -46.45544830, '2024-08-26 20:11:14'),
(390, 'AVENIDA FLAMINGO, 234 - VILA CURUCA - SÃO PAULO/SP 08031-000', -23.51052810, -46.42170070, '2024-08-26 20:11:14'),
(391, 'AVENIDA PARANAGUA, 1764 - ERMELINO MATARAZZO - SÃO PAULO/SP 03806-000', -23.49064910, -46.47895350, '2024-08-26 20:11:14'),
(392, 'AVENIDA DR. EDUARDO COTCHING - 1904 - VILA FORMOSA - São paulo - SP - 03356-001', -23.56641760, -46.54448670, '2024-08-26 20:11:14'),
(393, 'RUA MARCIO BECK MACHADO, 98 - CIDADE TIRADENTES - SÃO PAULO/SP 08485-455', -23.58015300, -46.41209810, '2024-08-26 20:11:14'),
(394, 'AVENIDA DR EDUARDO COTCHING, 2456 - VILA FORMOSA - SÃO PAULO/SP 03356-001', -23.56909740, -46.54050100, '2024-08-26 20:11:14'),
(395, 'RUA DA MOOCA - 3845 - MOOCA - São paulo - SP - 03165-001', -23.55917560, -46.58842330, '2024-08-26 20:11:14'),
(396, 'AVENIDA MATEO BEI - 2373 - SAO MATEUS - São paulo - SP - 03949-012', -23.60253950, -46.48237200, '2024-08-26 20:11:14'),
(397, 'ESTRADA DO LAGEADO VELHO - 538 - GUAIANAZES - São paulo - SP - 08451-000', -23.53663820, -46.40386930, '2024-08-26 20:11:14'),
(398, 'RUA APUCARANA - 634 - TATUAPE - São paulo - SP - 03311-000', -23.54382070, -46.56412740, '2024-08-26 20:11:15'),
(399, 'AVENIDA SAPOPEMBA, 5691 - SAPOPEMBA - SÃO PAULO/SP 03374-001', -23.58196980, -46.53608190, '2024-08-26 20:11:15'),
(400, 'AVENIDA TIBURCIO DE SOUZA - 1.695 - ITAIM PAULISTA - São paulo - SP - 08140-000', -23.49917630, -46.39957660, '2024-08-26 20:11:15'),
(401, 'AVENIDA MATEO BEI, 1545 - SAO MATEUS - SÃO PAULO/SP 03949-011', -23.59657950, -46.48697580, '2024-08-26 20:11:15'),
(402, 'AVENIDA MARIA LUIZA AMERICANO, 1.126 - CIDADE LIDER - SÃO PAULO/SP 08275-000', -23.56821890, -46.47468200, '2024-08-26 20:11:15'),
(403, 'AVENIDA MATEO BEI - 2920 - SAO MATEUS - São paulo - SP - 03949-300', -23.60669220, -46.47934980, '2024-08-26 20:11:15'),
(404, 'AVENIDA CELSO GARCIA, 4729 - TATUAPE - SÃO PAULO/SP 03063-000', -23.53380980, -46.56703230, '2024-08-26 20:11:15'),
(405, 'AVENIDA SAPOPEMBA, 3889 - SAPOPEMBA - SÃO PAULO/SP 03374-000', -23.57560840, -46.55194540, '2024-08-26 20:11:15'),
(406, 'RUA SALVADOR GIANETTI, 1014 - GUAIANAZES - SÃO PAULO/SP 08410-000', -23.54361890, -46.41253570, '2024-08-26 20:11:15'),
(407, 'AVENIDA MATEO BEI - 3106 - SAO MATEUS - São paulo - SP - 03949-300', -23.60802220, -46.47836270, '2024-08-26 20:11:16'),
(408, 'AVENIDA CELSO GARCIA, 3902 - TATUAPE - SÃO PAULO/SP 03064-000', -23.53564510, -46.57469410, '2024-08-26 20:11:16'),
(409, 'AVENIDA LIDER - 1742 - CIDADE LIDER - São paulo - SP - 08280-005', -23.55632240, -46.47818420, '2024-08-26 20:11:16'),
(410, 'AVENIDA CANGAIBA - 2559 - CANGAIBA - São paulo - SP - 03711-007', -23.50603710, -46.53117490, '2024-08-26 20:11:16'),
(411, 'RUA DOM JOSE ANTONIO COUTO - 13 - GUAIANAZES - São paulo - SP - 08452-270', -23.53459250, -46.39955180, '2024-08-26 20:11:16'),
(412, 'AVENIDA DR EDUARDO COTCHING, 2163 - VILA FORMOSA - SÃO PAULO/SP 03356-001', -23.56721670, -46.54236540, '2024-08-26 20:11:16'),
(413, 'Av. Santista, 1196 - Jardim Jaú (Zona Leste), São Paulo - SP, 04884-170', -23.82579700, -46.70508450, '2024-08-26 20:11:17'),
(414, 'RUA JACAREANA - 29 - JARDIM CAMARGO NOVO - São paulo - SP - 08121-425', -23.50154610, -46.38414120, '2024-08-26 20:11:17'),
(415, 'AVENIDA SATELITE - 226 - CIDADE SATELITE SANTA BARBARA - São paulo - SP - 08330-480', -23.61341400, -46.46910810, '2024-08-26 20:11:17'),
(416, 'AVENIDA MOACIR D. DE ITAPECURU - 894 - CIDADE NOV.S.MIGUEL - São paulo - SP - 08030-000', -23.55577140, -46.63955710, '2024-08-26 20:11:17'),
(417, 'RUA AZEVEDO SOARES - 1040 - VILA GOMES CARDIM - São paulo - SP - 03322-001', -23.54920540, -46.56659680, '2024-08-26 20:11:17'),
(418, 'AVENIDA ALZIRO ZARUR, 253 - PARQUE SAVOY CITY - SÃO PAULO/SP 03570-000', -23.56282750, -46.48274780, '2024-08-26 20:11:17'),
(419, 'AVENIDA WALDEMAR CARLOS PEREIRA - 323 - VILA TALARICO - São paulo - SP - 03533-001', -23.54255560, -46.52206880, '2024-08-26 20:11:17'),
(420, 'Rua Tibúrcio de Sousa, 45, Vila Teles - São Paulo/SP - Cep: 08140-000', -23.49814550, -46.40019080, '2024-08-26 20:11:17'),
(421, 'RUA ANTONIO ASSUNCAO FERREIRA - 80 - PQ BOA ESPERANCA - São paulo - SP - 08341-360', -23.59678830, -46.45338080, '2024-08-26 20:11:17'),
(422, 'AVENIDA DO ORATORIO - 4583 - JD GUAIRACA - São paulo - SP - 03221-200', -23.60223390, -46.53005200, '2024-08-26 20:11:18'),
(423, 'AVENIDA WALDEMAR CARLOS PEREIRA - 539 - VILA TALARICO - São paulo - SP - 03533-001', -23.54364050, -46.52038390, '2024-08-26 20:11:18'),
(424, 'AVENIDA BARONESA DE MURITIBA, 200 - PARQUE SAO RAFAEL - SÃO PAULO/SP 08311-080', -23.62438080, -46.47159560, '2024-08-26 20:11:18'),
(425, 'RUA OLAVO EGIDIO DE SOUZA ARANHA, 1841 - JARDIM PENHA - SÃO PAULO/SP 03822-000', -23.49303310, -46.49733350, '2024-08-26 20:11:18'),
(426, 'RUA ABEL TAVARES - 1096 - JARDIM BELEM - São paulo - SP - 03810-110', -23.49023210, -46.46951590, '2024-08-26 20:11:18'),
(427, 'AVENIDA VILA EMA - 5541 - VILA EMA - São paulo - SP - 03281-001', -23.59711000, -46.53022000, '2024-08-26 20:11:18'),
(428, 'R. PADRE ALDEMAR MOREIRA, 99 - CIDADE TIRADENTES, SÃO PAULO - SP, 08471-010', -23.59960930, -46.40031200, '2024-08-26 20:11:18'),
(429, 'RUA ITINGUCU - 1316 - VILA RE - São paulo - SP - 03658-000', -23.52699040, -46.50300970, '2024-08-26 20:11:18'),
(430, 'PRACA EULALIO DE CARVALHO - 102 - JARDIM NOVO CARRAO - São paulo - SP - 03908-280', -23.58047810, -46.50941500, '2024-08-26 20:11:18'),
(431, 'Av. Waldemar Carlos Pereira, 539 - Vila Dalila, São Paulo - SP, 03533-001', -23.54364050, -46.52038390, '2024-08-26 20:11:19'),
(432, 'AVENIDA SAO MIGUEL - 4260 - VILA RIO BRANCO - São paulo - SP - 03870-000', -23.50813000, -46.49223240, '2024-08-26 20:11:19'),
(433, 'RUA COSTA REGO, 38 - VILA GUILHERMINA - SÃO PAULO/SP 03542-030', -23.53156400, -46.51676750, '2024-08-26 20:11:19'),
(434, 'Av. Miguel Achiole da Fonseca, 729 - Jd São Paulo . Guainases', -23.55658320, -46.40013640, '2024-08-26 20:11:19'),
(435, 'RUA HARRY DANNENBERG - 470 - VILA CARMOSINA - São paulo - SP - 08270-010', -23.55442100, -46.46444260, '2024-08-26 20:11:19'),
(436, 'AVENIDA ARQUITETO VILANOVA ARTIGAS, 247 - CJ H TEOTONIO VILELA - SÃO PAULO/SP 03928-240', -23.61257750, -46.50152640, '2024-08-26 20:11:19'),
(437, 'RUA MANUEL VELOSO DA COSTA, 258 - JARDIM VILA CARRAO - SÃO PAULO/SP 08340-460', -23.61283570, -46.45498380, '2024-08-26 20:11:19'),
(438, 'AVENIDA CONS CARRAO, 3200 - VILA CARRAO - SÃO PAULO/SP 03402-003', -23.55121010, -46.53136300, '2024-08-26 20:11:20'),
(439, 'RUA NILZA - 18 - VILA ESPERANCA - São paulo - SP - 03651-120', -23.52357590, -46.52180670, '2024-08-26 20:11:20'),
(440, 'ESTRADA DO LAGEADO VELHO, 826 - VILA IOLANDA(LAJEADO) - SÃO PAULO/SP 08451-056', -23.53530860, -46.40143760, '2024-08-26 20:11:20'),
(441, 'AVENIDA RENATA, 439 - CHACARA BELENZINHO - SÃO PAULO/SP 03377-000', -23.57421720, -46.54112190, '2024-08-26 20:11:20'),
(442, 'RUA TAPAIUNA, 127 - JARDIM SANTA MARIA - SÃO PAULO/SP 03576-060', -23.55114380, -46.50755640, '2024-08-26 20:11:20'),
(443, 'AVENIDA DO ORATORIO - 2361 - PARQUE SAO LUCAS - São paulo - SP - 03221-100', -23.59265150, -46.54676350, '2024-08-26 20:11:20'),
(444, 'PRACA VALDEMAR BASSI, 52 - JARDIM BRASILIA (ZONA LESTE) - SÃO PAULO/SP 03585-050', -23.56017860, -46.49220800, '2024-08-26 20:11:20'),
(445, 'AVENIDA RAGUEB CHOHFI, 4880 - JARDIM IGUATEMI - SÃO PAULO/SP 08380-320', -23.59556310, -46.43890030, '2024-08-26 20:11:20'),
(446, 'AVENIDA PARANAGUA - 1891 - VILA PARANAGUA - São paulo - SP - 03806-010', -23.48963950, -46.47951600, '2024-08-26 20:11:21'),
(447, 'AVENIDA RIO DAS PEDRAS, 1325 - JARDIM ARICANDUVA - SÃO PAULO/SP 03453-100', -23.56621190, -46.51150510, '2024-08-26 20:11:21'),
(448, 'RUA AUGUSTO CAVALCANTI, 233 - CONJUNTO RESIDENCIAL JOSE BONIFACIO - SÃO PAULO/SP 08253-110', -23.54398430, -46.43659320, '2024-08-26 20:11:21'),
(449, 'RUA PASTORIL DE ITAPETINGA, 541 - JARDIM DANFER - SÃO PAULO/SP 03729-000', -23.50338690, -46.50399190, '2024-08-26 20:11:21'),
(450, 'Av. Pires do Rio, 4516 - Jardim Norma, São Paulo - SP, BR', -23.53249160, -46.45367010, '2024-08-26 20:11:21'),
(451, 'RUA SAO GONCALO DO ABAETE, 48 - PARQUE TIETE - SÃO PAULO/SP 02870-000', -23.45960000, -46.67499650, '2024-08-26 20:11:21'),
(452, 'AVENIDA SAO MIGUEL, 4438 - VILA RIO BRANCO - SÃO PAULO/SP 03870-000', -23.50768920, -46.49053630, '2024-08-26 20:11:22'),
(453, 'AVENIDA ESPERANTINA, 66 - PARQUE DAS PAINEIRAS - SÃO PAULO/SP 03692-000', -23.53180740, -46.48546370, '2024-08-26 20:11:22'),
(454, 'AVENIDA DA BARREIRA GRANDE, 2135 - VILA BANCARIA - SÃO PAULO/SP 03916-000', -23.58696160, -46.51553250, '2024-08-26 20:11:22'),
(455, 'RUA BELEM, 301 - BELENZINHO - SÃO PAULO/SP 03057-010', -23.53963090, -46.59591830, '2024-08-26 20:11:22'),
(456, 'RUA SARA KUBITSCHECK, 222 - CONJUNTO HABITACIONAL CASTRO ALVES - SÃO PAULO/SP 08474-000', -23.58354920, -46.40661290, '2024-08-26 20:11:22'),
(457, 'RUA JOSE DE SA E ARRUDA, 353 - JARDIM SANTO ANDRE - SÃO PAULO/SP 08390-030', -23.63523780, -46.44362760, '2024-08-26 20:11:22'),
(458, 'PRACA SERRA DO OROCORI - 4 - JARDIM AIMORE - São paulo - SP - 08110-370', -23.49452670, -46.40247570, '2024-08-26 20:11:22'),
(459, 'RUA WENCESLAU GUIMARAES - 833 - PARQUE CISPER - São paulo - SP - 03823-000', -23.48972880, -46.49035470, '2024-08-26 20:11:23'),
(460, 'AVENIDA DIOGO DA COSTA TAVARES, 211 - JARDIM MARGARIDA - SÃO PAULO/SP 08191-000', -23.48491070, -46.38640160, '2024-08-26 20:11:23'),
(461, 'RUA HENRY FUSELI, 38 - JARDIM DONA SINHA - SÃO PAULO/SP 03923-030', -23.59485210, -46.51168010, '2024-08-26 20:11:23'),
(462, 'AVENIDA MIGUEL ACHIOLE DA FONSECA, 729 - JARDIM SAO PAULO(ZONA LESTE) - SÃO PAULO/SP 08461-110', -23.55658320, -46.40013640, '2024-08-26 20:11:23'),
(463, 'RUA ANTONIO CARLOS MINGUES LOPES, 1484 - CONJUNTO HABITACIONAL SITIO CONCEICAO - SÃO PAULO/SP 08473-270', -23.58176800, -46.39484920, '2024-08-26 20:11:23'),
(464, 'AVENIDA SAPOPEMBA, 15774 - CIDADE SATELITE SANTA BARBARA - SÃO PAULO/SP 08330-180', -23.62598100, -46.46284940, '2024-08-26 20:11:23'),
(465, 'AVENIDA DOUTOR GUILHERME DE ABREU SODRE, 41 - VILA HORTENCIA - SÃO PAULO/SP 08490-010', -23.56749950, -46.40980940, '2024-08-26 20:11:24'),
(466, 'RUA MORRO DAS PEDRAS, 39 - JARDIM RODOLFO PIRANI - SÃO PAULO/SP 08310-100', -23.63335710, -46.46139910, '2024-08-26 20:11:24'),
(467, 'R. Erva do Sereno, 250 - Jardim Maia, São Paulo - SP, 08180-010', -23.48402930, -46.41267400, '2024-08-26 20:11:24'),
(468, 'RUA GENERAL PORFIRIO DA PAZ - 1750 - VILA BANCARIA - São paulo - SP - 03918-000', -23.59589060, -46.51407150, '2024-08-26 20:11:24'),
(469, 'RUA COLONIA LEOPOLDINA, 709 - VILA SILVIA - SÃO PAULO/SP 03821-020', -23.49255670, -46.49906040, '2024-08-26 20:11:24'),
(470, 'RUA NOVA RESENDE, 125 - PARQUE SANTA MADALENA - SÃO PAULO/SP 03981-090', -23.61414760, -46.51779240, '2024-08-26 20:11:24'),
(471, 'RUA CARDON - 983 - VILA PROGRESSO (ZONA LESTE) - São paulo - SP - 08041-525', -23.51844050, -46.43959460, '2024-08-26 20:11:24'),
(472, 'RUA DOS CICLAMES, 13 - VILA LUCIA - SÃO PAULO/SP 03146-010', -23.59187730, -46.57961160, '2024-08-26 20:11:25'),
(473, 'RUA LUIS MATEUS, 506 - JARDIM SAO PEDRO - SÃO PAULO/SP 08420-750', -23.54689500, -46.42654080, '2024-08-26 20:11:25'),
(474, 'AVENIDA INCONFIDENCIA MINEIRA - 1851 - VILA ANTONIETA - São paulo - SP - 03476-010', -23.57142260, -46.51045220, '2024-08-26 20:11:25'),
(475, 'AVENIDA JOAQUIM MANOEL DE MACEDO, 606 - PARQUE RESIDENCIAL MARENGO - ITAQUAQUECETUBA/SP 08594-500', -23.48526330, -46.29868110, '2024-08-26 20:11:25'),
(476, 'RUA MANUEL BUENO DA FONSECA, 77 - JARDIM SAO LUIS (ZONA LESTE) - SÃO PAULO/SP 08121-000', -23.49440860, -46.38883440, '2024-08-26 20:11:25'),
(477, 'RUA MANUEL LEMES DA SILVA, 310 - JARDIM DAS OLIVEIRAS - SÃO PAULO/SP 08122-140', -23.49507790, -46.37906010, '2024-08-26 20:11:25'),
(478, 'RUA ABEL TAVARES, 1096 - JARDIM BELEM - SÃO PAULO/SP 03810-110', -23.49023210, -46.46951590, '2024-08-26 20:11:25'),
(479, 'AVENIDA WALDEMAR CARLOS PEREIRA, 1880 - VILA TALARICO - SÃO PAULO/SP 03533-002', -23.54811190, -46.51004860, '2024-08-26 20:11:26'),
(480, 'AVENIDA RAGUEB CHOHFI, 4882 - JARDIM IGUATEMI - SÃO PAULO/SP 08380-320', -23.59558330, -46.43881850, '2024-08-26 20:11:26'),
(481, 'AVENIDA CAPITAO AVIADOR WALTER RIBEIRO, 235 - CIDADE JARDIM CUMBICA - GUARULHOS/SP 07181-000', -23.44690290, -46.47019210, '2024-08-26 20:11:26'),
(482, 'RUA PADRE THOMAZ JOSEPH SHEA, 18 - VILA SANTA INES - SÃO PAULO/SP 03812-040', -23.49371430, -46.46888270, '2024-08-26 20:11:26'),
(483, 'AVENIDA DR PEREIRA VERGUEIRO, 272 - VILA NHOCUNE - SÃO PAULO/SP 03563-000', -23.54291870, -46.49681280, '2024-08-26 20:11:26'),
(484, 'AVENIDA OLIVEIRA FREIRE, 1482 - PARQUE PAULISTANO - SÃO PAULO/SP 08080-570', -23.48435860, -46.42090330, '2024-08-26 20:11:26'),
(485, 'RUA TIJUCO PRETO, 460 - TATUAPE - SÃO PAULO/SP 03316-000', -23.54404570, -46.57128810, '2024-08-26 20:11:26'),
(486, 'RUA JACIRENDI, 76 - TATUAPE - SÃO PAULO/SP 03080-000', -23.53435980, -46.57771950, '2024-08-26 20:11:27'),
(487, 'RUA GONCALVES CRESPO, 78 - TATUAPE - SÃO PAULO/SP 03066-030', -23.53854600, -46.57573800, '2024-08-26 20:11:27'),
(488, 'RUA CORONEL JOVINIANO BRANDAO - 137 - VILA PRUDENTE - São paulo - SP - 03127-175', -23.57345250, -46.58645620, '2024-08-26 20:11:27'),
(489, 'RUA TUIUTI, 2403 - TATUAPE - SÃO PAULO/SP 03307-005', -23.54665340, -46.57386880, '2024-08-26 20:11:27'),
(490, 'AVENIDA MATEO BEI - 2568 - SAO MATEUS - São paulo - SP - 03949-200', -23.60413880, -46.48133410, '2024-08-26 20:11:27'),
(491, 'AVENIDA CONS CARRAO - 1861 - VILA CARRAO - São paulo - SP - 03403-001', -23.54585660, -46.54288490, '2024-08-26 20:11:27'),
(492, 'RUA FERNAO MENDES PINTO, 1493 - PARQUE BOTURUSSU - SÃO PAULO/SP 03803-000', -23.49447000, -46.49014300, '2024-08-26 20:11:27'),
(493, 'RUA BANDEIRA DO SUL, 852 - JARDIM TIETE - SÃO PAULO/SP 03944-120', -23.60444830, -46.49562510, '2024-08-26 20:11:28'),
(494, 'AVENIDA PIRES DO RIO - 2845 - JARDIM SAO SEBASTIAO - São paulo - SP - 08041-000', -23.52212090, -46.44299470, '2024-08-26 20:11:28'),
(495, 'AVENIDA MAL TITO, 789 - SAO MIGUEL PAULISTA - SÃO PAULO/SP 08010-090', -23.49462790, -46.43803370, '2024-08-26 20:11:28'),
(496, 'R. PADRE ESTEVÃO PERNET, 718 - SALA 2212 - TATUAPÉ, SÃO PAULO - SP, 03315-000', -23.54226920, -46.56789870, '2024-08-26 20:11:28'),
(497, 'PRACA VINTE DE JANEIRO, 100 - VILA REGENTE FEIJO - SÃO PAULO/SP 03335-060', -23.55372700, -46.56853290, '2024-08-26 20:11:28'),
(498, 'AVENIDA ERNESTO SOUZA CRUZ - 789 - CIDADE ANTONIO ESTEVAO DE CARVALHO - São paulo - SP - 08225-380', -23.52604690, -46.46421490, '2024-08-26 20:11:28'),
(499, 'RUA ROMELANDIA, 34 - PARQUE CISPER - SÃO PAULO/SP 03818-040', -23.50172420, -46.49366660, '2024-08-26 20:11:28'),
(500, 'AVENIDA NORDESTINA - 6870 - JARDIM AURORA (ZONA LESTE) - São paulo - SP - 08431-165', -23.53638820, -46.41680650, '2024-08-26 20:11:29'),
(501, 'RUA 24 DE MAIO - 242 - REPUBLICA - São paulo - SP - 01041-001', -23.54338000, -46.64059300, '2024-08-26 20:11:29'),
(502, 'RUA SAO BENTO - 51 - CENTRO - São paulo - SP - 01011-000', -23.54853260, -46.63657430, '2024-08-26 20:11:29'),
(503, 'RUA SAO BENTO - 351 - CENTRO - São paulo - SP - 01011-100', -23.54603030, -46.63534510, '2024-08-26 20:11:29'),
(504, 'RUA MIGUEL CARLOS - 7 - CENTRO - São paulo - SP - 01023-010', -23.53909840, -46.63050030, '2024-08-26 20:11:29'),
(505, 'RUA DO AROUCHE, 118 - CENTRO - SÃO PAULO/SP 01219-000', -23.54244260, -46.64449560, '2024-08-26 20:11:29'),
(506, 'RUA VINTE E CINCO DE MARCO - 1090 - CENTRO - São paulo - SP - 01021-100', -23.54019600, -46.63198270, '2024-08-26 20:11:29'),
(507, 'RUA BRA DE ITU, 22 - SANTA CECILIA - SÃO PAULO/SP 01231-000', -23.53984740, -46.65325380, '2024-08-26 20:11:30'),
(508, 'RUA CAMOMIL - 160 - CANINDE - São paulo - SP - 03032-010', -23.53062260, -46.62169790, '2024-08-26 20:11:30'),
(509, 'RUA FLORENCIO DE ABREU, 36 - CENTRO - SÃO PAULO/SP 01030-000', -23.54382850, -46.63346130, '2024-08-26 20:11:30'),
(510, 'RUA FLORENCIO DE ABREU, 65 - CENTRO - SÃO PAULO/SP 01029-000', -23.54350880, -46.63359110, '2024-08-26 20:11:30'),
(511, 'Ladeira Porto Geral, 14 - Loja 151 - Centro Histórico de São Paulo, São Paulo - SP, 01022-000', -23.54506350, -46.63342600, '2024-08-26 20:11:30'),
(512, 'RUA JOSE PAULINO - 226 - BOM RETIRO - São paulo - SP - 01120-000', -23.53204890, -46.63838040, '2024-08-26 20:11:30'),
(513, 'Ladeira Porto Geral, n 14 loja 281 CENTRO SP', -23.54506350, -46.63342600, '2024-08-26 20:11:30'),
(514, 'Ladeira Porto Geral, 14 - Loja 256/262 - Centro Histórico de São Paulo, São Paulo - SP, 01022-000', -23.54506350, -46.63342600, '2024-08-26 20:11:30'),
(515, 'LADEIRA PORTO GERAL, 34 - CENTRO - SÃO PAULO/SP 01022-000', -23.54499230, -46.63341210, '2024-08-26 20:11:30'),
(516, 'RUA BOA VISTA, 280 - CENTRO - SÃO PAULO/SP 01014-908', -23.54517460, -46.63338530, '2024-08-26 20:11:31'),
(517, 'RUA FLORENCIO DE ABREU, 334 - CENTRO - SÃO PAULO/SP 01030-000', -23.54116480, -46.63266550, '2024-08-26 20:11:31'),
(518, 'PRACA DA LIBERDADE AFRICA-JAPAO - 80 - LIBERDADE - São paulo - SP - 01503-010', -23.55488470, -46.63520060, '2024-08-26 20:11:31'),
(519, 'RUA CARNOT, 356 - CANINDE - SÃO PAULO/SP 03032-030', -23.53169330, -46.62234820, '2024-08-26 20:11:31'),
(520, 'Estrada geral da limpa', -28.09373120, -48.66291600, '2024-08-27 14:26:22');

-- --------------------------------------------------------

--
-- Estrutura para tabela `goals`
--

CREATE TABLE `goals` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `target` int(11) NOT NULL,
  `marker_id` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `goals_user`
--

CREATE TABLE `goals_user` (
  `id` int(11) NOT NULL,
  `goal_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `markers`
--

CREATE TABLE `markers` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `cor` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `markers`
--

INSERT INTO `markers` (`id`, `nome`, `cor`) VALUES
(13, 'Cosmético Geral', '#d87f03'),
(45, 'Cosmético Geral', '#e60000');

-- --------------------------------------------------------

--
-- Estrutura para tabela `mesorregioes`
--

CREATE TABLE `mesorregioes` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `estado_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `mesorregioes`
--

INSERT INTO `mesorregioes` (`id`, `nome`, `estado_id`) VALUES
(1, 'Distrito Federal', 7),
(2, 'Norte de Goiás', 9),
(3, 'Noroeste de Goiás', 9),
(4, 'Leste de Goiás', 9),
(5, 'Centro de Goiás', 9),
(6, 'Sul Goiano', 9),
(7, 'Centro-Norte de Mato Grosso do Sul', 12),
(8, 'Leste de Mato Grosso do Sul', 12),
(9, 'Sudoeste de Mato Grosso do Sul', 12),
(10, 'Pantanais Sul-Mato-Grossenses', 12),
(11, 'Centro-Sul Mato-Grossense', 11),
(12, 'Nordeste Mato-Grossense', 11),
(13, 'Norte Mato-Grossense', 11),
(14, 'Sudeste Mato-Grossense', 11),
(15, 'Sudoeste Mato-Grossense', 11),
(16, 'Agreste Alagoano', 2),
(17, 'Leste Alagoano', 2),
(18, 'Sertão Alagoano', 2),
(19, 'Extremo Oeste Baiano', 5),
(20, 'Vale São-Franciscano da Bahia', 5),
(21, 'Centro-Sul Baiano', 5),
(22, 'Sul Baiano', 5),
(23, 'Centro-Norte Baiano', 5),
(24, 'Nordeste Baiano', 5),
(25, 'Metropolitana de Salvador', 5),
(26, 'Centro-Sul Cearense', 6),
(27, 'Jaguaribe', 6),
(28, 'Metropolitana de Fortaleza', 6),
(29, 'Noroeste Cearense', 6),
(30, 'Norte Cearense', 6),
(31, 'Sertões Cearenses', 6),
(32, 'Sul Cearense', 6),
(33, 'Centro Maranhense', 10),
(34, 'Leste Maranhense', 10),
(35, 'Norte Maranhense', 10),
(36, 'Oeste Maranhense', 10),
(37, 'Sul Maranhense', 10),
(38, 'Sertão Paraibano', 15),
(39, 'Borborema', 15),
(40, 'Agreste Paraibano', 15),
(41, 'Mata Paraibana', 15),
(42, 'São Francisco Pernambucano', 17),
(43, 'Sertão Pernambucano', 17),
(44, 'Agreste Pernambucano', 17),
(45, 'Mata Pernambucana', 17),
(46, 'Metropolitana do Recife', 17),
(47, 'Centro-Norte Piauiense', 18),
(48, 'Norte Piauiense', 18),
(49, 'Sudeste Piauiense', 18),
(50, 'Sudoeste Piauiense', 18),
(51, 'Oeste Potiguar', 20),
(52, 'Central Potiguar', 20),
(53, 'Agreste Potiguar', 20),
(54, 'Leste Potiguar', 20),
(55, 'Agreste Sergipano', 26),
(56, 'Leste Sergipano', 26),
(57, 'Sertão Sergipano', 26),
(58, 'Vale do Acre', 1),
(59, 'Vale do Juruá', 1),
(60, 'Centro Amazonense', 4),
(61, 'Norte Amazonense', 4),
(62, 'Sudoeste Amazonense', 4),
(63, 'Sul Amazonense', 4),
(64, 'Norte do Amapá', 3),
(65, 'Sul do Amapá', 3),
(66, 'Baixo Amazonas', 14),
(67, 'Marajó', 14),
(68, 'Metropolitana de Belém', 14),
(69, 'Nordeste Paraense', 14),
(70, 'Sudeste Paraense', 14),
(71, 'Sudoeste Paraense', 14),
(72, 'Leste Rondoniense', 22),
(73, 'Madeira-Guaporé', 22),
(74, 'Norte de Roraima', 23),
(75, 'Sul de Roraima', 23),
(76, 'Ocidental do Tocantins', 27),
(77, 'Oriental do Tocantins', 27),
(78, 'Central Espírito-Santense', 8),
(79, 'Litoral Norte Espírito-Santense', 8),
(80, 'Noroeste Espírito-Santense', 8),
(81, 'Sul Espírito-Santense', 8),
(82, 'Campo das Vertentes', 13),
(83, 'Central Mineira', 13),
(84, 'Jequitinhonha', 13),
(85, 'Metropolitana de Belo Horizonte', 13),
(86, 'Noroeste de Minas', 13),
(87, 'Norte de Minas', 13),
(88, 'Oeste de Minas', 13),
(89, 'Sul e Sudoeste de Minas', 13),
(90, 'Triângulo Mineiro e Alto Paranaíba', 13),
(91, 'Vale do Mucuri', 13),
(92, 'Vale do Rio Doce', 13),
(93, 'Zona da Mata', 13),
(94, 'Baixadas Litorâneas', 19),
(95, 'Centro Fluminense', 19),
(96, 'Metropolitana do Rio de Janeiro', 19),
(97, 'Noroeste Fluminense', 19),
(98, 'Norte Fluminense', 19),
(99, 'Sul Fluminense', 19),
(100, 'São José do Rio Preto', 25),
(101, 'Ribeirão Preto', 25),
(102, 'Araçatuba', 25),
(103, 'Bauru', 25),
(104, 'Araraquara', 25),
(105, 'Piracicaba', 25),
(106, 'Campinas', 25),
(107, 'Presidente Prudente', 25),
(108, 'Marília', 25),
(109, 'Assis', 25),
(110, 'Itapetininga', 25),
(111, 'Macro Metropolitana Paulista', 25),
(112, 'Vale do Paraíba Paulista', 25),
(113, 'Litoral Sul Paulista', 25),
(114, 'Metropolitana de São Paulo', 25),
(115, 'Centro Ocidental Paranaense', 16),
(116, 'Centro Oriental Paranaense', 16),
(117, 'Centro-Sul Paranaense', 16),
(118, 'Metropolitana de Curitiba', 16),
(119, 'Noroeste Paranaense', 16),
(120, 'Norte Central Paranaense', 16),
(121, 'Norte Pioneiro Paranaense', 16),
(122, 'Oeste Paranaense', 16),
(123, 'Sudeste Paranaense', 16),
(124, 'Sudoeste Paranaense', 16),
(125, 'Centro Ocidental Rio-Grandense', 21),
(126, 'Centro Oriental Rio-Grandense', 21),
(127, 'Metropolitana de Porto Alegre', 21),
(128, 'Nordeste Rio-Grandense', 21),
(129, 'Noroeste Rio-Grandense', 21),
(130, 'Sudeste Rio-Grandense', 21),
(131, 'Sudoeste Rio-Grandense', 21),
(132, 'Vale do Rio Pardo', 21),
(133, 'Vale do Taquari', 21),
(134, 'Grande Florianópolis', 24),
(135, 'Norte Catarinense', 24),
(136, 'Oeste Catarinense', 24),
(137, 'Serrana', 24),
(138, 'Sul Catarinense', 24),
(139, 'Vale do Itajaí', 24);

-- --------------------------------------------------------

--
-- Estrutura para tabela `representatives`
--

CREATE TABLE `representatives` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `cidade` varchar(255) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL,
  `marcas` text DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `sharpeners`
--

CREATE TABLE `sharpeners` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `cpf` varchar(15) NOT NULL,
  `telefone` varchar(15) NOT NULL,
  `endereco` varchar(150) NOT NULL,
  `cidade` varchar(50) NOT NULL,
  `uf` varchar(2) NOT NULL,
  `instagram` varchar(200) NOT NULL,
  `selo` varchar(50) NOT NULL,
  `cep` varchar(10) NOT NULL,
  `email` varchar(100) NOT NULL,
  `bairro` varchar(100) NOT NULL,
  `status` varchar(30) NOT NULL,
  `situacao` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `sharpeners`
--

INSERT INTO `sharpeners` (`id`, `nome`, `cpf`, `telefone`, `endereco`, `cidade`, `uf`, `instagram`, `selo`, `cep`, `email`, `bairro`, `status`, `situacao`) VALUES
(2318, 'Tadeu Maia da Silva', '402.854.328-26', '15981200566', 'Rua Presidente Vargas n? 493', 'Cerquilho', 'SP', '@afiador_tadeumaia', '', '', 'tadeumaiasilva@gmail.com', 'Vila S?o Jos?', 'Aprovado', ''),
(2319, 'Ricardo Hansen ', '068.325.729-30\n', '47991089089', 'Rua Eurico krobel 376', 'Navegantes ', 'SC', '@ricardoafiacoes', '', '', 'ricardohansen@hotmail.com', 'Gravata', 'Aprovado', ''),
(2320, 'Jeferson Rodrigues ', '611773180', '67998136161', 'Rua Ant?nio Manoel dos Santos 237', 'Ivinhema ', 'MS', '@afiacoes_rodrigues ', '', '79740000', 'afiacoesrodrigues@gmail.com', 'Piraveve ', 'Aprovado', ''),
(2321, 'Mateus da Silva Barros Nascimento ', '6626307509', '75998819113', 'mateus.bass.s@hotmail.com', 'Utinga ', 'BA', '@afiart_utinga', '', '46810-000', 'mateus.bass.s@hotmail.com', 'Centro ', 'Aprovado', ''),
(2322, 'Helio Luiz D Alberto', '30977100944', '47996195510', 'Rua Santos Dumont 402', 'Brusque', 'SC', 'afiarte_', '', '88352200', 'heliodalberto@hotmail.com', 'Santa Terezinha', 'Aprovado', ''),
(2323, 'Jeferson Moreira de Almeida', '37515377836', '18997557585', 'Avenida Manoel Ant?nio de Souza, 1329', 'Paragua?u paulista ', 'SP', '@moreiraafiacao', '', '19707030', 'jeelara742@gmail.com', 'Barra funda', 'Aprovado', ''),
(2324, 'Danilo Ferreira sebastiao', '3723685900', '44998566810', 'Rua Afonso dias Bastos\n844', 'Peabiru', 'PR', '@vsafiacao', '', '87250000', 'sfdanilo@hotmail.com', 'Centro', 'Aprovado', ''),
(2325, 'Carlos Eduardo Andrade figueiredo', '5082459902', '44998679662', 'Rua Minas Gerais\n, 377', 'Paranava?', 'PR', '@afiacaoecia', '', '87702-340', 'duandrade49@gmail.com', 'Centro', 'Aprovado', ''),
(2326, 'Igor carneiro dos santos', '3661376624', '1922208526', 'Av Brasil 1181 jardim Amanda II', 'Hortol?ndia sp', 'SP', 'Igor_afiacoes', '', '13188252', 'igorafiacoes@gmail.com', 'Jardim Amanda II', 'Aprovado', ''),
(2327, 'Aledisson Rosne ', '35087546854', '43999834906', 'Can?rio da terra 425', 'Arapongas', 'PR', '@mundial_afiacoes', '', '86708-510', 'aledisson_ro@hotmail.com', 'Centauro', 'Aprovado', ''),
(2328, 'Rodrigo Wataki', '28786828835', '11930012717', 'rua da mooca 2020 sala 3', 'S?o Paulo', 'SP', '@doctorfiooficial', '', '3104000', 'rodrigowataki@gmail.com', 'Mooca', 'Aprovado', ''),
(2329, 'Leandro Eduardo Gramasco', '309.186.448-01', '19982425124', 'Avenida 15 JP,. 155 casa 15 A', 'Rio Claro', 'SP', 'afiacoes_gramasco', '', '13.502-270', 'leandro_gramasco@hotmail.com', 'Jardim Esmeralda', 'Aprovado', ''),
(2330, 'Felipe de Oliveira Souza', '6744533606', '32988582005', 'rua Esm?ria de jesus 95', 'juiz de fora ', 'MG', '@afiacoesfs', '', '36060440', 'felipekbsao@gmail.com', 'Linhares', 'Aprovado', ''),
(2331, 'Celso Rodrigues matos ', '041.645.273-66', '88992143474', 'Rua conselheiro Rodrigues Junior 74 ', 'Sobral', 'CE', '@loja_da_manicure ', '', '62010445', 'celsorodrigues56@gmail.com', 'Centro ', 'Aprovado', ''),
(2332, 'Odenilson Ramos de Jesus', '37557208846', '11983677062', 'Rua Jo?o Fernandes Camisa Nova J?nior\n449', 'S?o Paulo', 'SP', 'meocellafiacoes', '', '05844-000', 'ramos.odenilson@gmail.com', 'Jardim S?o Lu?s', 'Aprovado', ''),
(2333, 'Ivam Luiz de lima', '75641330230', '69992288357', 'Avenida 7 de setembro n?mero 4595 ', 'Cacoal ', 'RO', 'doctorfio.cacoal', '', '76963427', 'ivamluizlima07@gmail.com', 'Ch?cara brizon, o mesmo Jardim Clodoaldo', 'Aprovado', ''),
(2334, 'Luiz Fernando Felipe da Silva ', '91062667204', '69984461167', 'Rua It?lia ', 'ariquemes ', 'Ro', '@afiacoes_lc ', '', '76871-300', 'luiz_fernandofelipe@hotmail.com', 'jardim europa ', 'Aprovado Parcialmente', ''),
(2335, 'Celso Vilmar Kloss', '97318183087', '54991495888', 'Narceiso Rech 3105 AP 403 \r', 'Caxias do Sul', 'RS', 'Celso Kloss', '', '95059245', 'celso.kloss@hotmail.com', 'Jardim Iracema', 'Aprovado', ''),
(2336, 'alex junio silva', '11547466669', '37996636865', 'rua rio grande do sul 466 loja', 'Divin?polis', 'MG', 'chaveiro.divinopolis', '', '35500025', 'chaveirodivinopolis@outlook.com', 'centro', 'Aprovado', ''),
(2337, 'Rolimberg aparecido cobucci ', '137.865.428-56 ', '11995221829', 'Rua Jos? Virillo n?483 ', 'Itupeva ', 'SP', 'bergcobucci', '', '13295-576 ', 'bergcobucci@gmail.com', 'Portal Santa F? ', 'Aprovado', ''),
(2338, 'Anderson Jos? Marchesini ', '378.721.518-20 ', '19994419120', 'Rua Paraguai, 79', 'Jaguari?na', 'SP', '@afia.pro', '', '13919-060', 'afiapro.afiacao@gmail.com', 'Santa Cruz ', 'Aprovado', ''),
(2339, 'Rafael de Souza Gon?alves', '37242314828', '11971752468', 'Avenida Dom Pedro II\r\n93', 'SALTO', 'SP', '@afiacoesfort', '', '13320-240', 'raphaelsouza02092014@gmail.com', 'centro', 'Aprovado', ''),
(2340, 'Hailton Cesar nascimento Gomes', '56725892191', '65999092142', 'Rua Alzira Santana', 'V?rzea Grande', 'MT', 'Vg_afiacoes', '', '78128-474', 'centerchavesvgmt@hotmail.com', 'Costa verde', 'Aprovado', ''),
(2341, 'Tiago Alves da Cunha', '6536728459', '81988031788', 'Rua da Alegria, n?48', 'Jaboat?o dos Guararapes', 'PE', 'tiago_afiacoes', '', '54320495', 'afiacaodealicate1@gmail.com', 'Jardim Jord?o', 'Aprovado', ''),
(2342, 'Vanderson Belizario da Silva ', '40299397831', '15998383418', 'Jo?o Batista Mantovani 243', 'Porto Feliz ', 'SP', 'Beliz?rio_afia??es ', '', '18540000', '15997138984van@gmail.com', 'jardim vante ', 'Aprovado', ''),
(2343, 'Paulo Veroneze ', '306.947.328-85 ', '48988236086', 'Rua Padre Itamar Luis Costa 300 ', 'Tubar?o ', 'Sa', '@veronezeafiacoes ', '', '88708-070 ', 'plvrnz@gmail.com', 'S?o Jo?o ME ', 'Aprovado', 'Ativo'),
(2344, 'Ivanildo de Oliveira Souza ', '002-851-932-95', '6984566522', 'Linha 184 km 1,5 ch?cara setor dois ', 'Santa luzia D\' Oste ', 'RO', '0', '', '76.950-000', 'niildinhoo.oliveira@gmail.com', 'Ch?cara ', 'Aprovado', ''),
(2345, 'Erlei bernhardt ', '773.690.849-49 ', '41995269027', 'Rua pedro ivo, 193 - 1?andar', 'Curitiba', 'PR', 'Erleiafiacoesprofissionais', '', '80010-020', 'Erleiafiacoesprofissionais@gmail.com', 'Centro', 'Aprovado', ''),
(2346, 'Claudiomar Andrade Galv?o', '059.287.356-00', '27997728887', 'Rua M?rio Jorge assef, 678', 'Guarapari', 'ES', '@claudio_afiador', '', '29210180', 'galvaosfamily@gmail.com', 'Itapebussu', 'Aprovado', ''),
(2347, 'Agnaldo David rosa', '71641203153', '17991726828', ' Rua joaquim benvindo fidelis 190', 'Bady bassitt', 'SP', 'Seguir', '', '15115000', 'Agnaldosoopo@hotmail.com', 'Lago sul', 'Aprovado', ''),
(2348, 'Tiago vital da Silva ', '463.047.598-27 ', '11964265111', 'Rua mario pavanello  79', 'Mau? ', 'SP', '@afiacao_cortefino', '', '9390660', 'tiagovital58@gmail.com', 'Jd nova Mau? ', 'Aprovado Parcialmente', ''),
(2351, 'Matheus', '05815065021', '48 992118970', 'Estrada geral da limpa', 'Garopaba', 'SC', '@omatheusrogério', '', '88495000', 'madufajuisa@gmail.com', 'Limpa', 'Aprovado', 'Ativo'),
(2352, 'Guilherme', '05815065021', '48 992118970', 'Estrada geral da limpa', 'Garopaba', '', '@omatheusrogério', '', '88495000', 'madufajuisa@gmail.com', 'Limpa', 'Aprovado', 'Ativo'),
(2353, 'Matheus', '05815065021', '48 992118970', 'Estrada geral da limpa', 'Garopaba', 'SC', '@omatheusrogério', '', '88495000', 'madufajuisa@gmail.com', 'Limpa', 'Aprovado Parcialmente', 'Ativo');

-- --------------------------------------------------------

--
-- Estrutura para tabela `sharpeners_markers`
--

CREATE TABLE `sharpeners_markers` (
  `id` int(11) NOT NULL,
  `marcador_id` int(11) NOT NULL,
  `sharpener_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `sharpeners_users`
--

CREATE TABLE `sharpeners_users` (
  `id` int(11) NOT NULL,
  `sharpener_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `stores`
--

CREATE TABLE `stores` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `endereco` text NOT NULL,
  `status` varchar(50) NOT NULL,
  `anotacao` text NOT NULL,
  `telefone` varchar(25) NOT NULL,
  `instagram` varchar(255) NOT NULL,
  `site` varchar(255) NOT NULL,
  `decisor` varchar(50) NOT NULL,
  `cnpj` varchar(20) NOT NULL,
  `telefone_decisor` varchar(20) NOT NULL,
  `datetime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `cidade` varchar(50) NOT NULL,
  `estado` varchar(2) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mesorregiao` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `stores`
--

INSERT INTO `stores` (`id`, `nome`, `endereco`, `status`, `anotacao`, `telefone`, `instagram`, `site`, `decisor`, `cnpj`, `telefone_decisor`, `datetime`, `cidade`, `estado`, `email`, `mesorregiao`) VALUES
(13783, 'Phermas Cosméticos e Perfumaria', 'Av. Cap. Aviador Walter Ribeiro, 400- Cumbica, Guarulhos', 'Inativo', '', '11990118752', 'https://www.instagram.com/phermascosmeticos', '', 'Evandro', '50.981.114/0001-38', '', '2024-08-26 13:05:25', 'GUARULHOS', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13784, 'MEG\'S PERFUMARIA', 'AVENIDA SETE DE SETEMBRO - 1580 - VILA GALVAO - Guarulhos - SP - 07064-000', 'Inativo', '', '11 4372-2952', 'https://www.instagram.com/megsperfumaria/', '', 'KEILA', '29.063.291/0001-49', '', '2024-08-26 13:05:25', 'GUARULHOS', 'SP', 'keilakanashiro@gmail.com', 'Metropolitada São Paulo (Sem Capital)'),
(13786, 'YAMASHIRO COSMETICOS', 'RUA MIGUEL PRISCO, 59 - CENTRO - RIBEIRÃO PIRES/SP 09401-000', 'Inativo', '', '(11) 4829-4619', 'https://www.instagram.com/yamashirocosmeticosribeirao/', '', 'MARCOS', '43.174.289/0001-78', '', '2024-08-26 13:05:25', 'RIBEIRÃO PIRES', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13787, 'Helô Cosméticos', 'AVENIDA JOSE MOREIRA - 492 - JARDIM QUARTO CENTENARIO - Mauá - SP - 09341-120', 'Inativo', '', '11 96209-1867', 'https://www.instagram.com/_helocosmeticos/', '', '', '21.345.080/0001-97', '', '2024-08-26 13:05:25', 'Mauá', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13788, 'Amada Cosméticos e Perfumaria', 'AVENIDA DOM JOSE GASPAR, 1490 A - MATRIZ - MAUÁ/SP 09370-670', 'Inativo', '', '(11) 98605-0355', 'https://www.instagram.com/amada.cosmeticos/', '', 'MARCELO', '38.490.161/0001-83', '', '2024-08-26 13:05:29', 'Mauá', 'SP', 'marcelo.menegussi@yahoo.com.br', 'Metropolitada São Paulo (Sem Capital)'),
(13789, 'ME.LINDA COSMETICOS E PERFUMARIA', 'AVENIDA GOVERNADOR MARIO COVAS JUNIOR (VL F N MORELLI) - 01 - CENTRO - Mauá - SP - 09390-040', 'Inativo', '', '1145188642', 'https://www.instagram.com/lojasmelinda/', 'https://www.melinda.com.br/', 'EMERSON', '13.393.158/0015-16', '', '2024-08-26 13:05:30', 'Mauá', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13790, 'PERFUMARIA LIDER', 'AVENIDA BARAO DE MAUA, 31 - VILA BOCAINA - MAUÁ/SP 09310-000', 'Inativo', '', '(11) 99948-3788', 'https://www.instagram.com/lider_perfumaria/', '', 'DIOGO', '10.296.342/0001-54', '', '2024-08-26 13:05:29', 'Mauá', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13791, 'PINK COSMÉTICOS E ACESSÓRIOS', 'RUA PRESIDENTE ARTHUR DA COSTA E SILVA, 414 - PARQUE SAO VICENTE - MAUÁ/SP 09371-490', 'Inativo', '', '11963253052', 'https://www.instagram.com/lojapinkcosmeticos/', '', 'VINICIUS', '31.807.023/0001-36', '(11) 99538-4325', '2024-08-26 13:05:29', 'Mauá', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13792, 'Perfumaria Simony', 'AVENIDA AYRTON SENNA DA SILVA, 510 - VILA SANTA CECILIA - MAUÁ/SP 09380-440', 'Inativo', '', '(11) 4544-2577', 'https://www.instagram.com/perfumariasimony/', '', 'SIMONE', '03.269.033/0001-20', '', '2024-08-26 13:05:29', 'Mauá', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13793, 'PERFUMARIA SINONIMO DE BELEZA', 'R. HAVANA, 14A - PARQUE DAS AMÉRICAS, MAUÁ - SP, 09351-020', 'Inativo', '', '11959243816', 'https://www.instagram.com/perfumariasinonimo/', '', 'OSLAVDO / KAREN', '05.283.089/0001-64', '', '2024-08-26 13:05:34', 'Mauá', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13794, 'FLOR DE LIS - PERFUMARIA E ACESSORIOS', 'RUA ALFREDO FIGLIA, 25 - JARDIM ITAPEVA - MAUÁ/SP 09330-070', 'Inativo', '', '(11) 96456-8088', 'https://www.instagram.com/flordelisperfu/', '', 'ANDERSON / DALILA', '19.359.976/0001-83', '(11) 97750-2589', '2024-08-26 13:05:33', 'Mauá', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13795, 'Charmo Perfumaria', 'RUA SENADOR FLAQUER, 391 - CENTRO - SANTO ANDRÉ/SP 09010-160', 'Inativo', '', '1149944720', 'https://www.instagram.com/charmoperfumaria/', '', 'LUIZ / CARLOS', '71.811.822/0001-09', '', '2024-08-26 13:05:34', 'SANTO ANDRÉ', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13796, 'LAKISME PERFUMARIA E COSMETICOS', 'AVENIDA QUEIROS FILHO - 781 - VILA AMERICA - Santo andré - SP - 09110-260', 'Inativo', '', '11992464216', 'https://www.instagram.com/lakismeperfumaria/', '', 'JULLY', '38.094.825/0001-95', '', '2024-08-26 13:05:34', 'SANTO ANDRÉ', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13797, 'Gloss Cosmeticos Vila Luzita', 'Av. Dom Pedro I, 4101 - Vila Luzita, Santo André - SP, 09130-400', 'Inativo', '', '11961748208', 'https://www.instagram.com/glossluzita/', '', '', '16.904.025/0001-50', '', '2024-08-26 13:05:34', 'SANTO ANDRÉ', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13798, 'Beka Perfumaria', 'AVENIDA DOM PEDRO I, 3264 - VILA TIBIRICA - SANTO ANDRÉ/SP 09130-400', 'Inativo', '', '(11) 97835-8797', 'https://www.instagram.com/bekaperfumaria/', '', 'EDSON', '39.677.991/0001-87', '', '2024-08-26 13:05:39', 'SANTO ANDRÉ', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13799, 'Vaidosa Perfumaria', 'RUA ORATORIO, 1628 - PARQUE DAS NACOES - SANTO ANDRÉ/SP 09280-000', 'Inativo', '', '11 26778017', 'https://www.instagram.com/vaidosa_perfumaria/', '', 'RODRIGO', '17.327.714/0001-01', '', '2024-08-26 13:05:39', 'SANTO ANDRÉ', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13800, 'Nick Vick Beauty Shop', 'RUA MARTIM FRANCISCO - 316 - SANTA PAULA - São caetano do sul - SP - 09541-330', 'Inativo', '', '1142261210', 'https://www.instagram.com/NVBEAUTYSHOPOFICIAL', 'https://www.nvbeautyshop.com.br/', 'NEUSA', '05.418.143/0001-31', '', '2024-08-26 13:05:39', 'SÃO CAETANO DO SUL', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13801, 'Kaorys Perfumaria Diadema', 'AVENIDA PRESIDENTE KENNEDY (JD PITANGUEIRAS), 39 - CENTRO - DIADEMA/SP 09913-000', 'Inativo', '', '11 98231-9454', 'https://www.instagram.com/kaorysperfumariaoficial/', 'https://www.kaorysperfumaria.com.br/', 'FERNANDA / ADRIANA', '29.935.113/0001-60', '', '2024-08-26 13:05:39', 'DIADEMA', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13803, 'NOSSA BELEZA PERFUMARIA', 'RUA PAU DO CAFE, 1217 - CASA GRANDE - DIADEMA/SP 09962-375', 'Inativo', '', '(11) 4055-5630', 'https://www.instagram.com/nossabelezaserraria/', '', 'FELIPE / ELIANA', '11.233.167/0001-19', '', '2024-08-26 13:05:44', 'DIADEMA', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13804, 'IRIE PERFUMARIA', 'RUA ANTONIO DIAS ADORNO, 463 - VILA NOGUEIRA - DIADEMA/SP 09951-000', 'Inativo', '', '11 40762632', 'https://www.instagram.com/irieperfumaria/', 'https://shopee.com.br/netbeauty1?v=405&smtt=0.0.3', 'ANDRE', '10.991.584/0001-68', '', '2024-08-26 13:05:44', 'DIADEMA', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13805, 'Perfumaria Sofisa', 'AVENIDA ANTONIO SYLVIO CUNHA BUENO - 921 - INAMAR - Diadema - SP - 09970-160', 'Inativo', '', '(11) 94738-1592', 'https://www.instagram.com/sofisa_perfumaria/', '', '', '24.527.324/0001-40', '', '2024-08-26 13:05:44', 'DIADEMA', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13806, 'STILLOS COSMETICOS ', 'Av. Lico Maia, 497 - Conceição, Diadema - SP, 09981-420', 'Inativo', '', ' 11 94951-4380', 'https://www.instagram.com/perfumariastilloscosmeticos516/', '', 'SUELI', '20.121.847/0001-31', '', '2024-08-26 13:05:44', 'DIADEMA', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13807, 'SAMYRA COSMETICOS', 'RUA ALVARENGA PEIXOTO, 55 - VILA NOGUEIRA - DIADEMA/SP 09960-440', 'Inativo', '', '11982581459', 'https://www.instagram.com/samyracosmeticosdda/', '', '', '19.474.624/0001-79', '', '2024-08-26 13:05:44', 'DIADEMA', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13808, 'Todah Cosméticos e Perfumaria', 'PRACA BOM JESUS DE PIRAPORINHA - 336 - PIRAPORINHA - Diadema - SP - 09951-550', 'Inativo', '', '11996500450', 'https://www.instagram.com/todahcosmeticos/', '', 'CRISTIANE / MARCELO', '03.447.035/0001-61', '(11) 98700-0383', '2024-08-26 13:05:49', 'DIADEMA', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13809, 'PERFUMARIA MONALISA', 'AVENIDA ITAMARATI, 1711 - VILA CURUCA - SANTO ANDRÉ/SP 09290-730', 'Inativo', '', '(11) 99991-0831', 'https://www.instagram.com/perfumaria.monalisa/', '', 'ANDRESSA / MARLENE', '47.436.709/0001-06', '', '2024-08-26 13:05:49', 'DIADEMA', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13810, 'PERFUMARIA TAMMY  ', 'PRACA BOM JESUS DE PIRAPORINHA, 49 - PIRAPORINHA - DIADEMA/SP 09951-550', 'Inativo', '', '(11) 99733-6555', 'https://www.instagram.com/tammyperfumaria/', '', 'ALESSANDRO', '04.947.717/0001-04', '', '2024-08-26 13:05:49', 'DIADEMA', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13811, 'PERFUMARIA CRYSTAL', 'AVENIDA PRESIDENTE JUSCELINO, 1099 - PIRAPORINHA - DIADEMA/SP 09950-370', 'Inativo', '', '11 4067-7831', 'https://www.instagram.com/perfumaria.crystal/', '', 'LUCIANA / JOSE', '14.003.549/0001-44', '', '2024-08-26 13:05:49', 'DIADEMA', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13812, 'LENI PERFUMARIA', 'AVENIDA ALBERTO JAFET (VL ANA SOFIA) - 870 - VILA NOGUEIRA - Diadema - SP - 09951-110', 'Inativo', '', '11987268734', 'https://www.instagram.com/leniperfumaria/', '', 'LENITA', '22.837.823/0001-09', '', '2024-08-26 13:05:49', 'DIADEMA', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13813, 'DASLINDAS COSMETICOS ', 'AVENIDA ELIAS ALVES DA COSTA - 281 - CENTRO - Vargem grande paulista - SP - 06730-000', 'Inativo', '', '11 94145-1364', 'https://www.instagram.com/daslindascosmeticos/', '', 'ANDERSON', '05.988.707/0001-71', '', '2024-08-26 13:05:54', 'Vargem grande paulista', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13814, 'COSMETICOS DIRCE', 'AVENIDA INOCENCIO SERAFICO, 3597 - VILA SILVA RIBEIRO - CARAPICUÍBA/SP 06380-021', 'Inativo', '', '1141892701', 'https://www.instagram.com/dircecosmeticos/', '', 'ALLAN', '04.186.968/0001-05', '', '2024-08-26 13:05:54', 'CARAPICUÍBA', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13815, 'JR COSMETICOS E PERFUMARIA', 'AVENIDA INOCENCIO SERAFICO, 3644 - VILA DIRCE - CARAPICUÍBA/SP 06343-410', 'Inativo', '', ' 11 4553-5744', 'https://www.instagram.com/jrcosmeticoseperfumaria', '', 'JORGIVALDO', '18.124.972/0001-53', '', '2024-08-26 13:05:54', 'CARAPICUÍBA', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13816, 'Bella Cosméticos Carapicuíba', 'Avenida Inocêncio Seráfico, 1653, Carapicuíba, Brazil 06380-020', 'Inativo', '', '11 95423-9442', 'https://www.instagram.com/maisbellacarapicuiba/', '', 'KELLY', '30.003.899/0001-67', '', '2024-08-26 13:05:54', 'CARAPICUÍBA', 'SP', 'kellycamargo28@gmail.com', 'Metropolitada São Paulo (Sem Capital)'),
(13817, 'BELISSIMA COSMETICOS', 'ESTRADA DO COPIUVA, 1780 - PARQUE JANDAIA - CARAPICUÍBA/SP 06330-000', 'Inativo', '', '1143743516', 'https://www.instagram.com/belissimacosmeticoscarapicuiba/', '', 'EDSON', '15.631.247/0001-83', '', '2024-08-26 13:05:54', 'CARAPICUÍBA', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13818, 'Jasmine Cosméticos', 'AVENIDA BRIGADEIRO MANOEL RODRIGUES JORDAO - 1509 - JARDIM SILVEIRA - Barueri - SP - 06433-010', 'Inativo', '', '(11) 2321-1057', 'https://www.instagram.com/jasminecosmeticos/', 'https://www.jasminecosmeticos.com.br/', 'LUDMILA', '29.576.417/0001-89', '', '2024-08-26 13:05:59', 'BARUERI', 'SP', 'ludmila@jasminecosmeticos.com.br', 'Metropolitada São Paulo (Sem Capital)'),
(13819, 'Lojas Royal Cosméticos', 'RUA ANTONIO AGU - 617 - CENTRO - Osasco - SP - 06013-003', 'Inativo', '', '(11)99996-8792', 'https://www.instagram.com/lojasroyalcosmeticos/', 'https://www.royalcosmeticos.com.br/', 'FLAVIO', '46.350.228/0001-02', '', '2024-08-26 13:05:59', 'Osasco', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13820, 'Gabi Cosméticos', 'Avenida Zélia, 569, Barueri, Brazil 06436000', 'Inativo', '', '(11) 98348-8359', 'https://www.instagram.com/gabicosmeticos_/', '', '', '08.490.421/0001-50', '', '2024-08-26 13:05:59', 'BARUERI', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13821, 'Beautyline Cosméticos', 'RUA DAS AMAZONAS - 240 - PORTAIS (POLVILHO) - Cajamar - SP - 07790-850', 'Inativo', '', '(11) 91034-3423', 'https://www.instagram.com/beautylinecosmeticosbr/', 'https://www.beautyemcasa.com.br/', 'PEDRO', '35.604.811/0001-86', '', '2024-08-26 13:05:59', 'Cajamar', 'SP', 'pedro@mdcl.com.br', 'Metropolitada São Paulo (Sem Capital)'),
(13822, 'Perfumaria Carícia', 'AVENIDA TENENTE MARQUES - 2051 - PANORAMA (POLVILHO) - Cajamar - SP - 07792-820', 'Inativo', '', '11 44980216', 'https://www.instagram.com/perfumariacaricia/', '', 'EDUARDO / LUCIANA', '11.491.504/0001-78', '', '2024-08-26 13:05:59', 'Cajamar', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13823, 'PERFUMARIA BELIEVE', 'AVENIDA DEOVAIR CRUZ DE OLIVEIRA - 385 - CONDOMINIO PENTEADO - Cajamar - SP - 07776-435', 'Inativo', '', '(11) 95246-3419', 'https://www.instagram.com/perfumaria.believe/', '', 'SIVONEI', '17.121.181/0001-07', '', '2024-08-26 13:06:03', 'Cajamar', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13824, 'ANA FIORE PERFUMARIA', 'Av. Ver. Joaquim Pereira Barbosa, 227 - Jardim Nova Jordanésia, Cajamar - SP, 07770-000', 'Inativo', '', '(11) 99988-3788', 'https://www.instagram.com/anafioreperfumariaoficial/', '', 'ANA ROBERTA', '24.554.139/0001-45', '', '2024-08-26 13:06:03', 'Cajamar', 'SP', 'anaroberta.costa89@gmail.com', 'Metropolitada São Paulo (Sem Capital)'),
(13825, 'Kelli Perfumaria Oficial', 'Av. Prof. Carvalho Pinto, 72 - Centro, Caieiras - SP, 07700-000', 'Inativo', '', '1144421017', 'https://www.instagram.com/kelliperfumaria/', 'https://kelliperfumaria.com.br/', 'WALLISON', '31.131.934/0001-96', '', '2024-08-26 13:06:03', 'Caieiras', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13826, 'Bizú Cosméticos', 'Rua Danilo Valbuza, 728, Caieiras 07747300', 'Inativo', '', '11 48995668', 'https://www.instagram.com/bizucosmeticos/', '', 'TELMA', '32.135.389/0001-79', '', '2024-08-26 13:06:03', 'Caieiras', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13827, 'Valdir Cosmeticos', 'RUA PROGRESSO - 830 - CENTRO - Francisco morato - SP - 07901-080', 'Inativo', '', '11 96644-0697', 'https://www.instagram.com/valdir_cosmeticos/', 'http://www.valdirmac.com/index.php', 'ZILANDA', '18.146.281/0001-50', '', '2024-08-26 13:06:03', ' Francisco Morato', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13828, 'CIGANA COSMETICOS', 'RUA GERONIMO CAETANO GARCIA, 111 - CENTRO - FRANCISCO MORATO/SP 07901-970', 'Inativo', '', '11950856121', 'https://www.instagram.com/ciganabeleza/', 'https://www.ciganabeleza.com.br/', 'LUIZ', '50.853.720/0014-92', '', '2024-08-26 13:06:08', ' Francisco Morato', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13829, 'GE PERFUMARIA', 'AVENIDA PREFEITO CASSIANO GONCALVES PASSOS, 43 - CENTRO - FRANCISCO MORATO/SP 07901-005', 'Inativo', '', '(11) 995465410', 'https://www.instagram.com/geperfumariamorato/', '', 'GERTRUDES', '04.111.991/0001-30', '', '2024-08-26 13:06:08', ' Francisco Morato', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13830, 'Perfumaria Arco Íris ', 'Av. Crisântemo, 136 - Jardim das Flores, Osasco - SP, 06112-100', 'Inativo', '', '11999720585', 'https://www.instagram.com/Arco.iris.oficial_/', '', 'DURVALINA', '17.086.494/0001-71', '', '2024-08-26 13:06:08', 'OSASCO', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13831, 'Girassol Cosméticos', 'RUA DANTE BATTISTON - 277 - CENTRO - Osasco - SP - 06013-030', 'Inativo', '', '11947719257', 'https://www.instagram.com/girassolcosmeticos.osasco/', '', 'CRISTINA / NELSON', '05.262.047/0001-47', '', '2024-08-26 13:06:08', 'OSASCO', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13832, 'Clasbel Osasco', 'AVENIDA DR JOAO DE ANDRADE, 1874 - JD STO ANTONIO - OSASCO/SP 06132-006', 'Inativo', '', '11943380878', 'https://www.instagram.com/clasbelosasco/', '', 'LEILA', '72.985.872/0001-67', '', '2024-08-26 13:06:08', 'OSASCO', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13833, 'Perfumaria Osasco', 'RUA REPUBLICA DO LIBANO, 101 - CENTRO - OSASCO/SP 06013-060', 'Inativo', '', '11960436282', 'https://www.instagram.com/osascoperfumaria/', '', 'RICARDO', '02.269.072/0001-64', '', '2024-08-26 13:06:13', 'OSASCO', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13834, 'Dirce cosméticos', 'Rua doutor bento vidal 38, Osasco, Sao Paulo', 'Inativo', '', '11 91733-9996', 'https://www.instagram.com/dircecosmeticososasco/', '', 'DIRCE', '05.920.489/0001-33', '', '2024-08-26 13:06:14', 'OSASCO', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13835, 'Daikin Cosméticos', 'AVENIDA JOAO DE ANDRADE, 1180 / 1186 - SANTO ANTONIO - OSASCO/SP 06132-002', 'Inativo', '', '(11) 98293-1244', 'https://www.instagram.com/daikin.cosmeticos/', '', 'ERICK', '24.865.160/0001-61', '(11) 99817-6588', '2024-08-26 13:06:14', 'OSASCO', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13836, 'JAD COSMETICOS', 'Av. Cruzeiro do Sul, 1258 - Rochdale, Osasco - SP, 06226-000', 'Inativo', '', '11999567799', 'https://www.instagram.com/jadcosmeticosmakeup/', '', 'DENISE', '27.288.548/0001-35', '', '2024-08-26 13:06:14', 'OSASCO', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13837, 'Angel Cosméticos', 'AVENIDA PAULO AYRES, 604 - PARQUE PINHEIROS - TABOÃO DA SERRA/SP 06767-220', 'Inativo', '', '11982232753', 'https://www.instagram.com/angelcosmeticostaboao/', 'https://shopee.com.br/rosangelahviana', 'ROSANGELA', '23.229.243/0001-00', '(11) 99822-3275', '2024-08-26 13:06:13', 'TABOÃO DA SERRA', 'SP', 'rosangelahviana@gmail.com', 'Metropolitada São Paulo (Sem Capital)'),
(13838, 'KIDOM COSMÉTICOS', 'AVENIDA DOUTOR JOSE MACIEL, 727 - JARDIM MARIA ROSA - TABOÃO DA SERRA/SP 06763-270', 'Inativo', '', '11911542021', 'https://www.instagram.com/kidomcosmeticos/', '', 'ALMIR / DANIELA', '41.603.730/0001-64', '', '2024-08-26 13:06:18', 'TABOÃO DA SERRA', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13839, 'Beth’s Cosméticos', 'RUA OSWALDO CRUZ - 319 - BOQUEIRAO - Santos - SP - 11045-100', 'Inativo', '', '13992023079', 'https://www.instagram.com/bethscosmeticosoficial/', 'https://www.bethscosmeticos.com.br/', 'ALEXANDRE', '46.283.524/0001-38', '', '2024-08-26 13:06:18', 'Santos', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13840, 'FLORENCY PERFUMARIA ', 'RUA JOAO PESSOA, 137 - CENTRO - SANTOS/SP 11013-001', 'Inativo', '', '13 996122244', 'https://www.instagram.com/florencyoficial/', '', '', '66.683.327/0001-13', '', '2024-08-26 13:06:18', 'Santos', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13841, 'Manuella Cosméticos', 'Av. Ademar de Barros, 1634 - Jardim Primavera, Guarujá - SP, 11430-002', 'Inativo', '', '13974041979', 'https://www.instagram.com/manuellacosmeticos/', 'https://www.manuellacosmeticos.com.br/', 'THYAGO', '08.795.564/0001-70', '', '2024-08-26 13:06:18', 'Guarujá', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13842, 'MIRRA PERFUMARIA E COSMETICOS', 'RUA SANTA ELIZABETH, 361 - VILA PARAISO - GUARULHOS/SP 07241-170', 'Inativo', '', '1142156387', 'https://www.instagram.com/mirra.perfumaria/', '', ' NICE ', '42.344.824/0001-29', '(11) 98388-8553', '2024-08-26 13:06:18', 'GUARULHOS', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13843, 'LUPI COSMETICOS', '', 'Inativo', '', '13996362793', 'https://www.instagram.com/lupicosmeticosoficial', 'https://www.lupicosmeticos.com.br/', 'IRIS', '35.161.624/0001-75', '', '2024-08-26 13:06:22', 'SANTOS', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13844, 'Vinny Bijouterias', 'AVENIDA DOS EXPEDICIONARIOS - 77 - Franco da rocha - SP - 07803-010 (Shopping Franco da rocha - Loja 116/117)  ', 'Inativo', '', '(11) 99581-0177', 'https://www.instagram.com/bijouteriasvinny/', '', 'VINICIUS', '28.905.567/0001-26', '', '2024-08-26 13:06:22', 'Franco da rocha', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13845, 'Bello Perfumaria', 'AVENIDA ALVARO GUIMARAES, 924 - PLANALTO - SÃO BERNARDO DO CAMPO/SP 09890-003', 'Inativo', '', '(11) 9 94321970', 'https://www.instagram.com/belloperfumaria/', '', 'VALCI', '07.207.548/0001-56', '', '2024-08-26 13:06:22', 'SÃO BERNARDO DO CAMPO', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13846, 'Sumirê Jandira', 'AVENIDA CONCEICAO DE SAMMARTINO, 528 - CENTRO - JANDIRA/SP 06600-080', 'Inativo', '', '(11)97382-4494', 'https://www.instagram.com/sumirejandira/', '', 'SUELI', '03.238.192/0001-67', '', '2024-08-26 13:06:22', 'JANDIRA', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13847, 'Aflore Cosméticos', 'AVENIDA EMANCIPACAO, 40 - CENTRO - ITAQUAQUECETUBA/SP 08570-002', 'Inativo', '', '11986222670', 'https://www.instagram.com/aflorecosmeticos/', 'https://www.aflorecosmeticos.com.br/', 'KEYLA', '06.998.390/0001-17', '', '2024-08-26 13:06:22', 'ITAQUAQUECETUBA', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13848, 'Della Cosméticos', 'RUA FREI GASPAR, 531 - CENTRO - SÃO VICENTE/SP 11310-060', 'Inativo', '', '13996796970', 'https://www.instagram.com/dellacosmeticosoficial/', 'https://www.dellacosmeticos.com.br/', 'SERGIO', '27.825.414/0001-06', '', '2024-08-26 13:06:27', 'SÃO VICENTE', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13849, 'DAYARA COSMETICOS', 'PRAÇA JOÃO PESSOA, 46 - CENTRO, ITAPECERICA DA SERRA - SP, 06850-710, BRAZIL', 'Inativo', '', ' 11 996434508', 'https://www.instagram.com/cosmeticosdayara/', '', 'CESAR', '09.511.607/0001-00', '', '2024-08-26 13:06:27', 'ITAPECERICA DA SERRA', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13850, 'Rhara Cosméticos', 'AVENIDA WASHINGTON LUIS, 500 - GONZAGA - SANTOS/SP 11055-000', 'Inativo', '', '(13)3289-4404', 'https://www.instagram.com/rharacosmeticos/', '', 'ADELAIDE', '27.815.756/0001-45', '', '2024-08-26 13:06:27', 'SANTOS', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13851, 'Bella Cosméticos Taboão', 'ESTRADA KIZAEMON TAKEUTI, 2560 - PARQUE SAO JOAQUIM - TABOÃO DA SERRA/SP 06775-003', 'Inativo', '', '11989758342', 'https://www.instagram.com/bellacosmeticostaboao/', 'https://www.lojasbellacosmeticos.com.br/', '', '26.626.025/0001-99', '', '2024-08-26 13:06:27', 'TABOÃO DA SERRA', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13852, 'Anabelly Cotia', 'AVENIDA PROFESSOR JOSE BARRETO - 101 - CENTRO - Cotia - SP - 06703-001', 'Inativo', '', '11 91186-8655', 'https://www.instagram.com/anabellycotia/', '', 'ALEXANDRE', '40.075.019/0001-11', '', '2024-08-26 13:06:27', 'Cotia', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13853, 'Perfumaria Paraiso', 'AVENIDA DO TABOAO, 4.345 - TABOAO - SÃO BERNARDO DO CAMPO/SP 09657-000', 'Inativo', '', '11 9321131085', 'https://www.instagram.com/paraiso.perfumaria/', '', 'ORLANDO', '06.077.545/0001-82', '', '2024-08-26 13:06:31', 'SÃO BERNARDO DO CAMPO', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13854, 'ROTA DA BELEZA PERFUMARIA E COSMETICOS ', 'ESTRADA DE ITAPECERICA A CAMPO LIMPO, 2.647 - JARDIM SANTO EDUARDO - EMBU DAS ARTES/SP 06823-300', 'Inativo', '', '(11) 4782-4165', 'https://www.instagram.com/tracos_de_mulher_perfumaria/', '', 'ROBERTO / ADRIANA', '10.618.337/0001-10', '', '2024-08-26 13:06:31', 'EMBU DAS ARTES', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13855, 'Neide Cosméticos', 'RUA CARVALHO DE MENDONCA, 284 - VILA MATHIAS - SANTOS/SP 11070-101', 'Inativo', '', ' 13 99156-8631', 'https://www.instagram.com/neidecosmeticossantos', 'https://neidecosmeticos.com.br/', 'FABIANO', '49.950.595/0001-35', '', '2024-08-26 13:06:31', 'SANTOS', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13856, 'PERFUMARIA INOVA', 'RUA ORATORIO, 1679 - PARQUE DAS NACOES - SANTO ANDRÉ/SP 09280-000', 'Inativo', '', '(11) 96518-3009', 'https://www.instagram.com/perfumariainova/', 'https://www.perfumariainova.com.br/', 'PATRICIA', '00.802.756/0001-54', '(11) 96779-3889', '2024-08-26 13:06:31', 'SANTO ANDRÉ', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13857, 'Perfumaria Carícia', 'AVENIDA TENENTE MARQUES, 4886 - FAZENDINHA - SANTANA DE PARNAÍBA/SP 06530-001', 'Inativo', '', ' 11 41565795', 'https://www.instagram.com/perfumariacaricia/', '', 'EDUARDO / LUCIANA', '13.532.747/0001-32', '', '2024-08-26 13:06:31', 'SANTANA DE PARNAÍBA', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13858, 'Tica’s Perfumaria', 'RUA DOUTOR VICENTE DE CARVALHO, 507 - OCIAN - PRAIA GRANDE/SP 11704-300', 'Inativo', '', '13981212400', 'https://www.instagram.com/ticasperfumaria/', '', 'ALFREDO / SOLANGE ', '11.153.240/0001-42', '', '2024-08-26 13:06:35', 'PRAIA GRANDE', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13859, 'Sumire Barueri', 'Avenida Dom Pedro II, 236, Barueri, Brazil 06401060', 'Inativo', '', '11933415670', 'https://www.instagram.com/sumire_barueri/', '', 'SHIGUERU', '02.607.572/0001-69', '', '2024-08-26 13:06:35', 'Barueri', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13860, 'Perfumaria Semper Bella', 'AVENIDA GENERAL BARRETO DE MENEZES, 308 - JARDIM SILVINA - SÃO BERNARDO DO CAMPO/SP 09791-150', 'Inativo', '', '11987200104', 'https://www.instagram.com/perfumariasemperbella/', '', 'JOSE / VENUSA', '14.047.549/0001-46', '', '2024-08-26 13:06:35', 'SÃO BERNARDO DO CAMPO', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13861, 'Gel Cosméticos', 'Avenida Marcos Antonio Oggiano, 411, Morrinhos - Guarujá - SP - CEP 11495-011', 'Inativo', '', '13996115421', 'https://www.instagram.com/gel_cosmeticos/', 'https://gelcosmeticos.com.br/', 'EUCLIDES', '30.678.889/0001-21', '', '2024-08-26 13:06:35', 'Guarujá', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13862, 'Luma Cosméticos', 'AVENIDA ANTONIO EMMERICK, 590 - VILA CASCATINHA - SÃO VICENTE/SP 11390-000', 'Inativo', '', '(13) 988237919', 'https://www.instagram.com/cosmeticoslojaluma/', '', 'MOISES', '34.279.675/0001-33', '', '2024-08-26 13:06:35', 'SÃO VICENTE', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13863, 'ZAKKAY PERFUMARIA', 'RUA PORTO VELHO - 716 - JARDIM CUMBICA - Guarulhos - SP - 07240-060', 'Inativo', '', '11 990209871', 'https://www.instagram.com/zakkaycumbica', '', 'ANTONIA', '43.941.595/0001-92', '', '2024-08-26 13:06:40', 'GUARULHOS', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13864, 'NATHI COSMETICOS', 'RUA ALEXANDRE MARTINS - 51 - APARECIDA - Santos - SP - 11025-201', 'Inativo', '', '(13) 99615-7302', 'https://www.instagram.com/nathicosmeticosoficial/', '', 'JOSE', '06.258.880/0001-87', '', '2024-08-26 13:06:40', 'Santos', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13865, 'Isabella Cosméticos', 'RUA JOSE DOMINGOS BRANCO - 39 - CENTRO - Santana de parnaíba - SP - 06501-140', 'Inativo', '', '11934731799', 'https://www.instagram.com/isabellacosmeticos20/', '', 'ELISETE', '10.724.438/0001-76', '', '2024-08-26 13:06:40', 'Santana de parnaíba', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13866, 'LADY COSMETICOS', 'AVENIDA ANCHIETA, 1215 - CENTRO - BERTIOGA/SP 11250-285', 'Inativo', '', '(13)98135-2180', 'https://www.instagram.com/ladycosmeticosbertioga/', '', 'CLAUDIO ', '32.169.032/0001-01', '', '2024-08-26 13:06:40', 'BERTIOGA', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13867, 'PERFUMARIA JACK\'S', '', 'Inativo', '', '11978059485', 'https://www.instagram.com/perfumariajacks/', '', 'LAERCIO / NEUSA', '03.614.212/0001-57', '', '2024-08-26 13:06:40', '', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13868, 'NOSSA BELEZA PERFUMARIA', 'AVENIDA ROTARY - 166 - VILA SANTA MARIA - Diadema - SP - 09980-600', 'Inativo', '', '(11) 4055-5630', 'https://www.instagram.com/nossabelezaserraria/', '', 'FELIPE / ELIANA', '09.481.587/0001-72', '', '2024-08-26 13:06:45', 'Diadema', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13869, 'Asimões Cosméticos', 'R. RUI BARBOSA, 38 - VILA COSTA, SUZANO - SP, 08675-060', 'Inativo', '', '( 11 ) 94300-6270', 'https://www.instagram.com/distribuidoraasimoes/', '', 'ADELSON / CARLOS', '12.066.218/0001-28', '', '2024-08-26 13:06:45', 'SUZANO', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13870, 'LUA & FLOR PERFUMARIA E COSMETICOS', 'RUA M.M.D.C., 276 - PAULICEIA - SÃO BERNARDO DO CAMPO/SP 09690-000', 'Inativo', '', '11 978020727', 'https://www.instagram.com/luaflor8697/', '', 'OBERDAN', '29.563.484/0001-69', '', '2024-08-26 13:06:45', 'SÃO BERNARDO DO CAMPO', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13871, 'Styllus Pink', 'AVENIDA SENADOR PINHEIRO MACHADO, 836 - MARAPE - SANTOS/SP 11075-002', 'Inativo', '', '13997701919', 'https://www.instagram.com/stylluspink/', 'www.stylluspink.com.br', 'JOSE', '29.432.608/0001-77', '', '2024-08-26 13:06:45', 'SANTOS', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13872, 'DUQUESA COSMETICOS', 'RUA PRESIDENTE COSTA E SILVA, 312 - HELENA MARIA - OSASCO/SP 06253-000', 'Inativo', '', '11938068383', 'https://www.instagram.com/duquesaperfumes/', '', 'FRANCIELLE', '26.332.227/0001-28', '', '2024-08-26 13:06:45', 'OSASCO', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13873, 'REIKO COSMÉTICOS & PERFUMARIA', 'AVENIDA 19 DE MAIO, 367 - JARDIM ALBATROZ - BERTIOGA/SP 11250-003', 'Inativo', '', '(13)981326668', 'https://www.instagram.com/reiko.cosmeticos', '', 'MARCIA', '29.046.793/0001-61', '', '2024-08-26 13:06:50', 'BERTIOGA', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13874, 'Perfumaria Lu Cosmeticos', 'RUA IMIRIM, 396 - JARDIM NOSSA SENHORA DE FATIMA - JANDIRA/SP 06624-010', 'Inativo', '', '11975845776', 'https://www.instagram.com/lucosmeticosjandira1/', '', 'ANDERSON', '26.216.570/0001-07', '', '2024-08-26 13:06:50', 'JANDIRA', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13875, 'Calis cosméticos', 'AVENIDA ANTONIO EMMERICK, 1513 - VILA CASCATINHA - SÃO VICENTE/SP 11390-001', 'Inativo', '', '13988259812', 'https://www.instagram.com/calis.cosmeticos/', '', 'ARTUR', '39.935.991/0001-30', '(13) 99713-0847', '2024-08-26 13:06:50', 'SÃO VICENTE', 'SP', 'artur.meireles@yahoo.com.br', 'Metropolitada São Paulo (Sem Capital)'),
(13876, 'THALINE PERFUMARIA E COSMETICOS', 'RUA WALDEMAR DE PAULA FERREIRA - 108 - JARDIM PRESIDENTE DUTRA - Guarulhos - SP - 07172-010', 'Inativo', '', '(11) 99810-3607', 'https://www.instagram.com/thalineperfumaria/', '', 'JOSEFA', '11.128.226/0001-99', '', '2024-08-26 13:06:50', 'GUARULHOS', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13877, 'Tokai Perfumaria', 'AVENIDA SANTOS DUMONT, 291 - CIDADE JARDIM CUMBICA - GUARULHOS/SP 07180-270', 'Inativo', '', '(11) 2412-9432', 'https://www.instagram.com/tokaiperfumaria/', 'https://shopee.com.br/tokai2021?smtt=0.0.9', 'GILSON / ERICA', '05.785.321/0001-62', '(11) 96468-3011', '2024-08-26 13:06:50', 'OSASCO', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13878, 'PERFUMARIA ZINIAS', 'RUA ANTONIO PEREIRA DA CRUZ - 28 - CENTRO - Caieiras - SP - 07700-001', 'Inativo', '', '(11)97169-4655', 'https://www.instagram.com/perfumaria_zinias', 'https://ziniasperfumaria.com.br/', 'ANDIARA', '71.911.788/0001-36', '', '2024-08-26 13:06:55', 'Caieiras', 'SP', 'andiregina@hotmail.com', 'Metropolitada São Paulo (Sem Capital)'),
(13879, 'La Belle Valentim Perfumaria', 'AVENIDA DEPUTADO ULISSES GUIMARAES, 1009 - LOJA 01 - JARDIM RIO BRANCO - SÃO VICENTE/SP 11347-000', 'Inativo', '', '13997134321', 'https://www.instagram.com/labellevalentim/', '', 'TAYZE / RAQUEL', '29.745.036/0001-86', '', '2024-08-26 13:06:55', 'SÃO VICENTE', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13880, 'DAIKIN COSMETICOS', 'AVENIDA JOAO DE ANDRADE, 1186 - SANTO ANTONIO - OSASCO/SP 06132-002', 'Inativo', '', '11982931244', 'https://www.instagram.com/daikin.cosmeticos', '', 'ERICK', '44.163.190/0001-33', '', '2024-08-26 13:06:55', 'OSASCO', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13881, 'PERFUMARIA SEIKI', 'PRACA PRESIDENTE CASTELO BRANCO, 173 - CENTRO - DIADEMA/SP 09911-130', 'Inativo', '', '(11) 9 7086-7660', 'https://www.instagram.com/perfumariaseiki/', 'https://www.perfumariaseiki.com.br/', 'SIDNEI', '03.472.794/0001-84', '', '2024-08-26 13:06:55', 'Diadema', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13882, 'Perfumaria Novo Estilo', 'RUA DOUTOR DEODATO WERTHEIMER, 146 - BRAS CUBAS - MOGI DAS CRUZES/SP 08740-270', 'Inativo', '', '11988171621', 'https://www.instagram.com/perfumarianovoestilo/', '', 'RICARDO', '16.795.979/0001-71', '', '2024-08-26 13:06:55', 'MOGI DAS CRUZES', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13883, 'Perfumaria Bonfim', 'RUA PORTO VELHO - 627 - JARDIM CUMBICA - Guarulhos - SP - 07240-060', 'Inativo', '', '11 94473-3078', 'https://www.instagram.com/perfumaria_bonfim/', '', 'ETEVALDO / ANTONIO', '06.939.179/0001-23', '', '2024-08-26 13:07:00', 'GUARULHOS', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13884, 'Perfumaria Perola', 'RUA 26, 20 - CONJUNTO MARCOS FREIRE - GUARULHOS/SP 07263-730', 'Inativo', '', '(11)94886-3811', 'https://www.instagram.com/perfumaria_perola_/', '', 'FRANCISCA', '31.467.249/0001-35', '(11) 96499-0121', '2024-08-26 13:07:00', 'GUARULHOS', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13885, 'Kaorys Perfumaria', 'AV, Estr. Pres. Juscelino K. de Oliveira, 1089 - Jardim dos Pimentas, Guarulhos - SP, 07272-341', 'Inativo', '', ' 11 94086-8416', 'https://www.instagram.com/perfumariakaorys/', '', 'WALTER', '08.468.005/0001-55', '', '2024-08-26 13:07:00', 'GUARULHOS', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13886, 'WINKY COSMÉTICOS', 'AVENIDA RUBENS CARAMEZ, 25 - VILA AURORA - ITAPEVI/SP 06657-000', 'Inativo', '', '(11) 99916-4215', 'https://www.instagram.com/winkycosmeticoscohab/', '', 'RICARDO', '05.124.209/0001-80', '', '2024-08-26 13:07:00', 'ITAPEVI', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13887, 'Perfumaria Kibeleza', 'RUA IPACAETA, 443 - JARDIM PRESIDENTE DUTRA - GUARULHOS/SP 07171-150', 'Inativo', '', '(11) 98894-3633', 'https://www.instagram.com/perfumariakibeleza/', '', 'FERNANDA', '53.343.919/0001-44', '', '2024-08-26 13:07:00', 'GUARULHOS', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13888, 'Kaory\'s Perfumaria', 'ESTRADA AGUA CHATA, 208 - PARQUE PIRATININGA - ITAQUAQUECETUBA/SP 08583-370', 'Inativo', '', '11991342247', 'https://www.instagram.com/kaorys_perfumaria/', '', 'AKIRA', '12.500.532/0001-77', '', '2024-08-26 13:07:04', 'ITAQUAQUECETUBA', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13889, 'Gabi Perfumaria', 'RUA BRAZILINA BEU, 55 - VILA INDIANA - TABOÃO DA SERRA/SP 06786-450', 'Inativo', '', '1134634605', 'https://www.instagram.com/gaabi_perfumaria/', '', 'VALDECI / ELIZABETE', '23.141.128/0001-70', '', '2024-08-26 13:07:04', ' TABOÃO DA SERRA', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13890, 'TUT\'S PERFUMARIA', 'RUA JOSE NOGUEIRA, 13 A - CENTRO-CIPO - EMBU-GUAÇU/SP 06929-050', 'Inativo', '', '1146648768', 'https://www.instagram.com/tutsperfumaria/', '', 'ANTONIETA', '08.978.874/0001-20', '', '2024-08-26 13:07:04', ' EMBU-GUAÇU', 'SP', 'antonietacm@hotmail.com', 'Metropolitada São Paulo (Sem Capital)'),
(13891, 'PINK PERFUMARIA ', 'AVENIDA GOVERNADOR JANIO QUADROS - 938 - PARQUE SAO FRANCISCO - Ferraz de vasconcelos - SP - 08526-000', 'Inativo', '', '(11) 99750-4263', 'https://www.instagram.com/pinkperfumaria1/', '', 'CIBELE', '25.241.539/0001-63', '', '2024-08-26 13:07:04', ' Ferraz de vasconcelos', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13892, 'Perfumaria Acauã', 'R. Luiz Coladello, 26 - Parque Continental II Guarulhos - SP, 07084-410', 'Inativo', '', '11955990355', 'https://www.instagram.com/perfumariaacaua/', '', 'FRANCISCO ', '03.627.725/0001-00', '(11) 96485-6383', '2024-08-26 13:07:04', 'GUARULHOS', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13893, 'MADAME MARGO', 'RUA HELENA JACQUEY (VL HELENA) - 123 - RUDGE RAMOS - São bernardo do campo - SP - 09635-060', 'Inativo', '', '11 99524-3025', 'https://www.instagram.com/madame_margo/', 'https://madamemargo.com.br/search/?q=alicate', 'KAREN', '12.775.264/0001-04', '(11) 97856-4597', '2024-08-26 13:07:09', 'SÃO BERNARDO DO CAMPO', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13894, 'BELLE STAR PERFUMARIA', 'ESTRADA AGUA CHATA, 200 - PARQUE PIRATININGA - ITAQUAQUECETUBA/SP 08583-370', 'Inativo', '', '(11) 95057-5032', 'https://www.instagram.com/belle_starperfumaria/', '', '', '06.199.757/0001-32', '', '2024-08-26 13:07:09', 'ITAQUAQUECETUBA', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13895, 'Perfumaria Donna Bella', 'AVENIDA SAO PAULO - 584 - CIDADE SAO JORGE - Santo andré - SP - 09111-410', 'Inativo', '', '(11) 2379-3348', 'https://www.instagram.com/perfumariadonna', '', 'CLECIO / MARCIO', '28.196.237/0001-09', '', '2024-08-26 13:07:09', ' Santo andré', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13896, 'Sato Perfumaria e Presentes', 'BOULEVARD MAJOR PAULA LOPES, 106 - CENTRO - GUARAREMA/SP 08900-000', 'Inativo', '', '11995253579', 'https://www.instagram.com/sato_perfumaria/', '', 'HELOISA', '01.537.179/0001-83', '', '2024-08-26 13:07:09', 'GUARAREMA', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13897, 'PERFUMARIA NOVO ESTILO BADRA', 'AVENIDA MIGUEL BADRA, 1454 - CIDADE MIGUEL BADRA - SUZANO/SP 08690-010', 'Inativo', '', '11969226875', 'https://www.instagram.com/perfumarianovoestilobadra/', '', 'RODRIGO0', '50.628.441/0001-00', '', '2024-08-26 13:07:10', 'SUZANO', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13898, 'PERFUMARIA CHOCOLATE COM PIMENTA', 'RUA PADRE CLAUDIO ARENAL - 52 - VILA BARROS - Guarulhos - SP - 07192-010', 'Inativo', '', '11996714070', 'https://www.instagram.com/perf.chocopi/', 'https://shopee.com.br/perf.chocopi', 'CELIA', '20.772.526/0001-05', '', '2024-08-26 13:07:14', 'GUARULHOS', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13899, 'MOHANA MAKEUP E PERFUMARIA', 'RUA CELSO RAMOS DE OLIVEIRA - 27868 - ANTARTICA - Praia grande - SP - 11721-010', 'Inativo', '', '13981547566', 'https://www.instagram.com/mohana.makeup/', '', '', '37.198.807/0001-90', '', '2024-08-26 13:07:15', ' Praia grande ', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13900, 'Liv Perfumaria', 'RUA MARIA SAYEG, 44 - JARDIM DAS OLIVEIRAS - ITAPECERICA DA SERRA/SP 06867-420', 'Inativo', '', '11973499022', 'https://www.instagram.com/liv.perfumaria/', '', 'SHAIENE', '40.922.077/0001-33', '', '2024-08-26 13:07:15', 'ITAPECERICA DA SERRA', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13901, 'PINK DIAMOND', 'RUA ITIRUCU - 648 - JARDIM PRESIDENTE DUTRA - Guarulhos - SP - 07171-160', 'Inativo', '', '11987356978', 'https://www.instagram.com/pink_diamond_jpd', '', 'FABIO', '32.835.186/0001-95', '', '2024-08-26 13:07:15', 'GUARULHOS', 'SP', 'fabiosindicomais@hotmail.com', 'Metropolitada São Paulo (Sem Capital)'),
(13902, 'PERFUMARIA MAYUMI', 'RUA JOSE MARIA DIAS DA SILVA - 27 - PARQUE MIKAIL - Guarulhos - SP - 07142-400', 'Inativo', '', '11 94039-5461', 'https://www.instagram.com/perfumariamayumi/', '', 'MARCIO', '41.571.447/0001-06', '', '2024-08-26 13:07:15', 'GUARULHOS', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13903, 'Império da Beleza', 'Avenida Costa e Silva 70 Box 80B, Praia Grande 11700005', 'Inativo', '', '11 98282-3611', 'https://www.instagram.com/imperiodabeleza_new/', '', 'ANA', '52.748.658/0001-80', '', '2024-08-26 13:07:19', 'PRAIA GRANDE', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13904, 'BELISSIMA COSMETICOS', 'AVENIDA SAO PAULO - 11 - QUARENTENARIO - São vicente - SP - 11347-650', 'Inativo', '', '13998061628', 'https://www.instagram.com/belissima_cosmeticos02/', '', 'KAREN', '48.485.623/0001-28', '', '2024-08-26 13:07:19', 'São vicente', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13905, 'Perfumaria Mais Divas', 'RUA JOAO GOMES - 32 - JARDIM ADRIANA - Guarulhos - SP - 07135-160', 'Inativo', '', '(11) 97036- 8503', 'https://www.instagram.com/mais_divas_perfumaria/', '', '', '35.050.546/0001-31', '', '2024-08-26 13:07:19', 'GUARULHOS', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13906, 'MINHA FLOR COSMETICOS', 'AVENIDA MARIA CAVALCANTE DA SILVA, 31533 - SAMAMBAIA - PRAIA GRANDE/SP 11712-560', 'Inativo', '', '13991120576', 'https://www.instagram.com/minhaflorcosmeticos/', '', 'TAMIRES', '40.767.155/0001-72', '', '2024-08-26 13:07:19', 'PRAIA GRANDE', 'SP', 'tamires-torres@hotmail.com', 'Metropolitada São Paulo (Sem Capital)'),
(13907, 'GHEO COSMETICOS', 'AVENIDA DOM PEDRO II, 1085 - CIDADE NAUTICA - SÃO VICENTE/SP 11350-100', 'Inativo', '', '13 97421-0605', 'https://www.instagram.com/gheocosmeticos', 'https://shopee.com.br/gheocosmeticos', 'ALESSANDRA', '47.647.345/0001-03', '', '2024-08-26 13:07:19', 'São vicente', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13908, 'Ateliê da Make', 'RUA DA LIBERDADE, 70 - CENTRO - ITAQUAQUECETUBA/SP 08570-170', 'Inativo', '', '11947176779', 'https://www.instagram.com/ateliedamake.store/', 'https://www.ateliedamake.com.br/', 'MEISSA', '50.413.438/0001-70', '', '2024-08-26 13:07:24', 'ITAQUAQUECETUBA', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13909, '   + Bella Cosméticos Carapicuíba', 'Avenida Inocêncio Seráfico, 1653, Carapicuíba, Brazil 06380-020', 'Inativo', '', '11 95423-9442', 'https://www.instagram.com/maisbellacarapicuiba/', '', 'PAULO', '44.622.647/0001-20', '', '2024-08-26 13:07:24', 'Carapicuíba', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13910, 'Artigo’s 180 Cosméticos', 'RUA RICARDO PINTO, 180 - APARECIDA - SANTOS/SP 11035-170', 'Inativo', '', '13991428485', 'https://www.instagram.com/artigos180/', '', 'JULIANO', '00.157.697/0001-09', '', '2024-08-26 13:07:24', 'SANTOS', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13911, 'PERFUMARIA TURMALINA', 'RUA DR ROBERTO DOMINGOS JOAO ROSIA, 17 - PARQUE MIKAIL - GUARULHOS/SP 07142-500', 'Inativo', '', '11 24034409', 'https://www.instagram.com/perfumariaturmalina/', '', 'LUCIANA', '11.180.575/0001-50', '', '2024-08-26 13:07:24', 'GUARULHOS', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13912, 'BELLA MAJU PERFUMARIA', 'RUA MIQUELINA, 473 - VILA CAMILOPOLIS - SANTO ANDRÉ/SP 09230-280', 'Inativo', '', '1198429 0092', 'https://www.instagram.com/bellamajuperfumaria/', '', 'SERGIO', '35.919.296/0001-23', '(11) 99832-1625', '2024-08-26 13:07:24', 'SANTO ANDRÉ', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13913, 'Paris Perfumaria Santos', 'AVENIDA ANA COSTA - 480 - GONZAGA - Santos - SP - 11060-002', 'Inativo', '', '(13)99202-6852', 'https://www.instagram.com/parisperfumariasantos/', '', 'PAULO', '39.830.505/0001-19', '', '2024-08-26 13:07:29', 'SANTOS', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13914, 'Nick Cosméticos', 'R. Antônio Cândido da Silva, 136 - Vila Sonia, Praia Grande - SP, 11722-000', 'Inativo', '', '13991606731', 'https://www.instagram.com/nickcosmeticospg', '', 'ANDRE', '10.556.478/0001-56', '', '2024-08-26 13:07:29', 'Praia Grande', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13915, 'Manu Pinho Cosmeticos', 'AVENIDA THIAGO FERREIRA - 1.092 - VICENTE DE CARVALHO - Guarujá - SP - 11450-002', 'Inativo', '', ' 13 33521628', 'https://www.instagram.com/manupinhocosmeticos/', '', '', '14.380.033/0001-19', '', '2024-08-26 13:07:29', 'GUARUJÁ', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13916, 'Bella Face Perfumaria', 'R Oratório, 1864 - Parque das Nações, Santo André - SP, 09280-000', 'Inativo', '', '11 4476-3736', 'https://www.instagram.com/bellafaceperfumaria/', '', 'VALDIR', '31.200.999/0001-46', '', '2024-08-26 13:07:29', 'Santo André', 'SP', 'valdir.bellaface@gmail.com', 'Metropolitada São Paulo (Sem Capital)'),
(13917, 'Sheridan Perfumaria', 'AVENIDA BRIGADEIRO FARIA LIMA, 1401 - COCAIA - GUARULHOS/SP 07130-000', 'Inativo', '', '11 968221184', 'https://www.instagram.com/sheridanperfumaria/', '', 'SOLANGE', '03.354.531/0001-70', '11 995243058', '2024-08-26 13:07:29', 'GUARULHOS', 'SP', 'solangeavena@hotmail.com', 'Metropolitada São Paulo (Sem Capital)'),
(13918, 'COSMETICOS.COM', 'AVENIDA SAO PAULO, 177 - CIDADE INTERCAP - TABOÃO DA SERRA/SP 06757-170', 'Inativo', '', '11976627276', 'https://www.instagram.com/cosmeticos.com23/', '', 'ROMILDO', '51.571.155/0001-19', '', '2024-08-26 13:07:34', 'TABOÃO DA SERRA', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13919, 'CHARMY COSMÉTICOS ', 'ESTRADA SAO JOSE - 1310 - JARDIM VAZAME - Embu das artes - SP - 06814-160', 'Inativo', '', '(11) 94943-2551', 'https://www.instagram.com/charmymakes/', 'https://www.charmymakes.com.br/', 'ELIZANGELA', '47.952.526/0001-35', '', '2024-08-26 13:07:34', ' Embu das artes', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13920, 'UNIKA PERFUMARIA', 'Estr. dos Casa, 3440 - Bairro dos Casa - São Bernardo do Campo - SP, 09840-000', 'Inativo', '', '11974640221', 'https://www.instagram.com/unikaoficial/', '', 'FABIO', '40.688.109/0001-88', '(11) 97283-6422', '2024-08-26 13:07:34', 'São Bernardo do Campo', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13921, 'PERFUMARIA CRIATTIVA', 'RUA VITAL BRASIL, 525 - VILA NOVA CUMBICA - GUARULHOS/SP 07231-370', 'Inativo', '', '11940135908', 'https://www.instagram.com/perfumaria.criattiva/', '', 'TANIA', '28.991.466/0001-15', '', '2024-08-26 13:07:34', 'GUARULHOS', 'SP', 'thaniacabelereira@hotmail.com', 'Metropolitada São Paulo (Sem Capital)'),
(13922, 'Bella Six Jardim Belval', 'RUA ENGENHEIRO OSCAR KESSELRING, 91 - JARDIM BELVAL - BARUERI/SP 06420-160', 'Inativo', '', '11 978396903', 'https://www.instagram.com/bellasix03/', '', 'VALQUICINARA', '43.727.092/0001-19', '', '2024-08-26 13:07:34', 'BARUERI', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13923, 'DA-G PERFUMARIA ', 'AVENIDA DOUTOR TIMOTEO PENTEADO, 3411 - VILA GALVAO - GUARULHOS/SP 07061-001', 'Inativo', '', '11 963858997', 'https://www.instagram.com/dag_perfumaria/', '', 'GECENI', '47.527.046/0001-27', '', '2024-08-26 13:07:39', 'GUARULHOS', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13924, 'KAMARIM DA BELEZA', 'AVENIDA PRESIDENCIAL (JD CLAUDIA), 120 - DOS CASA - SÃO BERNARDO DO CAMPO/SP 09850-605', 'Inativo', '', ' 11 98589-3740', 'https://www.instagram.com/kamarimdabeleza.sbc/', '', 'SCARLETTE', '32.977.859/0001-41', '', '2024-08-26 13:07:39', 'São Bernardo do Campo', 'SP', 'araujo.scarlette13@gmail.con', 'Metropolitada São Paulo (Sem Capital)'),
(13925, 'BELLAFACE PERFUMARIA', 'AVENIDA OTAVIO BRAGA DE MESQUITA, 1980 - VILA FLORIDA - GUARULHOS/SP 07191-000', 'Inativo', '', '11 939613572', 'https://www.instagram.com/bellafaceperfumaria011/', '', 'ANA', '45.385.279/0001-07', '', '2024-08-26 13:07:39', 'GUARULHOS', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13926, 'Casa Belleza Itaquaquecetuba', 'Praça Padre João Álvares, 93 - Centro - Itaquaquecetuba - SP, 08570-050', 'Inativo', '', '11995036530', 'https://www.instagram.com/casabellezaitaquaquecetuba/', '', '', '54.104.911/0001-98', '', '2024-08-26 13:07:39', 'Itaquaquecetuba', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13927, 'Miss Angel Cosméticos', 'RUA CORONEL OLIVEIRA LIMA, 350 - CENTRO - SANTO ANDRÉ/SP 09010-000', 'Inativo', '', '11918687964', 'https://www.instagram.com/missangel_cosmeticos/', '', 'HENRIQUE', '51.168.749/0001-83', '', '2024-08-26 13:07:39', 'SANTO ANDRÉ', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13928, 'L\'AMOUR', 'AVENIDA RICIERI JOSE MARCATTO, 2.391 - VILA SUISSA - MOGI DAS CRUZES/SP 08810-020', 'Inativo', '', '11 97261-7005', 'https://www.instagram.com/lamourperfu_oficial/', '', 'ANA', '49.821.797/0001-87', '', '2024-08-26 13:07:44', 'MOGI DAS CRUZES', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13929, 'Perfumaria jóia da beleza', 'AVENIDA JOAO PAULO II, 1096 - JARDIM SANTA TEREZA - EMBU DAS ARTES/SP 06813-015', 'Inativo', '', '1142442000', 'https://www.instagram.com/joiadabeleza/', '', 'CHEN', '52.687.448/0001-29', '(11) 98268-8190', '2024-08-26 13:07:44', 'EMBU DAS ARTES', 'SP', 'shen.73@hotmail.com', 'Metropolitada São Paulo (Sem Capital)'),
(13930, 'Ônnix Cosméticos Silvia Ribeiro', 'AVENIDA INOCENCIO SERAFICO, 1948 - VL SANTA RIBEIRO - CARAPICUÍBA/SP 06380-021', 'Inativo', '', '1141871001', 'https://www.instagram.com/onnixcosmeticosoficial/', '', 'EDVALDO', '02.190.824/0001-05', '', '2024-08-26 13:07:44', 'CARAPICUÍBA', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13931, 'Kelli Perfumaria Oficial', 'PRACA ANTONIO SIQUEIRA (JD STO ANTONIO), 57 - REGIAO CENTRAL - CAIEIRAS/SP 07700-205', 'Inativo', '', '1144421017', 'https://www.instagram.com/kelliperfumaria/', '', 'KELLI', '21.866.754/0001-07', '', '2024-08-26 13:07:44', 'CAIEIRAS', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13932, 'PINK BEAUTY', 'PRACA PROFESSOR JOSE OLIVEIRA LOPES, 150 - RADIO CLUBE - SANTOS/SP 11088-190', 'Inativo', '', '13 98230-8885', 'https://www.instagram.com/pinkbeauty.ita', '', 'REGINA', '50.240.906/0001-51', '(13) 99755-8044', '2024-08-26 13:07:44', 'SANTOS', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13933, 'SAYURI COSMETICOS', 'ESTRADA ITAPECERICA-CAMPO LIMPO, 2954 - JARDIM DOM JOSE - EMBU DAS ARTES/SP 06823-301', 'Inativo', '', '11 96219-9380', 'https://www.instagram.com/cosmeticos.sayuri/', '', '', '06.951.509/0002-87', '', '2024-08-26 13:07:49', 'EMBU DAS ARTES', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13934, 'Kaoru Cosmeticos', 'RUA JOAO MIRASSOL, 571 - PESTANA - OSASCO/SP 06122-170', 'Inativo', '', '11 981933884', 'https://www.instagram.com/kaorucosmeticos/', '', 'RODRIGO ', '35.851.115/0001-74', '', '2024-08-26 13:07:49', 'OSASCO', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13935, 'Perfumaria Visual Chic', 'AVENIDA ARMANDO BEI - 463 - VILA NOVA BONSUCESSO - Guarulhos - SP - 07175-000', 'Inativo', '', '11977410131', 'https://www.instagram.com/perfumaria_visualchic/', '', 'IARA', '42.239.961/0001-01', '', '2024-08-26 13:07:49', 'Guarulhos', 'SP', 'https://www.instagram.com/iara_santaana/', 'Metropolitada São Paulo (Sem Capital)'),
(13936, 'PARAÍSO COSMÉTICO & ACESSÓRIO', 'RUA RENATO MARCHIONNO, 531 - BARONESA - OSASCO/SP 06266-020', 'Inativo', '', '11 9963651660', 'https://www.instagram.com/cosmeticoparaiso', '', 'TALITA', '41.553.830/0001-23', '', '2024-08-26 13:07:49', 'OSASCO', 'SP', 'talita.limabr@hotmail.com', 'Metropolitada São Paulo (Sem Capital)');
INSERT INTO `stores` (`id`, `nome`, `endereco`, `status`, `anotacao`, `telefone`, `instagram`, `site`, `decisor`, `cnpj`, `telefone_decisor`, `datetime`, `cidade`, `estado`, `email`, `mesorregiao`) VALUES
(13937, 'Perfumaria Beauty Crush', 'RUA TEODORO SAMPAIO, 1009 - PINHEIROS - SÃO PAULO/SP 05405-100', 'Inativo', '', '11 977121313', 'https://www.instagram.com/beautycrushbene/', 'https://beautycrush.com.br/', 'ANDREA / HORACIO', '19.099.567/0001-95', '', '2024-08-26 13:07:49', 'PINHEIROS', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13938, 'ROYAL COSMETICOS', 'RUA REPUBLICA DO LIBANO, 71 - CENTRO - OSASCO/SP 06013-060', 'Inativo', '', '(11)99996-8792', 'https://www.instagram.com/lojasroyalcosmeticos/', 'https://www.royalcosmeticos.com.br/', 'FLAVIO', '49.772.825/0002-02', '', '2024-08-26 13:07:54', 'OSASCO', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13939, 'FAITH COSMETICOS', 'ESTRADA PIMENTAS-SAO MIGUEL, 281 - VILA ALZIRA - GUARULHOS/SP 07210-380', 'Inativo', '', '(11) 94182-2497', 'https://www.instagram.com/faith.cosmetycos/', '', 'ZIRLANDIA', '45.528.278/0001-74', '', '2024-08-26 13:07:55', 'GUARULHOS', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13940, 'PPGIM COSMETICOS', 'RUA CAPRICORNIO, 637 - PARQUE SANTANA - SANTANA DE PARNAÍBA/SP 06515-090', 'Inativo', '', '(11)99138-8033', 'https://www.instagram.com/ppgimcosmeticos/', '', 'ILDA', '45.267.476/0001-21', '', '2024-08-26 13:07:55', 'SANTANA DE PARNAÍBA', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13941, 'Aroma Perfumaria', 'PRACA ALMEIDA JUNIOR - 34 - VILA ASSUNCAO - Santo andré - SP - 09030-525', 'Inativo', '', '11 95404-5502', 'https://www.instagram.com/aromaperfumaria.sa/', 'https://shopee.com.br/aromaperfumaria.sa', 'HELOISA', '40.043.011/0001-73', '', '2024-08-26 13:07:54', 'Santo andré', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13942, 'Kaimii', 'RUA MIQUELINA, 473 - VILA CAMILOPOLIS - SANTO ANDRÉ/SP 09230-280', 'Inativo', '', '11 98429-0092', 'https://www.instagram.com/__kaimii', 'Instagram com mais postagens do salão de beleza, mas possui materiais para profissionais na loja', 'KATIA', '20.698.515/0001-14', '', '2024-08-26 13:07:54', 'Santo andré', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13943, 'Bella Cosmeticos Perfumaria', 'RUA ENGENHEIRO JOSE SANCHES FERRARI, 912 - JARDIM VICENTE DE CARVALHO - BERTIOGA/SP 11250-518', 'Inativo', '', '13997827532', 'https://www.instagram.com/bellacosmeticos465/', '', 'EDILENE', '37.377.309/0001-05', '', '2024-08-26 13:07:59', 'BERTIOGA', 'SP', 'edilene0300@gmail.com', 'Metropolitada São Paulo (Sem Capital)'),
(13944, 'COMPLETA BELEZA', 'TRAVESSA GUAIO, 381 - CENTRO - SUZANO/SP 08674-150', 'Ativo', 'Unhas, cílios e sobrancelha', '11942052888', 'https://www.instagram.com/lojacompletabeleza/', '', 'PRICILA', '27.366.748/0001-69', '', '2024-08-20 20:45:56', 'SUZANO', 'SP', 'brpricila@gmail.com', 'Metropolitada São Paulo (Sem Capital)'),
(13945, 'Charming Nails Aruja', 'Rua Silvina de Camargo, 53, Centro, Arujá, CEP 07402135', 'Inativo', 'Unhas e cílios', '11973064090', 'https://www.instagram.com/charming_nails_aruja', '', 'RAFAEL', '40.343.194/0001-42', '', '2024-08-26 13:07:59', 'Arujá', 'SP', 'rsantos050285@gmail.com', 'Metropolitada São Paulo (Sem Capital)'),
(13946, 'Casa Belleza Mogi Das Cruzes', 'RUA DOUTOR DEODATO WERTHEIMER, 1709 - CENTRO - MOGI DAS CRUZES/SP 08710-430', 'Inativo', 'Unhas, cílios e sobrancelha', '(11)98858-3648', 'https://www.instagram.com/casabellezamogii/', '', 'JIANJUN', '53.255.468/0001-93', '', '2024-08-26 13:07:59', 'Mogi das Cruzes', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13947, 'Lar das Unhas', 'R. Sen. Dantas, 339 - Centro, Mogi das Cruzes - SP, 08710-690', 'Inativo', '', '11954293092', 'https://www.instagram.com/gabilardasunhas/', '', 'GABRIELLI', '40.776.084/0001-74', '', '2024-08-26 13:07:59', 'Mogi das Cruzes', 'SP', 'gabriellibianca7@gmail.com', 'Metropolitada São Paulo (Sem Capital)'),
(13948, 'GUAPA MICROPIGMENTACAO', 'Rua Francisco Franco, 110 - Centro / Mogi das Cruzes / SP', 'Inativo', 'Cílios e sobrancelha', '11941084326', 'https://www.instagram.com/guapa_micro', '', 'TATIANA', '28.442.599/0001-32', '', '2024-08-26 13:08:04', 'Mogi das Cruzes', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13949, 'Diley’s / Produtos Profissionais de Beleza', 'Praça do Carmo, 71 - Loja 33 - Centro, Santo André - SP, 09010-020', 'Inativo', 'Unhas, cílios e sobrancelha', '(11) 99133-2347', 'https://www.instagram.com/dileysoficial', '', 'GUILHERME', '35.815.155/0001-60', '', '2024-08-26 13:08:04', ' Santo André', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13950, 'LEKA ACESSORIOS', 'RUA SANTA CLARA, 310 - CANHEMA - DIADEMA/SP 09941-260', 'Inativo', 'Unhas, cílios e sobrancelha', '11962893430', 'https://www.instagram.com/lojalekaacessorios/', '', 'SIDNEY', '23.189.173/0001-03', '(11) 98203-1933', '2024-08-26 13:08:04', 'DIADEMA', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13951, 'FASHION ESMALTERIA', 'Av. Conde Francisco Matarazzo, 85 - Sala 36 - Centro, São Caetano do Sul 09520100', 'Inativo', 'Unhas e cílios', '(11) 99370-2356', 'https://www.instagram.com/fashion.esmalteria/', '', 'REGINA', '11.857.741/0001-00', '', '2024-08-26 13:08:04', 'São Caetano do Sul ', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13952, 'Fidelis Cosméticos', 'R. Manoel da Nóbrega, 598 - sala 36 - Centro, Diadema - SP, 09910-720', 'Inativo', 'Unhas, cílios e sobrancelha', '11985962024', 'https://www.instagram.com/cosmeticosfidelis', '', 'ALINE', '46.145.180/0001-09', '', '2024-08-26 13:08:04', 'DIADEMA', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13953, 'Vanessa Películas', 'TRAVESSA JOAQUIM HORACIO PEDROSO - 32 - CENTRO - Cotia - SP - 06700-060', 'Inativo', 'Unhas', '(11) 97139-9014', 'https://www.instagram.com/vanessapeliculasparaunhas', '', 'VANESSA', '23.356.244/0001-07', '', '2024-08-26 13:08:09', 'Cotia', 'SP', 'nessaejpp@hotmail.com', 'Metropolitada São Paulo (Sem Capital)'),
(13954, 'Tai Dantas store', 'RUA GUARAPARI, 107 - BOSQUE DE JANDIRA - JANDIRA/SP 06620-350', 'Ativo', 'Unhas, cílios e sobrancelha', '11968308226', 'https://www.instagram.com/taidantas.store/', '', 'TAIZA', '41.979.418/0001-70', '', '2024-08-20 20:46:05', 'Jandira', 'SP', 'taizahewinny@hotmail.com', 'Metropolitada São Paulo (Sem Capital)'),
(13955, 'Melimey Cosméticos', 'RUA DONA PRIMITIVA VIANCO, 200 - CENTRO - OSASCO/SP 06016-000', 'Inativo', 'Unhas, cílios e sobrancelha', ' 11 98544-9315', 'https://www.instagram.com/melimeycosmeticos/', '', 'SU JIASHENG', '49.176.585/0001-94', '(11) 98555-1996', '2024-08-26 13:08:10', 'OSASCO', 'SP', 'sujiasheng1993@gmail.com', 'Metropolitada São Paulo (Sem Capital)'),
(13956, 'B7 MAKEUP', 'R. Dona Primitiva Vianco, 244 - Centro, Osasco - SP, 06010-004', 'Inativo', 'Unhas', '11933937976', 'https://www.instagram.com/b7makeup/', '', 'DAYANNE', '29.129.736/0001-46', '', '2024-08-26 13:08:09', 'OSASCO', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13957, 'Cheguei! O Mundo Das Lashes', '', 'Inativo', 'Cílios', '11959025781', 'https://www.instagram.com/chegueionline/', '', 'ISABELA / CAMILA', '30.731.435/0001-77', '', '2024-08-26 13:08:09', 'OSASCO', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13958, 'A CASA DOS CILIOS ', '', 'Inativo', 'Cílios', '13991179154', 'https://www.instagram.com/casadosciliospg/', '', 'TULIO / BRUNA', '12.511.888/0001-06', '', '2024-08-26 13:08:14', 'Praia Grande', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13959, 'LOJA DOS CILIOS', 'RUA DA MATRIZ, 63 - MATRIZ - MAUÁ/SP 09370-100', 'Inativo', 'Cílios', '11978470202', 'https://www.instagram.com/lojadocilios/', '', 'DIEGO / DANILO', '42.993.095/0001-31', '', '2024-08-26 13:08:14', 'Mauá', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13960, 'TOP CILIOS ', '', 'Inativo', 'Cílios e sobrancelha', '(11) 99171-3060', 'https://www.instagram.com/loja_topcilios', '', 'JENIFER', '48.320.929/0001-24', '', '2024-08-26 13:08:14', 'Carapicuíba', 'SP', 'jenifergomes149@gmail.com', 'Metropolitada São Paulo (Sem Capital)'),
(13961, 'LaStore', 'RUA ALMEIDA NOGUEIRA - 23 - JARDIM PROFESSOR FRANCISCO MORATO - Francisco morato - SP - 07910-150', 'Inativo', 'Unhas, cílios e sobrancelha', '11 91427-7414', 'https://www.instagram.com/lastore____/', '', 'LARISSA', '36.337.450/0001-11', '(11) 98872-4226', '2024-08-26 13:08:14', 'Francisco morato', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13962, 'DANTAS COSMETICOS', 'R. Dona Amália Sestini, 223 - 1 andar - Centro, Franco da Rocha - SP, 07802-260', 'Inativo', 'Unhas, cílios e sobrancelha', '11996178235', 'https://www.instagram.com/dantas_afiacao/', '', 'ALEX', '30.206.521/0001-60', '', '2024-08-26 13:08:14', 'Franco da Rocha ', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13963, 'ELEGANCE BEAUTY CENTER', 'RUA SEBASTIAO DE OLIVEIRA, 129 - BOQUEIRAO - PRAIA GRANDE/SP 11701-200', 'Inativo', 'Unhas, cílios e sobrancelha', '13981724575', 'https://www.instagram.com/elegancebeautycenter_', '', '', '19.748.905/0001-72', '(13) 98124-0564', '2024-08-26 13:08:19', 'PRAIA GRANDE', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13964, 'Store Larissa Lima', 'RUA FREI GASPAR, 941- SALA 06 - CENTRO - SÃO BERNARDO DO CAMPO/SP 09720-440', 'Inativo', 'CÍLIOS', '11983037927', 'https://www.instagram.com/store.larissalima/', '', 'LARISSA', '32.754.597/0001-56', '', '2024-08-26 13:08:19', 'São Bernardo do Campo', 'SP', 'larissa.limaap09@gmail.com', 'Metropolitada São Paulo (Sem Capital)'),
(13965, 'Patroa Cosméticos', '', 'Inativo', 'Cílios e sobrancelha', '11990181465', 'https://www.instagram.com/patroacosmeticos/', '', 'STEPHANIE', '33.450.458/0001-00', '', '2024-08-26 13:08:19', 'São Bernardo do Campo', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13966, 'BOUTTIQUE DAS UNHAS', 'RUA MOCOCA, 31 - BOQUEIRAO - PRAIA GRANDE/SP 11701-100', 'Inativo', 'Unhas, cílios e sobrancelha', '(013)99774-2825', 'https://www.instagram.com/bouttiquedasunhas_/', '', 'LETICIA', '33.411.556/0001-20', '', '2024-08-26 13:08:19', 'PRAIA GRANDE', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13967, 'SANTOS CÍLIOS', 'Av. Conselheiro Nébias 754 - Sala 1319 - Santos, SP ', 'Inativo', 'CÍLIOS', '13 997765884', 'https://www.instagram.com/santos_cilios__/', '', 'EVILI / LEONARDO', '32.997.597/0001-87', '', '2024-08-26 13:08:19', 'SANTOS', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13968, 'Silvia Pedrarias & Cia', 'RUA ALAGOAS, 61 - GONZAGA - SANTOS/SP 11065-120', 'Inativo', 'Unhas, cílios e sobrancelha', '13974175536', 'https://www.instagram.com/silviapedrarias/', '', 'SILVIA', '26.922.261/0001-52', '', '2024-08-20 20:46:19', 'SANTOS', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13969, 'CANTINHO DA BELEZA', 'RUA ITIRUCU, 590 - JARDIM PRESIDENTE DUTRA - GUARULHOS/SP 07171-160', 'Inativo', 'Unhas, cílios e sobrancelha', '(11) 96664-6866', 'https://www.instagram.com/cantinhodabelleza_luiza/', '', 'LUIZA', '27.314.271/0001-78', '', '2024-08-26 13:08:24', 'GUARULHOS', 'SP', 'luiza.galvao157@gmail.com', 'Metropolitada São Paulo (Sem Capital)'),
(13970, 'FÁBRICA DA BELEZA', 'RUA EVANGELISTA DE SOUZA - 1782 - PARQUE CAPUAVA - Santo andré - SP - 09260-411', 'Inativo', 'Unhas, cílios e sobrancelha', '11941972011', 'https://www.instagram.com/fabricabeleza_distribuidora', '', 'JULIANA', '27.041.726/0001-29', '(11) 98834-0652', '2024-08-26 13:08:24', ' Santo andré', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13971, 'ON BEAUTY IMPORTS ', '', 'Ativo', 'Unhas, cílios e sobrancelha', '(11) 96397-7673', 'https://www.instagram.com/onbimports', '', 'KAROLINE', '51.887.265/0001-94', '', '2024-08-20 20:46:25', '', 'SP', 'kdelrei@gmail.com', 'Metropolitada São Paulo (Sem Capital)'),
(13972, 'ACESSORIO DA BELEZA', '', 'Inativo', 'CÍLIOS', '11 95195-6325', 'https://www.instagram.com/acessoriodebeleza/', '', 'THAIS', '40.430.528/0001-15', '(11) 98343-5564', '2024-08-26 13:08:24', '', 'SP', 'thaisoliveira2809@yahoo.com.br', 'Metropolitada São Paulo (Sem Capital)'),
(13973, 'MARIA DOM DOCA', 'R. Luiz Gama,n°4 - Centro • Itapecerica Da Serra - SP', 'Inativo', 'Unhas, cílios e sobrancelha', '11918463180', 'https://www.instagram.com/mariadomdocaitapecericadaserra/', '', 'BIANCA', '54.151.240/0001-16', '', '2024-08-26 13:08:29', 'Itapecerica Da Serra', 'SP', 'bianncade@bol.com.br', 'Metropolitada São Paulo (Sem Capital)'),
(13974, 'Inovare', 'RUA SARUTAIA - 363 - JARDIM SAO PAULO - Guarulhos - SP - 07131-000', 'Inativo', 'Unhas, cílios e sobrancelha', '11 947267462', 'https://www.instagram.com/invdistribuidora_/', '', 'VIVIANE', '24.172.205/0001-12', '', '2024-08-26 13:08:29', 'GUARULHOS', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13975, 'QBELEZA', 'AVENIDA FERNANDO FERNANDES - 800 - JARDIM MITUZI - Taboão da serra - SP - 06775-290', 'Inativo', 'Unhas, cílios e sobrancelha', '11992608837', 'https://www.instagram.com/qbeleza.contato/', '', 'BRUNO', '51.652.885/0001-44', 'https://www.instagra', '2024-08-26 13:08:29', 'Taboão da serra ', 'SP', 'bruno.leonardo7701@gmail.com', 'Metropolitada São Paulo (Sem Capital)'),
(13976, 'PATROA DAS UNHAS', 'RUA DOUTOR CESARIO MOTA, 210 - CENTRO - SANTO ANDRÉ/SP 09010-100', 'Inativo', 'Unhas', '11978524538', 'https://www.instagram.com/patroadasunhas_oficial/', '', 'ELAINE', '24.419.151/0001-47', '', '2024-08-26 13:08:29', 'SANTO ANDRÉ', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13977, 'Unha do sonho', 'AVENIDA DO CORRETOR DE IMOVEIS, 234 - SAMAMBAIA - PRAIA GRANDE/SP 11712-400', 'Inativo', 'Unhas, cílios e sobrancelha', ' 13 97409-2542', 'https://www.instagram.com/_unhadosonho/', '', 'THALITA', '36.117.797/0001-59', 'https://www.instagra', '2024-08-26 13:08:29', 'PRAIA GRANDE', 'SP', 'thalita.krisley14@gmail.com', 'Metropolitada São Paulo (Sem Capital)'),
(13978, 'LOJA AGDA ESMALTERIA', 'RUA VEREADOR JULIO AGOSTINHO - 57 - PIRAPORINHA - Diadema - SP - 09950-480', 'Ativo', 'Unhas, cílios e sobrancelha', '11957306262', 'https://www.instagram.com/lojaagdaesmalteria/', '', 'AGDA', '46.780.921/0001-15', '', '2024-08-20 20:46:30', 'Diadema', 'SP', '', 'Metropolitada São Paulo (Sem Capital)'),
(13979, 'Dama Madame', 'RUA XV DE NOVEMBRO, 64 - CENTRO - MAIRIPORÃ/SP 07600-057', 'Inativo', 'Unhas, cílios ', '11 97395-1917', 'https://www.instagram.com/_damamadame/', '', 'SAMUEL', '45.911.527/0001-06', '(11) 96485-2936', '2024-08-26 13:08:33', 'MAIRIPORÃ', 'SP', 'samuel.oliveira78@gmail.com', 'Metropolitada São Paulo (Sem Capital)'),
(13980, 'DESIGN COSMETICOS SAUDE E BELEZA', 'Praça da Liberdade, 80 Sala 31', 'Inativo', 'trio', '11974843300', 'https://www.instagram.com/designcosmeticosoficial', 'https://www.designcosmeticos.com.br/', 'michel ', '42.809.161/0001-70', '(11) 98272-8312', '2024-08-26 13:08:33', 'liberdade SP', 'SP', 'michael.david06@hotmail.com', 'Metropolitada São Paulo'),
(13981, 'GIRO COMERCIO', 'rua dos italianos 981', 'Inativo', 'trio', '11971975967', 'https://www.instagram.com/rc.revendadecosmeticos/', 'https://www.revendadecosmeticos.com.br/', 'roberto', '08.976.510/0001-00', ' (11) 4620-2376', '2024-08-26 13:08:33', 'bom retiro sp', 'SP', 'contato@revendadecosmeticos.com.br', 'Metropolitada São Paulo'),
(13982, 'DOMINIQUE COMERCIO DE COSMETICOS E SERVICOS DE BELEZA LTDA', 'R. Bela Cintra, 2073 -', 'Inativo', 'trio', '11997936050', 'https://www.instagram.com/dominique_beaute/', 'https://www.dominiquebeaute.com.br/', 'olivia ', '20.055.871/0001-10', ' (11) 3384-5382', '2024-08-26 13:08:33', ' Consolação', 'SP', 'olivia@dominiquebeaute.com.br', 'Metropolitada São Paulo'),
(13983, 'casa  da belleza (SHAN WU)', 'RUA ORIENTE, 144 - BRAS - SÃO PAULO/SP 03016-000', 'Inativo', 'trio', '11932267610', 'https://www.instagram.com/casabellezabras/', 'n/c', 'shan wu ', '33.034.986/0001-70', '11932267610', '2024-08-26 13:08:37', 'bras', 'SP', 'swu@dcwhitecollar.com', 'Metropolitada São Paulo'),
(13984, 'PADRON PERFUMARIA VAREJO ELETRONICO LTDA', 'RUA VINTE E QUATRO DE MAIO, 242 - REPUBLICA - SÃO PAULO/SP 01041-000', 'Inativo', 'trio', '1142242311', 'https://www.instagram.com/padronperfumaria?fbclid=IwAR35PeHtmATFTnomhWDDILbBRnvU3wsJJ4I4Qfrglu2g4_5TASW4ewmqwSY', 'https://www.padronperfumaria.com.br/', 'andre ou matheus ', '37.111.191/0001-79', '1142242311', '2024-08-26 13:08:37', 'republica ', 'SP', 'dedcont@terra.com.br', 'Metropolitada São Paulo'),
(13985, 'VONNY COSMETICOS', 'AVENIDA RANGEL PESTANA, 2118 - BRAS - SÃO PAULO/SP 03002-000', 'Inativo', 'trio', '11944855741', 'https://www.instagram.com/vonnyoficial/', 'https://www.vonny.com.br/', 'antonio ou takeyoshi', '33.508.154/0001-48', '11944855741', '2024-08-26 13:08:37', 'bras', 'SP', 'contato@mamaepresentes.com.br', 'Metropolitada São Paulo'),
(13986, 'N. J. DE SANTANA COSMETICOS', 'R. Dr. César, 264 - Santana', 'Inativo', 'trio', '11999513523', 'https://www.instagram.com/santanacosmeticosoficial/', 'https://www.santanacosmeticosoficial.com.br/index.html', 'daniela ', '30.062.419/0001-39', '(11) 96611-7622', '2024-08-26 13:08:37', 'santana sp', 'SP', 'nozinhonola@gmail.com', 'Metropolitada São Paulo'),
(13987, 'MARA UEHARA', 'Avenida Presidente Castelo Branco, 1033', 'Inativo', 'trio', '(11) 2079-0126 / (11) 345', 'https://www.instagram.com/uehara_cosmeticos/', 'n/c', 'MITRI M. O.', '01.960.568/0001-17', '(11) 2079-0126', '2024-08-26 13:08:37', 'são paulo ', 'SP', 'n/c', 'Metropolitada São Paulo'),
(13988, 'BELEZA MAGIA', 'Rua Ceára,283 Vila Cristovam', 'Descoberto', 'troi', '(19) 99249-5086', 'https://www.instagram.com/magiacosmeticos/', 'https://www.lojamagiacosmeticos.com.br/q?keywords=alicate', 'rosa maria ', '30.031.187/0001-51', '(19) 3704-0798', '2024-08-20 18:14:05', 'sp limeira', 'SP', 'laeka.assessoria@gmail.com', 'Metropolitada São Paulo'),
(13989, 'SUMIRE', 'RUA JOSE PAULINO, 520 - BOM RETIRO - SÃO PAULO/SP 01120-000', 'Descoberto', 'trio', '11943286041', 'https://www.instagram.com/sumirebomretiro/', 'n/c', 'giovanna', '26.484.762/0001-02', '(11) 99332-6018', '2024-08-20 18:14:05', 'bom retiro', 'SP', 'controladoriaphd@gmail.com', 'Metropolitada São Paulo'),
(13990, 'UNICK MAKE', 'rua hannemann, 415 - galeria pajé brás ', 'Descoberto', 'trio', ' (11) 2294-0537', 'https://www.instagram.com/unick_make', 'www.unickmake.com.br', 'XIUHUA Q.', '39.470.764/0001-86', ' (11) 2294-0537', '2024-08-20 18:14:05', 'brás ', 'SP', 'hungarodalva@gmail.com', 'Metropolitada São Paulo'),
(13991, 'LUCKY YE PRESENTES LTDA', 'Rua barão da ladario 512', 'Descoberto', 'trio', '(11)99706-6789', 'https://www.instagram.com/lucky_ye_maquiagem', 'n/c', 'HENGXUE', '35.130.118/0001-19', '(11)99706-6789', '2024-08-20 18:14:05', 'bras ', 'SP', 'n/c', 'Metropolitada São Paulo'),
(13992, 'REPUBLICA COSMETICOS', 'RUA MARCONI, 113 - REPUBLICA - SÃO PAULO/SP 01047-000', 'Descoberto', 'trio', '(11) 93939-2452', 'https://www.instagram.com/republica_cosmeticos/', 'https://shopee.com.br/republica_cosmeticos?smtt=0.0.9', 'elaine ', '12.760.746/0001-82', '(11) 93939-2452', '2024-08-20 18:14:05', 'republica ', 'SP', 'feirante@ocfsp.com.br', 'Metropolitada São Paulo'),
(13993, 'LANCEL MAQUIAGENS LTDA', 'rua paula sousa, 313 - centro historico sp prox 25 de março', 'Descoberto', 'trio', 'https://lancelmaquiagens.', 'https://www.instagram.com/lancelmaquiagens/', 'N/C', 'ENILA ', '45.083.536/0001-56', '(11) 98965-4135', '2024-08-20 18:14:05', 'centro historico', 'SP', 'liperuiz112@gmail.com', 'Metropolitada São Paulo'),
(13994, 'BELLE MAKE-UP', 'Rua Paula Sousa N 19 - Centro', 'Descoberto', 'trio', '11 93772-5619', 'https://www.instagram.com/bellemakeup20/', 'https://www.bellemake-up.com.br/', 'cassia', '26.102.949/0001-96', '(11) 3772-5619', '2024-08-20 18:14:05', 'centro historico', 'SP', 'bellemakeup20@gmail.com', 'Metropolitada São Paulo'),
(13995, 'JOSE ALVES COSMETICOS', 'RUA SETE DE ABRIL, 356 - REPUBLICA - SÃO PAULO/SP 01044-000', 'Descoberto', 'trio', 'n/c', 'https://www.instagram.com/josecleide_cosmeticos/', 'https://www.instagram.com/josecleidealves2023/ ', 'jose ', '12.504.868/0001-08', 'n/c', '2024-08-20 18:14:05', 'republica ', 'SP', 'n/c', 'Metropolitada São Paulo'),
(13996, 'LUCKY LADY COSMETICOS LTDA', 'RUA HENRIQUE DIAS, 44 - BRAS - SÃO PAULO/SP 03009-020', 'Descoberto', 'trio', 'https://linktr.ee/Lucky_L', 'https://www.instagram.com/lucky_lady1040/', 'n/c', 'xiujun e Lei w', '31.810.348/0001-78', '(11) 98119-9348', '2024-08-20 18:14:05', 'bras ', 'SP', 'w312528136@gmail.com', 'Metropolitada São Paulo'),
(13997, 'KAORI SUPERMERCADO DE COSMETICOS', 'RUA BARAO DE ITAPETININGA, 254 - REPUBLICA - SÃO PAULO/SP 01042-000', 'Descoberto', 'trio', '113255-7414', 'https://www.instagram.com/kaori_supermecado_cosmeticos/', 'n/c', 'margarete', '07.052.831/0001-56', ' (11) 3105-3001', '2024-08-20 18:14:05', 'republica ', 'SP', 'ocfeirante@uol.com.br', 'Metropolitada São Paulo'),
(13998, 'omy perfumaria ', 'AVENIDA BRIGADEIRO LUIS ANTONIO - 2163 - BELA VISTA - Sao paulo - SP - 01317-002', 'Descoberto', 'unhas ', '11971233260', 'https://www.instagram.com/omy_perfumaria/', 'n/c', 'ALEX K. T', '04.679.218/0001-75', ' (11) 2507-7159', '2024-08-20 18:14:05', 'bela vista sp', 'SP', 'n/c', 'Metropolitada São Paulo'),
(13999, 'YASMIM COSMETICOS ', 'RUA POLIGNANO A MARE, 41 - BRAS - SÃO PAULO/SP 03005-040', 'Descoberto', 'TRIO', '(11) 98303-0814', 'https://www.instagram.com/yasmimcosmeticos_sp/', 'n/c', 'ELIANA ', '20.654.052/0001-99', '(11) 3227-8350', '2024-08-20 18:14:05', 'BRAS', 'SP', 'aguiar.racional@uol.com.br', 'Metropolitada São Paulo'),
(14000, 'TERUYA COSMETIOS ', 'RUA MILLER, 99 - BRAS - SÃO PAULO/SP 03011-011', 'Descoberto', 'trio', ' (11) 97437-7979', 'https://www.instagram.com/teruyaperfumaria/', 'n/c', 'patricia', '25.104.583/0001-21', ' (11) 2692-0217', '2024-08-20 18:14:05', 'bras ', 'SP', 'perf.acacia@uol.com.br', 'Metropolitada São Paulo'),
(14001, 'KAORI COSMETICOS', 'RUA BARAO DE ITAPETININGA, 262 - REPUBLICA / R. PADRE JOÃO DA CUNHA, 504-510 - JARDIM JOAO XXIII', 'Descoberto', 'trio', '11 95964-2486', 'https://www.instagram.com/kaori_cosmeticos/', 'https://kaorinaweb.com.br/', 'alberto ', '26.012.189/0001-26', '(11) 4323-3195', '2024-08-20 18:14:05', 'republica / jardim joao', 'SP', 'kaoricosmeticos2017@gmail.com', 'Metropolitada São Paulo'),
(14002, 'LA PATTY COSMETICOS', '0', 'Descoberto', 'trio', '11960992212', 'https://www.instagram.com/lapattycosmeticosbras/', 'https://lapattycosmeticos.com.br/', 'PATRICIA GOMES', '32.960.623/0001-00', '(11) 99859-2670', '2024-08-20 18:14:05', 'bras', 'SP', 'lapattycosmeticos@gmail.com', 'Metropolitada São Paulo'),
(14003, 'MISS BELLE COSMETICOS E PERFUMARIA', 'RUA JOAQUIM CARLOS, 1122 - BRÁS - SÃO PAULO/SP 03019-000   loja de esquina ', 'Descoberto', 'trio', '11976245047', 'https://www.instagram.com/missbellecosmeticos.sp/reels/', 'https://www.instagram.com/ellenbrandessilva/', 'ellen w', '51.220.431/0001-02', 'n/c', '2024-08-20 18:14:05', 'bras ', 'SP', 'droganovaetica@gmail.com', 'Metropolitada São Paulo'),
(14004, 'Y&Z VARIEDADES', 'RUA ORIENTE, 55 - BRÁS - SÃO PAULO/SP 03016-001', 'Descoberto', 'trio', 'https://linktr.ee/jummyju', 'https://www.instagram.com/jummyju_makeup/', 'https://www.instagram.com/julianamariads2/', 'ramiro', '42.259.212/0001-38', '(11) 97860-6996', '2024-08-20 18:14:05', 'bras', 'SP', 'yasminju88@gmail.com', 'Metropolitada São Paulo'),
(14005, 'JONY SHOP LTDA', 'online ', 'Descoberto', 'trio', '(11) 98282-8885', 'https://www.instagram.com/_jonyshop/', 'https://shopee.com.br/jony_shop.br', 'zhibin ', '44.439.317/0001-02', '(11) 98282-8885', '2024-08-20 18:14:05', 'online market place', 'SP', 'jonyliu520@yahoo.com.br', 'Metropolitada São Paulo'),
(14006, 'BEAUTY BOSS COSMETICS', 'AVENIDA PAULISTA, 1765 - BELA VISTA - SÃO PAULO/SP 01311-930', 'Descoberto', 'trio', '11914034984', 'https://www.instagram.com/oficial_beautyboss/', 'não te ', 'ketlyn', '53.063.816/0001-20', '(41) 99888-0068', '2024-08-20 18:14:05', 'bela vista sp', 'SP', 'não tem ', 'Metropolitada São Paulo'),
(14007, 'SORA PERFUMARIA', 'R. Barão do Rio Branco, 278 - Santo Amaro, São Paulo - SP, 04753-000', 'Descoberto', 'UNHAS, CÍLIOS, SOBRANCELHA', '(11) 97467-3784', 'https://www.instagram.com/soraperfumaria/', '', 'AKIRA', '20.009.490/0001-02', '', '2024-08-20 18:14:05', 'SÃO PAULO (SANTO AMARO)', 'SP', '', 'Metropolitada São Paulo'),
(14008, 'SANSEI COSMETICOS ', 'RUA PROMOTOR GABRIEL NETTUZZI PEREZ - 173 - SANTO AMARO - São paulo - SP - 04743-020', 'Descoberto', 'UNHAS, CÍLIOS, SOBRANCELHA', '11941701043', 'https://www.instagram.com/sanseicosmeticos', 'https://www.sanseicosmeticos.com/', 'TAKEO / RENAN', '09.228.361/0001-64', '', '2024-08-20 18:14:05', 'SÃO PAULO (SANTO AMARO)', 'SP', '', 'Metropolitada São Paulo'),
(14009, 'KIMI COSMÉTICOS', 'RUA GAIVOTA - 1327 - MOEMA - Sao paulo - SP - 04522-033', 'Descoberto', 'UNHAS, CÍLIOS, SOBRANCELHA', '11940066391', 'https://www.instagram.com/kimicosmeticos/', 'https://www.kimicosmeticos.com.br/', '', '07.262.055/0001-19', '', '2024-08-20 18:14:05', 'SÃO PAULO (MOEMA)', 'SP', '', 'Metropolitada São Paulo'),
(14010, 'Thalia Perfumaria', 'AVENIDA DONA BELMIRA MARIM - 508 - GRAJAU - Sao paulo - SP - 04846-000', 'Descoberto', '', '(11) 97233-0565', 'https://www.instagram.com/thaliaperfumaria/', '', '', '05.551.402/0001-06', '', '2024-08-20 18:14:05', 'SÃO PAULO (GRAJAU)', 'SP', '', 'Metropolitada São Paulo'),
(14011, 'KLASS VOUGH', '', 'Descoberto', '', '11947689257', 'https://www.instagram.com/klassvough', 'https://www.klassvough.com/', 'LU', '02.881.499/0001-19', '', '2024-08-20 18:14:05', '', 'SP', '', 'Metropolitada São Paulo'),
(14012, 'Camaleoa Perfumaria', 'AVENIDA DR LUIS ROCHA MIRANDA - 100 - JABAQUARA - São paulo - SP - 04344-010', 'Descoberto', 'UNHAS, CÍLIOS, SOBRANCELHA', '11994035389', 'https://www.instagram.com/camaleoa_perfumaria/', 'http://www.camaleoaperfumaria.com.br/', 'MARIO / AMELIA', '62.132.592/0001-52', '', '2024-08-20 18:14:05', 'SÃO PAULO (JABAQUARA)', 'SP', '', 'Metropolitada São Paulo'),
(14013, 'Kemmy Cosméticos', 'RUA DOMINGOS DE MORAIS - 1014 - VILA MARIANA - São paulo - SP - 04010-100', 'Descoberto', 'UNHAS', '(11) 93334-5437', 'https://www.instagram.com/kemmy_cosmeticos/', '', 'SÉRGIO', '00.292.601/0001-15', '', '2024-08-20 18:14:05', 'SÃO PAULO (VILA MARIANA) ', 'SP', '', 'Metropolitada São Paulo'),
(14014, 'Perfumaria Esplendor', 'AVENIDA DO CURSINO - 135 - SAUDE - São paulo - SP - 04133-000', 'Descoberto', '', '(11)99464-5735', 'https://www.instagram.com/perfumariaesplendor_02', '', 'ELIANE', '08.209.997/0001-04', '', '2024-08-20 18:14:05', 'SÃO PAULO (SAÚDE)', 'SP', '', 'Metropolitada São Paulo'),
(14015, 'TULLYPA COSMETICOS  ', 'RUA CLODOMIRO AMAZONAS, 137 - ITAIM BIBI - SÃO PAULO/SP 04537-010', 'Descoberto', 'UNHAS', '11 97636-2967', 'https://www.instagram.com/tullypacosmeticos/', '', 'CLAUDIO ', '49.755.317/0001-27', '', '2024-08-20 18:14:05', 'SÃO PAULO (ITAIM BIBI)', 'SP', '', 'Metropolitada São Paulo'),
(14016, 'Perfumaria Bellissima', 'RUA HENRIQUE SAM MINDLIN, 1331 - CAPAO REDONDO - SÃO PAULO/SP 05882-000', 'Descoberto', 'UNHAS', '(11) 95159-9980', 'https://www.instagram.com/perfumariabellissima/', '', 'SUMAYA', '10.877.802/0001-38', '', '2024-08-20 18:14:05', 'SÃO PAULO (CAPÃO REDONDO)', 'SP', '', 'Metropolitada São Paulo'),
(14017, 'Perfumaria Karinna', 'RUA SANTA C RUZ - 2423 - IPIRANGA - São paulo - SP - 04121-002', 'Descoberto', 'UNHAS, SOBRANCELHA', '11 974074331', 'https://www.instagram.com/perfumariakarinna/', '', 'JUNG', '13.735.769/0001-08', '', '2024-08-20 18:14:05', 'SÃO PAULO (IPIRANGA)', 'SP', '', 'Metropolitada São Paulo'),
(14018, 'ELOHIM PERFUMARIA ', 'ESTRADA DAS LAGRIMAS, 1366 - IPIRANGA - SÃO PAULO/SP 04232-000', 'Descoberto', '', '(11) 96245-9438', 'https://www.instagram.com/elohimperfumaria/', '', 'ERICA / GUILHERME', '27.438.289/0001-81', '', '2024-08-20 18:14:05', 'SÃO PAULO (IPIRANGA)', 'SP', '', 'Metropolitada São Paulo'),
(14019, 'TODA VAIDADE PERFUMARIA', 'AVENIDA DO CURSINO - 3670 - SAUDE - São paulo - SP - 04132-002', 'Descoberto', 'UNHAS', '(11) 93005-3059', 'https://www.instagram.com/todavaidadeperfumaria/', '', 'ZELIA', '37.367.072/0001-81', '', '2024-08-20 18:14:05', 'SÃO PAULO (SAUDE)', 'SP', '', 'Metropolitada São Paulo'),
(14020, 'Q\'GRACINHA COSMETICA', 'AVENIDA CARLOS CALDEIRA FILHO - 2548 - VILA ANDRADE - São paulo - SP - 05730-190', 'Descoberto', 'UNHAS', '11 915721776', 'https://www.instagram.com/qgracinhacosmetica/', '', 'ANDRRE / LETICIA', '46.179.759/0001-84', '(11) 98406-7467', '2024-08-20 18:14:05', 'SÃO PAULO (VILA ANDRADE)', 'SP', 'andrezanelatto@hotmail.com', 'Metropolitada São Paulo'),
(14021, 'BELEZA E BRILHO', 'RUA JOAO FERNANDES C. NOVA JUNIOR - 510 - JARDIM SAO LUIS - São paulo - SP - 05844-000', 'Descoberto', '', '11 945482683', 'https://www.instagram.com/belezaebrilho.oficial/', '', 'ANGELA/DALMARA/JOANA', '45.680.132/0001-40', '(11) 99454-8268', '2024-08-20 18:14:05', 'SÃO PAULO ( JARDIM SAO LUIS)', 'SP', '', 'Metropolitada São Paulo'),
(14022, 'SUPERFUMARIA', 'RUA GEORGIA - 170 - BROOKLIN PAULISTA - São paulo - SP - 04559-010', 'Descoberto', 'UNHAS', '(11) 98900-4895', 'https://www.instagram.com/superfumaria/', 'https://www.superfumaria.com.br/', 'FABRIZZIO', '05.595.193/0001-94', '', '2024-08-20 18:14:05', 'SÃO PAULO (BROOKLIN PAULISTA)', 'SP', 'fabrizzio@dermadoctor.com.br', 'Metropolitada São Paulo'),
(14023, 'GLOSS COSMETICOS GRAJAU ', 'AVENIDA DONA BELMIRA MARIN - 1124 - PARQUE BRASIL - São paulo - SP - 04846-000', 'Descoberto', '', '11989057980', 'https://www.instagram.com/glossgrajau1', '', 'RICARDO', '18.627.977/0001-07', '(11) 94958-8444', '2024-08-20 18:14:05', 'SÃO PAULO (PARQUE BRASIL)', 'SP', '', 'Metropolitada São Paulo'),
(14024, 'THALIA PERFUMARIA', 'AVENIDA STA CATARINA - 1929 - VILA MASCOTE - São paulo - SP - 04378-400', 'Descoberto', '', '(11) 96573-0573', 'https://www.instagram.com/thaliaperfumaria/', '', 'EDNA', '05.763.950/0001-91', '(11) 96573-0573', '2024-08-20 18:14:05', 'SÃO PAULO (VILA MASCOTE)', 'SP', '', 'Metropolitada São Paulo'),
(14025, 'Lika Perfumaria', 'AVENIDA DO CURSINO - 1407 - JARDIM DA SAUDE - São paulo - SP - 04133-100', 'Descoberto', '', '(11) 94022-6060', 'https://www.instagram.com/likaperfumaria/', '', 'ELIANA / ADILSON', '04.000.537/0001-02', '', '2024-08-20 18:14:05', 'SÃO PAULO (SAÚDE)', 'SP', '', 'Metropolitada São Paulo'),
(14026, 'REALCE PERFUMARIA', 'RUA SINFONIA ITALIANA - 1326 D - JARDIM SAO BERNARDO - São paulo - SP - 04844-610', 'Descoberto', '', '(11) 5972-5000', 'https://www.instagram.com/realceperfumaria_/', '', 'ANTONIO', '05.000.038/0001-88', '', '2024-08-20 18:14:05', 'SÃO PAULO (SÃO BERNARDO)', 'SP', '', 'Metropolitada São Paulo'),
(14027, 'NALVA PERFUMARIA', 'R. HILDEBRANDO SIQUEIRA, 552 - VILA FACHINI, SÃO PAULO - SP, 04334-150', 'Descoberto', '', '(11) 4110-8673', 'https://www.instagram.com/nalva.perfumaria/', '', 'MARINALVA', '34.516.650/0001-06', '', '2024-08-20 18:14:05', 'SÃO PAULO (VILA FACHINI)', 'SP', '', 'Metropolitada São Paulo'),
(14028, 'PERFUMARIA UNIAO', 'RUA CRISTO REDENTOR, 6 - CIDADE NOVA HELIOPOLIS - SÃO PAULO/SP 04236-260', 'Descoberto', '', '11989812328', 'https://www.instagram.com/perfumariauniao_/', '', 'TATIANA', '27.832.205/0001-90', '', '2024-08-20 18:14:05', 'SÃO PAULO (CIDADE NOVA HELIOPOLIS) ', 'SP', 'tati01araujo@yahoo.com.br', 'Metropolitada São Paulo'),
(14029, 'Paris Store Perfumaria', 'ESTRADA DE ITAPECERICA - 4031 - VILA MARACANA - São paulo - SP - 05835-005', 'Descoberto', '', '11 96411-4296', 'https://www.instagram.com/parisstoreperfumaria/', '', 'BRUNO / SERGIO', '21.051.079/0001-50', '', '2024-08-20 18:14:05', 'SÃO PAULO (CAPÃO REDONDO)', 'SP', '', 'Metropolitada São Paulo'),
(14030, 'DAYARA COSMETICOS', 'ESTRADA DO M BOI MIRIM, 954 - JARDIM DAS FLORES - SÃO PAULO/SP 04905-000', 'Descoberto', '', '11974157881', 'https://www.instagram.com/cosmeticosdayara', '', 'ALAN', '23.548.899/0001-87', '', '2024-08-20 18:14:05', 'SÃO PAULO (JARDIM DAS FLORES)', 'SP', '', 'Metropolitada São Paulo'),
(14031, 'SIS COSMETICOS', 'RUA GUARARAPES, 401 - BROOKLIN NOVO - SÃO PAULO/SP 04561-000', 'Descoberto', '', '11974740676', 'https://www.instagram.com/siscosmeticos/?hl=pt-br', '', 'YORIKO / MASSAKO', '05.490.501/0001-17', '(11) 98281-4862', '2024-08-20 18:14:05', 'SÃO PAULO (BROOKLIN NOVO)', 'SP', '', 'Metropolitada São Paulo'),
(14032, 'Kelly Cosmeticos Perfumaria', 'AVENIDA LEBLON, 504 - JARDIM DOS LAGOS - SÃO PAULO/SP 04771-050', 'Descoberto', '', '11 954790332', 'https://www.instagram.com/kellycosmeticos_/', '', 'Kelly', '26.923.396/0001-32', '', '2024-08-20 18:14:05', 'SÃO PAULO (JARDIM DOS LAGOS)', 'SP', 'kelly.mimi@hotmail.com', 'Metropolitada São Paulo'),
(14033, 'Beckys Cosmeticos', 'AVENIDA JOAO CARLOS DA SILVA BORGES, 830 - VILA CRUZEIRO - SÃO PAULO/SP 04726-001', 'Descoberto', '', '(11) 5643-8478', 'https://www.instagram.com/beckyscosmeticos/', '', 'MONICA', '06.004.532/0001-83', '', '2024-08-20 18:14:05', 'SÃO PAULO (VILA CRUZEIRO)', 'SP', '', 'Metropolitada São Paulo'),
(14034, 'B1 COSMETICOS', 'AVENIDA DAMASCENO VIEIRA - 1068 - VILA MASCOTE - São paulo - SP - 04363-040', 'Descoberto', 'UNHAS, CÍLIOS, SOBRANCELHA', '(11) 987042370', 'https://www.instagram.com/b1cosmeticos/', '', 'MILTON', '12.939.309/0001-20', '(11) 98704-2370', '2024-08-20 18:14:05', 'SÃO PAULO (VILA MASCOTE)', 'SP', '', 'Metropolitada São Paulo'),
(14035, 'BELISSIMA PERFUMARIA', 'Rua: Demas zitto, 501 Parque residencial cocaia▪︎Grajaú, SP', 'Descoberto', '', '11 933615244', 'https://www.instagram.com/belissimaperfumariaa/', '', 'EDILENE', '08.268.711/0001-53', '', '2024-08-20 18:14:05', 'SÃO PAULO (GRAJAU)', 'SP', '', 'Metropolitada São Paulo'),
(14036, 'Thalia Perfumaria', 'ESTRADA DO MBOI MIRIM - 4350 - PARQUE DO LAGO - São paulo - SP - 04948-030', 'Descoberto', '', '(11) 94198-8210', 'https://www.instagram.com/thaliaperfumaria/', '', 'EDNA', '14.288.632/0001-07', '', '2024-08-20 18:14:05', 'SÃO PAULO (PARQUE DO LAGO)', 'SP', '', 'Metropolitada São Paulo'),
(14037, 'Aksa Cosmeticos', '', 'Descoberto', '', '11996608086', 'https://www.instagram.com/aksacosmeticos/', 'https://www.aksacosmeticos.com.br/  ', 'EDIVALDO', '11.575.060/0001-59', '(11) 96722-6923', '2024-08-20 18:14:05', 'SÃO PAULO (AMERICANÓPOLIS)', 'SP', '', 'Metropolitada São Paulo'),
(14038, 'Thalia Perfumaria', 'AVENIDA SENADOR TEOTONIO VILELA - 1271 - VILA SANTA CATARINA - São paulo - SP - 04801-010', 'Descoberto', '', '11973526830', 'https://www.instagram.com/thaliaperfumaria/', '', '', '07.725.226/0001-07', '', '2024-08-20 18:14:05', 'SÃO PAULO (VILA SANTA CATARINA)', 'SP', '', 'Metropolitada São Paulo'),
(14039, 'Traços de Mulher Perfumaria', 'AVENIDA SILVIO RIBEIRO ARAGAO - 261 - VILA FRANCA - São paulo - SP - 05776-510', 'Descoberto', '', '(11) 95382-6580', 'https://www.instagram.com/tracos_de_mulher_perfumaria/', 'https://shopee.com.br/34fgyg4oym', 'EDSON / ADELE', '05.415.671/0001-37', '', '2024-08-20 18:14:05', 'SÃO PAULO (VILA FRANCA)', 'SP', '', 'Metropolitada São Paulo'),
(14040, 'EMPORIO DOS COSMETICOS', 'Rua Moliére, 226 - Vila Sofia, São Paulo - SP, 04671-090', 'Descoberto', '', '11972588523', 'https://www.instagram.com/emporiodoscosmeticossp/', '', 'MARIA', '31.178.408/0001-81', '', '2024-08-20 18:14:05', 'SÃO PAULO (VILA SOFIA)', 'SP', '', 'Metropolitada São Paulo'),
(14041, 'BELLA PERFUMARIA E COSMETICOS', 'RUA SATURNINO DE OLIVEIRA, 503 - JARDIM SAO LUIZ - SÃO PAULO/SP 05813-080', 'Descoberto', '', '11 981232106', 'https://www.instagram.com/belaperfumaria2016/', '', 'WANDERLENE', '09.336.433/0001-97', '', '2024-08-20 18:14:05', 'SÃO PAULO ( JARDIM SAO LUIZ)', 'SP', '', 'Metropolitada São Paulo'),
(14042, 'LUARA PERFUMARIA', 'ESTRADA DO ALVARENGA - 1844 - BALNEARIO MAR PAULISTA - Sao paulo - SP - 04467-000', 'Descoberto', 'UNHAS, CÍLIOS, SOBRANCELHA', ' 11 94103-0541', 'https://www.instagram.com/perfumarialuara/', 'https://www.luaraperfumaria.com.br/', 'MARCELINO', '04.072.494/0001-70', '', '2024-08-20 18:14:05', 'São Paulo (Balneário Mar Paulista)', 'SP', 'marcelino_2006@terra.com.br', 'Metropolitada São Paulo'),
(14043, 'AFLORA PERFUMARIA', 'ESTRADA DO M BOI MIRIM, 9832 - PARQUE DO LAGO - SÃO PAULO/SP 04945-046', 'Descoberto', '', '11 5517-1565', 'https://www.instagram.com/afloraperfumaria/', '', 'FERNANDA / FABIANA', '25.369.571/0001-29', '', '2024-08-20 18:14:05', 'SÃO PAULO (PARQUE DO LAGO)', 'SP', '', 'Metropolitada São Paulo'),
(14044, 'KIMI COSMÉTICOS MOEMA', 'AVENIDA IRAI - 614 - INDIANOPOLIS - São paulo - SP - 04082-002', 'Descoberto', '', '11 97959-2262', 'https://www.instagram.com/kimimoema/', '', 'MARCELO / CELSO', '08.655.379/0001-80', '', '2024-08-20 18:14:05', 'SÃO PAULO (INDIANOPOLIS)', 'SP', '', 'Metropolitada São Paulo'),
(14045, 'Sempre Bella Perfumaria', 'RUA GUILHERME RULE - 2770 - CHACARA GAIVOTAS - São paulo - SP - 04849-310', 'Descoberto', '', '(11) 5931-2806', 'https://www.instagram.com/semprebella_perfumaria/', '', 'ELAINE', '12.620.278/0001-40', '', '2024-08-20 18:14:05', 'SÃO PAULO (CHACARA GAIVOTAS)', 'SP', '', 'Metropolitada São Paulo'),
(14046, 'Traços de Mulher Perfumaria', 'RUA JOAO DA CRUZ E SOUSA, 379 - JARDIM DAS ROSAS (ZONA SUL) - SÃO PAULO/SP 05893-000', 'Descoberto', '', '(11) 4782-4165', 'https://www.instagram.com/tracos_de_mulher_perfumaria/', '', 'ROBERTO / ADRIANA', '33.414.760/0001-02', '', '2024-08-20 18:14:05', 'SÃO PAULO (JARDIM DAS ROSAS)', 'SP', '', 'Metropolitada São Paulo'),
(14047, 'Belle Web Cosméticos', 'ALAMEDA DOS MARACATINS - 738 - INDIANOPOLIS - São paulo - SP - 04089-001', 'Descoberto', '', '11995972220', 'https://www.instagram.com/bellewebprime/', 'https://www.belleprime.com.br/', 'SEVERINA', '40.961.647/0001-02', '', '2024-08-20 18:14:05', 'SÃO PAULO (INDIANOPOLIS)', 'SP', '', 'Metropolitada São Paulo'),
(14048, 'LOLITAS COSMETICOS', 'AVENIDA ENGENHEIRO HEITOR ANTONIO EIRAS GARCIA - 4013 - JARDIM ESMERALDA - São paulo - SP - 05564-100', 'Descoberto', '', '11963939593', 'https://www.instagram.com/lolitas.cosmeticos/', '', 'JULIANA', '27.079.363/0001-10', '(11) 99901-5454', '2024-08-20 18:14:05', 'SÃO PAULO (JARDIM ESMERALDA)', 'SP', 'jufmachi@hotmail.com', 'Metropolitada São Paulo'),
(14049, 'Perfumaria Goya Cupece', 'AVENIDA CUPECE, 3320 - JARDIM PRUDENCIA - SÃO PAULO/SP 04366-000', 'Descoberto', '', '(11) 5562-6724', 'https://www.instagram.com/goya.cupece/', '', '', '10.321.813/0001-37', '', '2024-08-20 18:14:05', 'SÃO PAULO (JARDIM PRUDENCIA)', 'SP', '', 'Metropolitada São Paulo'),
(14050, 'DAIKI PERFUMARIA', 'AVENIDA YERVANT KISSAJIKIAN, 2248 - VILA JOANIZA - SÃO PAULO/SP 04428-000', 'Descoberto', '', '11963633135', 'https://www.instagram.com/daiki.perfumaria/', '', 'CLAUDIA', '24.976.157/0001-15', '', '2024-08-20 18:14:05', 'SÃO PAULO ( VILA JOANIZA)', 'SP', '', 'Metropolitada São Paulo'),
(14051, 'ESTILO K COSMETICA    ', 'AVENIDA ENGENHEIRO HEITOR ANTONIO EIRAS GARCIA, 6404 - JARDIM ESMERALDA - SÃO PAULO/SP 05564-200', 'Descoberto', '', '(????????) ??????????????', 'https://www.instagram.com/estilok.oficial/', 'https://www.estilok.com.br/unha', 'RENATA', '26.280.275/0001-10', '', '2024-08-20 18:14:05', 'SÃO PAULO (JARDIM ESMERALDA)', 'SP', 'renata@trilhast.com.br', 'Metropolitada São Paulo'),
(14052, 'Teruya Perfumaria - Menininha', 'ESTRADA M\'BOI MIRIM, 5936 - PARQUE BOLOGNE - SÃO PAULO/SP 04941-006', 'Descoberto', '', '(11)95559-2704', 'https://www.instagram.com/teruyaperfumariamboimirim/', '', 'RICARDO', '38.039.888/0001-49', '(11) 98551-5878', '2024-08-20 18:14:05', 'SÃO PAULO (PARQUE BOLOGNE)', 'SP', 'ricardoteruya@uol.com.br', 'Metropolitada São Paulo'),
(14053, 'Clarah Perfumaria', 'ESTRADA DO ALVARENGA - 3071 - BALNEARIO SAO FRANCISCO - São paulo - SP - 04474-340', 'Descoberto', '', '11988718175', 'https://www.instagram.com/clarah_perfumaria/', '', 'SEVERINO', '11.978.658/0001-99', '', '2024-08-20 18:14:05', 'SÃO PAULO (BALNEARIO SAO FRANCISCO)', 'SP', '', 'Metropolitada São Paulo'),
(14054, 'PERFUMARIA UNIVERSO', 'ESTRADA DE ITAPECERICA - 3850 - VILA PREL - São paulo - SP - 05835-004', 'Descoberto', '', '11 95776 8002', 'https://www.instagram.com/perfumaria_universo_/', '', 'JOSE', '46.518.177/0001-85', '', '2024-08-20 18:14:05', 'SÃO PAULO ( VILA PREL)', 'SP', '', 'Metropolitada São Paulo'),
(14055, 'LETICIA PERFUMARIA E COSMETICO', 'RUA DAS TRES MARIAS - 592 - PARQUE NOVO SANTO AMARO - São paulo - SP - 05874-180', 'Descoberto', '', '11 95462-1446', 'https://www.instagram.com/leticia_perfumaria/', '', '', '27.739.381/0001-81', '', '2024-08-20 18:14:05', 'SÃO PAULO (PARQUE NOVO SANTO AMARO)', 'SP', '', 'Metropolitada São Paulo'),
(14056, 'Marilu Maismarilu', 'AVENIDA ANDORINHA DOS BEIRAIS, 480 - JARDIM DOM JOSE - SÃO PAULO/SP 05887-000', 'Descoberto', '', '11 992434851', 'https://www.instagram.com/maismarilu/', '', 'ANTONIO', '19.953.449/0001-00', '', '2024-08-20 18:14:05', 'SÃO PAULO (JARDIM DOM JOSE)', 'SP', '', 'Metropolitada São Paulo'),
(14057, 'PERFUMARIA HIROMI', 'RUA MARECHAL DEODORO, 1728 - CENTRO - SÃO BERNARDO DO CAMPO/SP 09710-201', 'Descoberto', '', '11993306999', 'https://www.instagram.com/hiromioficial/', 'https://www.perfumariahiromi.com.br/', 'NANCI', '26.391.328/0001-70', '', '2024-08-20 18:14:05', 'SÃO PAULO (SÃO BERNARDO DO CAMPO)', 'SP', '', 'Metropolitada São Paulo'),
(14058, 'PERFUMARIA BELLISSIMA E MAKE', 'RUA HENRIQUE SAM MINDLIN - 1331 - JARDIM SAO BENTO NOVO - São paulo - SP - 05882-000', 'Descoberto', '', '(11) 95159-9980', 'https://www.instagram.com/perfumariabellissima/', 'https://shopee.com.br/perfumariabellissima_', 'ANDRESSA / SUMAYA', '47.750.514/0001-28', '', '2024-08-20 18:14:05', 'SÃO PAULO (JARDIM SAO BENTO NOVO)', 'SP', '', 'Metropolitada São Paulo'),
(14059, 'Grajaú Cosméticos', 'RUA GIOVANNI BONONCINI, 183 - PARQUE BRASIL - SÃO PAULO/SP 04843-020', 'Descoberto', '', '(11)5939-0479', 'https://www.instagram.com/grajau_cosmeticos_oficial/', '', 'HUIXIA / CHEN', '45.498.467/0001-41', '(11) 98290-1244', '2024-08-20 18:14:05', 'SÃO PAULO (PARQUE BRASIL)', 'SP', '', 'Metropolitada São Paulo'),
(14060, 'BEAUTYLINE', 'AVENIDA IRAI, 212 - INDIANÓPOLIS - SÃO PAULO/SP 04082-000', 'Descoberto', '', '(11) 93772-7777', 'https://www.instagram.com/beautyline_ibirapuera/', '', 'MARCOS', '46.017.038/0001-78', '(11) 98514-6381', '2024-08-20 18:14:05', 'SÃO PAULO (INDIANOPOLIS)', 'SP', '', 'Metropolitada São Paulo'),
(14061, 'PRIME COSMETICOS', 'AVENIDA DIEDERICHSEN, 1291 - VILA GUARANI (Z SUL) - SÃO PAULO/SP 04310-001', 'Descoberto', '', '11958803319', 'https://www.instagram.com/primecosmeticoseperfumaria', '', 'ROBASON / FLAVIA', '50.349.276/0001-58', '', '2024-08-20 18:14:05', 'SÃO PAULO ( VILA GUARANI)', 'SP', '', 'Metropolitada São Paulo'),
(14062, 'BROOKLIN COSMÉTICOS', 'AVENIDA ENG LUIZ CARLOS BERRINI, 1315 - CIDADE MONCOES - SÃO PAULO/SP 04571-010', 'Descoberto', '', '1155063700', 'https://www.instagram.com/brooklin.cosmeticos/', '', 'CHEN', '47.883.443/0001-31', '(11) 98268-8190', '2024-08-20 18:14:05', 'São Paulo ( CIDADE MONCOES)', 'SP', '', 'Metropolitada São Paulo'),
(14063, 'NATY PERFUMARIA', 'AVENIDA YERVANT KISSAJIKIAN, 3060 - VILA JOANIZA - SÃO PAULO/SP 04428-000', 'Descoberto', '', '11 91789-4570', 'https://www.instagram.com/naty.perfumaria/', '', 'NATALIA', '49.917.417/0001-02', '', '2024-08-20 18:14:05', 'SÃO PAULO (VILA JOANIZA)', 'SP', '', 'Metropolitada São Paulo'),
(14064, 'Purablz Distribuidora de Cosméticos', '', 'Descoberto', '', '(11)5666-7711 ', 'https://www.instagram.com/purablz.oficial/', 'https://purablz.com.br/', 'MARLENE', '45.580.315/0001-93', '', '2024-08-20 18:14:05', 'SÃO PAULO', 'SP', '', 'Metropolitada São Paulo'),
(14065, 'AIMI COSMETICOS', 'AVENIDA JABAQUARA, 1327 - MIRANDOPOLIS - SÃO PAULO/SP 04045-002', 'Descoberto', '', '(11) 99438-1228', 'https://www.instagram.com/aimi.cosmeticos/', 'https://www.aimicosmeticos.com.br/', 'RAFAEL', '48.593.343/0001-33', '', '2024-08-20 18:14:05', 'São Paulo (MIRANDOPOLIS)', 'SP', '', 'Metropolitada São Paulo'),
(14066, 'CASA BELLEZA IPIRANGA', 'RUA SILVA BUENO - 1805 - IPIRANGA - São paulo - SP - 04208-052', 'Descoberto', 'UNHAS, CÍLIOS, SOBRANCELHA', '(11) 3806-0546', 'https://www.instagram.com/casabelleza.ipiranga', '', 'Andrea', '34.393.836/0001-15', '(11) 99919-4257', '2024-08-20 18:14:05', 'SÃO PAULO (IPIRANGA)', 'SP', 'andrea@casabelleza.com.br', 'Metropolitada São Paulo'),
(14067, 'DOM DOCA ESMALTERIA', 'PRACA FLORIANO PEIXOTO - 408 - SANTO AMARO - São paulo - SP - 04751-030', 'Descoberto', 'UNHAS, CÍLIOS, SOBRANCELHA', '11947570916', 'https://www.domdocaesmalteria.com.br/', 'https://www.domdocaesmalteria.com.br/', 'VITORIA', '35.354.428/0001-17', '', '2024-08-20 18:14:05', 'SÃO PAULO (SANTO AMARO)', 'SP', '', 'Metropolitada São Paulo'),
(14068, 'FOR BEAUTY PRO', 'RUA DOMENICO LANZETTI, 6 - PARELHEIROS - SÃO PAULO/SP 04884-210', 'Descoberto', 'UNHAS, CÍLIOS, SOBRANCELHA', '11 917334019', 'https://www.instagram.com/for_beautypro/', 'https://forbeautypro.lojavirtualnuvem.com.br/', 'GUSTAVO', '47.972.644/0001-05', '(11) 97343-5615', '2024-08-20 18:14:05', 'SÃO PAULO (PARELHEIROS)', 'SP', 'gustavobranco53@gmail.com', 'Metropolitada São Paulo'),
(14069, 'SHOPPING DA BELEZA', 'AVENIDA DOS EUCALIPTOS - 671 - INDIANOPOLIS - São paulo - SP - 04517-050', 'Descoberto', 'UNHAS', '11961586007', 'https://www.instagram.com/_shoppingdabeleza_', '', 'RENAN', '68.950.955/0001-43', '', '2024-08-20 18:14:05', 'SÃO PAULO (INDIANOPOLIS)', 'SP', '', 'Metropolitada São Paulo'),
(14070, 'KIMI COSMETICOS', 'AVENIDA JORGE JOAO SAAD - 1120 - VILA PROGREDIOR - São paulo - SP - 05618-001', 'Descoberto', 'UNHAS, SOBRANCELHA', '11 94006-6391', 'https://www.instagram.com/kimicosmeticos', 'https://www.kimicosmeticos.com.br/', 'LINCOLN / CELSO', '04.499.605/0001-20', '', '2024-08-20 18:14:05', 'SÃO PAULO (VILA PROGREDIOR)', 'SP', '', 'Metropolitada São Paulo'),
(14071, 'ESMALTE MASTER', 'Av. Prof. Oscar Campiglia, 81 - Parque Ipe, São Paulo - SP, 05762-230', 'Descoberto', 'UNHAS, CÍLIOS', '11 985229163', 'https://www.instagram.com/esmaltesmaster/', 'https://shopee.com.br/esmaltemaster', 'GEZUE / DEBORA', '30.192.946/0001-68', '', '2024-08-20 18:14:05', 'SÃO PAULO (Parque Ipe)', 'SP', 'debgm1410@hotmail.com', 'Metropolitada São Paulo'),
(14072, 'MERCADO DA MANICURE', 'RUA SAMUEL KLEIN - 182 - CENTRO - São caetano do sul - SP - 09510-125', 'Descoberto', 'UNHAS', '(11) 97081-6166', 'https://www.instagram.com/mercadodamanicure.oficial/', 'https://www.mercadodamanicure.com.br/', 'AFONSO', '15.227.278/0001-73', '', '2024-08-20 18:14:05', 'SÃO PAULO (São caetano do sul)', 'SP', '', 'Metropolitada São Paulo'),
(14073, 'NAILS GRAJAU', 'Av. Rosália Iannini Conde, 320 - Parque America, São Paulo - SP, 04841-150', 'Descoberto', 'UNHAS', '11932161459', 'https://www.instagram.com/nails_grajau/', '', 'ROBERTO / CASSIA', '39.593.434/0001-88', '', '2024-08-20 18:14:05', 'SÃO PAULO (Parque America)', 'SP', '', 'Metropolitada São Paulo'),
(14074, 'VM BEAUTY LOJA', 'AVENIDA NOSSA SENHORA DA ENCARNACAO - DE 401/402 AO FIM, 925 - JARDIM MARIA ESTELA - SÃO PAULO/SP 04180-081', 'Descoberto', 'UNHAS, CÍLIOS, SOBRANCELHA', '11934879244', 'https://www.instagram.com/vmbeautyloja/', 'https://www.vmbeautyloja.com.br/', 'VITORIA', '45.657.455/0001-12', '', '2024-08-20 18:14:05', 'SÃO PAULO (JARDIM MARIA ESTELA)', 'SP', 'viick.marques@hotmail.com', 'Metropolitada São Paulo'),
(14075, 'Paola Cosmeticos', 'AVENIDA DO RIO PEQUENO - 880 - RIO PEQUENO - São paulo - SP - 05379-000', 'Descoberto', 'Unhas', '(11) 3766-4193', 'https://www.instagram.com/paolacosmeticos_/', '', 'JOSE E. D. A. L', '03.562.087/0001-89', '(11) 99163-6036', '2024-08-20 18:14:05', 'São paulo', 'SP', 'paolacosmeticos880@gmail.com', 'Metropolitada São Paulo'),
(14076, 'SUMIRÊ LAPA COSMETICOS', '', 'Descoberto', 'Unhas', '11 36415286', 'https://www.instagram.com/sumire.lapa/', 'www.sumirelapa.com.br', '', '43.582.584/0001-63', '', '2024-08-20 18:14:05', '', 'SP', '', 'Metropolitada São Paulo'),
(14077, 'BARAO COSMETICOS PERDIZES', '', 'Descoberto', 'Unhas', '(11) 3836-8733', 'https://www.instagram.com/baraocosmeticos/', 'https://baraocosmeticos.com.br/buscar?q=alicate', '', '26.167.682/0001-15', '(11) 3871-0498', '2024-08-20 18:14:05', '', 'SP', '', 'Metropolitada São Paulo'),
(14078, 'VILY COSMETICOS', 'AVENIDA DO RIO PEQUENO - 814 - RIO PEQUENO - São paulo - SP - 05379-000', 'Descoberto', 'Unhas', '(11) 3766-3587', 'https://www.instagram.com/stories/highlights/18098069257030540/', '', 'SOLANGE SATIKO HIRANO', '05.692.779/0001-77', '', '2024-08-20 18:14:05', 'São Paulo', 'SP', '', 'Metropolitada São Paulo'),
(14079, 'LAPA COSMETICOS', 'RUA MONTEIRO DE MELO - 102 - LAPA - São paulo - SP - 05050-000', 'Descoberto', 'Unhas', '(11) 2091-1992', 'https://www.instagram.com/lapa_cosmeticos/', '', 'NEUSA U. T', '11.051.741/0001-18', '(11) 2092-2728', '2024-08-20 18:14:05', 'São Paulo', 'SP', '', 'Metropolitada São Paulo'),
(14080, 'SOU MAR PERFUMARIA', 'AVENIDA DR SYLVIO DE CAMPOS, 58 - PERUS - SÃO PAULO/SP 05204-000', 'Descoberto', 'Unhas', '11 94116-6223', 'https://www.instagram.com/soumarperfumaria/', '', 'ELISA S', '51.962.868/0001-03', '(11) 3917-2224', '2024-08-20 18:14:05', 'São Paulo', 'SP', '', 'Metropolitada São Paulo'),
(14081, 'PERFUMARIA FLORIBELLA', 'AVENIDA MUTINGA - 2590 - PIRITUBA - São paulo - SP - 05110-000', 'Descoberto', 'Unhas', '11 98401-5416', 'https://www.instagram.com/perfumariafloribella/', '', 'MASAHIRO T', '56.757.388/0001-24', '(11) 2239-8527', '2024-08-20 18:14:05', 'São Paulo', 'SP', 'p.floribella@hotmail.com', 'Metropolitada São Paulo'),
(14082, 'KIMI COSMETICOS', 'AVENIDA VITAL BRASIL, 326 - BUTANTA - SÃO PAULO/SP 05503-000', 'Descoberto', 'Unhas', '(11) 94005-8909', 'https://www.instagram.com/kimicosmeticos/', '', 'LINCOLN H. I', '00.951.930/0001-20', '(11) 3819-4949', '2024-08-20 18:14:05', 'São Paulo', 'SP', 'kimi.butanta@terra.com.br', 'Metropolitada São Paulo'),
(14083, 'JUJU COSMETICOS', '', 'Descoberto', 'Unhas', '(11) 4701-2314', 'https://www.instagram.com/jujucosmeticos/', 'http://www.jujucosmeticos.com.br/', 'JAIR R. D. O. J', '24.226.302/0001-40', '', '2024-08-20 18:14:05', 'São Paulo', 'SP', 'jjjperfumaria@gmail.com', 'Metropolitada São Paulo');
INSERT INTO `stores` (`id`, `nome`, `endereco`, `status`, `anotacao`, `telefone`, `instagram`, `site`, `decisor`, `cnpj`, `telefone_decisor`, `datetime`, `cidade`, `estado`, `email`, `mesorregiao`) VALUES
(14084, 'REVENDA DE COSMETICOS', 'AVENIDA MOFARREJ, 348 - VILA LEOPOLDINA - SÃO PAULO/SP 05311-000', 'Descoberto', 'Unhas', '(11) 3978-7234', 'https://www.instagram.com/rc.revendadecosmeticos/', '', 'RENATA B. C', '42.747.003/0001-33', '(17) 3364-9940', '2024-08-20 18:14:05', 'São Paulo', 'SP', 'contato@revendadecosmeticos.com.br', 'Metropolitada São Paulo'),
(14085, 'MAIS MAKE DISTRIBUIDORA', '', 'Descoberto', 'Unhas', '(11) 2235-6929', 'https://www.instagram.com/maismakedistribuidora/', '', 'PAULO G. D. S. C', '38.318.620/0001-46', '(93) 99218-6608', '2024-08-20 18:14:05', '', 'SP', 'maismakedistribuidora@gmail.com', 'Metropolitada São Paulo'),
(14086, 'Kimi Cosméticos', '', 'Descoberto', 'Unhas', '11940091807', 'https://www.instagram.com/kimicosmeticos/', '', 'MIYUKI N. F', '03.246.835/0001-14', '', '2024-08-20 18:14:05', '', 'SP', 'financeiro.kimi@terra.com.br', 'Metropolitada São Paulo'),
(14087, 'UEHARA COSMETICOS', 'AVENIDA DOUTOR VITAL BRASIL - 569 - BUTANTA - São paulo - SP - 05503-001', 'Descoberto', 'Unhas', '(11) 2139-4650', 'https://www.instagram.com/uehara_cosmeticos/', '', 'RAFAEL T. U', '36.010.535/0001-90', '(11) 2387-7900', '2024-08-20 18:14:05', 'São Paulo', 'SP', 'escpolivalente@escpolivalente.com.br', 'Metropolitada São Paulo'),
(14088, 'COLORÊ MAKE UP', 'AVENIDA DEP JACOB SALVADOR ZVEIBIL, S/N - BUTANTA - SÃO PAULO/SP 05512-390', 'Descoberto', 'Unhas e Cilios', '(62) 3085-4605', 'https://www.instagram.com/coloremakeup_mix/', '', 'RAFAEL D. S. B', '48.826.681/0001-78', '', '2024-08-20 18:14:05', 'São Paulo', 'SP', '', 'Metropolitada São Paulo'),
(14089, 'Makibella Cosméticos', 'AVENIDA LEAO MACHADO, 100 - PARQUE CONTINENTAL - SÃO PAULO/SP 05328-020', 'Descoberto', '', '11976979956', 'https://www.instagram.com/makibellacosmeticos/', '', 'ANGELO / ADRIANA', '28.100.491/0001-61', '', '2024-08-20 18:14:05', 'SÃO PAULO (PARQUE CONTINENTAL)', 'SP', 'gerencia@angelbeauty.com.br', 'Metropolitada São Paulo'),
(14090, 'ANABELLY PERFUMARIA', 'Estr. do Campo Limpo, 3996 - Vila Pirajussara', 'Descoberto', '', '11 982344142', 'https://www.instagram.com/anabelly.perfumaria/', '', 'ARUAN', '39.602.577/0001-09', '', '2024-08-20 18:14:05', 'SÃO PAULO (Vila Pirajussara)', 'SP', '', 'Metropolitada São Paulo'),
(14091, 'BODY & BEAUTY', 'Av Corifeu de Azevedo Marques, 5069 - loja 7 - Open Mall Pátio Jaguaré - São Paulo/SP', 'Descoberto', 'UNHAS, CÍLIOS, SOBRANCELHA', '11 98822-8747', 'https://www.instagram.com/bodyebeauty', '', 'MARIA', '56.122.104/0001-23', '', '2024-08-20 18:14:05', 'SÃO PAULO (VILA LAGEADO)', 'SP', '', 'Metropolitada São Paulo'),
(14092, 'YUMEI COSMETICOS', 'PRACA ISAI LEINER, 131 - JARDIM BONFIGLIOLI - SÃO PAULO/SP 05592-140', 'Descoberto', '', '11995178178', 'https://www.instagram.com/yumeicosmeticos/', '', 'RAQUEL / SUNG ', '06.222.077/0001-92', '', '2024-08-20 18:14:05', 'SÃO PAULO (JARDIM BONFIGLIOLI)', 'SP', '', 'Metropolitada São Paulo'),
(14093, 'PINHEIROS COSMETICOS', 'R. Teodoro Sampaio, 1900 - Pinheiros, São Paulo - SP, 05406-150', 'Descoberto', '', '(11) 97528-0416', 'https://www.instagram.com/pinheiroscosmeticos', 'https://pinheiroscosmeticos.com.br/', 'KARINA', '20.390.496/0001-64', '', '2024-08-20 18:14:05', 'São Paulo (PINHEIROS)', 'SP', '', 'Metropolitada São Paulo'),
(14094, 'Fiklinda Perfumaria Jardim Ipanema', 'AVENIDA ALEXIOS JAFET, 1240 - JARDIM IPANEMA (ZONA OESTE) - SÃO PAULO/SP 05187-010', 'Descoberto', '', '11995300664', 'https://www.instagram.com/perfumaria_fiklinda/', '', 'ANDERSON', '09.628.282/0001-40', '', '2024-08-20 18:14:05', 'São Paulo (Jardim Ipanema)', 'SP', '', 'Metropolitada São Paulo'),
(14095, 'KENZO PERFUMARIA', 'AVENIDA ELISIO CORDEIRO DE SIQUEIRA, 779 - JARDIM SANTO ELIAS - SÃO PAULO/SP 05136-000', 'Descoberto', '', '1126406255', 'https://www.instagram.com/kenzoperfumaria.santoe]lias/', '', 'FERNANDO', '27.968.474/0001-88', '', '2024-08-20 18:14:05', 'São Paulo (Jardim Santo Elias)', 'SP', '', 'Metropolitada São Paulo'),
(14096, 'Sumirê Pinheiros', 'RUA TEODORO SAMPAIO - 2472 - PINHEIROS - São paulo - SP - 05406-200', 'Descoberto', '', '11940361633', 'https://www.instagram.com/sumirepinheiros/', '', 'RICARDO', '08.571.461/0001-26', '', '2024-08-20 18:14:05', 'São Paulo (PINHEIROS)', 'SP', '', 'Metropolitada São Paulo'),
(14097, 'AKIKO PERFUMARIA', 'AVENIDA CORIFEU DE A. MARQUES - 2144 - JARDIM RIZZO - São paulo - SP - 05582-001', 'Descoberto', '', '11 97762-4881', 'https://www.instagram.com/akikoperfumaria/', 'https://akikoperfumaria.com.br/', 'HELENA', '02.296.662/0001-86', '', '2024-08-20 18:14:05', 'São Paulo (JARDIM RIZZO)', 'SP', '', 'Metropolitada São Paulo'),
(14098, 'ANABEL COSMETICOS', 'RUA CEL RUBENS REIS REZENDE, 98 - JARDIM ARPOADOR - SÃO PAULO/SP 05565-180', 'Descoberto', '', '(11) 95608-8562', 'https://www.instagram.com/anabelcosmeticos_/', '', 'GIOVANNA', '34.063.593/0001-57', '', '2024-08-20 18:14:05', 'São Paulo (JARDIM ARPOADOR)', 'SP', '', 'Metropolitada São Paulo'),
(14099, 'Kaori Cosméticos', 'RUA PADRE JOAO DA CUNHA, 510 - JARDIM JOAO XXIII - SÃO PAULO/SP 05569-050', 'Descoberto', '', '11 95964-2486', 'https://www.instagram.com/kaori_cosmeticos/', 'https://kaorinaweb.com.br/', 'FLAVIA', '10.746.145/0001-90', '', '2024-08-20 18:14:05', 'São Paulo (JARDIM JOAO XXIII )', 'SP', '', 'Metropolitada São Paulo'),
(14100, 'DKELLY COSMETICOS', 'ESTRADA DO M BOI MIRIM, 1179 - JARDIM DAS FLORES - SÃO PAULO/SP 04905-021', 'Descoberto', '', '(11) 3853-8149', 'https://www.instagram.com/dkellycosmeticos/', '', 'OSVALDO', '23.371.178/0001-44', '', '2024-08-20 18:14:05', 'São Paulo (JARDIM DAS FLORES)', 'SP', '', 'Metropolitada São Paulo'),
(14101, 'PORTAL COSMETICOS', 'R. Prof. José Horácio Meirelles Teixeira, 1041 - LOJA 07 - Vila Suzana, São Paulo - SP, 05630-130', 'Descoberto', '', '11 981904849', 'https://www.instagram.com/portalcosmeticos.morumbi/', '', '', '02.634.976/0001-41', '', '2024-08-20 18:14:05', 'São Paulo (Vila Suzana)', 'SP', '', 'Metropolitada São Paulo'),
(14102, 'PADRAO COSMETICOS', 'RUA JOSE FILIPE DA SILVA, 274 - JARDIM ESTER - SÃO PAULO/SP 05372-040', 'Descoberto', '', '11956066265', 'https://www.instagram.com/padraocosmeticos/', '', 'VITOR', '11.767.830/0001-65', '', '2024-08-20 18:14:05', 'São Paulo (JARDIM ESTER)', 'SP', '', 'Metropolitada São Paulo'),
(14103, 'Perfumaria Belface Mais', 'RUA HEITOR PENTEADO - 1240 - SUMAREZINHO - São paulo - SP - 05438-100', 'Descoberto', '', '11 975733036', 'https://www.instagram.com/perfumariabelfacemais/', '', 'ELIZA', '07.967.998/0001-47', '', '2024-08-20 18:14:05', 'São Paulo (SUMAREZINHO)', 'SP', '', 'Metropolitada São Paulo'),
(14104, 'COMPANHIA DA BELEZA', 'ESTRADA CORONEL JOSE GLADIADOR, 120 - JARDIM ANHANGUERA - SÃO PAULO/SP 05267-000', 'Descoberto', '', '11995672545', 'https://www.instagram.com/ciada_beleza_/', '', 'OSMARI', '33.251.365/0001-48', '', '2024-08-20 18:14:05', 'São Paulo (JARDIM ANHANGUERA)', 'SP', '', 'Metropolitada São Paulo'),
(14105, 'BELLA COSMETICOS', 'RUA IRMAO JOAQUIM DO LIVRAMENTO, 76 - JARDIM JOAO XXIII - SÃO PAULO/SP 05569-000', 'Descoberto', '', '(11) 98168-9552', 'https://www.instagram.com/bellacosmeticosofficial/', '', 'ISABELA ', '24.222.299/0001-97', '', '2024-08-20 18:14:05', 'São Paulo (JARDIM JOAO XXIII)', 'SP', 'cristianeisabela450@gmail.com', 'Metropolitada São Paulo'),
(14106, 'Vila Olímpia Cosméticos', 'AVENIDA DR CARDOSO DE MELO, 1655 - VILA OLIMPIA - SÃO PAULO/SP 04548-005', 'Descoberto', '', '1138428336', 'https://www.instagram.com/vila.olimpiaa', '', 'CHEN', '49.605.885/0001-41', '(11) 98268-8190', '2024-08-20 18:14:05', 'São Paulo (VILA OLIMPIA)', 'SP', 'shen.73@hotmail.com', 'Metropolitada São Paulo'),
(14107, 'THEO COSMETICOS BELEZA', 'Estr. Pres. Juscelino K. de Oliveira, 4265 - Pimentas, Guarulhos - SP, 07252-000', 'Descoberto', 'Insta pouco utilizado porém loja esta aberta ainda, talvez eles tenham criado um novo que não encontrei', '11 950424472', 'https://www.instagram.com/theocosmeticosgru/', 'https://shopee.com.br/theocosmeticos?v=592', 'JANET', '48.880.484/0001-37', '(11) 95174-5406', '2024-08-20 18:14:05', 'São Paulo (Guarulhos)', 'SP', '', 'Metropolitada São Paulo'),
(14108, 'Dallila Cosméticos', 'RUA FRANCISCO DE SALES, 54 - JARDIM DAS PALMAS - SÃO PAULO/SP 05749-280', 'Descoberto', '', '11948717435', 'https://www.instagram.com/dallila264/', '', 'MILTON', '47.422.288/0001-56', '', '2024-08-20 18:14:05', 'São Paulo (JARDIM DAS PALMAS)', 'SP', '', 'Metropolitada São Paulo'),
(14109, 'CN BEAUTY Perfumaria e Salão de Beleza', 'AVENIDA DIOGENES RIBEIRO DE LIMA, 2407 - ALTO DE PINHEIROS - SÃO PAULO/SP 05458-001', 'Descoberto', 'Insta voltado para o salão mas também possui uma loja', '(11)98328-9061', 'https://www.instagram.com/cnbeauty.oficial/', '', 'NORMANDO', '47.409.001/0001-58', '(11)98328-9061', '2024-08-20 18:14:05', 'São Paulo (ALTO DE PINHEIROS)', 'SP', 'https://www.instagram.com/normspagliarone/', 'Metropolitada São Paulo'),
(14110, 'BELLA PERFUMARIA E COSMETICO', 'RUA JOSE MARIA PINTO ZILLI, 328 - JARDIM DAS PALMAS - SÃO PAULO/SP 05749-300', 'Descoberto', '', '(11) 5843-8433', 'https://www.instagram.com/bellaperfumaria/', 'https://shopee.com.br/bellapalmas?smtt=0.0.9', 'GUILHERME', '33.212.207/0001-89', '', '2024-08-20 18:14:05', 'São Paulo (JARDIM DAS PALMAS)', 'SP', '', 'Metropolitada São Paulo'),
(14111, 'CLIN COSMETICOS', 'RUA TEODORO SAMPAIO, 515 - PINHEIROS - SÃO PAULO/SP 05405-000', 'Descoberto', '', '1130863876', 'https://www.instagram.com/CLINCOSMETICOS', 'https://www.clincosmeticos.com.br/', 'RICARDO', '02.387.404/0001-05', '', '2024-08-20 18:14:05', 'São Paulo (PINHEIROS)', 'SP', 'ricardo@clincosmeticos.com', 'Metropolitada São Paulo'),
(14112, 'YUMEI COSMETICOS', 'PRACA ISAI LEIRNER, 131 - JARDIM BONFIGLIOLI - SÃO PAULO/SP 05592-140', 'Descoberto', '', '11995178178', 'https://www.instagram.com/yumeicosmeticos/', 'https://yumeicosmeticos.com.br/', '', '47.888.085/0001-50', '', '2024-08-20 18:14:05', 'São Paulo (JARDIM BONFIGLIOLI)', 'SP', '', 'Metropolitada São Paulo'),
(14113, 'Planet Nails', 'RUA PRESIDENTE CASTELO BRANCO - 253 - CENTRO - Osasco - SP - 06016-020', 'Descoberto', 'UNHAS', '11 99903-3344', 'https://www.instagram.com/planetnailsbr', 'https://planetnails.com.br/', 'ALMA', '22.250.655/0001-50', '', '2024-08-20 18:14:05', 'SÃO PAULO (OSASCO)', 'SP', '', 'Metropolitada São Paulo'),
(14114, 'CompreBis', 'AVENIDA CRISANTEMO - 169 - JARDIM DAS FLORES - Osasco - SP - 06112-100', 'Descoberto', 'UNHAS, CÍLIOS, SOBRANCELHA', '1136829749', 'https://www.instagram.com/comprebis', 'https://www.comprebis.com.br/', 'GUSTAVO', '21.376.309/0001-50', '', '2024-08-20 18:14:05', 'SÃO PAULO (OSASCO)', 'SP', '', 'Metropolitada São Paulo'),
(14115, 'ESPAÇO MULHER', 'ESTRADA SANTA EUGENIA, 19 - LOJA C -  PACIENCIA - RIO DE JANEIRO/RJ 23585-430', 'Descoberto', 'Unhas, cílios e sobrancelha (Muitos produtos para profissionais)', '2134264146', 'https://www.instagram.com/espacomulherpaciencia/', '', 'RENATA', '21.831.255/0001-76', '', '2024-08-20 18:14:05', 'São Paulo (PACIENCIA)', 'SP', 'espacomulherpaciencia@gmail.com', 'Metropolitada São Paulo'),
(14116, 'SONEDA PERFUMARIA', 'RUA LEITE DE MORAIS, 100 - SANTANA - SÃO PAULO/SP 02034-020', 'Descoberto', 'UNHAS, SOBRANCELHA, CÍLIOS', '11910723004', 'https://www.instagram.com/sonedaperfumaria/', 'https://www.soneda.com.br/', '', '07.116.306/0008-23', '', '2024-08-20 18:14:05', 'SÃO PAULO (SANTANA)', 'SP', '', 'Metropolitada São Paulo'),
(14117, 'Perfumaria Sumirê Lapa', 'RUA VOLUNTARIOS DA PATRIA - 2181 - SANTANA - São paulo - SP - 02011-500', 'Descoberto', 'UNHAS', ' (11) 3831-5064', 'https://www.instagram.com/sumire.lapa/', 'http://sumirelapa.com.br/', 'Diogo', '43.582.584/0004-06', '', '2024-08-20 18:14:05', 'SÃO PAULO (SANTANA)', 'SP', 'dharamaki@hotmail.com', 'Metropolitada São Paulo'),
(14118, 'PERFUMARIA GOYA', 'AVENIDA GUILHERME COTCHING - 1933 - VILA MARIA - São paulo - SP - 02113-017 - Unidade de Vila Maria', 'Descoberto', 'UNHAS, SOBRANCELHA, CÍLIOS', '(11) 95319-9970', 'https://www.instagram.com/goyaperfumaria_oficial/', 'https://goyaperfumaria.com.br/', 'Alessandra', '07.163.864/0001-73', '', '2024-08-20 18:14:05', 'SÃO PAULO (VILA MARIA)', 'SP', '', 'Metropolitada São Paulo'),
(14119, 'YUKIHIRO TAKARA PERFUMARIA', 'RUA DOUTOR CESAR, 262 - SANTANA - SÃO PAULO/SP 02013-001', 'Descoberto', 'CÍLIOS', '1147421606', 'https://www.instagram.com/takrabeauty', '', '', '01.567.303/0001-53', '', '2024-08-20 18:14:05', 'SÃO PAULO (SANTANA)', 'SP', '', 'Metropolitada São Paulo'),
(14120, 'ALIZE PERFUMARIA E COSMETICOS ', 'RUA DR. CESAR CASTIGLIONI JUNIOR - 310 - CASA VERDE - São paulo - SP - 02515-000', 'Descoberto', 'UNHAS, SOBRANCELHA, CÍLIOS', '11989176520', 'https://www.instagram.com/alizeperfumaria/', 'https://alizeperfumaria.com.br/', 'Ana / Fabiana', '07.971.032/0001-83', '', '2024-08-20 18:14:05', 'SÃO PAULO ( CASA VERDE)', 'SP', '', 'Metropolitada São Paulo'),
(14121, 'Gloss Cosméticos Tremembe', 'AVENIDA CEL SEZEFREDO FAGUNDES - 2727 - TUCURUVI - São paulo - SP - 02306-003', 'Descoberto', 'UNHAS, SOBRANCELHA', '11953524808', 'https://www.instagram.com/glosstremembe_rm/', '', '', '12.081.333/0001-71', '', '2024-08-20 18:14:05', 'SÃO PAULO (TUCURUVI)', 'SP', '', 'Metropolitada São Paulo'),
(14122, 'VITOR STUDIO COSMETICOS', 'PRACA DOM PEDRO FULCO MORVIDI - 14 - VILA PEREIRA BARRETO - PIRITUBA - São paulo - SP - 02920-020', 'Descoberto', '', '(11) 94503-1674', 'https://www.instagram.com/vitorstudio/', 'https://www.vitorstudio.com.br/', 'JULIANA / SIMONE', '11.031.919/0001-69', '', '2024-08-20 18:14:05', 'SÃO PAULO (PIRITUBA)', 'SP', 'juliana@vitorstudio.com.br', 'Metropolitada São Paulo'),
(14123, 'COSMETICOS MENSORE', 'R. Bonifácio Cubas, 164 - Vila Albertina São Paulo - SP', 'Descoberto', '', '11 2619-2145', 'https://www.instagram.com/perfumaria_mensore', '', 'SUELI / KAREN ', '59.661.405/0001-13', '', '2024-08-20 18:14:05', 'SÃO PAULO (Vila Albertina)', 'SP', '', 'Metropolitada São Paulo'),
(14124, 'Bella Acto Maquiagens', 'RUA ALCANTARA - 195 - VILA MARIA BAIXA - São paulo - SP - 02110-010', 'Descoberto', 'UNHAS, SOBRANCELHA, CÍLIOS', '11972464619', 'https://www.instagram.com/bellaacto', 'https://www.bellaacto.com.br/', 'RICARDO', '17.152.833/0001-70', '', '2024-08-20 18:14:05', 'SÃO PAULO (VILA MARIA BAIXA)', 'SP', '', 'Metropolitada São Paulo'),
(14125, 'OZZI PERFUMARIA', 'RUA ANTONIO DE NAPOLI - 68 - PARADA - São paulo - SP - 02987-030', 'Descoberto', '', '(11) 98665-0810', 'https://www.instagram.com/ozziperfumaria/', '', 'REINALDO / REGINA', '30.810.524/0001-09', '', '2024-08-20 18:14:05', 'SÃO PAULO (PARADA DE TAIPAS)', 'SP', '', 'Metropolitada São Paulo'),
(14126, 'PERFUMARIA MALIZIA', 'AVENIDA DEP EMILIO CARLOS, 1240 - BAIRRO DO LIMAO - SÃO PAULO/SP 02720-100', 'Descoberto', '', '(11) 3966-5018', 'https://www.instagram.com/pmaliz/', '', 'NELSON / NEUSA', '60.497.906/0001-95', '', '2024-08-20 18:14:05', 'SÃO PAULO (BAIRRO DO LIMAO)', 'SP', '', 'Metropolitada São Paulo'),
(14127, 'Meg\'s Perfumaria', 'AVENIDA ROLAND GARROS - 1.641 - JARDIM BRASIL (ZONA NORTE) - São paulo - SP - 02235-001', 'Descoberto', '', '11 43292215', 'https://www.instagram.com/megsperfumaria/', '', 'ALTIERES', '17.134.080/0001-70', '', '2024-08-20 18:14:05', 'SÃO PAULO (JARDIM BRASIL)', 'SP', '', 'Metropolitada São Paulo'),
(14128, 'Gloss Cosméticos', 'AVENIDA PARADA PINTO - 164 - VILA NOVA CACHOEIRINHA - São paulo - SP - 02611-002', 'Descoberto', '', '11932002440', 'https://www.instagram.com/glosscachoeirinha/', '', 'SILMARA / RAFAEL / MARCIA', '44.211.057/0001-05', '', '2024-08-20 18:14:05', 'São Paulo (Vila Nova Cachoeirinha)', 'SP', '', 'Metropolitada São Paulo'),
(14129, 'Encantti Perfumaria', 'RUA PAULINO DE BRITO - 29 - JARDIM BRASIL (ZONA NORTE) - São paulo - SP - 02223-010', 'Descoberto', '', '(11) 99549-1071', 'https://www.instagram.com/encantti.perfumaria/channel/', '', 'RICARDO / CINTIA', '55.742.241/0001-06', '', '2024-08-20 18:14:05', 'SÃO PAULO (JARDIM BRASIL)', 'SP', '', 'Metropolitada São Paulo'),
(14130, 'DML Perfumaria & Cosméticos', 'AVENIDA PAULA FERREIRA - 1690 - FREGUESIA DO O - São paulo - SP - 02916-000', 'Descoberto', '', '11971218757', 'https://www.instagram.com/dmlcosmeticos/', '', '', '52.694.866/0001-43', '', '2024-08-20 18:14:05', 'SÃO PAULO (FREGUESIA DO O)', 'SP', '', 'Metropolitada São Paulo'),
(14131, 'Perfumaria Uehara Cerejeiras', 'AVENIDA DAS CEREJEIRAS, 1333 - JARDIM JAPAO - SÃO PAULO/SP 02124-001', 'Descoberto', '', '(11)99439-1116', 'https://www.instagram.com/ueharaperfumaria_/', '', 'CLAUDIO ROBERTO', '07.686.539/0001-95', '', '2024-08-20 18:14:05', 'SÃO PAULO (JARDIM JAPAO)', 'SP', 'robertouehara@hotmail.com', 'Metropolitada São Paulo'),
(14132, 'invite Perfumaria', 'AVENIDA IMIRIM, 2191 - IMIRIM - SÃO PAULO/SP 02465-200', 'Descoberto', '', '11 98294 1504', 'https://www.instagram.com/inviteperfumaria/', '', 'CINTIA', '69.071.058/0001-22', '', '2024-08-20 18:14:05', 'SÃO PAULO (IMIRIM)', 'SP', '', 'Metropolitada São Paulo'),
(14133, 'Perfumaria Orquídea', 'AVENIDA ITABERABA, 1939 - ITABERABA - SÃO PAULO/SP 02739-000', 'Descoberto', '', '11 3976-9635', 'https://www.instagram.com/perfumaria_orquidea/', '', 'MADALENA', '02.404.610/0001-86', '', '2024-08-20 18:14:05', 'SÃO PAULO (ITABERABA)', 'SP', '', 'Metropolitada São Paulo'),
(14134, 'PERFUMARIA FUKUROU', 'RUA FRIEDRICH VON VOITH, 53 - JARDIM SAO JOAO (JARAGUA) - SÃO PAULO/SP 02995-000', 'Descoberto', '', '11 3947-9007', 'https://www.instagram.com/perfumaria_fukurou/', '', 'MURILO', '38.016.211/0001-95', '', '2024-08-20 18:14:05', 'SÃO PAULO (JARDIM SAO JOAO)', 'SP', '', 'Metropolitada São Paulo'),
(14135, 'PERFUMARIA MILLENIUN', 'AVENIDA ADOLFO COELHO, 925 - LAUZANE PAULISTA - SÃO PAULO/SP 02443-000', 'Descoberto', '', '11969935398', 'https://www.instagram.com/milleniumperfumaria/', '', 'GILDASIO', '03.415.235/0001-32', '', '2024-08-20 18:14:05', 'SÃO PAULO (LAUZANE PAULISTA)', 'SP', '', 'Metropolitada São Paulo'),
(14136, 'TSURU PERFUMARIA  ', 'AVENIDA JULIO BUONO, 1987 - VILA GUSTAVO - SÃO PAULO/SP 02201-001', 'Descoberto', '', '1136281427', 'https://www.instagram.com/tsuru_perfumaria/', '', 'RODRIGO', '02.035.986/0001-60', '(11) 96954-6965', '2024-08-20 18:14:05', 'SÃO PAULO (VILA GUSTAVO)', 'SP', '', 'Metropolitada São Paulo'),
(14137, 'PERFUMARIA ORVALHO', 'AVENIDA GENERAL ATALIBA LEONEL, 2780 - PARADA INGLESA - SÃO PAULO/SP 02242-000', 'Descoberto', '', '11 911242892', 'https://www.instagram.com/perfumariaorvalho/', 'https://shopee.com.br/perfumaria.orvalho', 'GUILHERME', '05.649.062/0001-42', '', '2024-08-20 18:14:05', 'SÃO PAULO (PARADA INGLESA)', 'SP', '', 'Metropolitada São Paulo'),
(14138, 'Ella Perfumaria', 'AVENIDA AGUIA DE HAIA, 3856 - JARDIM SORAIA - SÃO PAULO/SP 03889-000', 'Descoberto', '', '(11)93422-4267', 'https://www.instagram.com/ellaperfumaria1/', '', 'CLAUDENIA', '14.089.923/0001-76', '', '2024-08-20 18:14:05', 'SÃO PAULO (JARDIM SORAIA)', 'SP', '', 'Metropolitada São Paulo'),
(14139, 'IMPERIO DA BELEZA', 'RUA ZILDA - 527 - CASA VERDE ALTA - São paulo - SP - 02545-000', 'Descoberto', '', '11 982823611', 'https://www.instagram.com/imperiodabeleza_new/', '', 'JEAN / ANA', '45.434.216/0001-01', '', '2024-08-20 18:14:05', 'SÃO PAULO (CASA VERDE ALTA)', 'SP', '', 'Metropolitada São Paulo'),
(14140, 'Perfumaria Iara', 'RUA APARECIDA DO TABOADO - 1166 - JARDIM PAULISTANO (ZONA NORTE) - São paulo - SP - 02814-000', 'Descoberto', '', '11 993777998', 'https://www.instagram.com/perfumaria_iara23/', '', 'DAIANE', '48.357.608/0001-02', '', '2024-08-20 18:14:05', 'SÃO PAULO (JARDIM PAULISTANO)', 'SP', '', 'Metropolitada São Paulo'),
(14141, 'PERFUMARIA MIRANTE', 'AVENIDA MIGUEL DE CASTRO, 1678 - VILA PEREIRA BARRETO - SÃO PAULO/SP 02950-000', 'Descoberto', '', '(11) 99184-2936', 'https://www.instagram.com/perfumariamirante_/', 'https://perfumariamirante.com.br/', 'FARLEY', '22.470.628/0001-93', '', '2024-08-20 18:14:05', 'SÃO PAULO (VILA PEREIRA BARRETO)', 'SP', '', 'Metropolitada São Paulo'),
(14142, 'Perfumaria Hiromi', 'RUA BARAO DE JUNDIAI, 976 - CENTRO - JUNDIAÍ/SP 13201-012', 'Descoberto', 'Possuí loja em SP também', '11932502138', 'https://www.instagram.com/hiromioficial/', '', 'MATEUS / FLAVIA', '45.198.490/0001-10', '', '2024-08-20 18:14:05', 'SÃO PAULO (JUNDIAÍ)', 'SP', '', 'Metropolitada São Paulo'),
(14143, 'PERFUMARIA MENSORE', 'RUA BONIFACIO CUBAS, 164 - VILA ALBERTINA - SÃO PAULO/SP 02731-000', 'Descoberto', '', '1126192145', 'https://www.instagram.com/perfumaria_mensore', '', 'LUCAS', '52.323.776/0001-46', '', '2024-08-20 18:14:05', 'SÃO PAULO (VILA ALBERTINA)', 'SP', 'lucas.s.marasco@gmail.com', 'Metropolitada São Paulo'),
(14144, 'RENI PERFUMARIA', 'AVENIDA EDE, 97 - VILA EDE - SÃO PAULO/SP 02203-000', 'Descoberto', '', '11977045758', 'https://www.instagram.com/reniperfumaria/', '', 'RENI', '14.922.396/0001-39', '', '2024-08-20 18:14:05', 'SÃO PAULO (VILA EDE)', 'SP', '', 'Metropolitada São Paulo'),
(14145, 'AMO MEU ESTILO UNHAS', 'RUA CAPITAO LUIS RAMOS - 306 - VILA GUILHERME - São paulo - SP - 02066-011', 'Descoberto', 'UNHAS', '11 981597200', 'https://www.instagram.com/amomeuestilounhas/?hl=en', 'joyceviana87@gmail.com', 'Joyce', '40.914.870/0001-90', '', '2024-08-20 18:14:05', 'SÃO PAULO (VILA GUILHERME)', 'SP', 'joyceviana87@gmail.com', 'Metropolitada São Paulo'),
(14146, 'ACESSORIOS DE UNHAS LUANA', '', 'Descoberto', 'UNHAS, CÍLIOS E SOBRANCELHA', '11 96998-0181', 'https://www.instagram.com/acessoriosunhasluana/', '', 'JOSE', '39.417.433/0001-82', '', '2024-08-20 18:14:05', 'SÃO PAULO (VILA RICA)', 'SP', '', 'Metropolitada São Paulo'),
(14147, 'x da beleza', 'AVENIDA ITABERABA, 456 - NOSSA SENHORA DO O - SÃO PAULO/SP 02734-000', 'Descoberto', 'UNHAS, CÍLIOS E SOBRANCELHA', '11963110656', 'https://www.instagram.com/xdabeleza/', 'alexandre.acassio@hotmail.com', 'ALEXANDRE', '18.134.392/0001-47', '', '2024-08-20 18:14:05', 'SÃO PAULO (NOSSA SENHORA DO O)', 'SP', 'alexandre.acassio@hotmail.com', 'Metropolitada São Paulo'),
(14148, 'UEHARA NAILS', 'AVENIDA EDU CHAVES, 694 - PARQUE EDU CHAVES - SÃO PAULO/SP 02229-000', 'Descoberto', 'UNHAS, CÍLIOS ', '11 99934-0694', 'https://www.instagram.com/ueharanails.educhaves/', '', 'MAKOTO', '51.274.787/0001-10', '(11) 99979-3012', '2024-08-20 18:14:05', 'SÃO PAULO (PARQUE EDU CHAVES)', 'SP', '', 'Metropolitada São Paulo'),
(14149, 'PEROLA ROSA', 'RUA VINTE DE MARCO - 05 - JARDIM FELICIDADE - São paulo - SP - 02326-115', 'Descoberto', 'Unhas, cílios e sobrancelha', '11973639088', 'https://www.instagram.com/perola.rosaaa/', '', 'VANESSA', '30.023.308/0001-13', '', '2024-08-20 18:14:05', 'São Paulo (JARDIM FELICIDADE)', 'SP', '', 'Metropolitada São Paulo'),
(14150, 'UEHARA NAILS', 'RUA FELICIO MARCONDES - 440 - CENTRO - Guarulhos - SP - 07010-030', 'Descoberto', 'UNHAS, CÍLIOS E SOBRANCELHA', '(11) 99104-0945', 'https://www.instagram.com/ueharanails/', '', 'EDWIN', '39.839.771/0001-02', '', '2024-08-20 18:14:05', 'São Paulo (Guarulhos)', 'SP', '', 'Metropolitada São Paulo'),
(14151, 'NIKKEY  COSMETICOS ', 'RUA COELHO LISBOA - 382 - TATUAPE - São paulo - SP - 03323-040', 'Descoberto', 'UNHAS, SOBRANCELHA, CÍLIOS', ' (11) 3455-3333', 'https://www.instagram.com/nikkeycosmeticos/', 'https://www.nikkeycosmeticos.com.br/', '', '52.742.574/0001-39', '', '2024-08-20 18:14:05', 'SÃO PAULO (TATUAPE)', 'SP', '', 'Metropolitada São Paulo'),
(14152, 'PERFUMARIA IMIRA ', 'AVENIDA MATEO BEI - 3282 - SAO MATEUS - São paulo - SP - 03949-300', 'Descoberto', '', '(11) 99336-6086', 'https://www.instagram.com/perfumariaimira/', '', 'Sergio', '03.997.711/0001-70', '', '2024-08-20 18:14:05', 'SÃO PAULO (SÃO MATEUS)', 'SP', '', 'Metropolitada São Paulo'),
(14153, ' UEHARA COSMÉTICOS', 'RUA PADRE VIEGAS DE MENEZES - 365 - ITAQUERA - São paulo - SP - 08220-510', 'Descoberto', '', ' (11) 2079-0126', 'https://www.instagram.com/uehara_cosmeticos/', '', 'Rafael', '23.244.963/0001-36', '', '2024-08-20 18:14:05', 'SÃO PAULO (ITAQUERA)', 'SP', '', 'Metropolitada São Paulo'),
(14154, 'BELFACE PERFUMARIA', 'RUA VICTORIO SANTIM - 29 - ITAQUERA - São paulo - SP - 08290-001', 'Descoberto', '', '11 984817897', 'https://www.instagram.com/belface_perfumaria/', '', 'Lusia', '24.535.999/0001-31', '', '2024-08-20 18:14:05', 'SÃO PAULO (ITAQUERA)', 'SP', '', 'Metropolitada São Paulo'),
(14155, 'Vou de Make ', 'RUA DOS CAMPINEIROS - 441 - MOOCA - São paulo - SP - 03167-020', 'Descoberto', 'UNHAS, CÍLIOS', '11947119589', 'https://www.instagram.com/_voudemake', 'https://www.voudemake.com.br/', '', '13.440.504/0001-74', '', '2024-08-20 18:14:05', 'SÃO PAULO (MOOCA)', 'SP', '', 'Metropolitada São Paulo'),
(14156, 'PERFUMARIA BELEZA & CIA', 'RUA TUIUTI - 1.443 - TATUAPE - São paulo - SP - 03081-012', 'Descoberto', 'UNHAS', '11970816444', 'https://www.instagram.com/belezaeciaperfumaria', 'https://www.belezaeciaperfumaria.com.br/', '', '11.242.888/0001-95', '', '2024-08-20 18:14:05', 'SÃO PAULO (TATUAPÉ)', 'SP', '', 'Metropolitada São Paulo'),
(14157, 'KELNI PERFUMARIA', 'AVENIDA TENENTE LAUDELINO FERREIRA DO AMARAL - 141 - VILA JACUI - São paulo - SP - 08060-000', 'Descoberto', 'UNHAS, CÍLIOS', '11956862499', 'https://www.instagram.com/kelniperfumariaecosmeticos/?hl=pt', '', 'Aroldo', '18.957.293/0001-65', '', '2024-08-20 18:14:05', 'SÃO PAULO (VILA JACUI)', 'SP', '', 'Metropolitada São Paulo'),
(14158, 'BELLA COSMETICOS', 'AVENIDA FLAMINGO, 234 - VILA CURUCA - SÃO PAULO/SP 08031-000', 'Descoberto', '', '11 993671206', 'https://www.instagram.com/bellacosmeticos_curuca/', 'https://disprobelle.mercadoshops.com.br/', '', '03.954.536/0001-34', '', '2024-08-20 18:14:05', 'SÃO PAULO (VILA CURUCA)', 'SP', '', 'Metropolitada São Paulo'),
(14159, 'A PRONTA ENTREGA', 'AVENIDA PARANAGUA, 1764 - ERMELINO MATARAZZO - SÃO PAULO/SP 03806-000', 'Descoberto', 'UNHAS', '(11) 96407-8993', 'https://www.instagram.com/aprontaentrega', 'https://shopee.com.br/prontaentregaparanagua', 'Deyse', '14.823.724/0001-40', '', '2024-08-20 18:14:05', 'SÃO PAULO ( ERMELINO MATARAZZO)', 'SP', '', 'Metropolitada São Paulo'),
(14160, 'Ozzi Ozzi Perfumaria', 'RUA MARCIO BECK MACHADO, 98 - CIDADE TIRADENTES - SÃO PAULO/SP 08485-455', 'Descoberto', 'UNHAS', '(11)93212-3099', 'https://www.instagram.com/ozzi_tiradentes/', '', '', '19.397.233/0001-06', '', '2024-08-20 18:14:05', 'SÃO PAULO ( CIDADE TIRADENTES)', 'SP', '', 'Metropolitada São Paulo'),
(14161, 'Perfumaria Júlia', 'AVENIDA DR. EDUARDO COTCHING - 1904 - VILA FORMOSA - São paulo - SP - 03356-001', 'Descoberto', 'UNHAS', '1126742834', 'https://www.instagram.com/perfumariajulia', 'https://shopee.com.br/perfumariajulia', '', '03.091.905/0001-02', '', '2024-08-20 18:14:05', 'SÃO PAULO (VILA FORMOSA)', 'SP', '', 'Metropolitada São Paulo'),
(14162, 'Perfumaria Takeo', 'AVENIDA DR EDUARDO COTCHING, 2456 - VILA FORMOSA - SÃO PAULO/SP 03356-001', 'Descoberto', 'UNHAS, SOBRANCELHA, CÍLIOS', '11999281234', 'https://www.instagram.com/perfumariatakeo/', '', 'Tamilyn', '61.791.406/0001-24', '', '2024-08-20 18:14:05', 'SÃO PAULO (VILA FORMOSA)', 'SP', '', 'Metropolitada São Paulo'),
(14163, 'OLHA SO QUE BELLA', 'RUA DA MOOCA - 3845 - MOOCA - São paulo - SP - 03165-001', 'Descoberto', 'UNHAS', '11987393511', 'https://www.instagram.com/olhasoquebella/', 'https://olhasoquebella.com.br/olhasoquebella', 'Agnes', '41.131.950/0001-32', '', '2024-08-20 18:14:05', 'SÃO PAULO (MOOCA)', 'SP', '', 'Metropolitada São Paulo'),
(14164, 'GLOW MAKEUP', 'AVENIDA MATEO BEI - 2373 - SAO MATEUS - São paulo - SP - 03949-012', 'Descoberto', 'UNHAS', '11 971253750', 'https://www.instagram.com/gloow_makeupp', '', 'Darleide', '40.798.929/0001-22', '(11) 97061-6339', '2024-08-20 18:14:05', 'SÃO PAULO (SÃO MATEUS)', 'SP', 'darleidelopes@gmail.com', 'Metropolitada São Paulo'),
(14165, 'AIMI COSMETICOS', 'ESTRADA DO LAGEADO VELHO - 538 - GUAIANAZES - São paulo - SP - 08451-000', 'Descoberto', 'UNHAS', '11930835138', 'https://www.instagram.com/aimi.cosmeticos/', 'https://www.aimicosmeticos.com.br/', 'Nilton', '37.039.067/0001-40', '', '2024-08-20 18:14:05', 'SÃO PAULO ( GUAIANAZES)', 'SP', '', 'Metropolitada São Paulo'),
(14166, 'CAMARIM VIP COSMETICOS', 'RUA APUCARANA - 634 - TATUAPE - São paulo - SP - 03311-000', 'Descoberto', 'UNHAS', '11945754832', 'https://www.instagram.com/camarimvipperfumaria/', '', 'Eliana', '19.175.875/0001-52', '', '2024-08-20 18:14:05', 'SÃO PAULO (TATUAPE)', 'SP', '', 'Metropolitada São Paulo'),
(14167, 'JULIAN COSMETICOS', 'AVENIDA TIBURCIO DE SOUZA - 1.695 - ITAIM PAULISTA - São paulo - SP - 08140-000', 'Descoberto', 'UNHAS', '11 94587-2617', 'https://www.instagram.com/julian_cosmeticos/ - https://www.instagram.com/julian_cosmeticos.perfumaria/', '', 'Julio', '07.964.718/0001-47', '', '2024-08-20 18:14:05', 'SÃO PAULO (ITAIM PAULISTA)', 'SP', '', 'Metropolitada São Paulo'),
(14168, 'FLESH PERFUMARIA', 'AVENIDA SAPOPEMBA, 5691 - SAPOPEMBA - SÃO PAULO/SP 03374-001', 'Descoberto', 'UNHAS', '11997020692', 'https://www.instagram.com/perfumaria_flesh/', '', 'Marcio', '19.583.774/0001-10', '', '2024-08-20 18:14:05', 'SÃO PAULO (SAPOPEMBA)', 'SP', '', 'Metropolitada São Paulo'),
(14169, 'Teruya Perfumaria', 'AVENIDA MATEO BEI, 1545 - SAO MATEUS - SÃO PAULO/SP 03949-011', 'Descoberto', 'UNHAS, SOBRANCELHA, CÍLIOS', '(11) 97437-7979', 'https://www.instagram.com/teruyaperfumaria/', 'https://www.teruyaperfumaria.com.br/', '', '60.687.522/0002-16', '', '2024-08-20 18:14:05', 'SÃO PAULO (SAO MATEUS)', 'SP', '', 'Metropolitada São Paulo'),
(14170, 'Ultra Leste Perfumaria', 'AVENIDA MARIA LUIZA AMERICANO, 1.126 - CIDADE LIDER - SÃO PAULO/SP 08275-000', 'Descoberto', 'UNHAS, SOBRANCELHA, CÍLIOS', '11 986653015', 'https://www.instagram.com/perfumariaultraleste/', '', 'Miguel', '26.752.293/0001-57', '', '2024-08-20 18:14:05', 'SÃO PAULO (CIDADE LIDER)', 'SP', '', 'Metropolitada São Paulo'),
(14171, 'Perfumaria Imira', 'AVENIDA MATEO BEI - 2920 - SAO MATEUS - São paulo - SP - 03949-300', 'Descoberto', 'UNHAS, CÍLIOS', '11 99336 6086', 'https://www.instagram.com/perfumariaimira/', '', 'Cristiane', '29.085.306/0001-70', '', '2024-08-20 18:14:05', 'SÃO PAULO (SAO MATEUS)', 'SP', '', 'Metropolitada São Paulo'),
(14172, 'THANAR COSMETICOS ', 'AVENIDA CELSO GARCIA, 4729 - TATUAPE - SÃO PAULO/SP 03063-000', 'Descoberto', '', '11963116323', 'https://www.instagram.com/thanarperfumaria/', '', 'Sergio', '07.693.184/0001-61', '', '2024-08-20 18:14:05', 'SÃO PAULO (TATUAPE)', 'SP', '', 'Metropolitada São Paulo'),
(14173, 'X MAX COSMETICOS ', 'AVENIDA SAPOPEMBA, 3889 - SAPOPEMBA - SÃO PAULO/SP 03374-000', 'Descoberto', 'UNHAS', '(11) 2506-3748', 'https://www.instagram.com/xmaxcosmeticos/', '', '', '13.581.433/0001-20', '', '2024-08-20 18:14:05', 'SÃO PAULO (SAPOEMBA)', 'SP', '', 'Metropolitada São Paulo'),
(14174, ' LUMI COSMETICOS ', 'RUA SALVADOR GIANETTI, 1014 - GUAIANAZES - SÃO PAULO/SP 08410-000', 'Descoberto', 'UNHAS', '11 976294401', 'https://www.instagram.com/perfumarialumi/', 'https://www.lumistore.com.br/', '', '07.142.160/0005-48', '', '2024-08-20 18:14:05', 'SÃO PAULO (GUAIANAZES)', 'SP', '', 'Metropolitada São Paulo'),
(14175, 'PADRON PERFUMARIA', 'AVENIDA MATEO BEI - 3106 - SAO MATEUS - São paulo - SP - 03949-300', 'Descoberto', 'UNHAS, SOBRANCELHA, CÍLIOS', '1142242311', 'https://www.instagram.com/padronperfumaria/', 'https://www.padronperfumaria.com.br/', '', '62.245.881/0006-72', '', '2024-08-20 18:14:05', 'SÃO PAULO (SAO MATEUS)', 'SP', '', 'Metropolitada São Paulo'),
(14176, 'Perfumaria Popó', 'AVENIDA CELSO GARCIA, 3902 - TATUAPE - SÃO PAULO/SP 03064-000', 'Descoberto', 'UNHAS', '11987772061', 'https://www.instagram.com/perfumariapopo/', '', '', '03.404.684/0001-85', '', '2024-08-20 18:14:05', 'SÃO PAULO (TATUAPE)', 'SP', '', 'Metropolitada São Paulo'),
(14177, 'MARIA\'S PERFUMARIA', 'AVENIDA LIDER - 1742 - CIDADE LIDER - São paulo - SP - 08280-005', 'Descoberto', 'UNHAS, SOBRANCELHA, CÍLIOS', '11 963357994', 'https://www.instagram.com/mariasperfumaria_/', '', '', '17.083.273/0001-40', '', '2024-08-20 18:14:05', 'SÃO PAULO (TATUAPE)', 'SP', '', 'Metropolitada São Paulo'),
(14178, 'Perfumaria Espaço da Beleza', 'RUA DOM JOSE ANTONIO COUTO - 13 - GUAIANAZES - São paulo - SP - 08452-270', 'Descoberto', '', '(11) 2553-2170', 'https://www.instagram.com/perfumaria.graca/', '', '', '05.867.012/0001-31', '', '2024-08-20 18:14:05', 'SÃO PAULO (GUAIANAZES)', 'SP', '', 'Metropolitada São Paulo'),
(14179, 'Bruna Perfumaria', 'AVENIDA CANGAIBA - 2559 - CANGAIBA - São paulo - SP - 03711-007', 'Descoberto', '', '11945778994', 'https://www.instagram.com/bruna.perfumaria/', '', 'Tainara', '43.705.757/0001-93', '', '2024-08-20 18:14:05', 'SÃO PAULO (CANGAIBA)', 'SP', '', 'Metropolitada São Paulo'),
(14180, 'MISS ANGEL COSMETICOS', 'AVENIDA DR EDUARDO COTCHING, 2163 - VILA FORMOSA - SÃO PAULO/SP 03356-001', 'Descoberto', 'UNHAS, SOBRANCELHA, CÍLIOS', '11945786710', 'https://www.instagram.com/missangel_cosmeticos/', '', 'Valquiria', '47.275.362/0001-59', '', '2024-08-20 18:14:05', 'SÃO PAULO (VILA FORMOSA)', 'SP', '', 'Metropolitada São Paulo'),
(14181, 'RAYZA PERFUMARIA', 'Av. Santista, 1196 - Jardim Jaú (Zona Leste), São Paulo - SP, 04884-170', 'Descoberto', 'UNHAS, SOBRANCELHA', '11945985803', 'https://www.instagram.com/rayzaperfumaria/', '', 'SUZA / RAYMOND', '48.079.569/0001-10', '', '2024-08-20 18:14:05', 'SÃO PAULO (JARDIM JAÚ)', 'SP', 'suzyrutte30@gmail.com', 'Metropolitada São Paulo'),
(14182, 'PERFUMARIA NOVO ESTILO', 'RUA JACAREANA - 29 - JARDIM CAMARGO NOVO - São paulo - SP - 08121-425', 'Descoberto', 'UNHAS, SOBRANCELHA, CÍLIOS', '11945453208', 'https://www.instagram.com/perfumarianovoestilo/', '', 'RICARDO', '00.574.575/0001-18', '', '2024-08-20 18:14:05', 'SÃO PAULO (JARDIM CAMARGO NOVO)', 'SP', 'ricardo.mk@uol.com.br', 'Metropolitada São Paulo'),
(14183, 'PERFUMARIA AZZUMI', 'AVENIDA SATELITE - 226 - CIDADE SATELITE SANTA BARBARA - São paulo - SP - 08330-480', 'Descoberto', '', '', 'https://www.instagram.com/azzumi.perfumaria', '', 'LUCAS', '10.718.810/0001-31', ' (11) 97289-4141', '2024-08-20 18:14:05', 'São Paulo (Cidade Satelite Santa Barbara)', 'SP', '', 'Metropolitada São Paulo'),
(14184, 'Perfumaria Mônica', 'AVENIDA MOACIR D. DE ITAPECURU - 894 - CIDADE NOV.S.MIGUEL - São paulo - SP - 08030-000', 'Descoberto', '', '(11) 93229-6728', 'https://www.instagram.com/perfumariamonica/', '', 'CARLOS', '01.286.826/0001-21', '', '2024-08-20 18:14:05', 'SÃO PAULO (CIDADE NOVA SAO MIGUEL)', 'SP', '', 'Metropolitada São Paulo'),
(14185, 'LARIMARI PERFUMARIA E COSMETICOS', 'AVENIDA ALZIRO ZARUR, 253 - PARQUE SAVOY CITY - SÃO PAULO/SP 03570-000', 'Descoberto', '', '11 932296728', 'https://www.instagram.com/larimariperfumaria', '', 'JULIANE', '30.584.284/0001-71', '', '2024-08-20 18:14:05', 'SÃO PAULO (PARQUE SAVOY CITY)', 'SP', 'julifnascimento@hotmail.com', 'Metropolitada São Paulo'),
(14186, 'KIMAKE COSMÉTICOS', 'RUA AZEVEDO SOARES - 1040 - VILA GOMES CARDIM - São paulo - SP - 03322-001', 'Descoberto', 'UNHAS, SOBRANCELHA, CÍLIOS', '1120939163', 'https://www.instagram.com/kimakecosmeticos/', 'https://www.kimake.com.br/', 'IVERLI', '26.747.489/0001-53', '', '2024-08-20 18:14:05', 'SÃO PAULO (TATUAPÉ)', 'SP', '', 'Metropolitada São Paulo'),
(14187, 'Taue Perfumaria', 'Rua Tibúrcio de Sousa, 45, Vila Teles - São Paulo/SP - Cep: 08140-000', 'Descoberto', 'UNHAS, SOBRANCELHA, CÍLIOS', '11951787012', 'https://www.instagram.com/taueperfumaria', 'https://www.taueperfumaria.com.br/', 'SATIKO/HIROSHI', '96.552.880/0001-88', '', '2024-08-20 18:14:05', 'SÃO PAULO (VILA TELES)', 'SP', '', 'Metropolitada São Paulo'),
(14188, 'PERFUMARIA CHEIROSINHA', 'AVENIDA WALDEMAR CARLOS PEREIRA - 323 - VILA TALARICO - São paulo - SP - 03533-001', 'Descoberto', '', '(11) 93413-9485', 'https://www.instagram.com/perfumaria_cheirosinha/', '', 'MARIO/KAZUMI/BEATRIZ', '61.827.556/0001-40', '', '2024-08-20 18:14:05', 'SÃO PAULO (VILA TALARICO)', 'SP', '', 'Metropolitada São Paulo'),
(14189, 'Perfumaria Aiko', 'RUA ANTONIO ASSUNCAO FERREIRA - 80 - PQ BOA ESPERANCA - São paulo - SP - 08341-360', 'Descoberto', 'UNHAS, SOBRANCELHA, CÍLIOS', '11942036392', 'https://www.instagram.com/perfumariaaiko/?hl=pt', '', 'EDISON / ROSANA', '61.788.659/0001-49', '', '2024-08-20 18:14:05', 'SÃO PAULO (PQ BOA ESPERANCA)', 'SP', '', 'Metropolitada São Paulo'),
(14190, 'GLOSS COSMETICOS', 'AVENIDA DO ORATORIO - 4583 - JD GUAIRACA - São paulo - SP - 03221-200', 'Descoberto', '', '+55 (11) 2143-9619', 'https://www.instagram.com/glossoratorio/', '', 'MARIA', '69.237.170/0001-90', '', '2024-08-20 18:14:05', 'SÃO PAULO (JD GUAIRACA)', 'SP', '', 'Metropolitada São Paulo'),
(14191, 'PRIME Perfumaria', 'AVENIDA WALDEMAR CARLOS PEREIRA - 539 - VILA TALARICO - São paulo - SP - 03533-001', 'Descoberto', '', '(11)98286-0034', 'https://www.instagram.com/prime_viladalila/', '', 'CRISTIANE / MARCOS', '19.952.400/0001-25', '', '2024-08-20 18:14:05', 'SÃO PAULO (VILA TALARICO)', 'SP', '', 'Metropolitada São Paulo'),
(14192, 'PERFUMARIA IGUATEMI REALCE', 'AVENIDA BARONESA DE MURITIBA, 200 - PARQUE SAO RAFAEL - SÃO PAULO/SP 08311-080', 'Descoberto', '', '11 988978751', 'https://www.instagram.com/perfumaria_realce2020/', '', 'ANDERSON', '12.671.179/0001-98', '', '2024-08-20 18:14:05', 'SÃO PAULO (PARQUE SAO RAFAEL)', 'SP', '', 'Metropolitada São Paulo'),
(14193, 'Bruna Perfumaria', 'RUA OLAVO EGIDIO DE SOUZA ARANHA, 1841 - JARDIM PENHA - SÃO PAULO/SP 03822-000', 'Descoberto', '', '11945778994', 'https://www.instagram.com/bruna.perfumaria/', '', 'JUVENAL', '07.773.442/0001-10', '', '2024-08-20 18:14:05', 'SÃO PAULO (JARDIM PENHA)', 'SP', '', 'Metropolitada São Paulo'),
(14194, 'Perfumaria Lunna', 'RUA ABEL TAVARES - 1096 - JARDIM BELEM - São paulo - SP - 03810-110', 'Descoberto', '', '(11) 96841-5686', 'https://www.instagram.com/lunna.perfumaria/', '', 'JOSINEI / NAIANE', '36.739.062/0001-67', '', '2024-08-20 18:14:05', 'SÃO PAULO (JARDIM BELEM)', 'SP', 'josinei.jr@gmail.com', 'Metropolitada São Paulo'),
(14195, 'BELLY PERFUMARIA', 'R. PADRE ALDEMAR MOREIRA, 99 - CIDADE TIRADENTES, SÃO PAULO - SP, 08471-010', 'Descoberto', '', '(11) 94731-5954', 'https://www.instagram.com/perfumaria_belly/', '', 'PATRICIA/PRISCILA', '28.433.579/0001-03', '(11) 95840-3840', '2024-08-20 18:14:05', 'SÃO PAULO (CIDADE TIRADENNTES)', 'SP', '', 'Metropolitada São Paulo'),
(14196, 'PERFUMARIA CHEIROSINHA', 'RUA ITINGUCU - 1316 - VILA RE - São paulo - SP - 03658-000', 'Descoberto', '', '11942424126', 'https://www.instagram.com/perfumaria_cheirosinha/', '', 'Marta/Marcelo/Juliana', '12.439.119/0001-44', '(11) 97227-6963', '2024-08-20 18:14:05', 'SÃO PAULO (Vila Re)', 'SP', '', 'Metropolitada São Paulo'),
(14197, 'Belle La Vie', 'AVENIDA VILA EMA - 5541 - VILA EMA - São paulo - SP - 03281-001', 'Descoberto', '', '11 35629091', 'https://www.instagram.com/bellelavieperfumaria/', '', 'Cesar/Alessandra/Gabriela', '16.684.170/0001-72', '', '2024-08-20 18:14:05', 'SÃO PAULO (VILA EMA)', 'SP', '', 'Metropolitada São Paulo'),
(14198, 'NEW YORK  COSMETICOS', 'PRACA EULALIO DE CARVALHO - 102 - JARDIM NOVO CARRAO - São paulo - SP - 03908-280', 'Descoberto', '', '11991939333', 'https://www.instagram.com/perfumarianewyork/', '', 'HAILTON / ALEX', '56.852.866/0001-85', '(11) 97564-3053', '2024-08-20 18:14:05', 'SÃO PAULO (Jardim Novo Carrao)', 'SP', '', 'Metropolitada São Paulo'),
(14199, 'PERFUMARIA GOYA PONTE RASA', 'AVENIDA SAO MIGUEL - 4260 - VILA RIO BRANCO - São paulo - SP - 03870-000', 'Descoberto', '', '(11) 99160-1891', 'https://www.instagram.com/goyaponterasa/', '', 'LAIS', '20.341.598/0001-90', '', '2024-08-20 18:14:05', 'SÃO PAULO (VILA RIO BRANCO)', 'SP', '', 'Metropolitada São Paulo'),
(14200, 'PRIME PERFUMARIA', 'Av. Waldemar Carlos Pereira, 539 - Vila Dalila, São Paulo - SP, 03533-001', 'Descoberto', '', '(11)98286-0034', 'https://www.instagram.com/prime_viladalila/', '', 'MATHEUS / ANA', '38.267.679/0001-52', '', '2024-08-20 18:14:05', 'SÃO PAULO (VILA DALILA)', 'SP', '', 'Metropolitada São Paulo'),
(14201, 'PERFUMARIA GOLD', 'Av. Miguel Achiole da Fonseca, 729 - Jd São Paulo . Guainases', 'Descoberto', 'UNHAS, SOBRANCELHA, CÍLIOS', '11 94027-6044', 'https://www.instagram.com/perfumariagold/', 'https://perfumariagold.lojavirtualnuvem.com.br/', 'PRISCILLA / FABIO', '37.118.781/0001-23', '(11) 94775-3092', '2024-08-20 18:14:05', 'São Paulo (Guainases)', 'SP', '', 'Metropolitada São Paulo'),
(14202, 'PERFUMARIA MELISSA', 'RUA COSTA REGO, 38 - VILA GUILHERMINA - SÃO PAULO/SP 03542-030', 'Descoberto', '', '(11) 95198-8079', 'https://www.instagram.com/perfumaria_melissa/', '', 'WILSON / ELISABETE', '04.152.673/0001-18', '', '2024-08-20 18:14:05', 'SÃO PAULO (VILA GUILHERMINA)', 'SP', '', 'Metropolitada São Paulo'),
(14203, 'HIGASHI PERFUMARIA', 'RUA HARRY DANNENBERG - 470 - VILA CARMOSINA - São paulo - SP - 08270-010', 'Descoberto', '', '1125357386', 'https://www.instagram.com/higashiperfumaria/', '', 'EDSON', '19.631.434/0001-18', '(11) 99916-8591', '2024-08-20 18:14:05', 'SÃO PAULO (VILA CARMOSINA)', 'SP', '', 'Metropolitada São Paulo'),
(14204, 'Ozzi Perfumaria', 'AVENIDA ARQUITETO VILANOVA ARTIGAS, 247 - CJ H TEOTONIO VILELA - SÃO PAULO/SP 03928-240', 'Descoberto', '', '11964483373', 'https://www.instagram.com/ozzi_perfumariasapopemba/', '', 'REINALDO / REGINA', '06.290.949/0001-50', '', '2024-08-20 18:14:05', 'SÃO PAULO (SAPOPEMBA)', 'SP', '', 'Metropolitada São Paulo'),
(14205, 'Kazu Cosmetic Center', 'RUA MANUEL VELOSO DA COSTA, 258 - JARDIM VILA CARRAO - SÃO PAULO/SP 08340-460', 'Descoberto', '', '(11) 93315-2121', 'https://www.instagram.com/kazucosmeticcenter/', '', 'MARIO', '27.545.926/0001-19', '(11) 97836-2201', '2024-08-20 18:14:05', 'SÃO PAULO (Jardim Vila Carrao)', 'SP', '', 'Metropolitada São Paulo'),
(14206, 'PERFUMARIA TAKEO', 'AVENIDA CONS CARRAO, 3200 - VILA CARRAO - SÃO PAULO/SP 03402-003', 'Descoberto', '', '11999281234', 'https://www.instagram.com/perfumariatakeo/', '', 'YYUNKO / AKIM', '52.646.700/0001-51', '', '2024-08-20 18:14:05', 'SÃO PAULO ( Vila Carrao)', 'SP', '', 'Metropolitada São Paulo'),
(14207, 'Perfumaria Kirey', 'RUA NILZA - 18 - VILA ESPERANCA - São paulo - SP - 03651-120', 'Descoberto', '', '11940387111', 'https://www.instagram.com/kirey_perfumaria/', '', 'REGINA/RAFAEL/GERSON', '53.397.840/0001-04', '', '2024-08-20 18:14:05', 'SÃO PAULO ( Vila Esperança)', 'SP', '', 'Metropolitada São Paulo'),
(14208, 'Perfumaria Novo Estilo', 'ESTRADA DO LAGEADO VELHO, 826 - VILA IOLANDA(LAJEADO) - SÃO PAULO/SP 08451-056', 'Descoberto', '', '(11) 93900 9294', 'https://www.instagram.com/perfumarianovoestiloguaianazes/', '', 'MARIA', '03.901.933/0001-48', '', '2024-08-20 18:14:05', 'SÃO PAULO ( Vila Iolanda)', 'SP', '', 'Metropolitada São Paulo'),
(14209, 'PERFUMARIA OZZI', 'AVENIDA RENATA, 439 - CHACARA BELENZINHO - SÃO PAULO/SP 03377-000', 'Descoberto', '', '(11) 914887344', 'https://www.instagram.com/ozzirenata/', '', 'TEREZA', '17.097.695/0001-74', '(11) 99950-0561', '2024-08-20 18:14:05', 'SÃO PAULO (VILA FORMOSA)', 'SP', '', 'Metropolitada São Paulo'),
(14210, 'CHARMOSINHA PERFUMARIA ', 'RUA TAPAIUNA, 127 - JARDIM SANTA MARIA - SÃO PAULO/SP 03576-060', 'Descoberto', '', '(11) 2667-6003', 'https://www.instagram.com/charmosinha.perfumaria/', '', 'EDISON/RICARDO/GUILHERME', '41.544.754/0001-90', '', '2024-08-20 18:14:05', 'SÃO PAULO (JARDIM SANTA MARIA)', 'SP', '', 'Metropolitada São Paulo'),
(14211, 'Bella Beauty Perfumaria', 'AVENIDA DO ORATORIO - 2361 - PARQUE SAO LUCAS - São paulo - SP - 03221-100', 'Descoberto', '', '11998232468', 'https://www.instagram.com/bellabeauty_perfumaria/', '', 'VALQUIRIA', '39.709.557/0001-31', '', '2024-08-20 18:14:05', 'SÃO PAULO (PARQUE SAO LUCAS)', 'SP', '', 'Metropolitada São Paulo'),
(14212, 'AIMI COSMETICOS', 'PRACA VALDEMAR BASSI, 52 - JARDIM BRASILIA (ZONA LESTE) - SÃO PAULO/SP 03585-050', 'Descoberto', '', '11 992588304', 'https://www.instagram.com/aimi.cosmeticos/', 'https://www.aimicosmeticos.com.br/', 'NILTON', '28.298.100/0001-65', '', '2024-08-20 18:14:05', 'SÃO PAULO ( JARDIM BRASILIA)', 'SP', '', 'Metropolitada São Paulo'),
(14213, 'KEI COSMETICOS', 'AVENIDA RAGUEB CHOHFI, 4880 - JARDIM IGUATEMI - SÃO PAULO/SP 08380-320', 'Descoberto', '', '11944680323', 'https://www.instagram.com/kei.cosmeticos/', '', 'ELAINE', '03.145.183/0001-21', '', '2024-08-20 18:14:05', 'SÃO PAULO ( JARDIM IGUATEMI)', 'SP', '', 'Metropolitada São Paulo'),
(14214, 'ACAZZO PERFUMARIA', 'AVENIDA RIO DAS PEDRAS, 1325 - JARDIM ARICANDUVA - SÃO PAULO/SP 03453-100', 'Descoberto', '', '11 2724-6174', 'https://www.instagram.com/acazzoperfumaria/', '', 'ALBERTO', '08.022.750/0001-76', '', '2024-08-20 18:14:05', 'SÃO PAULO ( JARDIM ARICANDUVA)', 'SP', '', 'Metropolitada São Paulo'),
(14215, 'Miss Angel Cosméticos ', 'AVENIDA PARANAGUA - 1891 - VILA PARANAGUA - São paulo - SP - 03806-010', 'Descoberto', '', '11972880770', 'https://www.instagram.com/missangel_cosmeticos/', '', 'VALQUIRIA', '43.828.560/0001-41', '', '2024-08-20 18:14:05', 'SÃO PAULO (VILA PARANAGUA)', 'SP', '', 'Metropolitada São Paulo'),
(14216, 'PERFUMARIA  BELLA APARECIDA', 'RUA AUGUSTO CAVALCANTI, 233 - CONJUNTO RESIDENCIAL JOSE BONIFACIO - SÃO PAULO/SP 08253-110', 'Descoberto', '', '11 985033262', 'https://www.instagram.com/perfumariabellaaparecida/', '', 'COSMO / JANILSON', '27.257.822/0001-09', '', '2024-08-20 18:14:05', 'SÃO PAULO (JARDIM BONIFACIO)', 'SP', '', 'Metropolitada São Paulo'),
(14217, 'Romanela Perfumaria', 'Av. Pires do Rio, 4516 - Jardim Norma, São Paulo - SP, BR', 'Descoberto', '', '11942481375', 'https://www.instagram.com/romanelaperfumaria', 'https://meucomercio.com.br/romanela', 'TOMAS / MICHELLE', '40.863.872/0001-06', '', '2024-08-20 18:14:05', 'SÃO PAULO (Jardim Norma)', 'SP', '', 'Metropolitada São Paulo'),
(14218, 'PERFUMARIA BELLA FASHION', 'RUA SAO GONCALO DO ABAETE, 48 - PARQUE TIETE - SÃO PAULO/SP 02870-000', 'Descoberto', '', '11916773409', 'https://www.instagram.com/perfumariabellafashion', '', 'MARIA', '04.426.590/0001-70', '', '2024-08-20 18:14:05', 'SÃO PAULO (PARQUE TIETE) ', 'SP', '', 'Metropolitada São Paulo'),
(14219, 'BRUNA PERFUMARIA', 'RUA PASTORIL DE ITAPETINGA, 541 - JARDIM DANFER - SÃO PAULO/SP 03729-000', 'Descoberto', '', '11945778994', 'https://www.instagram.com/bruna.perfumaria/', '', 'EDINILDO', '09.451.800/0001-01', '', '2024-08-20 18:14:05', 'São Paulo (JARDIM DANFER)', 'SP', '', 'Metropolitada São Paulo'),
(14220, 'Perfumaria Belface Ponte Rasa', 'AVENIDA SAO MIGUEL, 4438 - VILA RIO BRANCO - SÃO PAULO/SP 03870-000', 'Descoberto', '', '(11)2943-4889', 'https://www.instagram.com/perfumaria_belface_ponte_rasa', '', 'CRISTINA', '03.454.756/0001-07', '', '2024-08-20 18:14:05', 'SÃO PAULO (VILA RIO BRANCO)', 'SP', '', 'Metropolitada São Paulo'),
(14221, 'Perfumaria ChocoPi', 'AVENIDA ESPERANTINA, 66 - PARQUE DAS PAINEIRAS - SÃO PAULO/SP 03692-000', 'Descoberto', '', '11996714070', 'https://www.instagram.com/perf.chocopi/', '', 'JULIO', '18.927.167/0001-68', '', '2024-08-20 18:14:05', 'SÃO PAULO (PARQUE DAS PAINEIRAS)', 'SP', '', 'Metropolitada São Paulo'),
(14222, 'Mega Beauty', 'AVENIDA DA BARREIRA GRANDE, 2135 - VILA BANCARIA - SÃO PAULO/SP 03916-000', 'Descoberto', '', '11954556211', 'https://www.instagram.com/perfumariamegabeauty/', '', 'FLAVIO / TATIANA', '32.196.063/0001-51', '', '2024-08-20 18:14:05', 'SÃO PAULO (VILA BANCARIA)', 'SP', '', 'Metropolitada São Paulo'),
(14223, 'Perfumaria MM', 'RUA BELEM, 301 - BELENZINHO - SÃO PAULO/SP 03057-010', 'Descoberto', '', ' 11 2618-1193', 'https://www.instagram.com/perfumariamm/', '', 'MURILO', '24.793.511/0001-76', '', '2024-08-20 18:14:05', 'SÃO PAULO (BELENZINHO)', 'SP', 'murilomarcacini@yahoo.com.br', 'Metropolitada São Paulo'),
(14224, 'TOP CENTER PERFUMARIA ', 'RUA JOSE DE SA E ARRUDA, 353 - JARDIM SANTO ANDRE - SÃO PAULO/SP 08390-030', 'Descoberto', '', '11 20597620', 'https://www.instagram.com/topcenter_perfumaria', '', 'NELSON', '27.220.699/0001-51', '', '2024-08-20 18:14:05', 'SÃO PAULO (JARDIM SANTO ANDRE)', 'SP', '', 'Metropolitada São Paulo'),
(14225, 'Perfumaria Belly', 'RUA SARA KUBITSCHECK, 222 - CONJUNTO HABITACIONAL CASTRO ALVES - SÃO PAULO/SP 08474-000', 'Descoberto', '', '11 947315954', 'https://www.instagram.com/perfumaria_belly/', '', 'LIEGE', '31.849.306/0001-40', '', '2024-08-20 18:14:05', 'SÃO PAULO (Cidade Tiradentes)', 'SP', '', 'Metropolitada São Paulo'),
(14226, 'Bella Perfumaria', 'PRACA SERRA DO OROCORI - 4 - JARDIM AIMORE - São paulo - SP - 08110-370', 'Descoberto', '', '(11) 2568-0337', 'https://www.instagram.com/bellaperfumariaitaim/', '', 'REGINA', '23.150.779/0001-27', '', '2024-08-20 18:14:05', 'SÃO PAULO (JARDIM AIMORE)', 'SP', '', 'Metropolitada São Paulo'),
(14227, 'AGATA PERFUMARIA', 'RUA WENCESLAU GUIMARAES - 833 - PARQUE CISPER - São paulo - SP - 03823-000', 'Descoberto', '', '11 98685-5499', 'https://www.instagram.com/agathaperfumaria.sp/', '', '', '02.253.802/0001-39', '(11) 96547-4684', '2024-08-20 18:14:05', 'SÃO PAULO (PARQUE CISPER)', 'SP', '', 'Metropolitada São Paulo'),
(14228, 'PERFUMARIA ESTACAO BELEZA', 'AVENIDA DIOGO DA COSTA TAVARES, 211 - JARDIM MARGARIDA - SÃO PAULO/SP 08191-000', 'Descoberto', '', '11 948775225', 'https://www.instagram.com/perfumariaestacaobeleza/', 'https://shopee.com.br/perfumaria.e.b', 'DANIELLE', '11.476.170/0001-63', '', '2024-08-20 18:14:05', 'SÃO PAULO (JARDIM MARGARIDA)', 'SP', '', 'Metropolitada São Paulo'),
(14229, 'Perfumaria Lakshmi', 'RUA HENRY FUSELI, 38 - JARDIM DONA SINHA - SÃO PAULO/SP 03923-030', 'Descoberto', '', '11 2059-0473', 'https://www.instagram.com/perfumaria.lakshmi/', '', 'JOSE / MARCIA', '10.925.224/0001-68', '(11) 99540-0732', '2024-08-20 18:14:05', 'SÃO PAULO (JARDIM DONA SINHA)', 'SP', '', 'Metropolitada São Paulo'),
(14230, 'PERFUMARIA GOLD', 'AVENIDA MIGUEL ACHIOLE DA FONSECA, 729 - JARDIM SAO PAULO(ZONA LESTE) - SÃO PAULO/SP 08461-110', 'Descoberto', '', '11 94027-6044', 'https://www.instagram.com/perfumariagold/', 'https://perfumariagold.lojavirtualnuvem.com.br/', 'PRISCILLA / FABIO', '08.675.040/0001-45', '', '2024-08-20 18:14:05', 'SÃO PAULO (JARDIM SÃO PAULO)', 'SP', '', 'Metropolitada São Paulo');
INSERT INTO `stores` (`id`, `nome`, `endereco`, `status`, `anotacao`, `telefone`, `instagram`, `site`, `decisor`, `cnpj`, `telefone_decisor`, `datetime`, `cidade`, `estado`, `email`, `mesorregiao`) VALUES
(14231, 'PERFUMARIA BELLY', 'RUA ANTONIO CARLOS MINGUES LOPES, 1484 - CONJUNTO HABITACIONAL SITIO CONCEICAO - SÃO PAULO/SP 08473-270', 'Descoberto', '', '11 947315963', 'https://www.instagram.com/perfumaria_belly/', '', 'BEMILSON', '29.266.928/0001-02', '', '2024-08-20 18:14:05', 'SÃO PAULO (Conj. Hab. Sitio Conceicao )', 'SP', 'bemilson@terra.com.br', 'Metropolitada São Paulo'),
(14232, 'BEATRIZ PERFUMARIA', 'AVENIDA SAPOPEMBA, 15774 - CIDADE SATELITE SANTA BARBARA - SÃO PAULO/SP 08330-180', 'Descoberto', '', '(11)980101570', 'https://www.instagram.com/perfumariabeatriz/', 'https://beatrizperfumaria.lojavirtualnuvem.com.br/', 'CRISTIANE', '15.071.000/0001-50', '', '2024-08-20 18:14:05', 'SÃO PAULO (Cidade Satelite Santa Barbara)', 'SP', 'cris.santos1010@hotmail.com', 'Metropolitada São Paulo'),
(14233, 'PATRICIA PERFUMARIA', 'AVENIDA DOUTOR GUILHERME DE ABREU SODRE, 41 - VILA HORTENCIA - SÃO PAULO/SP 08490-010', 'Descoberto', '', '11939592704', 'https://www.instagram.com/perfumariapatricia/', '', 'PATRICIA', '16.792.347/0001-54', '', '2024-08-20 18:14:05', 'SÃO PAULO (VILA HORTENCIA)', 'SP', 'patrika@bol.com.br', 'Metropolitada São Paulo'),
(14234, 'Perfumaria Cris', 'RUA MORRO DAS PEDRAS, 39 - JARDIM RODOLFO PIRANI - SÃO PAULO/SP 08310-100', 'Descoberto', '', '11939623719', 'https://www.instagram.com/perfumariacrisltda/', '', 'MARIA', '05.624.350/0001-42', '', '2024-08-20 18:14:05', 'SÃO PAULO (JARDIM RODOLFO PIRANI)', 'SP', '', 'Metropolitada São Paulo'),
(14235, 'Tinna Perfumaria', 'R. Erva do Sereno, 250 - Jardim Maia, São Paulo - SP, 08180-010', 'Descoberto', '', '1120252560', 'https://www.instagram.com/tinna_perfumaria/', '', 'WELINTON', '18.954.682/0001-37', '(11) 98517-3656', '2024-08-20 18:14:05', 'SÃO PAULO ( Jardim Maia)', 'SP', 'welinton.luiz@yahoo.com.br', 'Metropolitada São Paulo'),
(14236, 'Loucas por Esmaltes ZL', 'RUA GENERAL PORFIRIO DA PAZ - 1750 - VILA BANCARIA - São paulo - SP - 03918-000', 'Descoberto', '', '11 98702-5747', 'https://www.instagram.com/loucas_por_esmaltes_zl', '', 'EDCLECIO', '29.920.431/0001-58', '', '2024-08-20 18:14:05', 'SÃO PAULO ( VILA BANCARIA)', 'SP', '', 'Metropolitada São Paulo'),
(14237, 'VITORIA PERFUMARIA', 'RUA COLONIA LEOPOLDINA, 709 - VILA SILVIA - SÃO PAULO/SP 03821-020', 'Descoberto', '', '11 984008530', 'https://www.instagram.com/vitoriaperfumariaepresentes', '', 'FRANCISCA', '45.787.482/0001-00', '', '2024-08-20 18:14:05', 'SÃO PAULO (VILA SILVIA)', 'SP', '', 'Metropolitada São Paulo'),
(14238, 'Luar Perfumaria', 'RUA NOVA RESENDE, 125 - PARQUE SANTA MADALENA - SÃO PAULO/SP 03981-090', 'Descoberto', '', '11952338448', 'https://www.instagram.com/luar.perfumaria/', '', 'CLAUDIO', '47.294.972/0001-08', '(11) 96062-8182', '2024-08-20 18:14:05', 'SÃO PAULO (PARQUE SANTA MADALENA)', 'SP', '', 'Metropolitada São Paulo'),
(14239, 'LollyTinna Perfumaria', 'RUA CARDON - 983 - VILA PROGRESSO (ZONA LESTE) - São paulo - SP - 08041-525', 'Descoberto', '', '(11) 95485-8247', 'https://www.instagram.com/lollytinna/', '', 'ANSELMO', '09.361.971/0001-31', '', '2024-08-20 18:14:05', 'SÃO PAULO (VILA PROGRESSO)', 'SP', '', 'Metropolitada São Paulo'),
(14240, 'SABRINA PERFUMARIA', 'RUA DOS CICLAMES, 13 - VILA LUCIA - SÃO PAULO/SP 03146-010', 'Descoberto', '', '11 973376615', 'https://www.instagram.com/perfumaria.sabrina/', '', 'SABRINA', '34.279.722/0001-49', '', '2024-08-20 18:14:05', 'SÃO PAULO (VILA LUCIA)', 'SP', 'sabrinaperfumaria@hotmail.com', 'Metropolitada São Paulo'),
(14241, 'PERFUMARIA IMPERIAL', 'RUA LUIS MATEUS, 506 - JARDIM SAO PEDRO - SÃO PAULO/SP 08420-750', 'Descoberto', '', '(11) 98532-8880', 'https://www.instagram.com/perfumaria_imperial/', 'https://shopee.com.br/perfumariaimperial', 'PAULINO', '07.155.792/0001-12', '', '2024-08-20 18:14:05', 'SÃO PAULO (JARDIM SAO PEDRO)', 'SP', '', 'Metropolitada São Paulo'),
(14242, 'Zion Perfumaria', 'AVENIDA INCONFIDENCIA MINEIRA - 1851 - VILA ANTONIETA - São paulo - SP - 03476-010', 'Descoberto', '', ' 11 2722-6129', 'https://www.instagram.com/zion.perfumaria/', 'https://shopee.com.br/zionperfumaria', '', '45.433.531/0001-06', '(11) 98432-6173', '2024-08-20 18:14:05', 'SÃO PAULO (VILA ANTONIETA)', 'SP', '', 'Metropolitada São Paulo'),
(14243, 'NAMASTE PERFUMARIA', 'RUA MANUEL BUENO DA FONSECA, 77 - JARDIM SAO LUIS (ZONA LESTE) - SÃO PAULO/SP 08121-000', 'Descoberto', '', '11915664573', 'https://www.instagram.com/namasteperfumaria/', '', 'REINALDO / REGINA', '46.497.408/0001-11', '', '2024-08-20 18:14:05', 'SÃO PAULO (JARDIM SAO LUIS)', 'SP', '', 'Metropolitada São Paulo'),
(14244, 'MALIZ COSMETICOS', '', 'Descoberto', '', '', 'https://www.instagram.com/malizcosmeticos1/', 'https://shopee.com.br/malizcosmeticos', 'ELIZABETH / MARIA', '41.071.670/0001-86', '(11) 97609-9191', '2024-08-20 18:14:05', 'SÃO PAULO', 'SP', '', 'Metropolitada São Paulo'),
(14245, 'BELLAGI PERFUMARIA', 'AVENIDA JOAQUIM MANOEL DE MACEDO, 606 - PARQUE RESIDENCIAL MARENGO - ITAQUAQUECETUBA/SP 08594-500', 'Descoberto', '', ' 11 96686-0818', 'https://www.instagram.com/bellagi_perfumaria/', '', 'MARCOS', '43.737.596/0001-10', '', '2024-08-20 18:14:05', 'SÃO PAULO (ITAQUAQUECETUBA)', 'SP', '', 'Metropolitada São Paulo'),
(14246, 'PERFUMARIA PAG POKO', 'RUA MANUEL LEMES DA SILVA, 310 - JARDIM DAS OLIVEIRAS - SÃO PAULO/SP 08122-140', 'Descoberto', '', '11916408362', 'https://www.instagram.com/perfumariapagpoko/', '', 'JOSE / CAROLINE', '47.773.612/0001-80', '', '2024-08-20 18:14:05', 'SÃO PAULO (JARDIM DAS OLIVEIRAS)', 'SP', '', 'Metropolitada São Paulo'),
(14247, 'Perfumaria Lunna', 'RUA ABEL TAVARES, 1096 - JARDIM BELEM - SÃO PAULO/SP 03810-110', 'Descoberto', '', '(11) 96841-5686', 'https://www.instagram.com/lunna.perfumaria/', '', 'AMANDA', '52.701.582/0001-37', '', '2024-08-20 18:14:05', 'SÃO PAULO (JARDIM BELEM)', 'SP', '', 'Metropolitada São Paulo'),
(14248, 'AQUARELA COSMETICOS', 'AVENIDA WALDEMAR CARLOS PEREIRA, 1880 - VILA TALARICO - SÃO PAULO/SP 03533-002', 'Descoberto', '', '11913439927', 'https://www.instagram.com/aquarelacosmeticos2023/', '', 'FRED', '50.691.857/0001-73', '', '2024-08-20 18:14:05', 'SÃO PAULO (VILA TALARICO)', 'SP', '', 'Metropolitada São Paulo'),
(14249, 'KEI Cosméticos', 'AVENIDA RAGUEB CHOHFI, 4882 - JARDIM IGUATEMI - SÃO PAULO/SP 08380-320', 'Descoberto', '', '11944680323', 'https://www.instagram.com/kei.cosmeticos/', '', 'VINICIUS', '47.140.965/0001-43', '(11) 99782-1722', '2024-08-20 18:14:05', 'SÃO PAULO (JARDIM IGUATEMI)', 'SP', 'viniciusgoya.kei@gmail.com', 'Metropolitada São Paulo'),
(14250, 'PERFUMARIA TUDO POR ELAS', 'RUA PADRE THOMAZ JOSEPH SHEA, 18 - VILA SANTA INES - SÃO PAULO/SP 03812-040', 'Descoberto', '', '11965469421', 'https://www.instagram.com/perfumaria.tudoporelas/', '', 'ANDREIA', '42.087.368/0001-89', '', '2024-08-20 18:14:05', 'SÃO PAULO (VILA SANTA INES)', 'SP', '', 'Metropolitada São Paulo'),
(14251, 'GLAMOUR COSMETICOS', 'AVENIDA CAPITAO AVIADOR WALTER RIBEIRO, 235 - CIDADE JARDIM CUMBICA - GUARULHOS/SP 07181-000', 'Descoberto', '', '(11) 93314-1627', 'https://www.instagram.com/glamour.perfumaria21/', '', 'GENESIS', '28.378.600/0001-07', '', '2024-08-20 18:14:05', 'SÃO PAULO (CIDADE JARDIM CUMBICA)', 'SP', '', 'Metropolitada São Paulo'),
(14252, 'PAIXAO \' S PERFUMARIA E COSMETICOS', 'AVENIDA DR PEREIRA VERGUEIRO, 272 - VILA NHOCUNE - SÃO PAULO/SP 03563-000', 'Descoberto', '', '(11) 3232-1637', 'https://www.instagram.com/paixaosperfumaria.cosmeticos', '', 'VITORIA', '45.665.630/0001-13', '', '2024-08-20 18:14:05', 'SÃO PAULO (VILA NHOCUNE)', 'SP', '', 'Metropolitada São Paulo'),
(14253, 'PERFUMARIA GOYA VILA MARA', 'AVENIDA OLIVEIRA FREIRE, 1482 - PARQUE PAULISTANO - SÃO PAULO/SP 08080-570', 'Descoberto', '', '(11) 25815686', 'https://www.instagram.com/goyavilamara/', '', 'AMANDA', '47.887.464/0001-25', '', '2024-08-20 18:14:05', 'SÃO PAULO (VILA MARA)', 'SP', '', 'Metropolitada São Paulo'),
(14254, 'TUDO DA BELEZA', 'RUA TIJUCO PRETO, 460 - TATUAPE - SÃO PAULO/SP 03316-000', 'Descoberto', 'UNHAS, CÍLIOS', '11981075565', 'https://www.instagram.com/tudodabelezaoficial/', '', 'Taynan', '25.102.358/0001-56', '(11) 98769-8588', '2024-08-20 18:14:05', 'SÃO PAULO (TATUAPÉ)', 'SP', 'taynanrayza@gmail.com', 'Metropolitada São Paulo'),
(14255, 'LM Micro, Estética, Cílios & Manicure', 'RUA JACIRENDI, 76 - TATUAPE - SÃO PAULO/SP 03080-000', 'Descoberto', 'UNHAS, CÍLIOS', '11945416357', 'https://www.instagram.com/_lmmicropigmentacao/', 'https://www.lmmicropigmentacao.com/', 'Mara', '20.650.192/0001-99', '', '2024-08-20 18:14:05', 'SÃO PAULO (TATUAPÉ)', 'SP', 'marasantana.naves@hotmail.com', 'Metropolitada São Paulo'),
(14256, 'BRABA LASH STORE', 'RUA CORONEL JOVINIANO BRANDAO - 137 - VILA PRUDENTE - São paulo - SP - 03127-175', 'Descoberto', 'CÍLIOS', '11948992748', 'https://brabalashstore.com.br/', 'https://www.instagram.com/brabalashstore', '', '44.008.940/0001-00', '', '2024-08-20 18:14:05', 'SÃO PAULO (VILA PRUDENTE)', 'SP', '', 'Metropolitada São Paulo'),
(14257, 'Lilian’s Perfumaria', 'RUA GONCALVES CRESPO, 78 - TATUAPE - SÃO PAULO/SP 03066-030', 'Descoberto', 'UNHAS', '(11) 91725-2668', 'https://www.instagram.com/lilians_perfumaria/', 'https://liliansperfumaria.com.br/', 'Lilian', '39.596.431/0001-06', '', '2024-08-20 18:14:05', 'SÃO PAULO (TATUAPE)', 'SP', '', 'Metropolitada São Paulo'),
(14258, 'JADI PERFUMARIA', 'AVENIDA MATEO BEI - 2568 - SAO MATEUS - São paulo - SP - 03949-200', 'Descoberto', 'UNHAS', '11991983728', 'https://www.instagram.com/jadiperfumaria/', 'https://jadi-perfumaria.lojaintegrada.com.br/', 'Jadi', '40.750.130/0001-66', '', '2024-08-20 18:14:05', 'SÃO PAULO (SÃO MATEUS)', 'SP', '', 'Metropolitada São Paulo'),
(14259, 'NATI LASH', 'RUA TUIUTI, 2403 - TATUAPE - SÃO PAULO/SP 03307-005', 'Descoberto', 'CÍLIOS', '11992830223', 'https://www.instagram.com/natilash.shop/', 'https://natilash.com.br/', 'NATALIA', '48.472.241/0001-60', '(11) 99392-8672', '2024-08-20 18:14:05', 'SÃO PAULO (TATUAPE)', 'SP', 'nattii.morais@gmail.com', 'Metropolitada São Paulo'),
(14260, 'Isa Cosméticos e Perfumaria', 'RUA FERNAO MENDES PINTO, 1493 - PARQUE BOTURUSSU - SÃO PAULO/SP 03803-000', 'Descoberto', 'UNHAS, CÍLIOS', '11952334092', 'https://www.instagram.com/isacosmeticos___/', '', 'EUNICE', '49.004.564/0001-91', '', '2024-08-20 18:14:05', 'SÃO PAULO (PARQUE BOTURUSSU)', 'SP', '', 'Metropolitada São Paulo'),
(14261, 'Cib | COSMETICS IMPORT BRASIL', 'AVENIDA CONS CARRAO - 1861 - VILA CARRAO - São paulo - SP - 03403-001', 'Descoberto', 'UNHAS, CÍLIOS E SOBRANCELHA', '11959625567', 'https://www.instagram.com/lojacib', 'https://lojacib.com.br/', 'MONIQUE', '28.870.886/0001-43', '', '2024-08-20 18:14:05', 'SÃO PAULO (VILA CARRAO)', 'SP', '', 'Metropolitada São Paulo'),
(14262, 'ESPACO DEBORA SARAIVA', 'RUA BANDEIRA DO SUL, 852 - JARDIM TIETE - SÃO PAULO/SP 03944-120', 'Descoberto', 'CÍLIOS E SOBRANCELHA', '(11) 98363-8332', 'https://www.instagram.com/espacodeborasaraiva/', '', 'DEBORA', '42.768.807/0001-19', '', '2024-08-20 18:14:05', 'SÃO PAULO (JARDIM TIETE)', 'SP', '', 'Metropolitada São Paulo'),
(14263, 'LILIAN\'S PERFUMARIA  ', 'AVENIDA PIRES DO RIO - 2845 - JARDIM SAO SEBASTIAO - São paulo - SP - 08041-000', 'Descoberto', 'UNHAS, CÍLIOS E SOBRANCELHA', '11917252668', 'https://www.instagram.com/lilians_perfumaria/', 'https://liliansperfumaria.com.br/', 'CAIO', '18.752.512/0001-70', '', '2024-08-20 18:14:05', 'SÃO PAULO (JARDIM SAO SEBASTIAO)', 'SP', '', 'Metropolitada São Paulo'),
(14264, 'CASA BELLEZA SAO MIGUEL', 'AVENIDA MAL TITO, 789 - SAO MIGUEL PAULISTA - SÃO PAULO/SP 08010-090', 'Descoberto', 'UNHAS, CÍLIOS E SOBRANCELHA', '1150509159', 'https://www.instagram.com/casabellezasaomiguel/', '', 'XUHONG', '46.684.085/0001-75', '', '2024-08-20 18:14:05', 'SÃO PAULO (SAO MIGUEL PAULISTA)', 'SP', '', 'Metropolitada São Paulo'),
(14265, 'BC MICROPIGMENTACAO', 'R. PADRE ESTEVÃO PERNET, 718 - SALA 2212 - TATUAPÉ, SÃO PAULO - SP, 03315-000', 'Descoberto', 'SOBRANCELHA, CÍLIOS', '11965722632', 'https://www.instagram.com/bcmicropigmentacao/', 'https://www.bcmicropigmentacao.com.br/nossos-produtos', 'BRUNA / LUAN', '42.741.008/0001-59', '(11) 97063-4775', '2024-08-20 18:14:05', 'SÃO PAULO (TATUAPE)', 'SP', '', 'Metropolitada São Paulo'),
(14266, 'DERMABLADING', 'PRACA VINTE DE JANEIRO, 100 - VILA REGENTE FEIJO - SÃO PAULO/SP 03335-060', 'Descoberto', 'CÍLIOS', '11 98653-5119', 'https://www.instagram.com/dermablading_/', 'https://www.dermablading.com.br/', 'KELLY', '29.721.029/0001-44', '', '2024-08-20 18:14:06', 'SÃO PAULO (VILA REGENTE FEIJO)', 'SP', '', 'Metropolitada São Paulo'),
(14267, 'IN LASHES STORE', '', 'Descoberto', 'UNHAS, CÍLIOS E SOBRANCELHA', '11975991885', 'https://www.instagram.com/in_lashestore/', '', 'INDALECIO', '45.821.264/0001-44', '', '2024-08-20 18:14:06', 'SÃO PAULO ', 'SP', '', 'Metropolitada São Paulo'),
(14268, 'Mily Cosmeticos', 'AVENIDA ERNESTO SOUZA CRUZ - 789 - CIDADE ANTONIO ESTEVAO DE CARVALHO - São paulo - SP - 08225-380', 'Descoberto', 'UNHAS, CÍLIOS', '11960419634', 'https://www.instagram.com/milycosmeticoss/', 'https://milycosmeticos.com.br/', '', '09.195.902/0001-03', '', '2024-08-20 18:14:06', 'SÃO PAULO ( CIDADE DE CARVALHO)', 'SP', '', 'Metropolitada São Paulo'),
(14269, 'BELLA G MAKE', 'RUA ROMELANDIA, 34 - PARQUE CISPER - SÃO PAULO/SP 03818-040', 'Descoberto', '', '11961483757', 'https://www.instagram.com/bella_g_make/', '', 'MARCELO/GISLAINE', '40.495.317/0001-60', '(11) 96224-2377', '2024-08-20 18:14:06', 'SÃO PAULO (PARQUE CISPER)', 'SP', 'marceloflorr@yahoo.com.br', 'Metropolitada São Paulo'),
(14270, 'Beleza Unika', 'AVENIDA NORDESTINA - 6870 - JARDIM AURORA (ZONA LESTE) - São paulo - SP - 08431-165', 'Descoberto', 'UNHAS, CÍLIOS E SOBRANCELHA', '1125139022', 'https://www.instagram.com/unikacosmeticoss/', 'https://beleza-unika.lojaintegrada.com.br/', '', '34.852.435/0001-86', '', '2024-08-20 18:14:06', 'SÃO PAULO (JARDIM AURORA)', 'SP', '', 'Metropolitada São Paulo'),
(14271, 'TOKYO CILIOS', '', 'Descoberto', 'CÍLIOS', '11 96343-6511', 'https://www.instagram.com/tokyo_cilios/', '', 'LARISSA', '35.327.958/0001-76', '', '2024-08-20 18:14:06', 'SÃO PAULO ', 'SP', '', 'Metropolitada São Paulo'),
(14272, ' PRINCESA SUPERMERCADO DE COSMETICOS', 'RUA SAO BENTO - 51 - CENTRO - São paulo - SP - 01011-000', 'Descoberto', '', '(11) 31061340', 'https://www.instagram.com/princesa_cosmeticos/', 'https://www.supermercadodecosmeticos.com.br/', 'KERLY / CLAUDIO', '05.075.495/0001-31', '(11) 96781-0177', '2024-08-20 18:14:06', 'SÃO PAULO (CENTRO)', 'SP', '', 'Metropolitada São Paulo'),
(14273, 'PADRON PERFUMARIA', 'RUA 24 DE MAIO - 242 - REPUBLICA - São paulo - SP - 01041-001', 'Descoberto', 'UNHAS, CÍLIOS, SOBRANCELHA', '1142242311', 'https://www.instagram.com/padronperfumaria', 'https://www.padronperfumaria.com.br/', 'FABIO  EMILIO', '05.938.715/0001-03', '', '2024-08-20 18:14:06', 'SÃO PAULO (CENTRO)', 'SP', '', 'Metropolitada São Paulo'),
(14274, 'Perfumaria Sao Bento', 'RUA SAO BENTO - 351 - CENTRO - São paulo - SP - 01011-100', 'Descoberto', '', '11 969127369', 'https://www.instagram.com/perfumariasaobento/', '', 'MARCELO', '27.340.045/0001-61', '', '2024-08-20 18:14:06', 'SÃO PAULO (CENTRO)', 'SP', '', 'Metropolitada São Paulo'),
(14275, 'Nino e Nunes Cosméticos', 'RUA MIGUEL CARLOS - 7 - CENTRO - São paulo - SP - 01023-010', 'Descoberto', '', '11998819864', 'https://www.instagram.com/ninoenunes/', '', 'MARCOS / PATRICIA', '14.990.669/0001-82', '(11) 98295-0242', '2024-08-20 18:14:06', 'SÃO PAULO (CENTRO)', 'SP', '', 'Metropolitada São Paulo'),
(14276, 'VOICE COSMETIC', 'RUA DO AROUCHE, 118 - CENTRO - SÃO PAULO/SP 01219-000', 'Descoberto', '', '11 95658-7630', 'https://www.instagram.com/voice.cosmetic/', '', 'ALEXANDRA / RICARDO', '10.920.994/0001-18', '(11) 97816-9935', '2024-08-20 18:14:06', 'SÃO PAULO (REPUBLICA)', 'SP', '', 'Metropolitada São Paulo'),
(14277, 'VIP MAKE UP', 'RUA VINTE E CINCO DE MARCO - 1090 - CENTRO - São paulo - SP - 01021-100', 'Descoberto', '', '11 990275624', 'https://www.instagram.com/vipmakeupoficial/', 'https://sousavip.com.br/', 'EDILEUZA', '30.024.471/0001-09', '', '2024-08-20 18:14:06', 'SÃO PAULO (CENTRO)', 'SP', '', 'Metropolitada São Paulo'),
(14278, 'STAR BEAUTY PERFUMARIA E COSMETICOS', 'RUA BRA DE ITU, 22 - SANTA CECILIA - SÃO PAULO/SP 01231-000', 'Descoberto', '', '11 942959751', 'https://www.instagram.com/starbeautycosmeticos/', '', 'ANA / FABIO', '11.799.688/0001-38', '', '2024-08-20 18:14:06', 'SÃO PAULO (SANTA CECILIA)', 'SP', '', 'Metropolitada São Paulo'),
(14279, 'New Air Cosmeticos', 'RUA CAMOMIL - 160 - CANINDE - São paulo - SP - 03032-010', 'Descoberto', 'Unhas, cílios e sobrancelha', '(11) 98302-4089', 'https://www.instagram.com/vitorialtda2019/', 'https://shopee.com.br/new_air', 'ZHANG', '09.613.901/0001-23', '', '2024-08-20 18:14:06', 'São Paulo ( Canindé)', 'SP', '', 'Metropolitada São Paulo'),
(14280, 'BELLA MOÇA', 'RUA FLORENCIO DE ABREU, 36 - CENTRO - SÃO PAULO/SP 01030-000', 'Descoberto', 'Unhas, cílios e sobrancelha', ' 11 93489-1399', 'https://www.instagram.com/bella_moca_br/', '', 'JIHAO LOU', '16.657.916/0001-59', '', '2024-08-20 18:14:06', 'São Paulo (Centro)', 'SP', '', 'Metropolitada São Paulo'),
(14281, 'DHY UNHAS', 'RUA FLORENCIO DE ABREU, 65 - CENTRO - SÃO PAULO/SP 01029-000', 'Descoberto', 'UNHAS', '(11) 94915-3364', 'https://www.instagram.com/dhy_unhas', 'https://www.dhyunhas.com.br/', 'EDHYENNE', '24.589.920/0001-55', '', '2024-08-20 18:14:06', 'São Paulo (Centro)', 'SP', 'edieni20@hotmail.com>', 'Metropolitada São Paulo'),
(14282, 'SHOP INDICO PRO NAILS', 'Ladeira Porto Geral, 14 - Loja 151 - Centro Histórico de São Paulo, São Paulo - SP, 01022-000', 'Descoberto', 'Unhas, cílios e sobrancelha', '11 95886-4161', 'https://www.instagram.com/shop_indicopronails/', '', 'TANIA', '47.883.898/0001-57', '', '2024-08-20 18:14:06', 'São Paulo (Centro)', 'SP', '', 'Metropolitada São Paulo'),
(14283, 'Casa das Unhas', 'RUA JOSE PAULINO - 226 - BOM RETIRO - São paulo - SP - 01120-000', 'Descoberto', 'Unhas, cílios e sobrancelha', '11 97171 3616', 'https://www.instagram.com/casadasunhas.sp', 'https://www.casadasunhas.com.br/', 'MI / CHUNG', '07.340.568/0001-09', '', '2024-08-20 18:14:06', 'São Paulo (BOM RETIRO)', 'SP', '', 'Metropolitada São Paulo'),
(14284, 'OUTLET UNHAS E CÍLIOS', 'Ladeira Porto Geral, n 14 loja 281 CENTRO SP', 'Descoberto', 'Unhas, cílios ', '11913225654', 'https://www.instagram.com/outletunhasecilios/', '', 'GIOVANNA', '41.818.878/0001-16', '', '2024-08-20 18:14:06', 'São Paulo (Centro)', 'SP', '', 'Metropolitada São Paulo'),
(14285, 'CASA BELLEZA CENTRO', 'Ladeira Porto Geral, 14 - Loja 256/262 - Centro Histórico de São Paulo, São Paulo - SP, 01022-000', 'Descoberto', 'Unhas, cílios e sobrancelha', '(11) 94849-2537', 'https://www.instagram.com/lojacasabelleza.oficial/', '', 'TINGTING', '44.615.608/0001-04', '', '2024-08-20 18:14:06', 'São Paulo (Centro)', 'SP', '', 'Metropolitada São Paulo'),
(14286, 'ZEINA LASH & NAILS', 'LADEIRA PORTO GERAL, 34 - CENTRO - SÃO PAULO/SP 01022-000', 'Descoberto', 'Unhas, cílios   ', '11 95283-4152', 'https://www.instagram.com/zeina_lashandnails/', '', 'FATIMA', '53.267.467/0001-69', '', '2024-08-20 18:14:06', 'São Paulo (Centro)', 'SP', '', 'Metropolitada São Paulo'),
(14287, 'QBELEZA', 'RUA BOA VISTA, 280 - CENTRO - SÃO PAULO/SP 01014-908', 'Descoberto', 'Unhas, cílios   ', '11992608837', 'https://www.instagram.com/qbeleza.contato/', '', 'ADRIANA', '51.653.458/0001-80', '', '2024-08-20 18:14:06', 'São Paulo (Centro)', 'SP', '', 'Metropolitada São Paulo'),
(14288, 'Emporium Lolita', 'RUA BOA VISTA, 280 - CENTRO - SÃO PAULO/SP 01014-908', 'Descoberto', 'Unhas, cílios e sobrancelha', '(11) 94318-7253', 'https://www.instagram.com/lojaemporiumlolita/', '', 'BRYAN', '46.909.726/0001-42', '', '2024-08-20 18:14:06', 'São Paulo (Centro)', 'SP', '', 'Metropolitada São Paulo'),
(14289, 'Lojas FanNails', 'RUA FLORENCIO DE ABREU, 334 - CENTRO - SÃO PAULO/SP 01030-000', 'Descoberto', 'Unhas, cílios e sobrancelha', '11986462389', 'https://www.instagram.com/fan.lojas/', '', 'PRISCILA', '46.859.634/0001-03', '', '2024-08-20 18:14:06', 'São Paulo (Centro)', 'SP', 'priscila.shangguan@gmail.com', 'Metropolitada São Paulo'),
(14290, 'DESIGN COSMETICOS', 'PRACA DA LIBERDADE AFRICA-JAPAO - 80 - LIBERDADE - São paulo - SP - 01503-010', 'Descoberto', 'Unhas, cílios e sobrancelha', '11974843300', 'https://www.instagram.com/designcosmeticosoficial/', 'https://www.designcosmeticos.com.br/', 'NEUSA', '53.249.079/0001-55', '(11) 98633-0332', '2024-08-20 18:14:06', 'São Paulo (LIBERDADE)', 'SP', '', 'Metropolitada São Paulo'),
(14291, 'KIKI BELEZA', 'RUA CARNOT, 356 - CANINDE - SÃO PAULO/SP 03032-030', 'Descoberto', '', '(11)98970-0636', 'https://www.instagram.com/kikibelezaa/', '', '', '52.607.151/0001-06', '', '2024-08-20 18:14:06', 'São Paulo (CANINDE)', 'SP', 'jixiaoxiao4001@gmail.com', 'Metropolitada São Paulo'),
(14301, 'Guilherme', 'Estrada geral da limpa', 'Coberto', 'Unhas', '48992118970', '', '', '', '29.077.745/0001-30', '', '2024-08-23 17:17:32', 'Garopaba', 'SC', '', ''),
(14309, 'testando', 'Estrada geral da limpa', 'Ativo', 'Unhas', '48992118970', '@omatheusrogério', 'https://www.amorbeleza.com.br/?fbclid=IwAR16A5e4KVxsWS0BikU2gShb12FK1TYMFcZEBQrdoae3ABNc54hrTtgyZro', 'Guilherme', '27.212.630/0001-86', '48992118970', '2024-09-04 20:55:56', 'Garopaba', '24', 'madufajuisa@gmail.com', ''),
(14316, 'Phermas Cosméticos e Perfumaria 1234', 'Av. Cap. Aviador Walter Ribeiro, 400- Cumbica, Guarulhos', 'Inativo', '', '11990118752', 'https://www.instagram.com/phermascosmeticos', '', 'Evandro', '50.981.114/0001-38', '', '2024-09-13 20:23:38', 'GUARULHOS', '', '', ''),
(14317, 'Phermas Cosméticos e Perfumaria 1234', 'Av. Cap. Aviador Walter Ribeiro, 400- Cumbica, Guarulhos', 'Inativo', '', '11990118752', 'https://www.instagram.com/phermascosmeticos', '', 'Evandro', '50.981.114/0001-38', '', '2024-09-13 20:23:55', 'GUARULHOS', '', '', ''),
(14318, 'Guilherme', 'Estrada geral da limpa', 'Descoberto', '', '48992118970', '@omatheusrogério', 'https://www.amorbeleza.com.br/?fbclid=IwAR16A5e4KVxsWS0BikU2gShb12FK1TYMFcZEBQrdoae3ABNc54hrTtgyZro', 'Guilherme', '29.077.745/0001-30', '48992118970', '2024-09-18 14:30:30', 'Garopaba', '24', 'madufajuisa@gmail.com', '138'),
(14319, 'MATHEUS TESTE RICARDO', 'Estrada geral da limpa', 'Coberto', '', '48992118970', '', '', '', '29.077.745/0001-30', '', '2024-09-18 17:02:59', 'Garopaba', '14', '', '67'),
(14320, 'Guilherme', 'Estrada geral da limpa', 'Coberto', '', '48992118970', '', '', '', '29.077.745/0001-30', '', '2024-09-18 18:49:43', 'Garopaba', '24', '', '135');

-- --------------------------------------------------------

--
-- Estrutura para tabela `stores_markers`
--

CREATE TABLE `stores_markers` (
  `id` int(11) NOT NULL,
  `loja_id` int(11) NOT NULL,
  `marcador_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `stores_markers`
--

INSERT INTO `stores_markers` (`id`, `loja_id`, `marcador_id`) VALUES
(8949, 13783, 13),
(8950, 13784, 13),
(8952, 13786, 13),
(8953, 13787, 13),
(8954, 13788, 13),
(8955, 13789, 13),
(8956, 13790, 13),
(8957, 13791, 13),
(8958, 13792, 13),
(8959, 13793, 13),
(8960, 13794, 13),
(8961, 13795, 13),
(8962, 13796, 13),
(8963, 13797, 13),
(8964, 13798, 13),
(8965, 13799, 13),
(8966, 13800, 13),
(8967, 13801, 13),
(8969, 13803, 13),
(8970, 13804, 13),
(8971, 13805, 13),
(8972, 13806, 13),
(8973, 13807, 13),
(8974, 13808, 13),
(8975, 13809, 13),
(8976, 13810, 13),
(8977, 13811, 13),
(8978, 13812, 13),
(8979, 13813, 13),
(8980, 13814, 13),
(8981, 13815, 13),
(8982, 13816, 13),
(8983, 13817, 13),
(8984, 13818, 13),
(8985, 13819, 13),
(8986, 13820, 13),
(8987, 13821, 13),
(8988, 13822, 13),
(8989, 13823, 13),
(8990, 13824, 13),
(8991, 13825, 13),
(8992, 13826, 13),
(8993, 13827, 13),
(8994, 13828, 13),
(8995, 13829, 13),
(8996, 13830, 13),
(8997, 13831, 13),
(8998, 13832, 13),
(8999, 13833, 13),
(9000, 13834, 13),
(9001, 13835, 13),
(9002, 13836, 13),
(9003, 13837, 13),
(9004, 13838, 13),
(9005, 13839, 13),
(9006, 13840, 13),
(9007, 13841, 13),
(9008, 13842, 13),
(9009, 13843, 13),
(9010, 13844, 13),
(9011, 13845, 13),
(9012, 13846, 13),
(9013, 13847, 13),
(9014, 13848, 13),
(9015, 13849, 13),
(9016, 13850, 13),
(9017, 13851, 13),
(9018, 13852, 13),
(9019, 13853, 13),
(9020, 13854, 13),
(9021, 13855, 13),
(9022, 13856, 13),
(9023, 13857, 13),
(9024, 13858, 13),
(9025, 13859, 13),
(9026, 13860, 13),
(9027, 13861, 13),
(9028, 13862, 13),
(9029, 13863, 13),
(9030, 13864, 13),
(9031, 13865, 13),
(9032, 13866, 13),
(9033, 13867, 13),
(9034, 13868, 13),
(9035, 13869, 13),
(9036, 13870, 13),
(9037, 13871, 13),
(9038, 13872, 13),
(9039, 13873, 13),
(9040, 13874, 13),
(9041, 13875, 13),
(9042, 13876, 13),
(9043, 13877, 13),
(9044, 13878, 13),
(9045, 13879, 13),
(9046, 13880, 13),
(9047, 13881, 13),
(9048, 13882, 13),
(9049, 13883, 13),
(9050, 13884, 13),
(9051, 13885, 13),
(9052, 13886, 13),
(9053, 13887, 13),
(9054, 13888, 13),
(9055, 13889, 13),
(9056, 13890, 13),
(9057, 13891, 13),
(9058, 13892, 13),
(9059, 13893, 13),
(9060, 13894, 13),
(9061, 13895, 13),
(9062, 13896, 13),
(9063, 13897, 13),
(9064, 13898, 13),
(9065, 13899, 13),
(9066, 13900, 13),
(9067, 13901, 13),
(9068, 13902, 13),
(9069, 13903, 13),
(9070, 13904, 13),
(9071, 13905, 13),
(9072, 13906, 13),
(9073, 13907, 13),
(9074, 13908, 13),
(9075, 13909, 13),
(9076, 13910, 13),
(9077, 13911, 13),
(9078, 13912, 13),
(9079, 13913, 13),
(9080, 13914, 13),
(9081, 13915, 13),
(9082, 13916, 13),
(9083, 13917, 13),
(9084, 13918, 13),
(9085, 13919, 13),
(9086, 13920, 13),
(9087, 13921, 13),
(9088, 13922, 13),
(9089, 13923, 13),
(9090, 13924, 13),
(9091, 13925, 13),
(9092, 13926, 13),
(9093, 13927, 13),
(9094, 13928, 13),
(9095, 13929, 13),
(9096, 13930, 13),
(9097, 13931, 13),
(9098, 13932, 13),
(9099, 13933, 13),
(9100, 13934, 13),
(9101, 13935, 13),
(9102, 13936, 13),
(9103, 13937, 13),
(9104, 13938, 13),
(9105, 13939, 13),
(9106, 13940, 13),
(9107, 13941, 13),
(9108, 13942, 13),
(9109, 13943, 13),
(9155, 13989, 13),
(9156, 13990, 13),
(9157, 13991, 13),
(9158, 13992, 13),
(9159, 13993, 13),
(9160, 13994, 13),
(9161, 13995, 13),
(9162, 13996, 13),
(9163, 13997, 13),
(9164, 13998, 13),
(9165, 13999, 13),
(9166, 14000, 13),
(9167, 14001, 13),
(9168, 14002, 13),
(9169, 14003, 13),
(9170, 14004, 13),
(9171, 14005, 13),
(9172, 14006, 13),
(9173, 14007, 13),
(9174, 14008, 13),
(9175, 14009, 13),
(9176, 14010, 13),
(9177, 14011, 13),
(9178, 14012, 13),
(9179, 14013, 13),
(9180, 14014, 13),
(9181, 14015, 13),
(9182, 14016, 13),
(9183, 14017, 13),
(9184, 14018, 13),
(9185, 14019, 13),
(9186, 14020, 13),
(9187, 14021, 13),
(9188, 14022, 13),
(9189, 14023, 13),
(9190, 14024, 13),
(9191, 14025, 13),
(9192, 14026, 13),
(9193, 14027, 13),
(9194, 14028, 13),
(9195, 14029, 13),
(9196, 14030, 13),
(9197, 14031, 13),
(9198, 14032, 13),
(9199, 14033, 13),
(9200, 14034, 13),
(9201, 14035, 13),
(9202, 14036, 13),
(9203, 14037, 13),
(9204, 14038, 13),
(9205, 14039, 13),
(9206, 14040, 13),
(9207, 14041, 13),
(9208, 14042, 13),
(9209, 14043, 13),
(9210, 14044, 13),
(9211, 14045, 13),
(9212, 14046, 13),
(9213, 14047, 13),
(9214, 14048, 13),
(9215, 14049, 13),
(9216, 14050, 13),
(9217, 14051, 13),
(9218, 14052, 13),
(9219, 14053, 13),
(9220, 14054, 13),
(9221, 14055, 13),
(9222, 14056, 13),
(9223, 14057, 13),
(9224, 14058, 13),
(9225, 14059, 13),
(9226, 14060, 13),
(9227, 14061, 13),
(9228, 14062, 13),
(9229, 14063, 13),
(9230, 14064, 13),
(9231, 14065, 13),
(9241, 14075, 13),
(9242, 14076, 13),
(9243, 14077, 13),
(9244, 14078, 13),
(9245, 14079, 13),
(9246, 14080, 13),
(9247, 14081, 13),
(9248, 14082, 13),
(9249, 14083, 13),
(9250, 14084, 13),
(9251, 14085, 13),
(9252, 14086, 13),
(9253, 14087, 13),
(9254, 14088, 13),
(9255, 14089, 13),
(9256, 14090, 13),
(9257, 14091, 13),
(9258, 14092, 13),
(9259, 14093, 13),
(9260, 14094, 13),
(9261, 14095, 13),
(9262, 14096, 13),
(9263, 14097, 13),
(9264, 14098, 13),
(9265, 14099, 13),
(9266, 14100, 13),
(9267, 14101, 13),
(9268, 14102, 13),
(9269, 14103, 13),
(9270, 14104, 13),
(9271, 14105, 13),
(9272, 14106, 13),
(9273, 14107, 13),
(9274, 14108, 13),
(9275, 14109, 13),
(9276, 14110, 13),
(9277, 14111, 13),
(9278, 14112, 13),
(9282, 14116, 13),
(9283, 14117, 13),
(9284, 14118, 13),
(9285, 14119, 13),
(9286, 14120, 13),
(9287, 14121, 13),
(9288, 14122, 13),
(9289, 14123, 13),
(9290, 14124, 13),
(9291, 14125, 13),
(9292, 14126, 13),
(9293, 14127, 13),
(9294, 14128, 13),
(9295, 14129, 13),
(9296, 14130, 13),
(9297, 14131, 13),
(9298, 14132, 13),
(9299, 14133, 13),
(9300, 14134, 13),
(9301, 14135, 13),
(9302, 14136, 13),
(9303, 14137, 13),
(9304, 14138, 13),
(9305, 14139, 13),
(9306, 14140, 13),
(9307, 14141, 13),
(9308, 14142, 13),
(9309, 14143, 13),
(9310, 14144, 13),
(9311, 14145, 13),
(9312, 14146, 13),
(9313, 14147, 13),
(9314, 14148, 13),
(9315, 14149, 13),
(9316, 14150, 13),
(9317, 14151, 13),
(9318, 14152, 13),
(9319, 14153, 13),
(9320, 14154, 13),
(9321, 14155, 13),
(9322, 14156, 13),
(9323, 14157, 13),
(9324, 14158, 13),
(9325, 14159, 13),
(9326, 14160, 13),
(9327, 14161, 13),
(9328, 14162, 13),
(9329, 14163, 13),
(9330, 14164, 13),
(9331, 14165, 13),
(9332, 14166, 13),
(9333, 14167, 13),
(9334, 14168, 13),
(9335, 14169, 13),
(9336, 14170, 13),
(9337, 14171, 13),
(9338, 14172, 13),
(9339, 14173, 13),
(9340, 14174, 13),
(9341, 14175, 13),
(9342, 14176, 13),
(9343, 14177, 13),
(9344, 14178, 13),
(9345, 14179, 13),
(9346, 14180, 13),
(9347, 14181, 13),
(9348, 14182, 13),
(9349, 14183, 13),
(9350, 14184, 13),
(9351, 14185, 13),
(9352, 14186, 13),
(9353, 14187, 13),
(9354, 14188, 13),
(9355, 14189, 13),
(9356, 14190, 13),
(9357, 14191, 13),
(9358, 14192, 13),
(9359, 14193, 13),
(9360, 14194, 13),
(9361, 14195, 13),
(9362, 14196, 13),
(9363, 14197, 13),
(9364, 14198, 13),
(9365, 14199, 13),
(9366, 14200, 13),
(9367, 14201, 13),
(9368, 14202, 13),
(9369, 14203, 13),
(9370, 14204, 13),
(9371, 14205, 13),
(9372, 14206, 13),
(9373, 14207, 13),
(9374, 14208, 13),
(9375, 14209, 13),
(9376, 14210, 13),
(9377, 14211, 13),
(9378, 14212, 13),
(9379, 14213, 13),
(9380, 14214, 13),
(9381, 14215, 13),
(9382, 14216, 13),
(9383, 14217, 13),
(9384, 14218, 13),
(9385, 14219, 13),
(9386, 14220, 13),
(9387, 14221, 13),
(9388, 14222, 13),
(9389, 14223, 13),
(9390, 14224, 13),
(9391, 14225, 13),
(9392, 14226, 13),
(9393, 14227, 13),
(9394, 14228, 13),
(9395, 14229, 13),
(9396, 14230, 13),
(9397, 14231, 13),
(9398, 14232, 13),
(9399, 14233, 13),
(9400, 14234, 13),
(9401, 14235, 13),
(9402, 14236, 13),
(9403, 14237, 13),
(9404, 14238, 13),
(9405, 14239, 13),
(9406, 14240, 13),
(9407, 14241, 13),
(9408, 14242, 13),
(9409, 14243, 13),
(9410, 14244, 13),
(9411, 14245, 13),
(9412, 14246, 13),
(9413, 14247, 13),
(9414, 14248, 13),
(9415, 14249, 13),
(9416, 14250, 13),
(9417, 14251, 13),
(9418, 14252, 13),
(9419, 14253, 13),
(9438, 14272, 13),
(9439, 14273, 13),
(9440, 14274, 13),
(9441, 14275, 13),
(9442, 14276, 13),
(9443, 14277, 13),
(9444, 14278, 13),
(9483, 14301, 13);

-- --------------------------------------------------------

--
-- Estrutura para tabela `stores_seller`
--

CREATE TABLE `stores_seller` (
  `store_id` int(11) NOT NULL,
  `vendedor_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `stores_seller`
--

INSERT INTO `stores_seller` (`store_id`, `vendedor_id`) VALUES
(13783, 50),
(13784, 50),
(13786, 50),
(13787, 50),
(13788, 50),
(13789, 50),
(13790, 50),
(13791, 50),
(13792, 50),
(13793, 50),
(13794, 50),
(13795, 50),
(13796, 50),
(13797, 50),
(13798, 50),
(13799, 50),
(13800, 50),
(13801, 50),
(13803, 50),
(13804, 50),
(13820, 50),
(13978, 50),
(13983, 50),
(13997, 50),
(14309, 50),
(14316, 50),
(14317, 50),
(14318, 50),
(14319, 50),
(14320, 50);

-- --------------------------------------------------------

--
-- Estrutura para tabela `stores_users`
--

CREATE TABLE `stores_users` (
  `id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `timestemp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `stores_users`
--

INSERT INTO `stores_users` (`id`, `store_id`, `user_id`, `timestemp`) VALUES
(0, 14301, 34, '2024-08-23 17:17:32'),
(0, 14309, 34, '2024-09-04 20:55:56'),
(0, 14316, 34, '2024-09-13 20:23:38'),
(0, 14317, 34, '2024-09-13 20:23:55'),
(0, 14318, 34, '2024-09-18 14:30:30'),
(0, 14319, 34, '2024-09-18 17:02:59'),
(0, 14320, 34, '2024-09-18 18:49:43');

-- --------------------------------------------------------

--
-- Estrutura para tabela `teams`
--

CREATE TABLE `teams` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `manager_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `teams`
--

INSERT INTO `teams` (`id`, `name`, `description`, `manager_id`, `created_by`, `created_at`) VALUES
(2, 'Equipe B2PRO', '', 43, 34, '2024-08-23 13:31:28');

-- --------------------------------------------------------

--
-- Estrutura para tabela `team_users`
--

CREATE TABLE `team_users` (
  `id` int(11) NOT NULL,
  `team_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `role` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `team_users`
--

INSERT INTO `team_users` (`id`, `team_id`, `user_id`, `role`) VALUES
(16, 2, 34, 'Membro');

-- --------------------------------------------------------

--
-- Estrutura para tabela `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `senha` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `status` varchar(10) NOT NULL,
  `function` varchar(50) NOT NULL,
  `img_name` varchar(100) NOT NULL,
  `credits` int(11) DEFAULT 40000,
  `last_reset` date DEFAULT NULL,
  `datetime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `users`
--

INSERT INTO `users` (`id`, `nome`, `senha`, `email`, `tipo`, `status`, `function`, `img_name`, `credits`, `last_reset`, `datetime`) VALUES
(34, 'Matheus', '1234', 'madufajuisa@gmail.com', 'Administrador', 'Ativo', 'Hunter', 'user_34.png', 40000, NULL, '2024-08-20 20:54:22'),
(43, 'Bruno', '1234', 'bruno@gmail.com', 'Gerente', 'Ativo', 'Gerente', '', 40000, NULL, '2024-08-21 17:45:59'),
(50, 'Bruno', '1234', 'madufajuisa2@gmail.com', 'Padrão', 'Ativo', 'Vendedor', '', 40000, NULL, '2024-09-11 20:00:20'),
(52, 'teste', '1234', 'teste@gmail.com', 'Padrão', 'Solicitado', '', '', 40000, NULL, '2024-09-18 18:17:50'),
(53, 'teste', '1234', 'teste@gmail.com', 'Padrão', 'Solicitado', '', '', 40000, NULL, '2024-09-18 18:18:39'),
(54, 'Matheus', '1234', 'madufajuisa@gmail.com', 'Padrão', 'Solicitado', '', '', 40000, NULL, '2024-09-18 18:21:41'),
(55, 'Matheus', '1234', 'madufajuisa@gmail.com', 'Padrão', 'Solicitado', '', '', 40000, NULL, '2024-09-18 18:21:42'),
(56, 'Guilherme', '1234', 'madufajuisa@gmail.com', 'Padrão', 'Solicitado', '', '', 40000, NULL, '2024-09-18 18:36:25'),
(57, 'Guilherme', '1234', 'madufajuisa@gmail.com', 'Padrão', 'Solicitado', '', '', 40000, NULL, '2024-09-18 18:41:06'),
(58, 'Guilherme', '1234', 'madufajuisa@gmail.com', 'Padrão', 'Solicitado', '', '', 40000, NULL, '2024-09-18 18:41:09'),
(59, 'Guilherme', '1234', 'madufajuisa@gmail.com', 'Padrão', 'Solicitado', '', '', 40000, NULL, '2024-09-18 18:44:58'),
(60, 'Guilherme', '1234', 'madufajuisa@gmail.com', 'Padrão', 'Solicitado', '', '', 40000, NULL, '2024-09-18 18:48:23'),
(61, 'Guilherme', '1234', 'madufajuisa@gmail.com', 'Padrão', 'Solicitado', '', '', 40000, NULL, '2024-09-18 18:48:39'),
(62, 'Guilherme', '1234', 'madufajuisa@gmail.com', 'Padrão', 'Solicitado', '', '', 40000, NULL, '2024-09-18 18:48:40'),
(63, 'Guilherme', '1234', 'madufajuisa@gmail.com', 'Padrão', 'Solicitado', '', '', 40000, NULL, '2024-09-18 18:48:40'),
(64, 'Guilherme', '1234', 'madufajuisa@gmail.com', 'Padrão', 'Solicitado', '', '', 40000, NULL, '2024-09-18 18:48:40'),
(65, 'Guilherme', '1234', 'madufajuisa@gmail.com', 'Padrão', 'Solicitado', '', '', 40000, NULL, '2024-09-18 18:48:40'),
(66, 'Guilherme', '1234', 'madufajuisa@gmail.com', 'Padrão', 'Solicitado', '', '', 40000, NULL, '2024-09-18 18:48:41');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `credits`
--
ALTER TABLE `credits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Índices de tabela `educators`
--
ALTER TABLE `educators`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `estados`
--
ALTER TABLE `estados`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `geocoded_addresses`
--
ALTER TABLE `geocoded_addresses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `endereco` (`endereco`);

--
-- Índices de tabela `goals`
--
ALTER TABLE `goals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `goals_ibfk_1` (`created_by`),
  ADD KEY `goals_ibfk_2` (`marker_id`);

--
-- Índices de tabela `goals_user`
--
ALTER TABLE `goals_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `goals_user_ibfk_1` (`goal_id`),
  ADD KEY `goals_user_ibfk_2` (`user_id`);

--
-- Índices de tabela `markers`
--
ALTER TABLE `markers`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `mesorregioes`
--
ALTER TABLE `mesorregioes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `estado_id` (`estado_id`);

--
-- Índices de tabela `representatives`
--
ALTER TABLE `representatives`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `sharpeners`
--
ALTER TABLE `sharpeners`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `sharpeners_markers`
--
ALTER TABLE `sharpeners_markers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_marker_id` (`marcador_id`),
  ADD KEY `fk_sharpener_id` (`sharpener_id`);

--
-- Índices de tabela `sharpeners_users`
--
ALTER TABLE `sharpeners_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sharpeners_users_ibfk_1` (`sharpener_id`),
  ADD KEY `sharpeners_users_ibfk_2` (`user_id`);

--
-- Índices de tabela `stores`
--
ALTER TABLE `stores`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `stores_markers`
--
ALTER TABLE `stores_markers`
  ADD PRIMARY KEY (`id`,`loja_id`,`marcador_id`),
  ADD KEY `stores_markers_ibfk_1` (`loja_id`),
  ADD KEY `stores_markers_ibfk_2` (`marcador_id`);

--
-- Índices de tabela `stores_seller`
--
ALTER TABLE `stores_seller`
  ADD PRIMARY KEY (`store_id`,`vendedor_id`),
  ADD KEY `vendedor_id` (`vendedor_id`);

--
-- Índices de tabela `stores_users`
--
ALTER TABLE `stores_users`
  ADD PRIMARY KEY (`store_id`,`user_id`,`id`),
  ADD KEY `stores_users_ibfk_2` (`user_id`);

--
-- Índices de tabela `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`id`),
  ADD KEY `manager_id` (`manager_id`),
  ADD KEY `created_by` (`created_by`);

--
-- Índices de tabela `team_users`
--
ALTER TABLE `team_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `team_id` (`team_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Índices de tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `credits`
--
ALTER TABLE `credits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `educators`
--
ALTER TABLE `educators`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1240;

--
-- AUTO_INCREMENT de tabela `estados`
--
ALTER TABLE `estados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de tabela `geocoded_addresses`
--
ALTER TABLE `geocoded_addresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=521;

--
-- AUTO_INCREMENT de tabela `goals`
--
ALTER TABLE `goals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de tabela `goals_user`
--
ALTER TABLE `goals_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de tabela `markers`
--
ALTER TABLE `markers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT de tabela `mesorregioes`
--
ALTER TABLE `mesorregioes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=140;

--
-- AUTO_INCREMENT de tabela `representatives`
--
ALTER TABLE `representatives`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `sharpeners`
--
ALTER TABLE `sharpeners`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2354;

--
-- AUTO_INCREMENT de tabela `sharpeners_markers`
--
ALTER TABLE `sharpeners_markers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `sharpeners_users`
--
ALTER TABLE `sharpeners_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `stores`
--
ALTER TABLE `stores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14321;

--
-- AUTO_INCREMENT de tabela `stores_markers`
--
ALTER TABLE `stores_markers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9491;

--
-- AUTO_INCREMENT de tabela `teams`
--
ALTER TABLE `teams`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `team_users`
--
ALTER TABLE `team_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `credits`
--
ALTER TABLE `credits`
  ADD CONSTRAINT `credits_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Restrições para tabelas `goals`
--
ALTER TABLE `goals`
  ADD CONSTRAINT `goals_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `goals_ibfk_2` FOREIGN KEY (`marker_id`) REFERENCES `markers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `goals_user`
--
ALTER TABLE `goals_user`
  ADD CONSTRAINT `goals_user_ibfk_1` FOREIGN KEY (`goal_id`) REFERENCES `goals` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `goals_user_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `mesorregioes`
--
ALTER TABLE `mesorregioes`
  ADD CONSTRAINT `mesorregioes_ibfk_1` FOREIGN KEY (`estado_id`) REFERENCES `estados` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `sharpeners_markers`
--
ALTER TABLE `sharpeners_markers`
  ADD CONSTRAINT `fk_marker_id` FOREIGN KEY (`marcador_id`) REFERENCES `markers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_sharpener_id` FOREIGN KEY (`sharpener_id`) REFERENCES `sharpeners` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `sharpeners_users`
--
ALTER TABLE `sharpeners_users`
  ADD CONSTRAINT `sharpeners_users_ibfk_1` FOREIGN KEY (`sharpener_id`) REFERENCES `sharpeners` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sharpeners_users_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `stores_markers`
--
ALTER TABLE `stores_markers`
  ADD CONSTRAINT `stores_markers_ibfk_1` FOREIGN KEY (`loja_id`) REFERENCES `stores` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `stores_markers_ibfk_2` FOREIGN KEY (`marcador_id`) REFERENCES `markers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `stores_seller`
--
ALTER TABLE `stores_seller`
  ADD CONSTRAINT `stores_seller_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `stores` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `stores_seller_ibfk_2` FOREIGN KEY (`vendedor_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `stores_users`
--
ALTER TABLE `stores_users`
  ADD CONSTRAINT `stores_users_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `stores` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `stores_users_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `teams`
--
ALTER TABLE `teams`
  ADD CONSTRAINT `teams_ibfk_1` FOREIGN KEY (`manager_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `teams_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `team_users`
--
ALTER TABLE `team_users`
  ADD CONSTRAINT `team_users_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `team_users_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
