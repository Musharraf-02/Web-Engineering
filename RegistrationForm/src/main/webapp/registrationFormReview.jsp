<%@ page import="javax.swing.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</head>
<body style="width:70%;margin: auto">

<%
    String name = request.getParameter("name");
    String password = request.getParameter("password");
    String email = request.getParameter("email");
    String degree = request.getParameter("degree");
    String section = request.getParameter("section");
    String subjects[] = request.getParameterValues("subjects");
%>
<div style="text-align: center;background-color:#ffa500;padding: 30px;border-radius: 25px;margin: 20px">
    <span style="font-size: 40px"><b>Hi <%=name%>!</b> Information Provided by You...</span><br>
</div>
<div style="background-color:palegreen;padding: 30px;border-radius: 25px;margin: 20px">
    <span>Name: <%=name%></span><br>
    <span>Email: <span style="color: dodgerblue;"><%=email%></span></span><br>
    <span>Degree: <%=degree%></span><br>
    <span>Section: <%=section%></span><br>

    <%if (subjects != null && subjects.length != 0) {%>
    <span>Subjects:</span><br>
    <ul>
        <% for (int i = 0; i < subjects.length; i++) {%>
        <li><%=subjects[i]%>
        </li>
        <%}%>
    </ul>
</div>
<%
    } else {
        request.setAttribute("errorMsg", "Invalid subject! Please Select at least one subject..!");
        request.getRequestDispatcher("/registrationForm.jsp").forward(request, response);
    }
%>
<br>
<div>


        <button class="btn btn-danger" onclick="window.history.back()">Go Back And Edit</button>
    <br><br>
    <form method="post" action="thankYou.jsp">
        <button class="btn btn-success">Approve and Continue</button>
    </form>
</div>


</body>
</html>
