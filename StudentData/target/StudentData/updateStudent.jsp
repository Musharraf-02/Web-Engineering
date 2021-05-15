<%@ page import="javax.print.attribute.standard.OrientationRequested" %>
<%@ page import="java.sql.SQLSyntaxErrorException" %><%--
  Created by IntelliJ IDEA.
  User: ded
  Date: 10/01/2021
  Time: 2:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update Student</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <style>
        body {
            font-family: 'Lato', sans-serif;
            background-image: url('Resources/Images/background.png');
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-size: cover;
            color: white;
        }
        .col-5 {
            background-image: url('Resources/Images/foreground.png');
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-size: cover;
            border-radius: 10px;
            box-shadow: 0px 0px 20px 0px #68BDE6;
        }
    </style>
</head>
<body>
<%
    String id = request.getParameter("id");
    String name = request.getParameter("name");
    String rollNo = request.getParameter("rollNo");
    session.setAttribute("id", id);
%>
<div class="container">
    <br><br><br>
    <div class="row">
        <div class="col-5" style="margin: auto;">
            <div style="padding-top: 50px;padding-bottom: 150px">
                <h2 style="text-align: center;border: 1px solid transparent;border-radius: 5px;background:rgba(255,255,255,0.3);padding:20px">
                    UPDATE STUDENT</h2>
                <br><br>
                <form class="form-group">
                    <label>Name: </label>
                    <input id="name" type="text" name="name" value="<%=name%>" required
                           class="form-control">
                    <br>
                    <label>Roll No: </label>
                    <input id="rollNo" type="text" name="rollNo" value="<%=rollNo%>" required
                           class="form-control">
                    <br>
                    <label>Degree: </label>
                    <div class="form-check-inline">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="degree" value="SE" checked>SE
                        </label>
                    </div>
                    <div class="form-check-inline">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="degree" value="CS">CS
                        </label>
                    </div>
                    <div class="form-check-inline">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="degree" value="IT">IT
                        </label>
                    </div>
                </form>
                <br><br><br>
                <div style="text-align: center">
                    <button class="btn btn-light" id="update">Update Student</button>
                </div>
                <br>
                <div id="warning"></div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $("#update").click(function (event) {
        document.getElementById("warning").innerHTML = "";
        let name = document.getElementById("name").value;
        let rollNo = document.getElementById("rollNo").value;
        let degree = $('input[name=degree]:checked').val();
        fetch("updateStudentServlet?name=" + name + "&rollNo=" + rollNo + "&degree=" + degree, {method: 'post'}).then(response => {
            return response.text()
        }).then(data => {
            data = parseInt(data);
            if (data == 0) {
                window.location.href = "index.jsp"
            } else if (data == 1) {
                document.getElementById("warning").innerHTML = `<p style="text-align: center;">A student already exists with this roll no.</p>`
            }
        })
    });

</script>
</body>
</html>
