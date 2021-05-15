package org.pucit.controller;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServlet;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

@Controller
@RequestMapping("/studentDataFunctions")
public class StudentDataFunction extends HttpServlet {
    @RequestMapping("/displayDataFunction")
    public String displayData(ModelMap modelClass) {
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
                students.add(new Student(rs.getInt("id"), rs.getString("name").toUpperCase(), rs.getString("rollNo").toUpperCase(), rs.getString("degree").toUpperCase()));
            }
            Gson gson = (new GsonBuilder()).create();
            JsonArray jarray = gson.toJsonTree(students).getAsJsonArray();
            JsonObject jsonObject = new JsonObject();
            jsonObject.add("data", jarray);
            modelClass.addAttribute("data", jsonObject.toString());
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return "DisplayData";
    }

    @RequestMapping("/deleteStudentFunction")
    public void deleteStudent(@RequestParam(name = "id") String id) {
        try {
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
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    @RequestMapping("/updateStudentFunction")
    public String updateStudent(@RequestParam(name = "id") String id, @RequestParam(name = "name") String name, @RequestParam(name = "rollNo") String rollNo, @RequestParam(name = "degree") String degree, ModelMap modelClass) {
        try {
            degree = degree.toLowerCase();
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
            modelClass.addAttribute("result", rollNoExists);


        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return "UpdateStudent";
    }

    @RequestMapping("/addStudentFunction")
    public String addStudent(@RequestParam(name = "name") String name, @RequestParam(name = "rollNo") String rollNo, @RequestParam(name = "degree") String degree, ModelMap modelClass) {
        try {
            name = name.toLowerCase();
            rollNo = rollNo.toLowerCase();
            degree = degree.toUpperCase();
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
                if ((rs.getString("rollNo")).equals(rollNo)) {
                    rollNoExists = 1;
                }
            }
            if (rollNoExists == 0) {
                String query1 = "insert into `student_data` (name,rollNo,degree) value (?,?,?)";
                PreparedStatement stmt1 = conn.prepareStatement(query1);
                stmt1.setString(1, name);
                stmt1.setString(2, rollNo);
                stmt1.setString(3, degree);
                int result = stmt1.executeUpdate();
            }
            modelClass.addAttribute("result", rollNoExists);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return "AddStudent";

    }
}


