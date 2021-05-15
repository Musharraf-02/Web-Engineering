<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: ded
  Date: 25/12/2020
  Time: 8:43 PM
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


    if (session.getAttribute("uid") == null) {
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }
    String title = request.getParameter("title");
    String id1 = (String) session.getAttribute("uid");
    int id = Integer.parseInt(id1);
    try {
        Class.forName("com.mysql.jdbc.Driver");
        final String DB_URL = "jdbc:mysql://localhost:3306/personal_diary?";
        final String DB_USER = "root";
        final String DB_PASSWORD = "root";
        Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
        String query = "select * from `diary`where title=? and user_id=?";
        PreparedStatement stmt = conn.prepareStatement(query);
        stmt.setString(1, title);
        stmt.setInt(2, id);
        ResultSet rs = stmt.executeQuery();
        if (!rs.next()) {
            request.setAttribute("noTitle", "No such title exists.");
            request.getRequestDispatcher("/deleteEntry.jsp").forward(request, response);
        }
        rs.previous();
        while (rs.next()) {
            String description = rs.getString("description");
            String titles = rs.getString("title");
            if (description.equals("")) {
                description = "No description exists for this title.";
            }
%>
<div>
    <div class="row">
        <div class="col-md-8" style="margin: auto">
            <div style="border: 1px solid transparent;padding: 25px;border-radius: 25px;background-color:#e5e5e5;margin-bottom: 25px">
                <h1 style="text-align: center;color: #1e7e34">Delete Entry</h1>
            </div>
            <table class="table table-striped">
                <tr>
                    <th>Title</th>
                    <th>Description
                    </th>
                </tr>
                <tr>
                    <td><%=titles%>
                    </td>
                    <td><%=description%>
                    </td>
                </tr>
            </table>
            <br>
            <div style="text-align: center">
                <h2 style="color: #1e7e34">Do you want to delete above record?</h2>
                <form action="deleteEntryProcessing1.jsp" method="get">
                    <%
                        session.setAttribute("uid", id1);
                        session.setAttribute("title", title);
                    %>
                    <button class="btn btn-success">Yes</button>
                </form>
            </div>
            <br>


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
