<?php

class peliculaClass {
    protected $idPelicula;
    protected $TituloPelicula;
    protected $Anio;
    protected $Director;
    protected $cartel;
    
    
    public function getIdPelicula() {
        return $this->idPelicula;
    }

    public function getTituloPelicula() {
        return $this->TituloPelicula;
    }

    public function getAnio() {
        return $this->Anio;
    }

    public function getDirector() {
        return $this->Director;
    }

    public function getCartel() {
        return $this->cartel;
    }

    public function setIdPelicula($idPelicula) {
        $this->idPelicula = $idPelicula;
    }

    public function setTituloPelicula($TituloPelicula) {
        $this->TituloPelicula = $TituloPelicula;
    }

    public function setAnio($Anio) {
        $this->Anio = $Anio;
    }

    public function setDirector($Director) {
        $this->Director = $Director;
    }

    public function setCartel($cartel) {
        $this->cartel = $cartel;
    }


}
