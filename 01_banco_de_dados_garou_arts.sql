--
-- File generated with SQLiteStudio v3.4.17 on ter dez 2 01:25:42 2025
--
-- Text encoding used: System
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: cliente
CREATE TABLE IF NOT EXISTS cliente (
    id_cliente INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    telefone TEXT(15),
    endereco TEXT(100),
    email TEXT(100)
);
INSERT INTO cliente (id_cliente, nome, telefone, endereco, email) VALUES (1, 'CAROLINA SOUSA', '1199999-9999', 'rua das orquideas, 345- SBC-SP', 'carol.sousa@outlook.com');
INSERT INTO cliente (id_cliente, nome, telefone, endereco, email) VALUES (2, 'FELLIPE SOUZA', '1193399-9999', 'rua quartoze de junho, 232- Santo Andre-SP', 'fellipe.souza@outlook.com');
INSERT INTO cliente (id_cliente, nome, telefone, endereco, email) VALUES (3, 'GABRIEL ANDRADE', '1199999-3333', 'rua das palmeiras, 145- SBC', 'andrade.gabriel@outlook.com');

-- Table: estoque
CREATE TABLE IF NOT EXISTS estoque (
    id_estoque INTEGER PRIMARY KEY AUTOINCREMENT,
    quantidade INTEGER NOT NULL,
    valor_unitario FLOAT NOT NULL,
    id_produto INTEGER NOT NULL,
    id_material INTEGER NOT NULL,
    FOREIGN KEY (id_produto) REFERENCES produto(id_produto),
    FOREIGN KEY (id_material) REFERENCES material(id_material)
);

-- Table: etapa_producao
CREATE TABLE IF NOT EXISTS etapa_producao (
    id_etapa_producao INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT(100),
    descricao TEXT(200),
    id_usuario INTEGER,
    id_pedido INTEGER,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
    FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido)
);
INSERT INTO etapa_producao (id_etapa_producao, nome, descricao, id_usuario, id_pedido) VALUES (1, 'AGUARDANDO O PAGAMENTO', 'PAGAMENTO NEGADO', 1, 1);
INSERT INTO etapa_producao (id_etapa_producao, nome, descricao, id_usuario, id_pedido) VALUES (2, 'EM PRODUÇÂO', 'PRODUZINDO A ARTE DA CAMISETA', 3, 2);
INSERT INTO etapa_producao (id_etapa_producao, nome, descricao, id_usuario, id_pedido) VALUES (3, 'EM ROTA DE ENTREGA', 'SEU PRODUTO JA ESTA COM A TRANSPORTADORA', 2, 3);

-- Table: item_pedido
CREATE TABLE IF NOT EXISTS item_pedido(
    id_item_pedido INTEGER PRIMARY KEY AUTOINCREMENT,
    quantidade INTEGER,
    preco FLOAT,
    id_pedido INTEGER,
    id_produto INTEGER,
    FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido),
    FOREIGN KEY (id_produto) REFERENCES produto(id_produto)
);
INSERT INTO item_pedido (id_item_pedido, quantidade, preco, id_pedido, id_produto) VALUES (1, 4, '30,20', NULL, NULL);
INSERT INTO item_pedido (id_item_pedido, quantidade, preco, id_pedido, id_produto) VALUES (2, 1, '30,20', NULL, NULL);
INSERT INTO item_pedido (id_item_pedido, quantidade, preco, id_pedido, id_produto) VALUES (3, 1000, '0,36', NULL, NULL);

-- Table: Material
CREATE TABLE IF NOT EXISTS Material(
    id_material INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT(100),
    descricao TEXT(100),
    quantidade_estoque INTEGER,
    tamanho TEXT(10)
);
INSERT INTO Material (id_material, nome, descricao, quantidade_estoque, tamanho) VALUES (1, 'CAMISETA POLIESTER TAMANHO P', 'CAMISETA COM ESTAMPA PERSONALIZADA TAMNHO P', 50, 'P');
INSERT INTO Material (id_material, nome, descricao, quantidade_estoque, tamanho) VALUES (2, 'CAMISETA POLIESTER TAMANHO M', 'CAMISETA COM ESTAMPA PERSONALIZADA TAMNHO M', 50, 'M');
INSERT INTO Material (id_material, nome, descricao, quantidade_estoque, tamanho) VALUES (3, 'CAMISETA POLIESTER TAMANHO G', 'CAMISETA COM ESTAMPA PERSONALIZADA TAMNHO G', 56, 'G');

