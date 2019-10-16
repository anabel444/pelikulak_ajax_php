<?php

include_once ("../model/peliculaModel.php");

$pelicula= new peliculaModel();
$pelicula->setList(); 

$listaPeliculasJson=$pelicula->getListJsonString();

echo $listaPeliculasJson;

unset ($pelicula);