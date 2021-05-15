<%@ page import="jdk.jshell.spi.ExecutionControl" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</head>
<body style="margin: 20px">

<div class="container-fluid">
    <h1 style="color: purple;text-align: center">Registration Form</h1>
    <div class="row" style="width: 70%;margin: auto;background-color: blanchedalmond;padding: 30px;border-radius: 25px">
        <div class="col-12">

            <div class="form-group">
                <table>

                    <form method="post" action="registrationFormReview.jsp">

                        <tr>
                            <td><label>Name</label></td>
                            <td><input class="form-control" type="text" name="name" required ></td>

                        <tr>
                        <tr>
                            <td><label>Email</label></td>
                            <td><input class="form-control" type="email" name="email" required ></td>
                        </tr>
                        <tr>
                            <td><label>Password</label></td>
                            <td><input class="form-control" type="password" name="password" required ></td>

                        <tr>
                        <tr>
                            <td><label>Degree</label></td>
                            <td><select name="degree" class="form-control">
                                <option value="Computer Science">Computer Science</option>
                                <option value="Software Engineering">Software Engineering</option>
                                <option value="Information Technology">Information Technology
                                </option>
                            </select></td>
                        </tr>
                        <tr>
                            <td rowspan="2"><span>Section</span></td>
                            <td><input type="radio" name="section" value="Morning" checked>
                                <label>Morning</label></td>
                        </tr>
                        <tr>
                            <td><input type="radio" name="section" value="Afternoon">
                                <label>Afternoon</label></td>
                        <tr>
                        <tr>
                            <td><span>Subjects</span></td>
                            <td><input type="checkbox" name="subjects" id="Mathematics" value="Mathematics">
                                <label>Mathematics</label>
                                <input type="checkbox" name="subjects" value="Computer Vision" id="Computer Vision">
                                <label>Computer Vision</label>
                                <input type="checkbox" name="subjects" value="Artificial Intelligence"
                                       id="Artificial Intelligence">
                                <label> Artificial Intelligence</label>
                                <input type="checkbox" name="subjects" value="Web Engineering" id="Web Engineering">
                                <label>Web Engineering</label></td>
                        </tr>
                        <tr>
                            <td>
                                <br>
                                <button class="btn btn-primary" type="submit">Save and Preview</button>
                            </td>
                        </tr>
                        <%if (request.getAttribute("errorMsg") != null) {%>
                        <tr>
                            <td><span style="color: red;"><%=request.getAttribute("errorMsg")%></span></td>
                        </tr>
                        <%}%>

                    </form>
                </table>
            </div>
        </div>
    </div>

</div>
</body>
</html>