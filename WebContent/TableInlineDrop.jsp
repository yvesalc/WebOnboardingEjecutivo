<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="ISO-8859-1">
    <title>Insert title here</title>
</head>

<body>
    <h2>Fee Code Maintenance</h2>
    <div id="wrapper">
        <table align='center' cellspacing=2 cellpadding=5 id="data_table" border=1>
            <tr>
                <th>Fee Code</th>
                <th>Fee Name</th>
                <th>Fee Type</th>
                <th>Due Date</th>

            </tr>

            <tr id="row1">
                <td id="ffcode_row1">AF</td>
                <td id="ffname_row1">Annual Fees</td>
                <td id="fftype_row1">Fixed Fee</td>
                <td id="ffdate_row1">2016-12-21</td>
                <td>
                    <input type="button" id="edit_button1" value="Edit" class="edit" onclick="edit_row('1')">
                    <input type="button" id="save_button1" value="Save" class="save" onclick="save_row('1')">
                    <input type="button" value="Delete" class="delete" onclick="delete_row('1')">
                </td>
            </tr>

            <tr id="row2">
                <td id="ffcode_row2">MF</td>
                <td id="ffname_row2">Medical Fees</td>
                <td id="fftype_row2">Fixed Fee</td>
                <td id="ffdate_row2">2016-12-11</td>
                <td>
                    <input type="button" id="edit_button2" value="Edit" class="edit" onclick="edit_row('2')">
                    <input type="button" id="save_button2" value="Save" class="save" onclick="save_row('2')">
                    <input type="button" value="Delete" class="delete" onclick="delete_row('2')">
                </td>
            </tr>

            <tr id="row3">
                <td id="ffcode_row3">TF</td>
                <td id="ffname_row3">Tution Fees</td>
                <td id="fftype_row3">Fixed Fee</td>
                <td id="ffdate_row3">2016-11-11</td>
                <td>
                    <input type="button" id="edit_button3" value="Edit" class="edit" onclick="edit_row('3')">
                    <input type="button" id="save_button3" value="Save" class="save" onclick="save_row('3')">
                    <input type="button" value="Delete" class="delete" onclick="delete_row('3')">
                </td>
            </tr>

            <tr>
                <td><input type="text" id="new_ffcode"></td>
                <td><input type="text" id="new_ffname"></td>
                <td>
                    <select name="fftype" id="new_fftype">
                        <option value="">-select-</option>
                        <option value="FF">Fixed Fee</option>
                        <option value="RF">Refundable Fee</option>
                        <option value="PF">Penalty Fee</option>
                        <option value="DF">Discounts</option>
                    </select>
                </td>
                <td><input type="date" id="new_ffdate"></td>
                <td><input type="button" class="add" onclick="add_row();" value="Add Row"></td>
            </tr>

        </table>
    </div>
    <script>
        function edit_row(no) {
            document.getElementById("edit_button" + no).style.display = "none";
            document.getElementById("save_button" + no).style.display = "block";

            var ffcode = document.getElementById("ffcode_row" + no);
            var ffname = document.getElementById("ffname_row" + no);
            var fftype = document.getElementById("fftype_row" + no);
            var ffdate = document.getElementById("ffdate_row" + no);

            var ffcode_data = ffcode.innerHTML;
            var ffname_data = ffname.innerHTML;
            var fftype_data = fftype.innerHTML;
            var ffdate_data = ffdate.innerHTML;

            ffcode.innerHTML = "<input type='text' id='ffcode_text" + no + "' value='" + ffcode_data + "'>";
            ffname.innerHTML = "<input type='text' id='ffname_text" + no + "' value='" + ffname_data + "'>";
            fftype.innerHTML = "<select id='fftype_text" + no + "' value='" + fftype_data +
                "'><option value>-select-</option><option value='FF'>Fixed Fee</option><option value='RF'>Refundable Fee</option><option value='PF'>Penalty Fee</option><option value='DF'>Discounts</option></select>";
            ffdate.innerHTML = "<input type='date' id='ffdate_text" + no + "' value='" + ffdate_data + "'>";
        }

        function save_row(no) {
            var ffcode_val = document.getElementById("ffcode_text" + no).value;
            var ffname_val = document.getElementById("ffname_text" + no).value;
            var e = document.getElementById("fftype_text" + no);
            var fftype_val = e.options[e.selectedIndex].text;
            var ffdate_val = document.getElementById("ffdate_text" + no).value;

            document.getElementById("ffcode_row" + no).innerHTML = ffcode_val;
            document.getElementById("ffname_row" + no).innerHTML = ffname_val;
            document.getElementById("fftype_row" + no).innerHTML = fftype_val;
            document.getElementById("ffdate_row" + no).innerHTML = ffdate_val;

            document.getElementById("edit_button" + no).style.display = "block";
            document.getElementById("save_button" + no).style.display = "none";
        }

        function delete_row(no) {
            document.getElementById("row" + no + "").outerHTML = "";
        }

        function add_row() {
            var new_ffcode = document.getElementById("new_ffcode").value;
            var new_ffname = document.getElementById("new_ffname").value;
            var new_fftype = document.getElementById("new_fftype").value;
            var new_ffdate = document.getElementById("new_ffdate").value;

            var table = document.getElementById("data_table");
            var table_len = (table.rows.length) - 1;
            var row = table.insertRow(table_len).outerHTML = "<tr id='row" + table_len + "'><td id='ffcode_row" +
                table_len + "'>" + new_ffcode + "</td><td id='ffname_row" + table_len + "'>" + new_ffname +
                "</td><td id='fftype_row" + table_len + "'>" + new_fftype + "</td><td id='ffdate_row" + table_len +
                "'>" + new_ffdate + "</td><td><input type='button' id='edit_button" + table_len +
                "' value='Edit' class='edit' onclick='edit_row(" + table_len +
                ")'> <input type='button' id='save_button" + table_len +
                "' value='Save' class='save' onclick='save_row(" + table_len +
                ")'> <input type='button' value='Delete' class='delete' onclick='delete_row(" + table_len +
                ")'></td></tr>";

            document.getElementById("new_ffcode").value = "";
            document.getElementById("new_ffname").value = "";
            document.getElementById("new_fftype").value = "";
            document.getElementById("new_ffdate").value = "";
        }
    </script>
</body>

</html>