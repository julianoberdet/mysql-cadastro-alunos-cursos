CREATE DATABASE IF NOT EXISTS cadastro;
USE cadastro;

CREATE TABLE cursos(
    idcurso INT NOT NULL AUTO_INCREMENT,
    nome varchar(30) NOT NULL,
    descricao TEXT 
    carga INT,
    totaulas INT,
    ano YEAR,
    PRIMARY KEY (idcurso)
);

CREATE TABLE alunos(
    ID INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(30) NOT NULL,
    nascimento DATE,
    sexo ENUM('M','F'),
    peso DECIMAL(5,2),
    altura DECIMAL(3,2),
    nacionalidade VARCHAR(20) DEFAULT 'Brasil',
    profissao VARCHAR(30),
    cursopreferido INT,
    PRIMARY KEY(id)
    FOREIGN KEY (cursopreferido) REFERENCES cursos(idcurso)
);