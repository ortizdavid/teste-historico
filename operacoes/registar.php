<?php
    require_once '../inclusao.php';
    $item = new Item();
    $historico = new HistoricoOperacao();
    $usuario = new Usuario();
    $codGerado = 'IT'.date('YmdHis');
?>
<a href="../index.php">Voltar</a>
<h1>Registo de Itens</h1>

<?php 
    if (isset($_POST['submeter'])) 
    {
        $usuarioCorrente = filter_var($_POST['usuario']);
        $nomeItem = filter_var($_POST['nome_item'], FILTER_SANITIZE_STRING);
        $codigo = filter_var($_POST['codigo'], FILTER_SANITIZE_STRING);
        
        $item->insert([
            'nome_item' => $nomeItem,
            'codigo' => $codigo
        ]);
        $idItem = $item->getLastId();
        $nomeUsuario = $usuario->find($usuarioCorrente)->nome_usuario;

        $historico->gravar(
            $usuarioCorrente,
            $nomeItem,
            "Registar Item",
            "O item '{$nomeItem}' foi Registado pelo Usuario '{$nomeUsuario}'"
        );
        echo "<p>Item Registado com Sucesso</p>";
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
    <label for="">Nome do Item: </label><input type="text" name="nome_item" required autofocus><br>
    <label for="">Código: </label><input type="text" name="codigo" value="<?=$codGerado;?>" required><br>
    <br>
    <button type="submit" name="submeter">Submeter</button>
    <button onclick="window.location.href='itens.php'">Cancelar</button>
</form>
