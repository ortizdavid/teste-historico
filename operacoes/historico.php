<?php 
    require_once '../inclusao.php';
    $historico = new HistoricoOperacao();
    $listaDeHistorico = $historico->listar();
    $numRegistos = $historico->count();
?>

<a href="../index.php">Voltar</a>
<h1>Histórico de Operações</h1>


<div align="right">
    <a href="pesquisar.php">Pesquisar</a>
</div>
<?php if ($numRegistos > 0): ?>
    <p>Número de Registos: <?=$numRegistos;?></p>
    <table border="1">
        <thead>
            <tr>
                <th>Código</th>
                <th>Item</th>
                <th>Operação</th>
                <th>Descrição</th>
                <th>Usuário</th>
                <th>Endereço IP</th>
                <th>URI utilizada</th>
                <th>Host</th>
                <th>Data da Operação</th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($listaDeHistorico as $registo):?>
                <tr>
                    <td>
                    <a href="detalhes.php?id=<?=$registo->id_historico;?>"> <?=$registo->codigo;?></a>
                    </td>
                    <td><?=$registo->item;?></td>
                    <td><?=$registo->operacao;?></td>
                    <td><?=$registo->descricao;?></td>
                    <td><?=$registo->nome_usuario;?></td>
                    <td><?=$registo->endereco_ip;?></td>
                    <td><?=$registo->uri;?></td>
                    <td><?=$registo->host;?></td>
                    <td><?=$registo->data_operacao;?></td>
                </tr>
            <?php endforeach;?>
        </tbody>
    </table>
<?php else: ?>
    <p>Nenhum Registo Encontrado!</p>
<?php endif;?>
