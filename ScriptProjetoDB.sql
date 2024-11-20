CREATE DATABASE IF NOT EXISTS Igreja;
USE Igreja;

CREATE TABLE IF NOT EXISTS Membros (
    id_membro INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nome VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    telefone VARCHAR(20),
    endereco TEXT,
    data_nascimento DATE,
    data_entrada DATE
);

CREATE TABLE IF NOT EXISTS Ministerio (
    id_ministerio INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nome VARCHAR(100),
    descricao TEXT,
    id_membro INT NOT NULL,
    FOREIGN KEY (id_membro) REFERENCES Membros(id_membro)
);

CREATE TABLE IF NOT EXISTS Locais (
    id_local INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    endereco TEXT,
    capacidade INT,
    descricao TEXT
);

CREATE TABLE IF NOT EXISTS Tipos_Eventos (
    id_tipo INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS Tipos_Reunioes (
    id_tipo INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS Eventos (
    id_evento INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    data_inicio DATETIME NOT NULL,
    data_fim DATETIME,
    id_local INT,
    id_tipo INT,
    FOREIGN KEY (id_local) REFERENCES Locais(id_local),
    FOREIGN KEY (id_tipo) REFERENCES Tipos_Eventos(id_tipo)
);

CREATE TABLE IF NOT EXISTS Reunioes (
    id_reuniao INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    data_inicio DATETIME NOT NULL,
    data_fim DATETIME,
    id_ministerio INT,
    id_local INT,
    id_tipo INT,
    FOREIGN KEY (id_ministerio) REFERENCES Ministerio(id_ministerio),
    FOREIGN KEY (id_local) REFERENCES Locais(id_local),
    FOREIGN KEY (id_tipo) REFERENCES Tipos_Reunioes(id_tipo)
);

CREATE TABLE IF NOT EXISTS Ministerio_Membros (
    id_participacao INT AUTO_INCREMENT PRIMARY KEY,
    id_membro INT NOT NULL,
    id_ministerio INT NOT NULL,
    data_inicio DATE NOT NULL,
    data_fim DATE,
    FOREIGN KEY (id_membro) REFERENCES Membros(id_membro),
    FOREIGN KEY (id_ministerio) REFERENCES Ministerio(id_ministerio)
);

CREATE TABLE IF NOT EXISTS Eventos_Participantes (
    id_participacao INT AUTO_INCREMENT PRIMARY KEY,
    id_evento INT NOT NULL,
    id_membro INT NOT NULL,
    status_presenca ENUM('confirmado', 'presente', 'ausente') DEFAULT 'confirmado',
    check_in DATETIME,
    FOREIGN KEY (id_evento) REFERENCES Eventos(id_evento),
    FOREIGN KEY (id_membro) REFERENCES Membros(id_membro)
);

CREATE TABLE IF NOT EXISTS Reunioes_Participantes (
    id_participacao INT AUTO_INCREMENT PRIMARY KEY,
    id_reuniao INT NOT NULL,
    id_membro INT NOT NULL,
    status_presenca ENUM('confirmado', 'presente', 'ausente') DEFAULT 'confirmado',
    check_in DATETIME,
    FOREIGN KEY (id_reuniao) REFERENCES Reunioes(id_reuniao),
    FOREIGN KEY (id_membro) REFERENCES Membros(id_membro)
);

CREATE TABLE IF NOT EXISTS Log_Auditoria (
    id_log INT AUTO_INCREMENT PRIMARY KEY,
    acao VARCHAR(50),
    tabela VARCHAR(50),
    data_hora DATETIME,
    detalhes TEXT
);

INSERT INTO Membros (nome, email, telefone, endereco, data_nascimento, data_entrada)
VALUES
('José Vicente', 'josevicente@email.com', '98912345678', 'Endereço A', '2000-01-15', CURDATE()),
('Yan Garrido', 'yangarrido@email.com', '98923456789', 'Endereço B', '2001-05-22', CURDATE()),
('Luis Guilherme', 'luisguilherme@email.com', '98934567890', 'Endereço C', '2002-08-10', CURDATE()),
('Luis Magno', 'luismagno@email.com', '98945678901', 'Endereço D', '2003-11-30', CURDATE()),
('Marcos André', 'marcosandre@email.com', '98956789012', 'Endereço E', '2004-02-18', CURDATE()),
('João', 'joao@email.com', '98967890123', 'Endereço F', '2000-09-10', CURDATE()),
('Juan', 'juan@email.com', '98978901234', 'Endereço G', '2001-03-25', CURDATE());
