<%--
  Created by IntelliJ IDEA.
  User: ded
  Date: 25/12/2020
  Time: 9:31 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update Entry</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</head>
<body>
<%
    if( session.getAttribute("uid")==null){
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }
%>
<div class="container">
    <div class="row">
        <div class="col-md-4" style="margin: auto">
            <div style="border: 1px solid transparent;padding: 25px;border-radius: 25px;background-color:#e5e5e5;">
                <h1 style="text-align: center;color: #1e7e34">Update Entry</h1>
                <form action="updateEntryProcessing.jsp" method="get" class="form-group">
                    <label>Enter the title to update the record: </label>
                    <input type="text" name="title" required class="form-control">
                    <br>
                    <div style="text-align: center">
                        <button class="btn btn-success">Submit</button>
                    </div>
                </form>
                <%
                    if (request.getAttribute("noTitle") != null) {%>
                <p style="color: red;text-align: center"><%=request.getAttribute("noTitle")%>
                </p>
                <%}if(request.getAttribute("update") != null) {%>
                <p style="color: green;text-align: center"><%=request.getAttribute("update")%>
                </p>
                <%}%>
            </div>
        </div>
    </div>
</div>

</body>
</html>
