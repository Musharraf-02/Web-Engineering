import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;

public class LoginServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) {
        try {
            String name = request.getParameter("name");
            String password = request.getParameter("password");
            Class.forName("com.mysql.jdbc.Driver");
            final String DB_URL = "jdbc:mysql://localhost:3306/lab12?";
            final String DB_USER = "root";
            final String DB_PASSWORD = "root";
            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            String query = "select * from `students`";
            PreparedStatement stmt = conn.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();
            int stdExist = 0;
            while (rs.next()) {
                if (rs.getString("name").equalsIgnoreCase(name) && rs.getString("password").equals(password)) {
                    stdExist = 1;
                }
            }
            ServletOutputStream out = response.getOutputStream();
            out.println(stdExist);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
}