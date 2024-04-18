CREATE DATABASE IF NOT EXISTS biblioteca;

USE biblioteca;

CREATE TABLE IF NOT EXISTS assunto(
	id INT AUTO_INCREMENT,
	nome VARCHAR(30) NOT NULL,
	PRIMARY KEY (id)

);

CREATE TABLE IF NOT EXISTS Livro(
id INT AUTO_INCREMENT,
		Titulo VARCHAR(50) NOT NULL,
        Autor VARCHAR (50) NOT NULL,
        Assunto_Id int,
        Lancamento DATETIME,
        Copias INT,
        PRIMARY KEY(Id),
        FOREIGN KEY(Assunto_id) REFERENCES Assunto (Id)
);

CREATE TABLE IF NOT EXISTS Aluno(
id INT AUTO_INCREMENT,
		Nome VARCHAR(50) NOT NULL,
        Email VARCHAR (50) NOT NULL,
        Telefone VARCHAR (20) NOT NULL,
        PRIMARY KEY(Id)
        );
	
    
CREATE TABLE IF NOT EXISTS Emprestimo(
		id INT AUTO_INCREMENT,
		Livro_Id INT,
        Aluno_Id INT,
        data_emprestimo DATETIME DEFAULT CURRENT_TIMESTAMP,
        data_devolucao DATETIME,
        Multa DECIMAL,
        PRIMARY KEY(Id),
        FOREIGN KEY(Aluno_id) REFERENCES Aluno (Id),
        FOREIGN KEY(Livro_id) REFERENCES Livro (Id)
        );
        
        
        
       


