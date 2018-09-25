<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>jQuery AJAX </title>


<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>


<script src="js/jquery.table2excel.js"></script>

<script src="js/jquery.tabledit.js"></script>

<!-- paginacion -->
<script src="js/simplepagination.js"></script>

<!-- filtros tabla -->
<!-- <script src="js/multifilter.js"></script> -->

<!-- otro filtro -->
<!-- <script src="js/excel-bootstrap-table-filter-bundle.js"></script>
<link rel="stylesheet" href="css/excel-bootstrap-table-filter-style.css"> -->


<link rel="stylesheet" href="css/bootstrap.min.css">

<!-- filtros jquerdatatables -->
<script src="js/jquery.dataTables.min.js" ></script>
<link rel="stylesheet" href="css/jquery.dataTables.min.css">

     <!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
    <!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->




<style type="text/css">
.navbar-brand {
    position: absolute;
    padding: 20px;
}
/*
ul {
  list-style: none;
  margin-top: 10px;
  padding: 0;
}

li {
  border-radius: 3px;
  color: black;
  background: #eee;
  cursor: pointer;
  display: inline;
  font-weight: 200;
  margin: 10px 5px 0px 2px;
  padding: 5px;
  text-align: center;
  width: 5px;
}*/

.active {
  background: teal;
  color: white;
}
</style>

