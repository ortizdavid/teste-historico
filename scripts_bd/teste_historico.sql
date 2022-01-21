CREATE DATABASE teste_historico;

USE teste_historico;

CREATE TABLE usuario (
    id_usuario INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome_usuario VARCHAR(80) UNIQUE NOT NULL,
    palavra_passe VARCHAR(80) NOT NULL
);

CREATE TABLE item (
    id_item INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome_item VARCHAR(80) UNIQUE NOT NULL,
    codigo VARCHAR(20) UNIQUE NOT NULL
);

CREATE TABLE dados_servidor (
    id_dados_servidor INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    endereco_ip VARCHAR(20) NOT NULL,
    uri VARCHAR(255) NOT NULL,
    navegador VARCHAR(100) NOT NULL,
    sistema_operativo VARCHAR(100) NOT NULL,
    host VARCHAR(50) NOT NULL,
    data_rastreio TIMESTAMP DEFAULT NOW()
);

CREATE TABLE historico_operacao (
    id_historico INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    id_dados_servidor INT NOT NULL,
    operacao VARCHAR(50) NOT NULL,
    descricao VARCHAR(200),
    data_operacao TIMESTAMP DEFAULT NOW(),
    CONSTRAINT fk_usuario FOREIGN KEY(id_usuario) REFERENCES usuario(id_usuario),
    CONSTRAINT fk_dados_servidor FOREIGN KEY(id_dados_servidor) REFERENCES dados_servidor(id_dados_servidor)
);


-- VIEW ---------------------------------------------------------------------
DROP VIEW IF EXISTS view_dados_historico;

CREATE VIEW view_dados_historico AS

SELECT id_historico, historico_operacao.data_operacao, 
    historico_operacao.operacao, historico_operacao.descricao, 
    historico_operacao.item, historico_operacao.codigo,

    dados_servidor.id_dados_servidor, dados_servidor.data_rastreio,
    dados_servidor.endereco_ip, dados_servidor.uri, dados_servidor.navegador,
    dados_servidor.sistema_operativo, dados_servidor.host,

    usuario.id_usuario, usuario.nome_usuario, usuario.palavra_passe

FROM historico_operacao

JOIN dados_servidor ON(dados_servidor.id_dados_servidor = historico_operacao.id_dados_servidor)
JOIN usuario ON(usuario.id_usuario = historico_operacao.id_usuario);


-- Inseção ------------------------------
INSERT INTO usuario (nome_usuario, palavra_passe)
    VALUES 
        ('administrador', 'usu$rio001!'),
        ('manuel.jose', 'usu$rio002!'),
        ('anamaria', 'usu$rio003!'),
        ('joqim.jf', 'usu$rio004!');