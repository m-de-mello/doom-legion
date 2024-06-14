-- CRIANDO A BASE DE DADOS
CREATE DATABASE DoomLegion;
USE DoomLegion;
/*----------------------------------------------------------------------------------------------------------------------------------------*/
-- CRIANDO AS TABELAS

-- TABELA USUARIO
CREATE TABLE usuario (
idUsuario INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(50) NOT NULL,
username VARCHAR(30) NOT NULL,
genero VARCHAR(15) NOT NULL,
email VARCHAR(50) UNIQUE NOT NULL,
senha VARCHAR(25) NOT NULL,
dataRegistro DATE DEFAULT (CURDATE()),
nivelAcesso VARCHAR(15) DEFAULT 'Usuário',
CONSTRAINT chkGenero CHECK (genero IN ('Masculino', 'Feminino', 'Não Informado')),
CONSTRAINT chkNivelAcesso CHECK (nivelAcesso IN ('Administrador', 'Usuário'))
);

INSERT INTO usuario (nome, username, genero, email, senha) VALUES
	('Murillo Moreira', 'Murillok', 'Masculino', 'murillo@email.com', 'murillo123');
    
    SELECT * FROM usuario;
    truncate usuario;

-- TABELA QUIZ
CREATE TABLE quiz (
idQuiz INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45) NOT NULL,
dificuldade VARCHAR(15) NOT NULL,
maxAcertos INT NOT NULL,
CONSTRAINT chkDificuldade CHECK (dificuldade IN ('Iniciante', 'Intermediário', 'Avançado'))
);

-- TABELA TENTATIVA
CREATE TABLE tentativa (
idTentativa INT,
fkUsuario INT,
fkQuiz INT,
qtdAcertos INT NOT NULL,
CONSTRAINT pkTentativa PRIMARY KEY (idTentativa, fkUsuario, fkQuiz),
CONSTRAINT fkTentativaUsuario FOREIGN KEY (fkUsuario)
	REFERENCES usuario(idUsuario),
CONSTRAINT fkTentativaQuiz FOREIGN KEY (fkQuiz)
	REFERENCES quiz(idQuiz)
);
/*----------------------------------------------------------------------------------------------------------------------------------------*/