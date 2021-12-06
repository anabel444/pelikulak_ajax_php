<?php

include_once ("../model/peliculaModel.php");

$pelicula= new peliculaModel();

$response=array();

$response['list']=$pelicula->setList();
$response['error']="no error"; 

echo json_encode($response); // pasar de php a json

unset ($pelicula);
unset ($list);