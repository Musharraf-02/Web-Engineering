<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: ded
  Date: 25/12/2020
  Time: 9:35 PM
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
<% if (session.getAttribute("uid") == null) {
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
            request.getRequestDispatcher("/updateEntry.jsp").forward(request, response);
        }
        rs.previous();
        while (rs.next()) {
            String description = rs.getString("description");
            String titles = rs.getString("title");
            int cid = rs.getInt("id");
            if (description.equals("")) {
                description = "No description exists for this title.";
            }
%>
<div class="container">
    <div class="row">
        <div class="col-md-4" style="margin: auto">
            <div style="border: 1px solid transparent;padding: 25px;border-radius: 25px;background-color:#e5e5e5;">
                <h1 style="text-align: center;color: #1e7e34">Update Entry</h1>
                <form action="updateEntryProcessing1.jsp" method="get" class="form-group">
                    <label>Enter title for update: </label>
                    <input type="text" name="title" required placeholder="<%=titles%>" class="form-control">
                    <label>Enter description for update: </label>
                    <input type="text" name="description" placeholder="<%=description%>" class="form-control">
                    <%session.setAttribute("oTitle", title);%>
                    <br>
                    <div style="text-align: center;">
                        <button class="btn btn-success">Update</button>
                    </div>
                </form>
            </div>
            <%if (request.getAttribute("duplication") != null) {%>
            <p style="color: red"><%=request.getAttribute("duplication")%>
            </p>
        </div>
    </div>
</div>
<%}%>
<%

        }
    } catch
    (Exception e) {
        System.out.println(e.getMessage());
    }
%>

</body>
</html>
