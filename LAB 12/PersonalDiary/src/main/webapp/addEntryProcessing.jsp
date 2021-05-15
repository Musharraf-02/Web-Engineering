<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: ded
  Date: 25/12/2020
  Time: 7:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Entry</title>
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
    String title = request.getParameter("titleEntry");
    String description = request.getParameter("titleDescription");
    String id1 = (String) session.getAttribute("uid");
    int id = Integer.parseInt(id1);
    try {
        Class.forName("com.mysql.jdbc.Driver");
        final String DB_URL = "jdbc:mysql://localhost:3306/personal_diary?";
        final String DB_USER = "root";
        final String DB_PASSWORD = "root";
        Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
        String query1 = "Select title from `diary` where user_id=?";
        PreparedStatement stmt2 = conn.prepareStatement(query1);
        stmt2.setInt(1, id);
        ResultSet rs = stmt2.executeQuery();
        boolean flag = true;
        while (rs.next()) {
            String t = rs.getString("title");
            if (t.equalsIgnoreCase(title)) {
                flag = false;
                request.setAttribute("duplication", "Title already exists.");
                request.getRequestDispatcher("/addEntry.jsp").forward(request, response);
            }
        }
        if (flag) {
            String query = "Insert into `diary`(title,description,date,user_id) Values(?,?,CURRENT_DATE ,?)";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setString(1, title);
            stmt.setString(2, description);
            stmt.setInt(3, id);
            int result = stmt.executeUpdate();
            request.setAttribute("add", "Entry Added Successfully.");
            request.getRequestDispatcher("/addEntry.jsp").forward(request, response);
        }

%>
<% } catch (Exception e) {
    System.out.println(e.getMessage());
}
%>

</body>
</html>
