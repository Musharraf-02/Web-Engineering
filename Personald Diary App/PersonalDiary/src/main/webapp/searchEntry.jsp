<%--
  Created by IntelliJ IDEA.
  User: ded
  Date: 26/12/2020
  Time: 11:53 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Search Entry</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

</head>
<body>
<%
    if (session.getAttribute("uid") == null) {
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }

%>
<div class="container">
    <div class="row">
        <div class="col-md-4" style="margin: auto">
            <div style="border: 1px solid transparent;padding: 25px;border-radius: 25px;background-color:#e5e5e5;">
                <h1 style="text-align: center;color: #1e7e34">Search Entry</h1>
                <form action="searchEntryProcessing.jsp" method="get" class="form-group">
                    <label>Starting Date: </label>
                    <input type="date" name="sd" required class="form-control">
                    <label>Ending Date: </label>
                    <input type="date" name="ed" required class="form-control">
                    <br>
                    <div style="text-align: center">
                        <button class="btn btn-primary">Search</button>
                    </div>
                </form>
                <%
                    if (request.getAttribute("noRecords") != null) {%>
                <p style="color: red;text-align: center;
"><%=request.getAttribute("noRecords")%>
                </p></div>
        </div>
    </div>
</div>
<% }
%>
</body>
</html>
