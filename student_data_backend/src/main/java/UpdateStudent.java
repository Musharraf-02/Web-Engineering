import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UpdateStudent extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) {
        response.addHeader("Access-Control-Allow-Origin", "http://localhost:3000");
        try {
            String id = null;
            if (request.getSession().getAttribute("id") != null) {
                id = (String) request.getSession().getAttribute("id");
            } else {
                id = request.getParameter("id");
            }
            String name = request.getParameter("name");
            String rollNo = request.getParameter("rollNo");
            String degree = request.getParameter("degree");
            name = name.toLowerCase();
            rollNo = rollNo.toLowerCase();
            int stdId = Integer.parseInt(id);
            Class.forName("com.mysql.jdbc.Driver");
            final String DB_URL = "jdbc:mysql://localhost:3306/test-db?";
            final String DB_USER = "root";
            final String DB_PASSWORD = "root";
            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            String query = "select * from `student_data`";
            PreparedStatement stmt = conn.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();
            int rollNoExists = 0;
            while (rs.next()) {
                if (rs.getString("rollNo").equals(rollNo) && rs.getInt("id") != stdId) {
                    rollNoExists = 1;
                }
            }
            if (rollNoExists == 0) {
                String query1 = "update student_data set name=?,rollNo=?,degree=? where id=?";
                PreparedStatement stmt1 = conn.prepareStatement(query1);
                stmt1.setString(1, name);
                stmt1.setString(2, rollNo);
                stmt1.setString(3, degree);
                stmt1.setInt(4, stdId);
                int result = stmt1.executeUpdate();
            }
            ServletOutputStream out = response.getOutputStream();
            out.println(rollNoExists);


        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
}
