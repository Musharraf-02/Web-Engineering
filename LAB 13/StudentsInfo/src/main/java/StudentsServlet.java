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

public class StudentsServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) {
        try {
            String cid = request.getParameter("cid");
            int c_id = Integer.parseInt(cid);
            Class.forName("com.mysql.jdbc.Driver");
            final String DB_URL = "jdbc:mysql://localhost:3306/lab12?";
            final String DB_USER = "root";
            final String DB_PASSWORD = "root";
            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            String query = "select * from `students` where c_id=?";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setInt(1, c_id);
            ResultSet rs = stmt.executeQuery();
            ArrayList<Students> students = new ArrayList();
            while (rs.next()) {
                students.add(new Students(rs.getString("name"), rs.getString("fname")));
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
