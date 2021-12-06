<?php
include_once ("connect_data.php");  // klase honetan gordetzen dira datu basearen datuak. erabiltzailea...
include_once("peliculaClass.php");

class peliculaModel extends peliculaClass 
{
    
    private $link;
   
    
    public function setList()
    {
        $this->OpenConnect();  // konexio zabaldu  - abrir conexión
        
        //$sql = "CALL spAllFilms()"; // SQL sententzia - sentencia SQL
        
        $sql = "select * from peliculas";
        
        $result = $this->link->query($sql); // result-en ddbb-ari eskatutako informazio dena gordetzen da
        // se guarda en result toda la información solicitada a la bbdd
        
        $list=array();
        while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
            
            $nuevo=new peliculaClass();
            
            $nuevo->idPelicula=$row['idPelicula'];
            $nuevo->TituloPelicula=$row['TituloPelicula'];
            $nuevo->Anio=$row['Anio'];
            $nuevo->Director=$row['Director'];
            $nuevo->cartel=$row['cartel'];
            
            array_push($list, $nuevo);
        }
        mysqli_free_result($result);
        $this->CloseConnect();
        return $list;
    }
    
   
    public function OpenConnect()
    {
        $konDat=new connect_data();
        try
        {
            $this->link=new mysqli($konDat->host,$konDat->userbbdd,$konDat->passbbdd,$konDat->ddbbname);
            // mysqli klaseko link objetua sortzen da dagokion konexio datuekin
            // se crea un nuevo objeto llamado link de la clase mysqli con los datos de conexión.
        }
        catch(Exception $e)
        {
            echo $e->getMessage();
        }
        $this->link->set_charset("utf8"); // honek behartu egiten du aplikazio eta
        //                  //databasearen artean UTF -8 erabiltzera datuak trukatzeko
    }
    
    public function CloseConnect()
    {
        mysqli_close ($this->link);
    }
    
 
}
?>
