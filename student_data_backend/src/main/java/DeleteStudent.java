import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class DeleteStudent extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) {
        response.addHeader("Access-Control-Allow-Origin", "http://localhost:3000");
        try {
            String id = request.getParameter("id");
            int stdId = Integer.parseInt(id);
            Class.forName("com.mysql.jdbc.Driver");
            final String DB_URL = "jdbc:mysql://localhost:3306/test-db?";
            final String DB_USER = "root";
            final String DB_PASSWORD = "root";
            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            String query = "delete  from `student_data` where id=?";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setInt(1, stdId);
            int result = stmt.executeUpdate();
            ServletOutputStream out = response.getOutputStream();
            out.println(result);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
}

