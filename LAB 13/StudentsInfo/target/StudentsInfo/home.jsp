<%--
  Created by IntelliJ IDEA.
  User: ded
  Date: 14/01/2021
  Time: 10:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Home</title>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
    <div class="row">
        <div id="select" class="col-md-8 col-12" style="margin: auto;">
            <select name="class" id="classes" class="form-group">
                <option value="selectClass">Select Class</option>

            </select>

            <table id="stdTable" class="table">
            </table>
        </div>
    </div>
</div>
<script>
    window.onload = async () => {
        const response = await fetch("http://localhost:8080/StudentsInfo_war/classes");
        const res = await response.json();
        res.data.forEach((data) => {
            document.getElementById("classes").innerHTML += `<option value=${data.id}>${data.name}</option>`;
        })
    }
</script>
<script type="text/javascript">
    $(document).ready(function () {
        $('#classes').change(function () {
            let classId = $('#classes').val();
            if (classId != "selectClass") {
                document.getElementById("stdTable").innerHTML = "";

                async function displayTable(classId) {
                    const response = await fetch("http://localhost:8080/StudentsInfo_war/students?cid=" + classId)
                    const res = await response.json();
                    if (res.data.length) {
                        document.getElementById("stdTable").innerHTML = `<thead class="thead-dark"><tr><th>NAME</th><th>FNAME</th></tr></thead>`;
                        res.data.forEach((data) => {
                            let f_name = data.fname;
                            if (f_name == undefined) {
                                f_name = "";
                            }
                            document.getElementById("stdTable").innerHTML += `<tr><td>${data.name}</td><td>${f_name}</td></tr>`;
                        })
                    } else {
                        document.getElementById("stdTable").innerHTML = "<p style='color: red;text-align: center'>No students in this class.</p>"
                    }
                }

                displayTable(classId);
            }
        })
    })
</script>
</body>
</html>
