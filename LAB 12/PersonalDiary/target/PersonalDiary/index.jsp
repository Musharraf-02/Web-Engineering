<html>
<title>Login</title>
<title></title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<body>
<%
    String name="",password="";
    if (request.getParameter("name") != null) {
          name=request.getParameter("name");
    }
    if (request.getParameter("password") != null) {
        password = request.getParameter("password");
    }%>
<div class="container">
    <div class="row">
        <div style="margin:auto;" class="col-md-4">
            <div style="border: 1px solid transparent;padding: 25px;border-radius: 25px;background-color:#e5e5e5;">
                <h1 style="text-align: center;color: #1e7e34">Login</h1>
                <form method="post" action="personalDiary.jsp" class="form-group">
                    <label>Name: </label>
                    <input type="text" name="name" required class="form-control" value="<%=name%>">
                    <label>Password: </label>
                    <input type="password" name="password" required class="form-control">
                    <br>
                    <div style="text-align: center">
                        <button type="submit" class="btn btn-success">Login</button>
                    </div>
                </form>
                <%
                    if (request.getAttribute("noUser") != null) {%>
                <p style=" color: red;text-align: center"><%=request.getAttribute("noUser")%>
                    </p>

                        <%
                    }
                %>
            </div>
        </div>
    </div>
</div>
</body>
</html>
