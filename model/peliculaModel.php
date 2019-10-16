<?php
include_once ("connect_data.php");  // klase honetan gordetzen dira datu basearen datuak. erabiltzailea...
include_once("peliculaClass.php");

class peliculaModel extends peliculaClass {
    
    private $link;
    private $list= array();  // all the films, represents the pelicula table
   
    
    public function getList()
    {
        return $this->list;
    }

    
    public function setList()
    {
        $this->OpenConnect();  // konexio zabaldu  - abrir conexión
        
        $sql = "CALL spAllFilms()"; // SQL sententzia - sentencia SQL
        
        $result = $this->link->query($sql); // result-en ddbb-ari eskatutako informazio dena gordetzen da
        // se guarda en result toda la información solicitada a la bbdd
        
        while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
            
            $nuevo=new peliculaClass();
            
            $nuevo->setIdPelicula($row['idPelicula']);
            $nuevo->setTituloPelicula($row['TituloPelicula']);
            $nuevo->setAnio($row['Anio']);
            $nuevo->setDirector($row['Director']);
            $nuevo->setCartel($row['cartel']);
            
            array_push($this->list, $nuevo);
        }
        mysqli_free_result($result);
        $this->CloseConnect();
    }
    
    public function insert(){
        
        $this->OpenConnect();  // konexio zabaldu  - abrir conexión
        
        $TituloPeliculaInsert=$this->getTituloPelicula();
        $AnioInsert=$this->getAnio();
        $DirectorInsert=$this->getDirector();
        $cartelInsert=$this->getCartel();

        $sql="CALL spInsertPelicula('$TituloPeliculaInsert',
                                    $AnioInsert, $DirectorInsert,'$cartelInsert')";
        
        $numFilas=$this->link->query($sql);
        
        if ($numFilas>=1)
        {
            return "insertado";
        } else {
            return "Error al insertar";
        }
        
        $this->CloseConnect();
    }
    public function delete(){
        
        $this->OpenConnect();  // konexio zabaldu  - abrir conexión

        $id=$this->getIdPelicula(); 
        $sql="CALL spDeletePelicula($id)";
        
        $numFilas=$this->link->query($sql); 
        
        if ($numFilas>=1)
        {
            echo "borrado";
        } else {
            echo "Error al borrar";
        }
        $this->CloseConnect();
        
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
    
    function getListJsonString() {//if Class attributes PROTECTED
        
        // returns the list of objects in a srting with JSON format
        // Atributtes don't must be PUBLICs, they can be PRIVATE or PROTECTED
        $arr=array();
        
        foreach ($this->list as $object)
        {
            $vars = get_object_vars($object);
            
            array_push($arr, $vars);
        }
        return json_encode($arr);
    }
}
?>
