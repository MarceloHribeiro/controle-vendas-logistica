#Script de criação das tabelas

#Criar banco de dados
CREATE DATABASE bd_1;

#Usar banco de dados
USE bd_1;

#Criar tabela Decorador
CREATE TABLE IF NOT EXISTS `bd_1`.`DECORADOR` (
  `cpfDECORADOR` bigINT NOT NULL,
  `nome` VARCHAR(45) NULL,
  `endereco_com` VARCHAR(45) NULL,
  `telefone_com` bigINT NULL,  
  PRIMARY KEY (`cpfDECORADOR`)
);
 
#Criar tabela Cliente
CREATE TABLE IF NOT EXISTS `bd_1`.`CLIENTE` (
  `cpf` bigINT NOT NULL,
  `nome` VARCHAR(40) NULL,
  `endereco_res` VARCHAR(45) NULL,
  `telefone` bigINT NULL,
  `email` VARCHAR(30) NULL,
  `DECORADOR_cpfDECORADOR` bigINT NOT NULL,
  PRIMARY KEY (`cpf`),  
  FOREIGN KEY (`DECORADOR_cpfDECORADOR`) REFERENCES DECORADOR(`cpfDECORADOR`)
  );
 
 #Criar tabela Produto
 CREATE TABLE IF NOT EXISTS `bd_1`.`PRODUTO` (
  `idPRODUTO` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NULL,
  `fornecedor` VARCHAR(45) NULL,
  `descricao` VARCHAR(255) NULL,
  `preco` DECIMAL(10,2) NULL,
  `largura` DECIMAL(5,2) NULL,
  `profundidade` DECIMAL(5,2) NULL,
  `altura` DECIMAL(5,2) NULL,
  `peso` DECIMAL(5,2) NULL,
  `estoque` INT NULL,
  `frag` TINYINT NOT NULL,
  PRIMARY KEY (`idPRODUTO`)
);
 
#Criar tabela Pedido
CREATE TABLE IF NOT EXISTS `bd_1`.`PEDIDO` (
  `idPEDIDO` INT NOT NULL AUTO_INCREMENT,
  `endereco_entrega` VARCHAR(45) NULL,  
  `CLIENTE_cpf` bigINT NOT NULL,  
  PRIMARY KEY (`idPEDIDO`),
	FOREIGN KEY (`CLIENTE_cpf`) REFERENCES `bd_1`.`CLIENTE` (`cpf`)
	);
    
#criar tabela Pedido_has_Produto
CREATE TABLE IF NOT EXISTS `bd_1`.`PEDIDO_has_PRODUTO` (
 `PEDIDO_idPEDIDO` INT NOT NULL,
 `PRODUTO_idPRODUTO` INT NOT NULL,
 `preco_produto_pedido` DECIMAL(10,2) NULL,
 `quantidade_produto_pedido` INT NULL,  
 PRIMARY KEY (`PEDIDO_idPEDIDO`, `PRODUTO_idPRODUTO`),
 FOREIGN KEY (`PEDIDO_idPEDIDO`) REFERENCES `bd_1`.`PEDIDO` (`idPEDIDO`),
 FOREIGN KEY (`PRODUTO_idPRODUTO`) REFERENCES `bd_1`.`PRODUTO` (`idPRODUTO`)
);

#Script de população das tabelas

#Inserir dados dos Decoradores
INSERT INTO `bd_1`.`DECORADOR`  (`cpfDECORADOR`,`nome`,`endereco_com`,`telefone_com`) VALUES
(42836194245,"Alan Santos","Rua Araras n°89 Bragança Paulista SP",11966414422),
(55699455113,"Carla Aguiar","Rua Regia n°63 Bragança Paulista SP",11955224433),
(44766855390,"Vilma Branco","Rua Clara n°74 Bragança Paulista SP",11944775588),
(55688922236,"Eduardo Souto","Rua Amelia nº86 Atibaia SP",1155568899),
(96345675388,"Fabio Vieira","Rua Direita nº 1334 São Paulo SP",11988445566);

