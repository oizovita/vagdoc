<?php

class Model
{
    private $con;

    public function __construct()
    {

        $this->con = mysqli_connect(getenv("DB_HOST"), getenv("DB_USERNAME"), getenv("DB_PASSWORD"), getenv("DB_DATABASE")) or die("error");

        mysqli_set_charset($this->con, 'utf8');
    }

    public function __destruct()
    {
        mysqli_close($this->con);
    }

    public function getConnect(){
        return $this->con;
    }
}