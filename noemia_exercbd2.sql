DROP DATABASE Noemia_exercBD2;

CREATE DATABASE IF NOT EXISTS Noemia_exercBD2;

USE Noemia_exercBD2;

CREATE TABLE IF NOT EXISTS tab_usuario (
    ID_usuario INT PRIMARY KEY,
    nome_usuario VARCHAR(45),
    cpf_user VARCHAR(11),
    nasc_user DATE,
    telefone_usuario VARCHAR(10),
    email_usuario VARCHAR(45),
    cidade_usuario VARCHAR(45),
    uf_usuario CHAR(2)
);

CREATE TABLE IF NOT EXISTS tab_emprestimos (
    cod_emprestimo INT PRIMARY KEY,
    usuario INT,
    data_emprestimo DATE,
    data_devolucao DATE,
    FOREIGN KEY (usuario) REFERENCES tab_usuario(ID_usuario)
);

CREATE TABLE IF NOT EXISTS tab_editora (
    cod_editora INT PRIMARY KEY,
    nome_editora VARCHAR(45),
    cidade_editora VARCHAR(45),
    uf_editora VARCHAR(45)
);

CREATE TABLE IF NOT EXISTS tab_livro (
    id_livro INT PRIMARY KEY,
    editora_livro INT,
    nome_livro VARCHAR(45),
    nomeoriginal_livro VARCHAR(75),
    genero_livro VARCHAR(25),
    sinopse_livro VARCHAR(500),
    paginas_livro INT,
    anopub_livro INT,
    FOREIGN KEY (editora_livro) REFERENCES tab_editora(cod_editora)
);

CREATE TABLE IF NOT EXISTS tab_autor (
    id_autor INT PRIMARY KEY,
    nome_autor VARCHAR(45),
    nacionalidade_autor VARCHAR(45)
);

CREATE TABLE IF NOT EXISTS tab_autorias (
    livro INT,
    autor INT,
    PRIMARY KEY (livro, autor),
    FOREIGN KEY (livro) REFERENCES tab_livro(id_livro),
    FOREIGN KEY (autor) REFERENCES tab_autor(id_autor)
);

CREATE TABLE IF NOT EXISTS tab_livrosemprestimo (
    emprestimo INT,
    livro INT,
    PRIMARY KEY (emprestimo, livro),
    FOREIGN KEY (livro) REFERENCES tab_livro(id_livro),
    FOREIGN KEY (emprestimo) REFERENCES tab_emprestimos(cod_emprestimo)
);

INSERT INTO tab_usuario (ID_usuario, nome_usuario, cpf_user, nasc_user, telefone_usuario, email_usuario, cidade_usuario, uf_usuario)
VALUES
(1, 'André da Silva', '11223344556', '1998-03-21', '4135341234', 'andredasilva@mail.com', 'Curitiba', 'PR'),
(2, 'Carlos Siqueira', '23412356790', '1980-12-13', '4136365678', 'siqueira.carlossiqueira@mail.com', 'Curitiba', 'PR');

INSERT INTO tab_autor (id_autor, nome_autor, nacionalidade_autor)
VALUES
(1, 'Josenildo Feijó', 'Brasileiro(a)'),
(2, 'José Augusto N.G. Manzano', 'Brasileiro(a)'),
(3, 'Peter Rob','Brasileiro(a)');

INSERT INTO tab_editora (cod_editora, nome_editora, cidade_editora, uf_editora)
VALUES
(1, 'Editora Erica', 'São Paulo', 'SP'),
(2, 'Microssoft Press', 'São Paulo', 'SP');
 
INSERT INTO tab_livro (id_livro, editora_livro, nome_livro, nomeoriginal_livro, genero_livro, sinopse_livro, paginas_livro, anopub_livro)
VALUES
(1, 2, 'Guia de Bolso Windows Server 2008', 'The Windows Server 2008 Guide', 'Informática', 'Guia completo', 650, 2008),
(2, 2, 'Redes de Computadores', NULL, 'TI', 'Iniciante', 320, 2012),
(3, 1, 'Programação Java', 'Java Programming', 'Informática', 'Full Java Development', 567, 2012),
(4, 1, 'Programação Delphi XE3', NULL, 'TI', NULL, 513, 2012);

INSERT INTO tab_autorias (livro, autor)
VALUES
(1, 1),
(1, 2),
(3, 3),
(4, 2);

ALTER TABLE tab_livro DROP COLUMN sinopse_livro;

ALTER TABLE tab_usuario MODIFY COLUMN uf_usuario VARCHAR(2);

UPDATE tab_autor SET nacionalidade_autor = 'Italiano(a)' WHERE nome_autor = 'José Augusto N.G. Manzano';

UPDATE tab_livro SET anopub_livro = 2011 WHERE nome_livro = 'Programação Java';

UPDATE tab_usuario SET cidade_usuario = 'Salvador', uf_usuario = 'BA' WHERE nome_usuario = 'Carlos Siqueira';

DELETE FROM tab_autorias WHERE livro = (SELECT id_livro from tab_livro where nome_livro = 'Guia de Bolso Windows Server 2008');

DELETE FROM tab_livro WHERE nome_livro = 'Guia de Bolso Windows Server 2008';



