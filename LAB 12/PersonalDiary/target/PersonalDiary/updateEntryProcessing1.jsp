<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: ded
  Date: 25/12/2020
  Time: 9:48 PM
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
    if (session.getAttribute("uid") == null) {
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }
    String title = request.getParameter("title");
    String description = request.getParameter("description");
    if (description == null) {
        description = "";
    }
    String oTitle = (String) session.getAttribute("oTitle");
    String uid1 = (String) session.getAttribute("uid");
    int uid = Integer.parseInt(uid1);
    try {
        Class.forName("com.mysql.jdbc.Driver");
        final String DB_URL = "jdbc:mysql://localhost:3306/personal_diary?";
        final String DB_USER = "root";
        final String DB_PASSWORD = "root";
        Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

        int cid = -1;
        String q = "select id from `diary` where title=? and user_id=?";
        PreparedStatement stmt3 = conn.prepareStatement(q);
        stmt3.setString(1, oTitle);
        stmt3.setInt(2, uid);
        ResultSet rs3 = stmt3.executeQuery();
        while (rs3.next()) {
            cid = rs3.getInt("id");
        }


        String query1 = "Select title from `diary` where user_id=?";
        PreparedStatement stmt2 = conn.prepareStatement(query1);
        stmt2.setInt(1, uid);
        ResultSet rs = stmt2.executeQuery();
        boolean flag = true;
        int count = 0;
        while (rs.next()) {
            String t = rs.getString("title");
            if (t.equalsIgnoreCase(title)) {
                flag = false;
                count++;
                if (count > 2) {
                    request.setAttribute("duplication", "Title already exists.");
                    request.getRequestDispatcher("/updateEntryProcessing.jsp").forward(request, response);
                }
            }
        }
        if (flag && title.equalsIgnoreCase(oTitle)) {
            String query = "update `diary` set description=?,date=CURRENT_DATE ,user_id=? where id=?";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setString(1, description);
            stmt.setInt(2, uid);
            stmt.setInt(3, cid);
            int result = stmt.executeUpdate();
        } else {
            String query = "update `diary` set title=?,description=?,date=CURRENT_DATE ,user_id=? where id=?";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setString(1, title);
            stmt.setString(2, description);
            stmt.setInt(3, uid);
            stmt.setInt(4, cid);
            int result = stmt.executeUpdate();
            request.setAttribute("update", "Entry Updated Successfully.");
            request.getRequestDispatcher("/updateEntry.jsp").forward(request, response);
        }


%>
<% } catch (Exception e) {
    System.out.println(e.getMessage());
}
%>
</body>
</html>
