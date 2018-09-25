<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>jQuery AJAX </title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="js/script.js"></script>
<link rel="stylesheet" href="css/custom.css">

<script src="js/jquery.tabledit.js"></script>

<script type="text/javascript">

	$(document).ready(function() {
		$('#example-2').Tabledit({
			columns : {
				identifier : [ 1, 'First' ],
				editable : [ [ 2, 'Last' ], [ 3, 'Nickname', '{"1": "@mdo", "2": "@fat", "3": "@twitter"}' ] ]
			},
			onAjax : function(action, serialize) {
				alert(action);
				alert(serialize);
				llamaAjax(action, serialize);
			}
		});
		
		
		
		function llamaAjax(action, serialize){
		
		alert("funcion");
		
		var frm = serialize;
		
		alert(frm);
		
		
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
				<li><a href="#">Ingreso Oferta</a></li>
				<li class="active"><a href="Enrolamiento.jsp">Enrolamiento TOC</a></li>
				<li><a href="Login.jsp">Salir</a></li>
			</ul>
		</div>
	</nav>




		<table class="table table-striped table-bordered" id="example-2">
			<caption>Click the table cells to edit.</caption>
			<thead>
				<tr>
					<th>#</th>
					<th>First</th>
					<th>Last</th>
					<th>Nickname</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th scope="row">1</th>
					<td>Mark</td>
					<td>Otto</td>
					<td>@mdo</td>
				</tr>
				<tr>
					<th scope="row">2</th>
					<td>Jacob</td>
					<td>Thornton</td>
					<td>@fat</td>
				</tr>
				<tr>
					<th scope="row">3</th>
					<td>Larry</td>
					<td>the Bird</td>
					<td>@twitter</td>
				</tr>
			</tbody>
		</table>



</body>
</html>