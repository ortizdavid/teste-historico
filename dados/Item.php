<?php

require_once 'mysql-lib/TableDB.php';

class Item extends TableDB
{
    protected string $tableName = 'item';
    protected string $primaryKey = 'id_item';
}