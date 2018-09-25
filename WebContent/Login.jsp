<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">


<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<style type="text/css">
.panel-heading {
    padding: 5px 15px;
}

.panel-footer {
	padding: 1px 15px;
	color: #A0A0A0;
}

.profile-img {
	width: 96px;
	height: 96px;
	margin: 0 auto 10px;
	display: block;
	-moz-border-radius: 50%;
	-webkit-border-radius: 50%;
	border-radius: 50%;
}

</style>

<script type="text/javascript">
	// function check(form) {
	// 	if (form.loginname.value == "administrador" && form.password.value == "admin") {
	// 		window.location.href = "ingreso-oferta-admin.jsp";
	// 	} else if (form.loginname.value == "ejecutivo" && form.password.value == "ejec") {
	// 		window.location.href = "ingreso-oferta-ejec.jsp";
	// 	} else {
	// 		window.alert("El usuario y/o contrase�a son incorrectos")
	// 	}
	// }

$(document).ready(function(){
    $("#btnIngresar").click(function(){
        var username = $("#loginname").val().trim();
        var password = $("#password").val().trim();

        if( username != "" && password != "" ){
            $.ajax({    
                url:'ControlerLogin',
                data:{username:username,password:password},
                success:function(response){

                var user = $.parseJSON(response);
                
                if (user.use_vigente == 1) {
					
					if (user.rol_id == 1) {
						window.location.replace('http://' + window.location.host + '/WebOnboardingEjecutivo/ingreso-oferta-ejec.jsp');
					}else {
                        window.location.replace('http://' + window.location.host + '/WebOnboardingEjecutivo/ingreso-oferta-admin.jsp');
					}					
					
				}else {
					alert("usuario ingresado NO es vigente");
				}
                

                    // var msg = "";
                    // if(response == 1){
                    //     window.location = "home.php";
                    // }else{
                    //     msg = "Invalid username and password!";
                    // }
                    // $("#message").html(msg);
                }
            });
        }
    });
});





</script>

<title>Aplicativo Ejecutivo</title>
</head>
<body>

    <div class="container" style="margin-top:40px">
		<div class="row">
			<div class="col-sm-6 col-md-4 col-md-offset-4">
				<div class="panel panel-default">
					<div class="panel-heading">
						<strong> Ingresar</strong>
					</div>
					<div class="panel-body">
						<form role="form" action="#" method="POST">
							<fieldset>
								<div class="row">
									<div class="center-block">
										<img class="profile-img"
											src="https://lh5.googleusercontent.com/-b0-k99FZlyE/AAAAAAAAAAI/AAAAAAAAAAA/eu7opA4byxI/photo.jpg?sz=120" alt="">
									</div>
								</div>
								<div class="row">
									<div class="col-sm-12 col-md-10  col-md-offset-1 ">
										<div class="form-group">
											<div class="input-group">
												<span class="input-group-addon">
													<i class="glyphicon glyphicon-user"></i>
												</span> 
												<input id="loginname" class="form-control" placeholder="Usuario" name="loginname" type="text" autofocus>
											</div>
										</div>
										<div class="form-group">
											<div class="input-group">
												<span class="input-group-addon">
													<i class="glyphicon glyphicon-lock"></i>
												</span>
												<input id="password" class="form-control" placeholder="pass" name="password" type="password" value="">
											</div>
										</div>
										<div class="form-group">
											<!-- <input type="button" class="btn btn-lg btn-primary btn-block" value="Ingresar" onclick="check(this.form);"> -->
											<input id="btnIngresar" type="button" class="btn btn-lg btn-primary btn-block" value="Ingresar">
										</div>
									</div>
								</div>
							</fieldset>
						</form>
					</div>
<!-- 					<div class="panel-footer "> -->
<!-- 						Don't have an account! <a href="#" onClick=""> Sign Up Here </a> -->
<!-- 					</div> -->
                </div>
			</div>
		</div>
	</div>






</body>
</html>
