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

INSERT INTO usuario (nome, username, genero, email, senha, nivelAcesso) VALUES
('Murillo Moreira', 'Murillok', 'Masculino', 'murillo@email.com', 'murillo123', 'Administrador');

INSERT INTO usuario (nome, username, genero, email, senha) VALUES
    ('Ana Silva', 'Aninha123', 'Feminino', 'ana@email.com', 'ana456'),
	('João Santos', 'JotaSantos', 'Masculino', 'joao@email.com', 'joao789'),
	('Carla Oliveira', 'CarlinhaOliveira', 'Feminino', 'carla@email.com', 'carla123'),
	('Rafaela Pereira', 'RafaelaP', 'Feminino', 'rafaela@email.com', 'rafaela456'),
	('Pedro Lima', 'PedroLima123', 'Masculino', 'pedro@email.com', 'pedro789'),
	('Camila Costa', 'CamilaCosta', 'Feminino', 'camila@email.com', 'camila123'),
	('Lucas Souza', 'LucasS', 'Masculino', 'lucas@email.com', 'lucas456'),
	('Mariana Fernandes', 'MarianaFern', 'Feminino', 'mariana@email.com', 'mariana123'),
	('Gabriel Rodrigues', 'GabrielR', 'Masculino', 'gabriel@email.com', 'gabriel456');
    
INSERT INTO usuario (nome, username, genero, email, senha, dataRegistro) VALUES
	('Gabriel Rodrigues', 'GabrielR', 'Masculino', 'gabriel1@email.com', 'gabriel456', '2024-06-13'),
	('Gabriel Rodrigues', 'GabrielR', 'Masculino', 'gabriel2@email.com', 'gabriel456', '2024-06-12'),
	('Gabriel Rodrigues', 'GabrielR', 'Masculino', 'gabriel3@email.com', 'gabriel456', '2024-06-11'),
	('Gabriel Rodrigues', 'GabrielR', 'Masculino', 'gabriel4@email.com', 'gabriel456', '2024-06-10'),
	('Gabriel Rodrigues', 'GabrielR', 'Masculino', 'gabriel5@email.com', 'gabriel456', '2024-06-09'),
	('Gabriel Rodrigues', 'GabrielR', 'Masculino', 'gabriel6@email.com', 'gabriel456', '2024-06-08'),
	('Gabriel Rodrigues', 'GabrielR', 'Masculino', 'gabriel7@email.com', 'gabriel456', '2024-06-07');

SELECT * FROM usuario;

-- TABELA QUIZ
CREATE TABLE quiz (
idQuiz INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45) NOT NULL,
dificuldade VARCHAR(15) NOT NULL,
maxAcertos INT NOT NULL,
CONSTRAINT chkDificuldade CHECK (dificuldade IN ('Iniciante', 'Intermediário', 'Avançado'))
);

INSERT INTO quiz VALUES 
	(DEFAULT, 'Teste seu Conhecimento - Iniciante', 'Iniciante', 10);
    
SELECT * FROM quiz;

-- TABELA TENTATIVA
CREATE TABLE tentativa (
idTentativa INT AUTO_INCREMENT,
fkUsuario INT,
fkQuiz INT,
qtdAcertos INT NOT NULL,
dataTentativa DATETIME DEFAULT CURRENT_TIMESTAMP,
CONSTRAINT pkTentativa PRIMARY KEY (idTentativa, fkUsuario, fkQuiz),
CONSTRAINT fkTentativaUsuario FOREIGN KEY (fkUsuario)
	REFERENCES usuario(idUsuario),
CONSTRAINT fkTentativaQuiz FOREIGN KEY (fkQuiz)
	REFERENCES quiz(idQuiz)
);

INSERT INTO tentativa (fkUsuario, fkQuiz, qtdAcertos) VALUES
	(2, 1, 3),
    (2, 1, 6),
    (2, 1, 9),
    (3, 1, 5),
    (3, 1, 7),
    (3, 1, 8),
    (4, 1, 3),
    (4, 1, 7),
    (4, 1, 10),
    (5, 1, 1),
    (5, 1, 4),
    (5, 1, 8),
    (6, 1, 0),
    (6, 1, 5),
    (6, 1, 7),
    (7, 1, 8),
    (7, 1, 9),
    (7, 1, 10),
    (8, 1, 1),
    (8, 1, 2),
    (8, 1, 3),
    (9, 1, 4),
    (9, 1, 7),
    (9, 1, 9),
    (10, 1, 5),
    (10, 1, 7),
    (10, 1, 9);
    
INSERT INTO tentativa (fkUsuario, fkQuiz, qtdAcertos, dataTentativa) VALUES  
	(10, 1, 1, '2024-06-13'), 
	(10, 1, 3, '2024-06-12'), 
	(10, 1, 5, '2024-06-11'), 
	(10, 1, 9, '2024-06-10'), 
	(10, 1, 7, '2024-06-09'), 
	(10, 1, 4, '2024-06-08'), 
	(10, 1, 2, '2024-06-07'); 

SELECT * FROM tentativa;
/*----------------------------------------------------------------------------------------------------------------------------------------*/
-- SELECTS DASHBOARD

-- Quantidade de Cadastros/Semana
SELECT count(idUsuario) AS 'Quantidade de Cadastros' FROM usuario
	WHERE dataRegistro BETWEEN DATE_SUB(CURDATE(), INTERVAL 7 DAY) AND CURDATE();
    
-- Nº de Tentativas/Semana
SELECT count(idTentativa) AS 'Quantidade de Tentativas' FROM tentativa
	WHERE dataTentativa BETWEEN DATE_SUB(now(), INTERVAL 7 DAY) AND now();
    
-- Média Total de Acertos/Semana
SELECT round(avg(qtdAcertos),1) FROM tentativa
	WHERE dataTentativa BETWEEN DATE_SUB(now(), INTERVAL 7 DAY) AND now();
    
-- SELECTS GRÁFICOS

-- Quantidade de Cadastros na Semana (Ordenados por Dia)
SELECT qtdRegistros, Dia FROM (SELECT (count(idUsuario)) AS qtdRegistros, date_format(dataRegistro, '%a') AS Dia 
		FROM usuario 
		WHERE dataRegistro BETWEEN DATE_SUB(CURDATE(), INTERVAL 7 DAY) AND CURDATE()
		GROUP BY Dia ORDER BY FIELD(Dia, 'Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat')) AS subQuerry;
        
-- Quantidade de Cadastros na Semana (Ordenados por Genero)
SELECT count(idUsuario), genero FROM usuario 
		WHERE dataRegistro BETWEEN DATE_SUB(CURDATE(), INTERVAL 7 DAY) AND CURDATE()
		GROUP BY genero;
        
-- Quantidade de Tentativas na Semana (Ordenadas por Dia)
SELECT qtdTentativas, Dia FROM (SELECT (count(idTentativa)) AS qtdTentativas, date_format(dataTentativa, '%a') AS Dia 
		FROM tentativa 
		WHERE dataTentativa BETWEEN DATE_SUB(now(), INTERVAL 7 DAY) AND now()
		GROUP BY Dia ORDER BY FIELD(Dia, 'Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat')) AS subQuerry;
        
-- Quantidade de Acertos (Ordenados por Quantidade de Acertos)
SELECT DISTINCT qtdAcertos AS Notas, count(qtdAcertos) AS Vezes FROM tentativa 
	WHERE dataTentativa BETWEEN DATE_SUB(now(), INTERVAL 7 DAY) AND now()
		GROUP BY qtdAcertos ORDER BY qtdAcertos;	