
$(document).ready(function(){
	
	$.ajax({
       	type:"GET",
       	url: "controller/cIndex.php", 
    	datatype: "json",  //type of the result
       	
    	success: function(result){  
       		
    		console.log(result);
    		
       		var pelikulak = JSON.parse(result);

       		$("#tableFilms").empty(); // removes all the previous content in the container
       		
       		var newRow ="<h2>Pelikulak</h2>";
  			newRow +="<table > ";
			newRow +="<tr><th>ID</th><th>TITULO</th><th>ANIO</th><th>DIRECTOR</th><th>CARTEL</th></tr>";
       		
			$.each(pelikulak,function(index,info) { 
								
				newRow += "<tr>" +"<td>"+info.idPelicula+"</td>"
									+"<td>"+info.TituloPelicula+"</td>"
									+"<td>"+info.Anio+"</td>"
									+"<td>"+info.Director+"</td>"
									+"<td><img src='"+info.cartel+"'/></td>"
								+"</tr>";	
			});
       		newRow +="</table>";   
       		
       		$("#tableFilms").append(newRow); // add the new row to the container
		},
       	error : function(xhr) {
   			alert("An error occured: " + xhr.status + " " + xhr.statusText);
   		}
	});
	
	$("#berria").click(function(){

		$("#insert").css("display","block");
	});
	
	$("#btnExecInsert").click(function(){
			
			var TituloPeliculaInsert=$("#TituloPeliculaInsert").val();
			var AnioInsert=$("#AnioInsert").val();
			var DirectorInsert=$("#DirectorInsert").val();
			var cartelInsert=$("#cartelInsert").val();
		     
		  	$.ajax({
		       	type: "GET",
		       	data:{ 'TituloPeliculaInsert':TituloPeliculaInsert, 'AnioInsert':AnioInsert,'DirectorInsert':DirectorInsert,'cartelInsert':cartelInsert},
		       	url: "controller/cPeliculaInsert.php", 
		       	datatype: "json",  //type of the result
		       	success: function(result){  
		       		
		       		console.log(result);
		       		alert(result);
		       		location.reload(true);  //recarga la pagina
		       	},
		       	error : function(xhr) {
		   			alert("An error occured: " + xhr.status + " " + xhr.statusText);
		   		}
		    });
		  	
	});
	
	$("#ezabatu").click(function(){

		$("#delete").css("display","block");
		$("#delete input").val(""); 
		$("#delete img").attr("src",""); 
		
		$.ajax({
	       	type: "GET",
	       	url: "controller/cPeliculaDelete.php", 
	       	datatype: "json",  //type of the result
	       	success: function(result){  
	       		
       			console.log("PELICULAS"+result);
	    		
	       		var pelikulak = JSON.parse(result);
	       		
	       		console.log(result);
	       		$("#selectDelete").empty(); // removes all the previous content in the container
	       		
	       		var newRow ="<option>--Select--></option>";

				$.each(pelikulak,function(index,info) { 
			  	
					var datuak = info.idPelicula +"-"+ info.TituloPelicula +"-"+ info.Anio;
					
					var datuakItzuli = datuak+"-" + info.Director+"-"+info.cartel;
					
					newRow +="<option value='"+datuakItzuli+"'>"+datuak+"</option>"; 
				});
		
				$("#selectDelete").append(newRow); 
		       	},
		       	error : function(xhr) {
		   			alert("An error occured: " + xhr.status + " " + xhr.statusText);
		   		}
	       });
	});
	$("#btnDatuakIkusi").click(function(){
		
		var atributoak=($("#selectDelete").val()).split("-");
		
		$("#idPeliculaDelete").val(atributoak[0]);
	    $("#TituloPeliculaDelete").val(atributoak[1]);
	    $("#AnioDelete").val(atributoak[2]);
	    $("#DirectorDelete").val(atributoak[3]);
	    $("#cartelDelete").attr("src",atributoak[4]);
	});
	$("#btnExecDelete").click(function(){
		
		var idPeliculaDelete=$("#idPeliculaDelete").val();
		
		$.ajax({
	       	type: "GET",
	       	data:{ 'idPeliculaDelete':idPeliculaDelete},
	       	url: "controller/cPeliculaExecuteDelete.php", 
	       	
	       	success: function(result){  
	       		
	       		console.log(result);
	       		alert(result);
	       		location.reload(true);  //recarga la pagina
	       	},
	       	error : function(xhr) {
	   			alert("An error occured: " + xhr.status + " " + xhr.statusText);
	   		}
	    });
  	
    });
	
	
	$("#aldatu").click(function(){

		$("#update").css("display","block");
		
		
	});

});