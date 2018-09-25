<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="ISO-8859-1">
    <title>Insert title here</title>


    <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet">
    <script src="http://code.jquery.com/jquery-2.0.3.min.js"></script>
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>

    <link href="//cdnjs.cloudflare.com/ajax/libs/x-editable/1.5.0/bootstrap3-editable/css/bootstrap-editable.css" rel="stylesheet" />
    <script src="//cdnjs.cloudflare.com/ajax/libs/x-editable/1.5.0/bootstrap3-editable/js/bootstrap-editable.min.js"></script>


    <script type="text/javascript">
        $(document).ready(function () {
            //toggle `popup` / `inline` mode
            $.fn.editable.defaults.mode = 'inline';

            //make username editable
            $('#username').editable();

            //make status editable
            $('#status').editable({
                type: 'select',
                title: 'Select status',
                placement: 'right',
                value: 2,
                source: [{
                        value: 1,
                        text: 'status 1'
                    },
                    {
                        value: 2,
                        text: 'status 2'
                    },
                    {
                        value: 3,
                        text: 'status 3'
                    }
                ]
                /*
                //uncomment these lines to send data on server
                ,pk: 1
                ,url: '/post'
                */
            });
        });
    </script>

</head>

<body>

    <div class="container">

        <h1>X-editable starter template</h1>

        <div>
            <span>Username:</span>
            <a href="#" id="username" data-type="text" data-placement="right" data-title="Enter username">superuser</a>
        </div>

        <div>
            <span>Status:</span>
            <a href="#" id="status"></a>
        </div>


    </div>

</body>

</html>