#Inserir dados dos clientes na tabela
INSERT INTO `bd_1`.`CLIENTE` (`cpf`,`nome`,`endereco_res`,`telefone`,`email`,`DECORADOR_cpfDECORADOR`) VALUES
(44355699712,"Elaine Abreu","Rua Tamarati n°20 Bragança Paulista SP",11966419945,"elaine.abreu@gmail.com",42836194245),
(55656978110,"Marcos Melo","Rua Coronel n°11 Bragança Paulista SP",11955942231,"marcos.melo@gmail.com",55699455113),
(45866947120,"Diego Silva","Rua Silas n°50 Bragança Paulista SP",11961237899,"diego.silva@gmail.com",55699455113),
(56359271216,"Diana Chaves","Rua Hellena n°90 Bragança Paulista SP",11921243136,"diana.chaves@gmail.com",96345675388),
(64594663211,"Adan Abreu","Rua Braga n°12 Bragança Paulista SP",11948123621,"adan.abreu@gmail.com",42836194245),
(22345194712,"Edgar Dantas","Rua Tarssis n°59 Bragança Paulista SP",11945126622,"edgar.dantas@gmail.com",55688922236),
(44799133640,"Hamilton Franco","Rua Galileu n°12 Bragança Paulista SP",11933117799,"hamilton.franco@gmail.com",96345675388),
(55612304520,"Ana Santos","Rua Tadeu n° 23 Bragança Paulista SP",11966166481,"ana.santos@gmal.com",42836194245),
(66123464930,"Bruna Dias","Rua Catedral n°90 Bragança Paulista SP",11945451213,"bruna.dias@gmail.com",55688922236),
(41526345111,"Maria Prado","Rua Chagas n°20 Bragança Paulista SP",11966445520,"maria.prado@gmail.com",96345675388),
(61361310210,"Lucas Antonio","Rua Teixeira n°12 Bragança Paulista SP",11961941231,"lucas.antonio@gmail.com",96345675388);

#Inserir dados dos produtos na tabela
INSERT INTO `bd_1`.`PRODUTO` (`nome`,`fornecedor`,`descricao`,`preco`,`largura`,`profundidade`,`altura`,`peso`,`estoque`,`frag`) VALUES
("Poltrona Barcelona","Herman Miller","Cadeira em couro e estrutura em aço inox",4370.66,75,75,74,17,5,0),
("Cadeira Bertoia","Bauhaus Design","Cadeira em aço e couro",1172.00,50,51,84,12,23,0),
("Cadeira Girafa","Marcenaria Baraúna","Cadeira em madeira",1298.00,44,39,79,6,21,0),
("Mesa Girafa","Marcenaria Baraúna","Mesa em madeira",2190.00,70,70,76,25,9,0),
("Escultura de mesa","Ateliê Zoe","Peça em cerâmica",230.00,10,8,25,0.75,10,1),
("Tapete Macramê","Ateliê Zoe","Tapete em macramê com motivos indígenas",6732.35,130,250,1,4.6,2,0),
("Espelho Decorativo","Vidracaria Cristal","Espelho redondo com moldura em alumínio",423.36,120,120,1,5.2,3,1),
("Poltrona Charles Eames","Herman Miller","Cadeira em aço, madeira e couro",7500.52,83.2,74.6,95.2,8.5,3,0),
("Conjunto de Vasos Marajoara","Cooperativa Maranhão","Conjunto de vasos em três tamanhos com motivos marajoaras",1565.6,30.6,60.5,128.5,36.6,5,1),
("Mesa em Vidro","Bauhaus Design","Mesa em vidro e aço",6253.2,90.6,230.5,95.6,132.5,2,1);