<script type="text/javascript">
$(document).ready(function() {


		$.ajax({
			url : 'ControlerServlet?action=Read',
			data: {
				idusuario: '3'
			},			
			success : function(result) {
			
				var lstofertas = $.parseJSON(result);
				
				//alert(lstofertas);

				var items = [];
				
				$.each(lstofertas, function(key, val){
								
				var estadoviene = val.idestadooferta;

				var estadog = "no";
				
				if (estadoviene == 5 ) {
					var estadog = "Pendiente";
				}


				//items.push("<tr><td id='"+key+"'>"+val.rut+"</td><td>"+val.ofecodigo+"</td><td>"+val.ofecredito+"</td><td>"+val.firmados+"</td><td>"+val.idestado+"</td><td>"+val.username+"</td><td>"+val.fechacreacion+"</td></tr>");
				items.push("<tr><td id='"+key+"'>"+val.rut+"</td><td>"+val.ofertacodigo+"</td><td>"+val.ofertacredito+"</td><td>"+val.docFirmado+"</td><td>"+val.NombreEstadoOferta+"</td><td>"+val.usuariocreacion+"</td><td>"+val.fechacreacion+"</td></tr>");					
				
				});
				$('#CrudTableAdmin tbody').append(items);

				var personas = [
				  persona1 = {"nombre": "Luis","Edad": "32"},
				  persona2 = {"nombre": "Marcos","Edad": "15"},
				]
				
				var strg = "";
				personas.forEach(function(persona, index) {
				  //console.log("Persona " + index + " | Nombre: " + persona.nombre + " Edad: " + persona.Edad)
				  //strg += "'"+ index +"': '" + persona.nombre + "',";
				  strg += '"'+ index +'": "' + persona.nombre + '",';
				});
				
				strg += "}";

				var res = strg.replace(",}", "");

				//alert(res);
				
				//var myJsonString = JSON.stringify(personas);
				
				var id="1";
				var nombreejecutivo = "ejecutiiii1";

				$('#CrudTableAdmin').Tabledit({
					columns : {
						identifier : [ 0, 'Rut' ],
						editable : [
							[ 1, 'NOferta' ],
							[ 2, 'N Credito' ],
							//[ 3, 'Firmados' ],
							[ 4, 'Estados', '{"1": "Pendiente de firma", "2": "Caducado", "3": "Generando documentación", "4": "Firmado por cliente", "5": "En proceso de curse", "6": "Cursado", "7": "Anulado"}' ],
							//[ 5, 'Ejecutivo', '{"'+ id +'": "'+ nombreejecutivo +'"}' ]
							[ 5, 'Ejecutivo', '{'+ res +'}' ]
							//[ 6, 'Fecha Creacion' ]
						]
					},
					onAjax : function(action, serialize) {

						AjaxLoad(action, serialize);
					}
				});


				// $("#CrudTableAdmin").pagination();

				// $(".filter1").multifilter();

				// $("#CrudTableAdmin").excelTableFilter();

				// $("#CrudTableAdmin").DataTable({
				// "lengthMenu": [
				// 	[10, 25, 50, 100, -1],
				// 	[10, 25, 50, 100, "All"]
				// 	],
				// 	"scrollY": "200px",
				// 	"dom": 'rtipS',
				// 	// searching: false,
				// 	"deferRender": true,
				// 	initComplete: function() {
				// 	var column = this.api().column(5);

				// 	var select = $('<select class="filter"><option value=""></option></select>')
				// 		.appendTo('#selectTriggerFilter')
				// 		.on('change', function() {
				// 		var val = $(this).val();
				// 		//column.search(val ? '^' + $(this).val() + '$' : val, true, false).draw();
				// 		column.search(val).draw()
				// 		});

				// 	var offices = []; 
				// 	column.data().toArray().forEach(function(s) {
				// 			s = s.split(',');
				// 		s.forEach(function(d) {
				// 			if (!~offices.indexOf(d)) {
				// 				offices.push(d)
				// 			select.append('<option value="' + d + '">' + d + '</option>');                         
				// 			}
				// 		})
				// 	})    
				// 		/*      
				// 	column.data().unique().sort().each(function(d, j) {
				// 		select.append('<option value="' + d + '">' + d + '</option>');
				// 	});
				// 	*/
				// 	}
				// });

/* 				$('#CrudTableAdmin').DataTable( {
						initComplete: function () {
							this.api().columns().every( function () {
								var column = this;
								var select = $('<select><option value=""></option></select>')
									.appendTo( $(column.footer()).empty() )
									.on( 'change', function () {
										var val = $.fn.dataTable.util.escapeRegex(
											$(this).val()
										);
				
										column
											.search( val ? '^'+val+'$' : '', true, false )
											.draw();
									} );
				
								column.data().unique().sort().each( function ( d, j ) {
									select.append( '<option value="'+d+'">'+d+'</option>' )
								} );
							} );
						}
					} );				
 */


			},
	         error: function(jqxhr, status, exception) {
	             alert('Exception:', exception);
	         }
		});

		function AjaxLoad(action, serialize) {

			// 			alert("llego la wea");
			// 			alert(action);
			// 			alert(serialize);

			if (action == "edit") {
				$.ajax({
					url : 'ControlerServlet?action=Update',
					data : {
						userName : 'usermane'
					},
					success : function(responseText) {
						alert("paso ctm por fin update");
					//$('#ajaxGetUserServletResponse').text(responseText);
					}
				});
			} else {
				$.ajax({
					url : 'ControlerServlet?action=Delete',
					data : {
						userName : 'usermane'
					},
					success : function(responseText) {
						alert("paso ctm por fin delete");
					//$('#ajaxGetUserServletResponse').text(responseText);
					}
				});

			}
		}



		$('#NuevaOferta').click(function(event) {
			
			var frm = $('#add_product').serialize();
			
			$.ajax({
				url : 'ControlerServlet?action=Create',
				data : {
 					rut : $('#Rut').val(),
 					oferta : $('#Oferta').val(),
 					credito : $('#Credito').val(),
 					estado : $('#Estado').val(),
 					ejecutivo : $('#Ejecutivo').val(),
 					frmdata : frm
				},
				success : function(result) {
				
					$('#CrudTableAdmin tbody').empty();
					
					$("#add_product")[0].reset();
				
					var lstofertas = $.parseJSON(result);
					
					var items = [];
					
					$.each(lstofertas, function(key, val){
					
					
					items.push("<tr><td id='"+key+"'>"+val.rut+"</td><td>"+val.ofecodigo+"</td><td>"+val.ofecredito+"</td><td>"+val.firmados+"</td><td>"+val.idestado+"</td><td>"+val.username+"</td><td>"+val.fechacreacion+"</td></tr>");					
					
					});
					$('#CrudTableAdmin tbody').append(items);
					
					
					
					$('#CrudTableAdmin').Tabledit({
						columns : {
							identifier : [ 0, 'Rut' ],
							editable : [ [ 1, 'NOferta' ], [2, 'N Credito'], [3, 'Firmados'], [4, 'Estados','{"1": "Firmado", "2": "Proceso", "3": "Caducada"}'], [5, 'Ejecutivo'], [6, 'Fecha Creacion'] ]							

						},
						onAjax : function(action, serialize) {
							alert("entroaca");
							llamaAjax(action, serialize);
						}
					});					
					
				},
		         error: function(jqxhr, status, exception) {
		             alert('Exception:', exception);
		         }
			});
		})


		function llamaAjax(action, serialize) {
		alert("llamma ajax");
			var frm = serialize;

			$.ajax({
				url : 'ControlerServlet?action=Create',
				data : {
					userName : 'usermane',
					frmdata : frm
				},
				success : function(responseText) {
					alert("paso ctm por fin otro");
				//$('#ajaxGetUserServletResponse').text(responseText);
				}
			});
		}



		$("#FormToggle").click(function() {
			$("#add_product").toggle();
		});

		$("#export").click(function(){
		$("#CrudTableAdmin").table2excel({
			// exclude CSS class
			exclude: ".noExl",
			name: "Worksheet Name",
			filename: "SomeFile" //do not include extension
		}); 
		});

		// $("#CrudTableAdmin").pagination();

	})

