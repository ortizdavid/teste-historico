<?php
    require_once '../inclusao.php';
    $id = filter_var($_GET['id'], FILTER_SANITIZE_NUMBER_INT);
    $item = new Item();
    $historico = new HistoricoOperacao();
    $usuario = new Usuario();
    $objItem = $item->find($id);
?>
<a href="../index.php">Voltar</a>
<h1>Edição de Itens</h1>

<?php 
    if (isset($_POST['salvar'])) 
    {
        $usuarioCorrente = filter_var($_POST['usuario']);
        $nomeItem = filter_var($_POST['nome_item'], FILTER_SANITIZE_STRING);
        $codigo = filter_var($_POST['codigo'], FILTER_SANITIZE_STRING);
        
        $item->update([
            'nome_item' => $nomeItem,
            'codigo' => $codigo
        ], $id);

        $nomeUsuario = $usuario->find($usuarioCorrente)->nome_usuario;

        $historico->gravar(
            $usuarioCorrente,
            $objItem->nome_item,
            "Editar Item",
            "O item '{$objItem->nome_item}' foi Editado pelo Usuario '{$nomeUsuario}'"
        );
        echo "<script>window.location.href='itens.php'</script>";
    }
?>

<form action="" method="post">
    <label for="">Usuário Corrente:</label>
    <select name="usuario" required id="">
        <?php foreach ($usuario->findAll() as $registo):?>
            <option value="<?=$registo->id_usuario;?>"><?=$registo->nome_usuario;?></option>
        <?php endforeach;?>
    </select>
    <hr>
    <label for="">Nome do Item: </label><input type="text" name="nome_item" value="<?=$objItem->nome_item;?>" required autofocus><br>
    <label for="">Código: </label><input type="text" name="codigo" value="<?=$objItem->codigo;?>" required><br>
    <br>
    <button type="submit" name="salvar">Salvar</button>
    <button onclick="window.location.href='itens.php'">Cancelar</button>
</form>
