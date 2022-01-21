<?php

require_once 'mysql-lib/TableDB.php';

class DadosServidor extends TableDB
{
    protected string $tableName = 'dados_servidor';
    protected string $primaryKey = 'id_dados_servidor';


    public function __construct()
    {}


    public function rastrear() : int
    {
        $this->insert([
            'endereco_ip' => $_SERVER['REMOTE_ADDR'],
            'uri' => $_SERVER['REQUEST_URI'],
            'navegador' => $_SERVER['HTTP_USER_AGENT'],
            'sistema_operativo' => $_SERVER['HTTP_SEC_CH_UA_PLATFORM'],
            'host' => $_SERVER['HTTP_HOST'],
        ]);
        return $this->getLastId();
    }


}

