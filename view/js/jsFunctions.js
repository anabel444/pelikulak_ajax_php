document.addEventListener("DOMContentLoaded", function (event) {

	
	loadFilms();
});

function loadFilms(){	
	$.ajax({
       	type:"GET",
       	url: "controller/cIndex.php", 
    	dataType: "json",  //type of the result
       	
    	success: function(result){  
       		
    		console.log(result.list);
    		
       		var pelikulak = result.list;

       		var newRow ="<h2>Pelikulak</h2>";
  			newRow +="<table > ";
			newRow +="<tr><th>ID</th><th>TITULO</th><th>ANIO</th><th>DIRECTOR</th><th>CARTEL</th></tr>";
       		
			for (let i=0;i<pelikulak.length;i++)
			{					
				newRow += "<tr>" +"<td>"+pelikulak[i].idPelicula+"</td>"
									+"<td>"+pelikulak[i].TituloPelicula+"</td>"
									+"<td>"+pelikulak[i].Anio+"</td>"
									+"<td>"+pelikulak[i].Director+"</td>"
									+"<td><img src='"+pelikulak[i].cartel+"'/></td>"
								+"</tr>";	
			}
       		newRow +="</table>";   
       		
       		document.getElementById("tableFilms").innerHTML=newRow; // add the new row to the container
       		
		},
       	error : function(xhr) {
   			alert("An error occured: " + xhr.status + " " + xhr.statusText);
   		}
	});
}