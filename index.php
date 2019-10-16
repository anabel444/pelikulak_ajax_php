<!DOCTYPE html>

<html>
    <head>
        <meta charset="UTF-8">
       <title>Pelikulak</title>
       <link rel="stylesheet" href="view/css/estilos.css" />
</head>
<body>

    <div  id="container">  
        <div>
         <h4>EKINTZAK </h4>  
         	<button id="berria">Pelikula berria</button>
         	<button id="ezabatu">Pelikula ezabatu</button>
         	<button id="aldatu">Pelikula aldatu</button>
    	</div>   
        <div id="tableFilms">
        	
        </div>
    </div>

    <div id="ekintzak">
        <div id="insert" >
            	<h4>Insert new film:</h4>	 
              <br>
              Titulo:<br>
              <input type="text" id="TituloPeliculaInsert">
              <br>
              Anio:<br>
              <input type="text" id="AnioInsert">
              <br>
              Director:<br>
              <input type="text" id="DirectorInsert">
              <br>
              Cartel:<br>
              <input type="text" id="cartelInsert">
              <br><br>
              <button id="btnExecInsert">Execute Insert</button>
        </div>
        <div id="delete" >
            	<h4>Delete new film:</h4>	
            	
              <select id="selectDelete">  
            
              </select>
              <button id="btnDatuakIkusi">Datuak ikusi</button>
        
              <br><br>
               Id:<br>
              <input type="text" id="idPeliculaDelete" readonly/>
              <br>
              Titulo:<br>
              <input type="text" id="TituloPeliculaDelete" readonly/>
              <br>
              Anio:<br>
              <input type="text" id="AnioDelete" readonly/>
              <br>
              Director:<br/>
              <input type="text" id="DirectorDelete" readonly/>
              <br/>
              Cartel:<br>
              <img src=" " id="cartelDelete" />
              <br><br>
              <button id="btnExecDelete">Confirm Deleted</button>
         
        </div>
        <div id="update" >
            	<h4>Update new film:</h4>	
            	
            	<select id="selectUpdate">  
            
              </select>
              <button id="btnDatuakIkusiUpdate">Datuak ikusi</button>
        
               Id:<br>
              <input type="text" id="idPeliculaUpdate" readonly>
              <br>
              Titulo:<br>
              <input type="text" id="TituloPeliculaUpdate">
              <br>
              Anio:<br>
              <input type="text" id="AnioUpdate">
              <br>
              Director:<br>
              <input type="text" id="DirectorUpdate">
              <br>
              Cartel:<br>
              <input type="text" id="cartelUpdate">
              <br><br>
              <button id="btnExecUpdate">Confirm Updated</button>
         
        </div>
 	</div>  


	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="view/js/jsFunctions.js"></script>        


</body>
</html>