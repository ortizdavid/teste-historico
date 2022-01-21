<?php

require_once 'mysql-lib/TableDB.php';

class Usuario extends TableDB
{
    protected string $tableName = 'usuario';
    protected string $primaryKey = 'id_usuario';
}