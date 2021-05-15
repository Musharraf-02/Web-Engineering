<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: ded
  Date: 25/12/2020
  Time: 3:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Personal Diary</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</head>
<body>
<%
    if ((request.getParameter("name") == null || request.getParameter("password") == null)) {
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }
    String name = request.getParameter("name");
    String password = request.getParameter("password");
    try {
        Class.forName("com.mysql.jdbc.Driver");
        final String DB_URL = "jdbc:mysql://localhost:3306/personal_diary?";
        final String DB_USER = "root";
        final String DB_PASSWORD = "root";
        Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
        String query = "select * from `users`";
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(query);
        boolean user = false;
        while (rs.next()) {
            int id = rs.getInt("id");
            String name1 = rs.getString("username");
            String password1 = rs.getString("password");
            if (name.equalsIgnoreCase(name1) && password.equals(password1)) {
                user = true;%>
<div class="container">
    <div class="row">
        <div class="col-md-8" style="margin: auto">
            <div style="border: 1px solid transparent;padding: 25px;border-radius: 25px;background-color: #e5e5e5">
                <h1 style="text-align: center;color:#1e7e34">Hi! <%=name%>
                </h1>
                <h1 style="text-align: center;color:#1e7e34">Welcome to Personal Diary</h1>
            </div>
            <div style="border-radius: 25px;border: 1px solid transparent;background-color:#e5e5e5;padding: 25px;margin-top: 25px">
                <table>
                    <tr>
                        <td>
                            <form action="openDiary.jsp" method="get">
                                <%
                                    String uid = Integer.toString(id);
                                    session.setAttribute("uid", uid);
                                %>
                                <button class="btn btn-primary">Open Diary</button>
                            </form>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <form action="addEntry.jsp" method="get">
                                <%
                                    uid = Integer.toString(id);
                                    session.setAttribute("uid", uid);
                                %>
                                <button class="btn btn-success">Add an Entry</button>
                            </form>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <form action="deleteEntry.jsp" method="get">
                                <%
                                    uid = Integer.toString(id);
                                    session.setAttribute("uid", uid);
                                %>
                                <button class="btn btn-danger">Delete an Entry</button>
                            </form>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <form action="updateEntry.jsp" method="get">
                                <%
                                    uid = Integer.toString(id);
                                    session.setAttribute("uid", uid);
                                %>
                                <button class="btn btn-warning">Update an Entry</button>
                            </form>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <form action="searchEntry.jsp" method="get">
                                <%
                                    uid = Integer.toString(id);
                                    session.setAttribute("uid", uid);
                                %>
                                <button class="btn btn-info">Search an Entry</button>
                            </form>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <form action="index.jsp" method="get">
                                <%
                                    uid = Integer.toString(id);
                                    session.setAttribute("uid", uid);
                                %>
                                <button class="btn btn-secondary">Logout</button>
                            </form>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</div>
<% }
}
    if (user == false) {
        request.setAttribute("name",name);
        request.setAttribute("password",password);
        request.setAttribute("noUser", "Invalid username or password.");
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }
} catch
(Exception e) {
    System.out.println(e.getMessage());
}
%>


</body>
</html>
