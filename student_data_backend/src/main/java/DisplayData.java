import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class DisplayData extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) {
        response.addHeader("Access-Control-Allow-Origin", "http://localhost:3000");
        try {
            Class.forName("com.mysql.jdbc.Driver");
            final String DB_URL = "jdbc:mysql://localhost:3306/test-db?";
            final String DB_USER = "root";
            final String DB_PASSWORD = "root";
            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            String query = "select * from `student_data`";
            PreparedStatement stmt = conn.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();
            ArrayList<Student> students = new ArrayList();
            while (rs.next()) {
                students.add(new Student(rs.getInt("id"), rs.getString("name").toUpperCase(), rs.getString("rollNo").toUpperCase(), rs.getString("degree")));
            }
            Gson gson = (new GsonBuilder()).create();
            JsonArray jarray = gson.toJsonTree(students).getAsJsonArray();
            JsonObject jsonObject = new JsonObject();
            jsonObject.add("data", jarray);

            try {
                response.setContentType("application/json;charset=UTF-8");
                ServletOutputStream out = response.getOutputStream();
                out.println(jsonObject.toString());
            } catch (IOException var) {
                var.printStackTrace();
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
}

