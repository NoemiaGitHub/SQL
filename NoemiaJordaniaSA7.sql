-- Criar um banco de dados
CREATE DATABASE IF NOT EXISTS sistema_vendas;

-- Usar o banco de dados criado
USE sistema_vendas;

-- Tabela de pessoas
CREATE TABLE IF NOT EXISTS pessoas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    cpf VARCHAR(14),
    status VARCHAR(20)
);

-- Tabela de clientes
CREATE TABLE IF NOT EXISTS clientes (
    pessoa_id INT PRIMARY KEY,
    renda DECIMAL(10, 2),
    credito DECIMAL(10, 2),
    FOREIGN KEY (pessoa_id) REFERENCES pessoas(id)
);

-- Tabela de vendedores
CREATE TABLE IF NOT EXISTS vendedores (
    pessoa_id INT PRIMARY KEY,
    salario DECIMAL(10, 2),
    FOREIGN KEY (pessoa_id) REFERENCES pessoas(id)
);

-- Tabela de produtos
CREATE TABLE IF NOT EXISTS produtos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(200),
    estoque INT,
    valor DECIMAL(10, 2),
    status VARCHAR(20)
);

-- Tabela de pedidos
CREATE TABLE IF NOT EXISTS pedidos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    data_solicitacao DATETIME DEFAULT CURRENT_TIMESTAMP,
    valor_total DECIMAL(10, 2),
    status VARCHAR(20),
    vendedor_id INT,
    cliente_id INT,
    FOREIGN KEY (vendedor_id) REFERENCES vendedores(pessoa_id),
    FOREIGN KEY (cliente_id) REFERENCES clientes(pessoa_id)
);

-- Tabela de itens do pedido
CREATE TABLE IF NOT EXISTS itens_pedido (
    pedido_id INT,
    produto_id INT,
    quantidade INT,
    valor DECIMAL(10, 2),
    FOREIGN KEY (pedido_id) REFERENCES pedidos(id),
    FOREIGN KEY (produto_id) REFERENCES produtos(id),
    PRIMARY KEY (pedido_id, produto_id)
);

-- Inserir dados nas tabelas
INSERT INTO pessoas (id, nome, cpf, status) VALUES 
(11, 'Noemia Jordania', '123.456.789-11', 'Ativo'),
(12, 'João Alberto', '123.456.789-12', 'Inativo'),
(13, 'Carlos Gabriel', '123.456.789-13', 'Ativo'),
(14, 'Maria Joana', '123.456.789-14', 'Inativo'),
(15, 'José Maria', '123.456.789-15', 'Ativo'),
(16, 'Leonardo Viana', '123.456.789-16', 'Ativo'),
(17, 'Mylena Martins', '123.456.789-17', 'Ativo'),
(18, 'Marilia Gabriela', '123.456.789-18', 'Ativo'),
(19, 'Christopher José', '123.456.789-19', 'Inativo'),
(20, 'Maria José Silva', '123.456.789-20', 'Ativo'),
(21, 'Patricia dos Santos', '123.456.789-20', 'Ativo'),
(22, 'Manuel José Silva', '123.456.789-20', 'Inativo'),
(23, 'Enzo Gabriel', '123.456.789-20', 'Ativo'),
(24, 'Felipe da Silva', '123.456.789-20', 'Inativo'),
(25, 'Caio Roberto', '123.456.789-20', 'Ativo'),
(26, 'Thaisa Manuela', '123.456.789-20', 'Ativo'),
(27, 'Roberto Justus', '123.456.789-20', 'Inativo'),
(28, 'Ricardo Gianechini', '123.456.789-20', 'Ativo'),
(29, 'Mario Roberto', '123.456.789-20', 'Ativo'),
(30, 'Juliano José', '123.456.789-20', 'Ativo');

INSERT INTO clientes (pessoa_id, renda, credito) VALUES 
(11, 50000.00, 100000.00),
(12, 60000.00, 200000.00),
(13, 70000.00, 300000.00),
(14, 80000.00, 400000.00),
(15, 90000.00, 500000.00),
(16, 100000.00, 600000.00),
(17, 200000.00, 700000.00),
(18, 300000.00, 800000.00),
(19, 400000.00, 900000.00),
(20, 500000.00, 1000000.00);

INSERT INTO vendedores (pessoa_id, salario) VALUES 
(21, 50000.00),
(22, 100000.00),
(23, 200000.00),
(24, 300000.00),
(25, 400000.00),
(26, 500000.00),
(27, 600000.00),
(28, 700000.00),
(29, 800000.00),
(30, 900000.00);

INSERT INTO produtos (id, descricao, estoque, valor, status) VALUES 
(1, 'caderno', 10, 200.00, 'Ativo'),
(2, 'lápis', 20, 100.00, 'Inativo'),
(3, 'borracha', 30, 300.00, 'Ativo'),
(4, 'caneta', 40, 180.00, 'Inativo'),
(5, 'sulfite', 50, 220.00, 'Ativo'),
(6, 'apontador', 60, 320.00, 'Ativo'),
(7, 'corretivo', 70, 400.00, 'Ativo'),
(8, 'caixa lápis de cor', 80, 500.00, 'Ativo'),
(9, 'caixa giz de cera', 90, 200.00, 'Inativo'),
(10, 'caixa tinta guache', 100, 300.00, 'Ativo');

INSERT INTO pedidos (id, valor_total, status, vendedor_id, cliente_id) VALUES 
(1, 10.00, 'ativo', 21, 11),
(2, 90.00, 'inativo', 22, 12),
(3, 80.00, 'ativo', 23, 13),
(4, 70.00, 'ativo', 24, 14),
(5, 60.00, 'ativo', 25, 15),
(6, 50.00, 'ativo', 26, 16),
(7, 40.00, 'inativo', 27, 17),
(8, 30.00, 'ativo', 28, 18),
(9, 20.00, 'ativo', 29, 19),
(10, 10.00, 'inativo', 30, 20);

INSERT INTO itens_pedido (pedido_id, produto_id, quantidade, valor) VALUES 
(1, 10, 5, 200.00),
(2, 9, 10, 100.00),
(3, 8, 5, 300.00),
(4, 7, 10, 180.00),
(5, 6, 5, 220.00),
(6, 5, 10, 320.00),
(7, 4, 5, 400.00),
(8, 3, 10, 500.00),
(9, 2, 10, 200.00),
(10, 1, 5, 300.00);