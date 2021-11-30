<?php
class Question {
    private $num;
    private $name;
    private $nbResponse;
    private $typeResponse;

    public function __construct($num, $name, $nbResponse, $typeResponse){
        $this->num = $num;
        $this->name = $name;
        $this->nbResponse = $nbResponse;
        $this->typeResponse = $typeResponse;
    }

    public function getNum(){
        return $this->num;
    }

    public function getName(){
        return $this->name;
    }

    public function getNbResponse(){
        return $this->nbResponse;
    }

    public function getTypeResponse(){
        return $this->typeResponse;
    }

    public function setNum($num){
        $this->num = $num;
    }

    public function setName($name){
        $this->name = $name;
    }

    public function setNbResponse($nbResponse){
        $this->nbResponse= $nbResponse;
    }

    public function setTypeResponse($typeResponse){
        $this->typeResponse = $t;
    }
}