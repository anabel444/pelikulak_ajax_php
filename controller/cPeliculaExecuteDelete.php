<?php

include_once ("../model/peliculaModel.php");


$idPelicula=filter_input(INPUT_GET,"idPeliculaDelete");

$pelicula= new peliculaModel();
$pelicula->setIdPelicula($idPelicula);

$resultado=$pelicula->delete();

echo $resultado;

unset ($pelicula);
