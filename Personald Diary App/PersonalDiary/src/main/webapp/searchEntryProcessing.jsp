<%@ page import="java.util.Date" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.DateFormat" %><%--
  Created by IntelliJ IDEA.
  User: ded
  Date: 26/12/2020
  Time: 11:58 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <title>Search Entry</title>
</head>
<body>
<%
    if( session.getAttribute("uid")==null){
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }
    String uid = (String) session.getAttribute("uid");
    int id = Integer.parseInt(uid);
    String sd = request.getParameter("sd");
    String ed = request.getParameter("ed");

    Date sDate = new SimpleDateFormat("yyyy-MM-dd").parse(sd);
    Date eDate = new SimpleDateFormat("yyyy-MM-dd").parse(ed);
    java.sql.Date SDate = new java.sql.Date(sDate.getTime());
    java.sql.Date EDate = new java.sql.Date(eDate.getTime());
    try {
        Class.forName("com.mysql.jdbc.Driver");
        final String DB_URL = "jdbc:mysql://localhost:3306/personal_diary?";
        final String DB_USER = "root";
        final String DB_PASSWORD = "root";
        Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
        String query = "select * from `diary` where date>=? and date <=? and user_id=?";
        PreparedStatement stmt = conn.prepareStatement(query);
        stmt.setDate(1, SDate);
        stmt.setDate(2, EDate);
        stmt.setInt(3, id);
        ResultSet rs = stmt.executeQuery();
        if (!rs.next()) {
            request.setAttribute("noRecords", "No records exists between the provided starting and ending date.");
            request.getRequestDispatcher("/searchEntry.jsp").forward(request, response);
        }
        rs.previous();%>
<div class="container">
    <div class="row" style="margin: auto">
        <div class="col-12">
            <div style="border: 1px solid transparent;padding: 25px;border-radius: 25px;background-color:#e5e5e5;margin-bottom: 25px">
                <h1 style="text-align: center;color: #1e7e34">Entries Matching Date Criteria</h1>
            </div>
            <table class="table table-striped">
                <tr>
                    <th>Title</th>
                    <th>Description
                    </th>
                    <th>Date
                    </th>
                </tr>
                <%
                    while (rs.next()) {
                        String description = rs.getString("description");
                        String title = rs.getString("title");
                        java.util.Date date = new java.util.Date(rs.getDate("date").getTime());
                        if (description.equals("")) {
                            description = "No description exists for this title.";
                        }
                %>
                <tr>
                    <td><%=title%>
                    </td>
                    <td><%=description%>
                    </td>
                    <td><%=date%>
                    </td>
                </tr>

                <%

                    }%>
            </table>
            <div style="text-align: center">
                <form method="get" action="personalDiary.jsp">
                    <%
                        session.setAttribute("uid",uid);
                    %>
                    <button class="btn btn-success">Home</button>
                </form>
            </div>
        </div>
    </div>
</div>
<%
    } catch
    (Exception e) {
        System.out.println(e.getMessage());
    }
%>
</body>
</html>
