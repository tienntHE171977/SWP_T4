/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.User;
import Model.Volunteer;
import Model.VolunteerCV;
import jakarta.servlet.http.HttpSession;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.sql.SQLException;
import java.text.SimpleDateFormat;

/**
 *
 * @author admin
 */
public class VolunteerDAO extends DBContext {

    public List<Volunteer> getAllVolunteers() {
        List<Volunteer> volunteers = new ArrayList<>();
        String sql = "SELECT * FROM [Volunteers]";

        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery(sql);
            while (rs.next()) {
                int volunteerId = rs.getInt("volunteer_id");
                int userId = rs.getInt("user_id");
                Date createdAt = rs.getDate("created_at");

                Volunteer vo = new Volunteer(volunteerId, userId, createdAt);
                volunteers.add(vo);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return volunteers;
    }

    // Method to get all VolunteerCVs from the database
    public List<VolunteerCV> getAllVolunteerCVs() {
        List<VolunteerCV> volunteerCVs = new ArrayList<>();
        String sql = "SELECT * FROM VolunteerCV";

        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery(sql);
            while (rs.next()) {
                int cvId = rs.getInt("cv_id");
                int volunteerId = rs.getInt("volunteer_id");
                String description = rs.getString("description");
                String skillDescription = rs.getString("skill_description");
                String createdAt = rs.getString("created_at");

                VolunteerCV volunteerCV = new VolunteerCV(cvId, volunteerId, description, skillDescription, createdAt);
                volunteerCVs.add(volunteerCV);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return volunteerCVs;
    }
    // Method to insert a new VolunteerCV into the database

    public void insertVolunteerCV(VolunteerCV volunteerCV) {
        String sql = "INSERT INTO VolunteerCV (volunteer_id, description, skill_description, created_at) VALUES (?, ?, ?, ?)";

        try {
            PreparedStatement statement = connection.prepareStatement(sql);
//            ResultSet rs = statement.executeQuery(sql);
            statement.setInt(1, volunteerCV.getVolunteerId());
            statement.setString(2, volunteerCV.getDescription());
            statement.setString(3, volunteerCV.getSkillDescription());
            statement.setString(4, volunteerCV.getCreatedAt());

            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    // Method to update a VolunteerCV in the database

    public void updateVolunteerCV(VolunteerCV volunteerCV) {
        String sql = "UPDATE VolunteerCV SET description = ?, skill_description = ?, created_at = ? WHERE cv_id = ?";

        try {
            PreparedStatement pstmt = connection.prepareStatement(sql);
            pstmt.setString(1, volunteerCV.getDescription());
            pstmt.setString(2, volunteerCV.getSkillDescription());
            pstmt.setString(3, volunteerCV.getCreatedAt());
            pstmt.setInt(4, volunteerCV.getCvId());

            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    // Method to delete a VolunteerCV from the database

    public void deleteVolunteerCV(int cvId) {
        String sql = "DELETE FROM VolunteerCV WHERE cv_id = ?";

        try {
            PreparedStatement pstmt = connection.prepareStatement(sql);
            pstmt.setInt(1, cvId);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Volunteer VolunteerByUserId(int id) {
        String sql = "select * from Volunteers where user_id = ?";
        // Establish a connection
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            // Execute the query
            ResultSet rs = st.executeQuery();

            // Process the result set and retrieve user data
            if (rs.next()) {
                int volunteerId = rs.getInt("volunteer_id");
                Date createdAt = rs.getDate("created_at");
                Volunteer v = new Volunteer(volunteerId, id, createdAt);
                return v;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;

    }

    public static void main(String[] args) {
        DAO d = new DAO();
        VolunteerDAO vlD = new VolunteerDAO();
//        List<Notification> list = d.getAllNotic();
//      int userid = (int) request.getAttribute("Userid");
//        HttpSession session = request.getSession();
//        session.setAttribute("acc", d.selectUserById(1));
//        User user = (User) session.getAttribute("acc");
//        int user_id = user.getUserId();
        Volunteer vl = vlD.VolunteerByUserId(7);
        int vl_id = vl.getVolunteerId();
        String description = "eqweqweqewqeeqeq";
        String description_skill = "asdasfaf,asda,asdad";
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date created_at = new Date();
        Date crat = new Date();
        String ct = dateFormat.format(created_at);

        VolunteerCV newcv = new VolunteerCV(0, vl_id, description, description, ct);
        vlD.insertVolunteerCV(newcv);
//        response.sendRedirect("home");
    }
}