-- Table: Pagamento
CREATE TABLE IF NOT EXISTS Pagamento(
    id_pagamento INTEGER PRIMARY KEY AUTOINCREMENT,
    valor FLOAT,
    data_pagamento NOW,
    metodo TEXT,
    status TEXT,
    id_pedido,
    FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido)
);
INSERT INTO Pagamento (id_pagamento, valor, data_pagamento, metodo, status, id_pedido) VALUES (1, 'R$120,80', '2025/11/04', 'credito', 'NEGADO', NULL);
INSERT INTO Pagamento (id_pagamento, valor, data_pagamento, metodo, status, id_pedido) VALUES (2, 'R$30,20', '2025/02/01', 'dinheiro', 'APROVADO', NULL);
INSERT INTO Pagamento (id_pagamento, valor, data_pagamento, metodo, status, id_pedido) VALUES (3, 'R$360,80', '2025/01/04', 'credito', 'APROVADO', NULL);
INSERT INTO Pagamento (id_pagamento, valor, data_pagamento, metodo, status, id_pedido) VALUES (4, 'R$120,80', '2025/11/04', 'credito', 'NEGADO', 1);
INSERT INTO Pagamento (id_pagamento, valor, data_pagamento, metodo, status, id_pedido) VALUES (5, 'R$30,20', '2025/02/01', 'dinheiro', 'APROVADO', 2);
INSERT INTO Pagamento (id_pagamento, valor, data_pagamento, metodo, status, id_pedido) VALUES (6, 'R$360,80', '2025/01/04', 'credito', 'APROVADO', 3);

-- Table: Pedido
CREATE TABLE IF NOT EXISTS Pedido(
    id_pedido INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT(80) NOT NULL,
    data_entrega_prevista TEXT,
    data_pedido TEXT,
    quantidade INTEGER,
    valor INTEGER,
    id_cliente INTEGER,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);
INSERT INTO Pedido (id_pedido, nome, data_entrega_prevista, data_pedido, quantidade, valor, id_cliente) VALUES (1, 'CAMISETA MASCULINA ESTAMPADA', '2025/11/23', '2025/11/04', 4, 'R$120,80', 1);
INSERT INTO Pedido (id_pedido, nome, data_entrega_prevista, data_pedido, quantidade, valor, id_cliente) VALUES (2, 'CAMISETA MASCULINA ESTAMPADA', '2025/11/23', '2025/11/04', 1, 'R$30,20', 2);
INSERT INTO Pedido (id_pedido, nome, data_entrega_prevista, data_pedido, quantidade, valor, id_cliente) VALUES (3, 'CARTÂO DE VISITA 4X4 BOPP', '2025/11/23', '2025/11/04', 1000, 'R$360,80', 3);

-- Table: Produto
CREATE TABLE IF NOT EXISTS Produto (
    id_produto INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    quantidade INTEGER,
    valor FLOAT,
    id_pedido INTEGER,
    FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido)
);
INSERT INTO Produto (id_produto, nome, quantidade, valor, id_pedido) VALUES (1, 'CAMISETA ESTAMPADA P MASCULINA', 4, 'R$120,80', 1);
INSERT INTO Produto (id_produto, nome, quantidade, valor, id_pedido) VALUES (2, 'CAMISETA ESTAMPADA G MASCULINA', 1, 'R$30,20', 2);
INSERT INTO Produto (id_produto, nome, quantidade, valor, id_pedido) VALUES (3, 'CARTÃO DE VISITA 4X4 BOPP', 1000, 'R$360,80', 3);

-- Table: usuario
CREATE TABLE IF NOT EXISTS usuario(
    id_usuario INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT(100),
    email TEXT(100),
    senha_hash,
    perfil TEXT(100)
);
INSERT INTO usuario (id_usuario, nome, email, senha_hash, perfil) VALUES (1, 'CAIO FERNANDEZ', 'fernandez.caio@gmail.com', '3213123215', 'designer');
INSERT INTO usuario (id_usuario, nome, email, senha_hash, perfil) VALUES (2, 'SOPHIA RODRIGUEZ', 'sophi.rodriguez@hotmail.com', '424214', 'logistica');
INSERT INTO usuario (id_usuario, nome, email, senha_hash, perfil) VALUES (3, 'GABRIEL BRODOWISCHI', 'brodowischi.gabe@gmail.com', '4214212', 'designer');

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
