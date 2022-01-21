<?php
    require_once '../inclusao.php';
    $item = new Item();
    $historico = new HistoricoOperacao();
    $usuario = new Usuario();
    $codGerado = 'IT'.date('YmdHis');
?>

<a href="historico.php">Voltar</a>

<h1>Pesquisa de Operações</h1>

<form action="" method="post">
    <input type="search" name="parametro" placeholder="Usuário, Item ou Operação" style="width: 20%;" required autofocus>
    <button type="submit" name="pesquisar">Pesquisar</button>
</form>

<?php if (isset($_POST['pesquisar'])): ?>

    <?php 
        $parametro = filter_var($_POST['parametro'], FILTER_SANITIZE_STRING);
        $resultados = $historico->buscar($parametro);
        $numRegistos = count($resultados);
    ?>

    <?php if ($numRegistos > 0): ?>
        <p><?=$numRegistos;?> Encontrados para <b><?=$parametro;?></b></p>
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
                <?php foreach ($resultados as $registo):?>
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
        <p>0 Registos Encontrados para <b><?=$parametro;?></b></p>
    <?php endif ;?>

<?php endif; ?>