#Inserir dados dos pedidos na tabela
INSERT INTO `bd_1`.`PEDIDO` (`endereco_entrega`,`CLIENTE_cpf`) VALUES
("Rua Tamarati n°20 Bragança Paulista SP",44355699712),
("Rua Tamarati n°20 Bragança Paulista SP",44355699712),
("Rua Coronel  n°11 Bragança Paulista SP",55656978110),
("Rua Silas n°50 Bragança Paulista SP",45866947120),
("Rua Hellena n°90 Bragança Paulista SP",56359271216),
("Rua Coronel  n°11 Bragança Paulista SP",55656978110),
("Rua Tamarati n°20 Bragança Paulista SP",44355699712),
("Rua Tarssis n°59  Bragança Paulista SP",22345194712),
("Rua Hellena n°90 Bragança Paulista SP",56359271216),
("Rua Galileu n°12 Bragança Paulista SP",44799133640),
("Rua Silas n°50 Bragança Paulista SP",45866947120),
("Rua Braga n°12 Bragança Paulista SP",64594663211),
("Rua Silas n°50 Bragança Paulista SP",45866947120),
("Rua Galileu n°12 Bragança Paulista SP",44799133640),
("Rua Hellena n°90 Bragança Paulista SP",56359271216),
("Rua Tarssis n°59  Bragança Paulista SP",22345194712),
("Rua Hellena n°90 Bragança Paulista SP",56359271216),
("Rua Hellena n°90 Bragança Paulista SP",56359271216),
("Rua Tadeu n° 23 Bragança Paulista SP",55612304520),
("Rua Teixeira n°12 Bragança Paulista SP",61361310210),
("Rua Tadeu n° 23 Bragança Paulista SP",55612304520),
("Rua Chagas n°20 Bragança Paulista SP",41526345111),
("Rua Chagas n°20 Bragança Paulista SP",41526345111),
("Rua Tadeu n° 23 Bragança Paulista SP",55612304520),
("Rua Catedral n°90 Bragança Paulista SP",66123464930),
("Rua Tadeu n° 23 Bragança Paulista SP",55612304520),
("Rua Teixeira n°12 Bragança Paulista SP",61361310210);

#Inserir dados dos produtos dos pedidos
INSERT INTO `bd_1`.`PEDIDO_has_PRODUTO` (`PEDIDO_idPEDIDO`,`PRODUTO_idPRODUTO`,`preco_produto_pedido`,`quantidade_produto_pedido`) VALUES
(1,1,4370.66,2),
(1,3,1298.00,5),
(1,7,423.36,2),
(1,5,230.00,1),
(2,10,6253.2,1),
(2,2,1172.00,6),
(3,3,1298.00,8),
(3,10,6253.2,1),
(3,6,6732.35,2),
(4,5,230.00,2),
(5,8,7500.52,1),
(5,9,1565.6,2),
(5,4,2190.00,1),
(5,3,1298.00,6),
(5,1,4370.66,2),
(6,1,4370.66,1),
(7,10,6253.2,1),
(8,2,1172.00,6),
(8,3,1298.00,8),
(8,10,6253.2,1),
(9,6,6732.35,2),
(9,5,230.00,2),
(9,8,7500.52,2),
(9,9,1565.6,2),
(10,4,2190.00,1),
(11,3,1298.00,4),
(12,1,4370.66,2),
(13,6,6732.35,2),
(14,5,230.00,2),
(14,8,7500.52,1),
(15,9,1565.6,2),
(15,4,2190.00,1),
(16,3,1298.00,6),
(16,1,4370.66,2),
(16,2,1172.00,1),
(16,10,6253.2,1),
(17,2,1172.00,6),
(18,3,1298.00,6),
(19,1,4370.66,2),
(20,1,4370.66,1),
(20,10,6253.2,1),
(20,2,1172.00,6),
(20,7,423.36,1),
(20,6,6732.35,2),
(21,5,230.00,2),
(22,8,7500.52,1),
(23,9,1565.6,2),
(23,4,2190.00,3),
(24,10,6253.2,1),
(25,2,1172.00,6),
(26,6,6732.35,2),
(26,4,2190.00,1),
(27,6,6732.35,3),
(27,4,2190.00,1);


#Queries

#1- Saber qual decorador está atendendo qual cliente e quais clientes são atendidos por qual decorador, com formatação dos nomes das colunas:

#Cliente > Decorador:

SELECT CLIENTE.cpf AS "CPF do cliente", CLIENTE.nome AS "Nome do cliente", DECORADOR.nome AS "Decorador responsável" FROM CLIENTE INNER JOIN DECORADOR ON DECORADOR_cpfDECORADOR = DECORADOR.cpfDECORADOR;

#Decorador > Cliente:
SELECT DECORADOR.cpfDECORADOR AS "CPF do decorador", DECORADOR.nome AS "Nome do decorador", CLIENTE.nome AS "Cliente atendido" FROM DECORADOR INNER JOIN CLIENTE ON CLIENTE.DECORADOR_cpfDECORADOR = DECORADOR.cpfDECORADOR;

#2- Saber o valor total de todos os pedidos com indicação do cliente:

