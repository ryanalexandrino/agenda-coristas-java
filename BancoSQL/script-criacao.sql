
CREATE DATABASE coro;
USE coro;

-- Tabela de vozes
CREATE TABLE vozes (
    id_voz TINYINT AUTO_INCREMENT PRIMARY KEY,
    tipo_voz VARCHAR(20) NOT NULL
);

-- Tabela de instrumentos
CREATE TABLE instrumentos (
    id_instrumento TINYINT AUTO_INCREMENT PRIMARY KEY,
    nome_instrumento VARCHAR(20) NOT NULL
);

-- Cadastro de coristas
CREATE TABLE cadastro_corista (
    id_corista TINYINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(60) NOT NULL,
    rg CHAR(14),
    id_voz TINYINT,
    FOREIGN KEY (id_voz) REFERENCES vozes(id_voz)
);

-- Cadastro de músicos
CREATE TABLE cadastro_musicos (
    id_musico TINYINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(60) NOT NULL,
    rg CHAR(14),
    id_instrumento TINYINT,
    FOREIGN KEY (id_instrumento) REFERENCES instrumentos(id_instrumento)
);

-- Tabela de eventos (ensaios, apresentações etc.)
CREATE TABLE eventos (
    id_evento TINYINT AUTO_INCREMENT PRIMARY KEY,
    data_evento DATE NOT NULL,
    dia_semana ENUM('Segunda','Terça','Quarta','Quinta','Sexta','Sábado','Domingo'),
    tipo ENUM('Ensaio','Apresentacão')
);

-- Relacionamento N:N entre coristas e eventos
CREATE TABLE presenca_corista (
    id_evento TINYINT,
    id_corista TINYINT,
    presente BOOLEAN DEFAULT FALSE,
    PRIMARY KEY (id_evento, id_corista),
    FOREIGN KEY (id_evento) REFERENCES eventos(id_evento),
    FOREIGN KEY (id_corista) REFERENCES cadastro_corista(id_corista)
);

-- Relacionamento N:N entre músicos e eventos
CREATE TABLE presenca_musico (
    id_evento TINYINT,
    id_musico TINYINT,
    presente BOOLEAN DEFAULT FALSE,
    PRIMARY KEY (id_evento, id_musico),
    FOREIGN KEY (id_evento) REFERENCES eventos(id_evento),
    FOREIGN KEY (id_musico) REFERENCES cadastro_musicos(id_musico)
);

SHOW DATABASES;
