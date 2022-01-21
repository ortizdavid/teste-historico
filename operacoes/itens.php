<?php 
    require_once '../inclusao.php';
    $item = new Item();
    $listaItens = $item->findAll();
    $numRegistos = $item->count();
?>

<a href="../index.php">Voltar</a>
<h1>Itens do Sistema</h1>

<div >
    <a href="registar.php">Registar</a>
</div>

<?php if ($numRegistos > 0): ?>
    <p>Número de Registos: <?=$numRegistos;?></p>
    <table border="1">
        <thead>
            <tr>
                <th>Código</th>
                <th>Nome do Item</th>
                <th>Operação</th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($listaItens as $registo):?>
                <tr>
                    <td><?=$registo->codigo;?></td>
                    <td><?=$registo->nome_item;?></td>
                    <td>
                        <a href="editar.php?id=<?=$registo->id_item;?>">Editar</a> |
                        <a href="eliminar.php?id=<?=$registo->id_item;?>">Excluir</a> |
                    </td>
                </tr>
            <?php endforeach;?>
        </tbody>
    </table>
<?php else: ?>
    <p>Nenhum Registo Encontrado!</p>
<?php endif;?>
