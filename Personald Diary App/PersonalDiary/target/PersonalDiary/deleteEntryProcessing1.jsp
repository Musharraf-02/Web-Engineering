<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %><%--
  Created by IntelliJ IDEA.
  User: ded
  Date: 25/12/2020
  Time: 9:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete Entry</title>
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
    String id1 = (String) session.getAttribute("uid");
    int id = Integer.parseInt(id1);
    String title = (String) session.getAttribute("title");
    try {
        Class.forName("com.mysql.jdbc.Driver");
        final String DB_URL = "jdbc:mysql://localhost:3306/personal_diary?";
        final String DB_USER = "root";
        final String DB_PASSWORD = "root";
        Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
        String query = "Delete from `diary` where title=? and user_id =?";
        PreparedStatement stmt = conn.prepareStatement(query);
        stmt.setString(1, title);
        stmt.setInt(2, id);
        int result = stmt.executeUpdate();
        request.setAttribute("delete", "Entry Deleted Successfully.");
        request.getRequestDispatcher("/deleteEntry.jsp").forward(request, response);
%>
<% } catch (Exception e) {
    System.out.println(e.getMessage());
}
%>
</body>
</html>