SELECT PEDIDO_has_PRODUTO.PEDIDO_idPedido AS "Número do pedido", CLIENTE.nome AS "Nome do Cliente", SUM(PEDIDO_has_PRODUTO.preco_produto_pedido * PEDIDO_has_PRODUTO.quantidade_produto_pedido) AS "Valor total do pedido" FROM PEDIDO_has_PRODUTO INNER JOIN CLIENTE INNER JOIN PEDIDO WHERE CLIENTE.cpf = PEDIDO.Cliente_cpf AND PEDIDO.idPedido = PEDIDO_has_PRODUTO.Pedido_idPedido GROUP BY Pedido_idPedido ORDER BY Pedido_idPedido ASC;

#3- Saber o peso total de todos os pedidos:
SELECT PEDIDO_has_PRODUTO.Pedido_idPedido AS "Número do pedido", SUM(PRODUTO.peso*PEDIDO_has_PRODUTO.quantidade_produto_pedido) AS "Peso total do pedido" FROM PEDIDO_has_PRODUTO INNER JOIN PRODUTO WHERE PEDIDO_has_PRODUTO.Produto_idProduto = PRODUTO.idProduto GROUP BY PEDIDO_has_PRODUTO.Pedido_idPedido ORDER BY PEDIDO_has_PRODUTO.Pedido_idPedido ASC;

#4- Saber o volume total de todos os pedidos

SELECT PEDIDO_has_PRODUTO.Pedido_idPedido AS "Número do pedido", CONCAT(ROUND(SUM(PRODUTO.largura*PRODUTO.profundidade*PRODUTO.altura*PEDIDO_has_PRODUTO.quantidade_produto_pedido/1000000),2),"m³") AS "Volume total do pedido" FROM PEDIDO_has_PRODUTO INNER JOIN PRODUTO WHERE PEDIDO_has_PRODUTO.Produto_idProduto = PRODUTO.idProduto GROUP BY PEDIDO_has_PRODUTO.Pedido_idPedido ORDER BY PEDIDO_has_PRODUTO.Pedido_idPedido ASC;

#5- Comissão dos decoradores
SELECT DECORADOR.nome AS "Nome do decorador", SUM(PEDIDO_has_PRODUTO.preco_produto_pedido * PEDIDO_has_PRODUTO.quantidade_produto_pedido) AS "Valor total dos pedidos", ROUND(SUM(PEDIDO_has_PRODUTO.preco_produto_pedido * PEDIDO_has_PRODUTO.quantidade_produto_pedido * 0.02),2) AS "Comissão de 2% sobre as vendas"  FROM PEDIDO_has_PRODUTO INNER JOIN PEDIDO INNER JOIN CLIENTE INNER JOIN DECORADOR WHERE PEDIDO.idPedido = PEDIDO_has_PRODUTO.Pedido_idPedido AND PEDIDO.CLIENTE_cpf = CLIENTE.cpf AND CLIENTE.DECORADOR_cpfDECORADOR = DECORADOR.cpfDECORADOR GROUP BY DECORADOR.cpfDECORADOR;

#6 - Contagem de vendas por decorador
SELECT DECORADOR.nome AS "Nome do decorador", COUNT(PEDIDO.idPEDIDO) AS "Quantidade de vendas por decorador" FROM PEDIDO INNER JOIN CLIENTE INNER JOIN DECORADOR WHERE PEDIDO.CLIENTE_cpf = CLIENTE.cpf AND CLIENTE.DECORADOR_cpfDECORADOR = DECORADOR.cpfDECORADOR GROUP BY DECORADOR.cpfDECORADOR ORDER BY COUNT(PEDIDO.idPEDIDO) DESC;

#7- Ticket médio de todos os clientes
SELECT (SELECT SUM(PEDIDO_has_PRODUTO.preco_produto_pedido * PEDIDO_has_PRODUTO.quantidade_produto_pedido) FROM PEDIDO_has_PRODUTO) / (SELECT (count(CLIENTE.cpf)) FROM Cliente) AS "Média de gastos por cliente";

