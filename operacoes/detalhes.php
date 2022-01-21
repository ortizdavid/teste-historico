<?php 
    require_once '../inclusao.php';
    $id = filter_var($_GET['id'], FILTER_SANITIZE_NUMBER_INT);
    $historico = new HistoricoOperacao();
    $detalhe = $historico->obterDados($id);
?>

<a href="historico.php">Voltar</a>
<fieldset>
    <legend>Detalhes da Operação</legend>
    <p><b>Código: </b><?=$detalhe->codigo;?></p>
    <p><b>Item: </b><?=$detalhe->item;?></p>
    <p><b>Operação: </b><?=$detalhe->operacao;?></p>
    <p><b>Descrição: </b><?=$detalhe->descricao;?></p>
    <p><b>Usuário Responsável: </b><?=$detalhe->nome_usuario;?></p>
    <p><b>Endereço IP: </b><?=$detalhe->endereco_ip;?></p>
    <p><b>Sistema Operativo: </b><?=$detalhe->navegador;?></p>
    <p><b>URI acessada: </b><?=$detalhe->uri;?></p>
    <p><b>Navegador: </b><?=$detalhe->navegador;?></p>
    <p><b>Host: </b><?=$detalhe->host;?></p>
    <p><b>Data da Operação: </b><?=$detalhe->data_operacao;?></p>
</fieldset>