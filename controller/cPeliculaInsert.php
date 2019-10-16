<?php

include_once ("../model/peliculaModel.php");

$TituloPeliculaInsert=filter_input(INPUT_GET, 'TituloPeliculaInsert');
$AnioInsert=filter_input(INPUT_GET, 'AnioInsert');
$DirectorInsert=filter_input(INPUT_GET, 'DirectorInsert');
$cartelInsert=filter_input(INPUT_GET, 'cartelInsert');


$pelicula=new peliculaModel();

$pelicula->setTituloPelicula($TituloPeliculaInsert);
$pelicula->setAnio($AnioInsert);
$pelicula->setDirector($DirectorInsert);
$pelicula->setCartel($cartelInsert);

$resultado=$pelicula->insert(); //function insert en pelicula_model
echo $resultado;

