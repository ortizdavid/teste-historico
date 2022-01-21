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