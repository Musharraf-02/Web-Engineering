<%@ page import="javax.management.StandardMBean" %>
<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: ded
  Date: 25/12/2020
  Time: 4:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Open Diary</title>
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
    String id = (String) session.getAttribute("uid");
    int uid = Integer.parseInt(id);
    try {
        Class.forName("com.mysql.jdbc.Driver");
        final String DB_URL = "jdbc:mysql://localhost:3306/personal_diary?";
        final String DB_USER = "root";
        final String DB_PASSWORD = "root";
        Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
        String query = "select * from `diary` where user_id=? order by title";
        PreparedStatement stmt = conn.prepareStatement(query);
        stmt.setInt(1, uid);
        ResultSet rs = stmt.executeQuery();
%>
<div class="container">
    <div class="row">
        <div class="col-md-4" style="margin: auto">
            <div style="border: 1px solid transparent;padding: 25px;border-radius: 25px;background-color:#e5e5e5;margin-bottom: 25px">
                <h1 style="text-align: center;color: #1e7e34">Open Diary</h1>
            </div>
            <table class="table table-striped">
                <tr>
                    <th>Titles</th>
                </tr>
                <%
                    while (rs.next()) {
                        String title = rs.getString("title");
                %>
                <tr>
                    <td><%=title%>
                    </td>
                </tr>

                <% }
                %>
            </table>

            <form method="get" action="displayDescription.jsp" class="form-group">

                <label style="color: #1e7e34">Enter title name to display corresponding description: </label>
                <input type="text" name="des" class="form-control">
                <br>
                <div style="text-align: center">
                    <button class="btn btn-success" type="submit">Submit</button>
                </div>

            </form>
            <%
                if (request.getAttribute("noTitle") != null) {%>
            <p style="color: red;text-align: center"><%=request.getAttribute("noTitle")%>
            </p>

        </div>
    </div>
</div>
<%}%>
<%
    } catch
    (Exception e) {
        System.out.println(e.getMessage());
    }
%>

</body>
</html>
