CREATE DATABASE IF NOT EXISTS Igreja;
USE Igreja;

CREATE TABLE IF NOT EXISTS Membros (
id_membro INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
nome VARCHAR(100),
email VARCHAR(100) UNIQUE,
telefone VARCHAR(20),
endereço TEXT,
data_nascimento DATE,
data_entrada DATE
);

CREATE TABLE IF NOT EXISTS Ministerio (
id_ministerio INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
nome VARCHAR(100),
descrição TEXT,
id_membro INT NOT NULL,
FOREIGN KEY (id_membro) REFERENCES Membros(id_membro)
);