#8- Produtos mais comprados
SELECT PRODUTO.nome AS "Nome do Produto", sum(PEDIDO_has_PRODUTO.quantidade_produto_pedido) AS "Quantidade de peças vendidas" FROM PEDIDO_has_PRODUTO INNER JOIN PRODUTO WHERE PEDIDO_has_PRODUTO.Produto_idProduto = PRODUTO.idProduto GROUP BY PEDIDO_has_PRODUTO.Produto_idProduto ORDER BY sum(PEDIDO_has_PRODUTO.quantidade_produto_pedido) DESC;

#9- Produtos mais lucrativos
SELECT PRODUTO.nome AS "Nome do Produto", sum(PEDIDO_has_PRODUTO.quantidade_produto_pedido*PEDIDO_has_PRODUTO.preco_produto_pedido) AS "Valor total de vendas da peça" FROM PEDIDO_has_PRODUTO INNER JOIN PRODUTO WHERE PEDIDO_has_PRODUTO.Produto_idProduto = PRODUTO.idProduto GROUP BY PEDIDO_has_PRODUTO.Produto_idProduto ORDER BY sum(PEDIDO_has_PRODUTO.quantidade_produto_pedido*PEDIDO_has_PRODUTO.preco_produto_pedido) DESC;

#10- Pedidos com produtos frágeis
SELECT PEDIDO.idPedido, CLIENTE.nome, GROUP_CONCAT(PRODUTO.nome) FROM PEDIDO INNER JOIN CLIENTE INNER JOIN PRODUTO INNER JOIN PEDIDO_has_PRODUTO WHERE PEDIDO_has_PRODUTO.PRODUTO_idPRODUTO = PRODUTO.idPRODUTO AND PEDIDO_has_PRODUTO.PEDIDO_idPEDIDO = PEDIDO.idPEDIDO AND PEDIDO.cliente_cpf = CLIENTE.cpf AND PRODUTO.frag = 1 GROUP BY PEDIDO_has_PRODUTO.PEDIDO_idPEDIDO ORDER BY PEDIDO_has_PRODUTO.PEDIDO_idPEDIDO;

#11- Pedidos e produtos
SELECT PEDIDO.idPedido, CLIENTE.nome, GROUP_CONCAT(PRODUTO.nome) FROM PEDIDO INNER JOIN CLIENTE INNER JOIN PRODUTO INNER JOIN PEDIDO_has_PRODUTO WHERE PEDIDO_has_PRODUTO.PRODUTO_idPRODUTO = PRODUTO.idPRODUTO AND PEDIDO_has_PRODUTO.PEDIDO_idPEDIDO = PEDIDO.idPEDIDO AND PEDIDO.cliente_cpf = CLIENTE.cpf GROUP BY PEDIDO_has_PRODUTO.PEDIDO_idPEDIDO ORDER BY PEDIDO_has_PRODUTO.PEDIDO_idPEDIDO;

#12- Mostrar os dados dos Clientes, Decoradores e Produtos, formatados.

	#Decorador:
SELECT INSERT(INSERT(INSERT(cpfDECORADOR, 4, 0, '.'), 8, 0, '.'), 12, 0, '-') AS "CPF do decorador", nome AS "Nome do decorador", endereco_com AS "Endereço comercial",  INSERT(INSERT(telefone_com, 3,0,'-'), 8, 0, '-') AS "Telefone Comercial" FROM DECORADOR;
	
#Cliente:
SELECT INSERT(INSERT(INSERT(cpf, 4, 0, '.'), 8, 0, '.'), 12, 0, '-') AS "CPF do cliente", nome AS "Nome do cliente", endereco_res AS "Endereço residencial",  INSERT(INSERT(telefone, 3, 0,'-'), 9, 0, '-') AS "Telefone residencial", email AS "Email" FROM CLIENTE;
	
#Produto:
SELECT idProduto AS "Código do produto", nome AS "Nome do produto", fornecedor AS "Fornecedor do produto",  descricao AS "Descrição do produto", CONCAT('R$ ',FORMAT(preco, 2, 'pt-BR')) AS "Preço do produto", CONCAT(largura, ' cm') AS "Largura", CONCAT(profundidade, ' cm') AS "Profundidade", CONCAT(Altura, ' cm') AS "Altura", CONCAT(peso, ' kg') AS "Peso", estoque AS "Quantidade em estoque", IF (frag = 1, "Frágil", "Não frágil") AS "Frágil?" FROM PRODUTO;
