<?php 
require_once 'mysql-lib/TableDB.php';
require_once 'mysql-lib/Query.php';

class HistoricoOperacao extends TableDB
{
    protected string $tableName = 'historico_operacao';
    protected string $primaryKey = 'id_historico';


    public function __construct()
    {}


    public function obterDados(int $id) : object
    {
        $query = new Query();
        return $query->select()
                    ->from('view_dados_historico')
                    ->where('id_historico', '=', $id)
                    ->one();
    }


    public function listar() : array
    {
        $query = new Query();
        return $query->select()
                    ->from('view_dados_historico')
                    ->orderBy('data_operacao', 'DESC')
                    ->all();
    }


    public function buscar($param) : array
    {
        $query = new Query();
        return $query->select()
                    ->from('view_dados_historico')
                    ->where('item', 'LIKE', $param)
                    ->or('nome_usuario', 'LIKE', $param)
                    ->or('data_operacao', 'LIKE', $param)
                    ->orderBy('data_operacao', 'DESC')
                    ->all();
    }


    public function gravar(int $usuario, string $item, string $operacao, string $descricao) : void
    {
        $idDadosServidor = (new DadosServidor())->rastrear();
        $codigo = 'HST'.date('YmdHis');
        
        $this->insert([
            'id_dados_servidor' => $idDadosServidor,
            'id_usuario' => $usuario,
            'item' => $item,
            'codigo' => $codigo,
            'operacao' => $operacao,
            'descricao' => $descricao
        ]);
    }


}
