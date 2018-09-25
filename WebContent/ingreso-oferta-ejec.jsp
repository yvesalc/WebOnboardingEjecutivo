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


<style type="text/css">
.navbar-brand {
    position: absolute;
    padding: 20px;
}
</style>

<script type="text/javascript">
$(document).ready(function() {


		$('#login').click(function(event) {
			
			var frm = $('#add_product').serialize();
			alert(frm);
			
			
			
			$.ajax({
				url : 'ControlerServlet?action=Create',
				data : {
 					userName : $('#code').val(),
 					frmdata : frm
				},
				success : function(responseText) {
					alert("paso ctm por fin");
					//$('#ajaxGetUserServletResponse').text(responseText);
				}
			});					
			
		})
		
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



	<div class="container">
        <div class="table-wrapper">
            <div class="table-title">
                <div class="row">
                    <div class="col-sm-6">
						<h2>Administrador <b>Ofertas</b></h2>
					</div>
<!-- 					<div class="col-sm-6"> -->
<!-- 						<a data-target="#addProductModal" class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Agregar Oferta</span></a> -->
<!-- 					</div> -->
                </div>
            </div>

			<div class="input-group col-md-12">
				<div class="table-responsive">
				<form name="add_product" id="add_product">
					<table class="table table-striped table-hover">
						<thead>
							<tr>
								<th class='text-center'>Rut</th>
								<th class='text-center'>N Oferta</th>
								<th class='text-center'>N Credito</th>
								<th class='text-center'>Firmados</th>
								<th class='text-center'>Estados</th>
								<th class='text-center'>Ejecutivo</th>
								<th class='text-center'>Fecha Creacion</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><input type="text" name="code" id="code"
									class="form-control" required></td>
								<td><input type="text" name="Oferta" id="Oferta"
									class="form-control" required></td>
								<td><input type="text" name="Credito" id="Credito"
									class="form-control" required></td>
								<td><input type="number" name="Firmados" id="Firmados"
									class="form-control" required></td>
								<td><input type="text" name="Estados" id="Estados"
									class="form-control" required></td>
								<td><input type="text" name="Ejecutivo" id="Ejecutivo"
									class="form-control" required></td>
								<td><input type="text" name="Fecha" id="Fecha"
									class="form-control" required></td>
							</tr>
						</tbody>						
					</table>
					<button type="button" class="modal-outline" id="login">Guardar</button>
					</form>
				</div>
			</div>

			<div class='col-sm-4 pull-right'>
				<div id="custom-search-input">
                            <div class="input-group col-md-12">
                                <input type="text" class="form-control" placeholder="Buscar"  id="q" onkeyup="load(1);" />
                                <span class="input-group-btn">
                                    <button class="btn btn-info" type="button" onclick="load(1);">
                                        <span class="glyphicon glyphicon-search"></span>
                                    </button>
                                </span>
                            </div>
                </div>
			</div>
			<div class='clearfix'></div>
			<hr>

			<div class="table-responsive">
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<th class='text-center'>Rut</th>
							<th class='text-center'>N Oferta</th>
							<th class='text-center'>N Credito</th>
							<th class='text-center'>Firmados</th>
							<th class='text-center'>Estados</th>
							<th class='text-center'>Ejecutivo</th>
							<th class='text-center'>Fecha Creacion</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><span>5000-2</span></td>
							<td><span>2</span></td>
							<td><span>037CON11234G</span></td>
							<td><span>7 de 7</span></td>
							<td><span>Firmado por cliente</span></td>
							<td><span>Andres</span></td>
							<td><span>dd/mm/aaaa</span></td>
							<td><a href="#" data-target="#editProductModal" class="edit"
								data-toggle="modal"><i class="material-icons"
									data-toggle="tooltip" title="Editar">&#xE254;</i></a> <a
								data-target="#deleteProductModal" class="delete"
								data-toggle="modal"><i class="material-icons"
									data-toggle="tooltip" title="Eliminar">&#xE872;</i></a></td>
						</tr>
						<tr>
							<td><span>500-3</span></td>
							<td><span>3</span></td>
							<td><span>037CON11235T</span></td>
							<td><span>3 de 7</span></td>
							<td><span>En proceso de curse</span></td>
							<td><span>Juan</span></td>
							<td><span>dd/mm/aaaa</span></td>
							<td><a href="#" data-target="#editProductModal" class="edit"
								data-toggle="modal"><i class="material-icons"
									data-toggle="tooltip" title="Editar">&#xE254;</i></a> <a
								data-target="#deleteProductModal" class="delete"
								data-toggle="modal"><i class="material-icons"
									data-toggle="tooltip" title="Eliminar">&#xE872;</i></a></td>							
						</tr>
						<tr>
							<td><span>5000-4</span></td>
							<td><span>4</span></td>
							<td><span>034CON11235R</span></td>
							<td><span>3 de 7</span></td>
							<td><span>Caducada</span></td>
							<td><span>Anita</span></td>
							<td><span>dd/mm/aaaa</span></td>
							<td><a href="#" data-target="#editProductModal" class="edit"
								data-toggle="modal"><i class="material-icons"
									data-toggle="tooltip" title="Editar">&#xE254;</i></a> <a
								data-target="#deleteProductModal" class="delete"
								data-toggle="modal"><i class="material-icons"
									data-toggle="tooltip" title="Eliminar">&#xE872;</i></a></td>							
						</tr>
					</tbody>
				</table>
			</div>
		</div>

		<div id="addProductModal" class="modal fade">
			<div class="modal-dialog">
				<div class="modal-content">
					<form name="add_product" id="add_product">
						<div class="modal-header">
							<h4 class="modal-title">Agregar Producto</h4>
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
						</div>
						<div class="modal-body">
							<div class="form-group">
								<label>Rut</label> <input type="text" name="code" id="code"
									class="form-control" required>
							</div>
							<div class="form-group">
								<label>N Oferta</label> <input type="text" name="Oferta" id="Oferta"
									class="form-control" required>
							</div>
							<div class="form-group">
								<label>N Credito</label> <input type="text" name="Credito"
									id="Credito" class="form-control" required>
							</div>
							<div class="form-group">
								<label>Firmados</label> <input type="number" name="Firmados"
									id="Firmados" class="form-control" required>
							</div>
							<div class="form-group">
								<label>Estados</label> <input type="text" name="Estados" id="Estados"
									class="form-control" required>
							</div>
							<div class="form-group">
								<label>Ejecutivo</label> <input type="text" name="Ejecutivo" id="Ejecutivo"
									class="form-control" required>
							</div>
							<div class="form-group">
								<label>Fecha Creacion</label> <input type="text" name="Fecha" id="Fecha"
									class="form-control" required>
							</div>														
						</div>
						<div class="modal-footer">
						
						<button type="button" class="modal-outline" id="login">Guardar</button>
							<input type="button" class="btn btn-default" data-dismiss="modal" value="Cancelar"> 
							<input type="submit" class="btn btn-success" id="GuardarNuevo" value="Guardar datos">


						</div>
					</form>
				</div>
			</div>
		</div>

		<div id="deleteProductModal" class="modal fade">
			<div class="modal-dialog">
				<div class="modal-content">
					<form name="delete_product" id="delete_product">
						<div class="modal-header">
							<h4 class="modal-title">Eliminar Producto</h4>
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
						</div>
						<div class="modal-body">
							<p>¿Seguro que quieres eliminar este registro?</p>
							<p class="text-warning">
								<small>Esta acción no se puede deshacer.</small>
							</p>
							<input type="hidden" name="delete_id" id="delete_id">
						</div>
						<div class="modal-footer">
							<input type="button" class="btn btn-default" data-dismiss="modal"
								value="Cancelar"> <input type="submit"
								class="btn btn-danger" value="Eliminar">
						</div>
					</form>
				</div>
			</div>
		</div>

		<div id="editProductModal" class="modal fade">
			<div class="modal-dialog">
				<div class="modal-content">
					<form name="edit_product" id="edit_product">
						<div class="modal-header">
							<h4 class="modal-title">Editar Producto</h4>
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
						</div>
						<div class="modal-body">
							<div class="form-group">
								<label>Código</label> <input type="text" name="edit_code"
									id="edit_code" class="form-control" required> <input
									type="hidden" name="edit_id" id="edit_id">
							</div>
							<div class="form-group">
								<label>Producto</label> <input type="text" name="edit_name"
									id="edit_name" class="form-control" required>
							</div>
							<div class="form-group">
								<label>Categoría</label> <input type="text" name="edit_category"
									id="edit_category" class="form-control" required>
							</div>
							<div class="form-group">
								<label>Stock</label> <input type="number" name="edit_stock"
									id="edit_stock" class="form-control" required>
							</div>
							<div class="form-group">
								<label>Precio</label> <input type="text" name="edit_price"
									id="edit_price" class="form-control" required>
							</div>
						</div>
						<div class="modal-footer">
							<input type="button" class="btn btn-default" data-dismiss="modal"
								value="Cancelar"> <input type="submit"
								class="btn btn-info" value="Guardar datos">
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>