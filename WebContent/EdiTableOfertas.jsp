<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<html lang="en">

<head>
    <title>EdiTableOfertas</title>
    <meta name="viewport" content="width=device-width">
    <meta http-equiv="cache-control" content="no-cache">
    <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
    <link href="http://netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.css" rel="stylesheet">
    <link href="http://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
    <style>
        body { font-size: 12px; }
    	.table thead { 
    		background-color: rgb(253, 199, 69);
    		background: -webkit-linear-gradient(top, rgb(253, 199, 69) 0%, rgb(228, 180, 63) 100%);
			background: -o-linear-gradient(top, rgb(253, 199, 69) 0%, rgb(228, 180, 63) 100%);
			background: -ms-linear-gradient(top, rgb(253, 199, 69) 0%, rgb(228, 180, 63) 100%);
			background: -moz-linear-gradient(top, rgb(253, 199, 69) 0%, rgb(228, 180, 63) 100%);
			background: linear-gradient(to bottom, rgb(253, 199, 69) 0%, rgb(228, 180, 63) 100%);
    	}
    	.table tbody td>span { display:block; padding-top: 1px; padding-bottom: 1px; padding-left: 1px;}
    	.table tbody td>span { margin: 3px 5px;}
    	.table-condensed>thead>tr>th { padding-left: 10px;} 

    	.input-sm, select.input-sm { height: 25px; padding: 3px 5px;}
    	select.input-sm { padding: 3px 1px;}
    	.blue-gradient {
    		background: -webkit-linear-gradient(top, rgb(102, 143, 213) 0%, rgb(63, 112, 194) 91%, rgb(45, 88, 162) 99%, rgb(35, 71, 129) 100%);
			background: -o-linear-gradient(top, rgb(102, 143, 213) 0%, rgb(63, 112, 194) 91%, rgb(45, 88, 162) 99%, rgb(35, 71, 129) 100%);
			background: -ms-linear-gradient(top, rgb(102, 143, 213) 0%, rgb(63, 112, 194) 91%, rgb(45, 88, 162) 99%, rgb(35, 71, 129) 100%);
			background: -moz-linear-gradient(top, rgb(102, 143, 213) 0%, rgb(63, 112, 194) 91%, rgb(45, 88, 162) 99%, rgb(35, 71, 129) 100%);
			background: linear-gradient(to bottom, rgb(102, 143, 213) 0%, rgb(63, 112, 194) 91%, rgb(45, 88, 162) 99%, rgb(35, 71, 129) 100%);
    	}
		.btn-info {
			background-color: #538ad1;
			border-color: rgb(35, 71, 129);
		}
		.btn-info:hover { background-color: rgb(35, 71, 129);}
    </style>
</head>

<body>
    <h1 style="margin:150px auto 50px auto" align="center">EdiTableOfertas</h1>
    <div class="container">
        <table id="data" class="table table-striped table-condensed">
        </table>
    </div>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script type="text/javascript" src="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/custom-fields.js"></script>
</body>

</html>