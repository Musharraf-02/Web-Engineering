<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: ded
  Date: 25/12/2020
  Time: 5:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Description</title>
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
    String des = request.getParameter("des");
    String uid = (String) session.getAttribute("uid");
    int id = Integer.parseInt(uid);
    try {
        Class.forName("com.mysql.jdbc.Driver");
        final String DB_URL = "jdbc:mysql://localhost:3306/personal_diary?";
        final String DB_USER = "root";
        final String DB_PASSWORD = "root";
        Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
        String query = "select * from `diary`where title=? and user_id=?";
        PreparedStatement stmt = conn.prepareStatement(query);
        stmt.setString(1, des);
        stmt.setInt(2, id);
        ResultSet rs = stmt.executeQuery();
        if (!rs.next()) {
            request.setAttribute("noTitle", "No such title exists.");
            request.getRequestDispatcher("/openDiary.jsp").forward(request, response);
        }
        rs.previous();
        while (rs.next()) {
            String description = rs.getString("description");
            String title = rs.getString("title");
            if (description.equals("")) {
                description = "No description exists for this title.";
            }
%>
<div class="container">
    <div class="row">
        <div class="col-md-8" style="margin: auto">
            <div style="border: 1px solid transparent;padding: 25px;border-radius: 25px;background-color:#e5e5e5;margin-bottom: 25px">
                <h1 style="text-align: center;color: #1e7e34">Title and Description</h1>
            </div>
            <table class="table table-striped">
                <tr>
                    <th>Title</th>
                    <th>Description
                    </th>
                </tr>
                <tr>
                    <td><%=title%>
                    </td>
                    <td><%=description%>
                    </td>
                </tr>
            </table>

        </div>
    </div>
</div>
</div>
<%

        }
    } catch
    (Exception e) {
        System.out.println(e.getMessage());
    }
%>
</body>
</html>
