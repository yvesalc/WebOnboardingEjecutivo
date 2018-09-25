<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
    <title>prueba</title>
    <!--Got most includes from https://www.datatables.net/download/ -->
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.5/css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.8/css/dataTables.bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/autofill/2.0.0/css/autoFill.bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/keytable/2.0.0/css/keyTable.bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/1.0.7/css/responsive.bootstrap.css" />

    <link href="//cdnjs.cloudflare.com/ajax/libs/x-editable/1.5.0/bootstrap3-editable/css/bootstrap-editable.css" rel="stylesheet"
        type="text/css" />
    <link rel="stylesheet" href="css/TableOfertas.css" />
</head>

<body>
    <h1>Datatable AutoFill and Editable</h1>
    <p>Highlight changed fields.</p>

    <table class="table">
        <thead>
            <tr>
                <th>ID</th>
                <th>Age (AutoFill)</th>
                <th>Qty (AutoFill and Editable)</th>
                <th>Cost (Editable)</th>
            </tr>
        </thead>
        <tr>
            <td>1</td>
            <td data-original-value="11">11</td>
            <td data-original-value="1"><a href="#" data-type="text" data-pk="1" class="editable" data-url=""
                    data-title="Edit Quantity">1</a></td>
            <td data-original-value="1.99"><a href="#" data-type="text" data-pk="1" class="editable" data-url=""
                    data-title="Edit Quantity">1.99</a></td>
        </tr>
        <tr>
            <td>2</td>
            <td data-original-value="22">22</td>
            <td data-original-value="2"><a href="#" data-type="text" data-pk="2" class="editable" data-url=""
                    data-title="Edit Quantity">2</a></td>
            <td data-original-value="2.99"><a href="#" data-type="text" data-pk="1" class="editable" data-url=""
                    data-title="Edit Quantity">2.99</a></td>
        </tr>
        <tr>
            <td>3</td>
            <td data-original-value="33">33</td>
            <td data-original-value="3"><a href="#" data-type="text" data-pk="3" class="editable" data-url=""
                    data-title="Edit Quantity">3</a></td>
            <td data-original-value="3.99"><a href="#" data-type="text" data-pk="1" class="editable" data-url=""
                    data-title="Edit Quantity">3.99</a></td>
        </tr>
    </table>

    <!--Got most includes from https://www.datatables.net/download/ -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.4.js">

    </script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.5/js/bootstrap.js">

    </script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.8/js/jquery.dataTables.js">

    </script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.8/js/dataTables.bootstrap.js">

    </script>
    <script type="text/javascript" src="https://cdn.datatables.net/autofill/2.0.0/js/dataTables.autoFill.js">

    </script>
    <script type="text/javascript" src="https://cdn.datatables.net/autofill/2.0.0/js/autoFill.bootstrap.js">

    </script>
    <script type="text/javascript" src="https://cdn.datatables.net/keytable/2.0.0/js/dataTables.keyTable.js">

    </script>
    <script type="text/javascript" src="https://cdn.datatables.net/responsive/1.0.7/js/dataTables.responsive.js">

    </script>

    <script src="//cdnjs.cloudflare.com/ajax/libs/x-editable/1.5.0/bootstrap3-editable/js/bootstrap-editable.min.js">

    </script>
    <script src="js/tableofertas.js">

    </script>

</body>


</html>