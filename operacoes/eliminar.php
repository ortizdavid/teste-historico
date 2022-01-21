<?php
    require_once '../inclusao.php';
    $id = filter_var($_GET['id'], FILTER_SANITIZE_NUMBER_INT);
    $item = new Item();
    $historico = new HistoricoOperacao();
    $usuario = new Usuario();
    $objItem = $item->find($id);
?>

<a href="../index.php">Voltar</a>
<h1>Exclusão de Itens</h1>

<?php 
    if (isset($_POST['eliminar'])) 
    {
        $usuarioCorrente = filter_var($_POST['usuario']);
        $item->delete($id);

        $nomeUsuario = $usuario->find($usuarioCorrente)->nome_usuario;

        $historico->gravar(
            $usuarioCorrente,
            $objItem->nome_item,
            "Eliminar Item",
            "O item '{$objItem->nome_item}' foi Eliminado pelo Usuario '{$nomeUsuario}'"
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
  
    <button type="submit" name="eliminar">Eliminar Item</button>
    <button onclick="window.location.href='itens.php'">Cancelar</button>
</form>