</script>




</head>
<body>

	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#navbar" aria-expanded="false"
				aria-controls="navbar">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#"> <img alt="Brand"
				src="images/logo-caja.png">
			</a>
		</div>
		<div id="navbar" class="navbar-collapse collapse">
			<ul class="nav navbar-nav navbar-right">
				<li class="active"><a href="#">Ingreso Oferta</a></li>
				<li><a href="Enrolamiento.jsp">Enrolamiento TOC</a></li>
				<li><a href="Login.jsp">Salir</a></li>
			</ul>
		</div>
	</nav>
<%-- Hello, <%= session.getAttribute( "userSession" ) %> --%>
	<div class="container">
        <div class="table-wrapper">
            <div class="table-title" id="FormToggle">
                <div class="row">
                    <div class="col-sm-6">
						<h2>Ingresar <b>Oferta</b></h2>
					</div>
                </div>
            </div>

			<div class="input-group col-md-12">
				<div class="table-responsive">
				<form name="add_product" id="add_product">
						<table class="table table-striped table-hover">
							<thead>
								<tr>
									<th>Rut</th>
									<th>N Oferta</th>
									<th>N Credito</th>
									<th>Estado</th>
									<th>Ejecutivo</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><input type="text" name="Rut" id="Rut"></td>
									<td><input type="text" name="Oferta" id="Oferta"></td>
									<td><input type="text" name="Credito" id="Credito"></td>
									<td><select name="Estado" id="Estado">
											<option value="Pendiente">Pendiente de firma</option>
											<option value="Caducado">Caducado</option>
											<option value="Generando">Generando documentación</option>
											<option value="Firmado">Firmado por cliente</option>
											<option value="Proceso">En proceso de curse</option>
											<option value="Cursado">Cursado</option>
											<option value="Anulado">Anulado</option>
									</select></td>
									<td><select name="Ejecutivo" id="Ejecutivo">
											<option value="ejecutivo1">ejecutivo1</option>
											<option value="ejecutivo2">ejecutivo2</option>
											<option value="ejecutivo3">ejecutivo3</option>
									</select></td>
								</tr>
							</tbody>
						</table>
						<button type="button" class="modal-outline" id="NuevaOferta">Guardar</button>
					</form>
				</div>
			</div>


		</div>
		
		
		<!-- <div class="col-sm-4 pull-right">
			<div id="custom-search-input">
						<div class="input-group col-md-12">
							<input type="text" class="form-control" placeholder="Buscar"  id="q" onkeyup="load(1);" />
							<span class="input-group-btn">
								<button class="btn btn-info" type="button" onclick="buscar(1);">
									<span class="glyphicon glyphicon-search"></span>
								</button>
							</span>
						</div>
			</div>
		</div> -->
		
<!-- <p id="selectTriggerFilter"><label><b>Filter:</b></label><br></p> -->

		<div class="clearfix"></div>
		<hr>

		<div class="table-wrapper">
			<div class="table-title">
				<div class="row">
					<div class="col-sm-6">
						<h2>
							Administrador <b>Ofertas</b>
						</h2>
					</div>
				</div>
			</div>

			<div class="table-responsive">

				<!-- <div class="filters">
					<div class="filter-container">
						<input autocomplete="off" class="filter1" name="Rutf" placeholder="Rut" data-col="Rut" />
					</div>
					<div class="filter-container">
						<input autocomplete="off" class="filter1" name="NOfertaf" placeholder="N Oferta" data-col="N Oferta" />
					</div>
					<div class="filter-container">
						<input autocomplete="off" class="filter1" name="NCreditof" placeholder="N Credito" data-col="N Credito" />
					</div>																			

					<div class="clearfix"></div>
				</div> -->

				<table class="table table-striped table-hover" id="CrudTableAdmin" number-per-page="10" current-page="0">
					<thead>
						<tr>
							<th>Rut</th>
							<th>N Oferta</th>
							<th>N Credito</th>
							<th>Firmados</th>
							<th>Estados</th>
							<th>Ejecutivo</th>
							<th>Fecha Creacion</th>
						</tr>					
					</thead>
					<!-- <tfoot> 
						<tr>
							<th>Rut</th>
							<th>N Oferta</th>
							<th>N Credito</th>
							<th>Firmados</th>
							<th>Estados</th>
							<th>Ejecutivo</th>
							<th>Fecha Creacion</th>
						</tr>
					</tfoot> -->					
					<tbody></tbody>
				</table>
				<button id="export">Export</button>
			</div>

		</div>





	</div>
</body>
</html>