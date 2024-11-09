/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dalQuang;

import ModelQuang.CampaignParticipant;
import model.User;
import ModelQuang.Volunteer;
import ModelQuang.VolunteerCV;
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

    DAO d = new DAO();
    ProjectDAO pd = new ProjectDAO();

    public List<Volunteer> getAllVolunteers() {
        List<Volunteer> volunteers = new ArrayList<>();
        String sql = "SELECT * FROM [Volunteers]";

        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                int volunteerId = rs.getInt("volunteer_id");
                int userId = rs.getInt("user_id");
                User u = d.selectUserById(userId);
                String status = rs.getString("status");
                Date createdAt = rs.getDate("created_at");

                Volunteer vo = new Volunteer(volunteerId, u, status, createdAt);
                volunteers.add(vo);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return volunteers;
    }

    public boolean deleteVolunteer(int volunteerId) {
        String sql = "DELETE FROM [Volunteers] WHERE volunteer_id = ?";
        try  {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, volunteerId); // Set the volunteer_id parameter in the query
            statement.executeUpdate(); // Execute the delete command

            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false; // Returns false if an error occurred or no rows were deleted
    }

    // Method to get all VolunteerCVs from the database
    public List<VolunteerCV> getAllVolunteerCVs() {
        List<VolunteerCV> volunteerCVs = new ArrayList<>();
        String sql = "SELECT * FROM VolunteerCV";

        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                int cvId = rs.getInt("cv_id");
                int user_id = rs.getInt("user_id");
                String description = rs.getString("description");
                String skillDescription = rs.getString("skill_description");
                Date createdAt = rs.getDate("created_at");
                String image = rs.getString("cv_image");
                String exper = rs.getString("Experience");

                String edu = rs.getString("Education");

                VolunteerCV volunteerCV = new VolunteerCV(cvId, d.selectUserById(user_id), description, skillDescription, createdAt, image, exper, edu);
                volunteerCVs.add(volunteerCV);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return volunteerCVs;
    }
    // Method to insert a new VolunteerCV into the database

    public void insertVolunteerCV(VolunteerCV volunteerCV) {
        String sql = "INSERT INTO VolunteerCV (user_id, description, skill_description, created_at,cv_image, Experience,Education) VALUES (?, ?, ?, ?, ?, ?, ?)";

        try {
            PreparedStatement statement = connection.prepareStatement(sql);
//            ResultSet rs = statement.executeQuery(sql);
            statement.setInt(1, volunteerCV.getUserid().getUserId());
            statement.setString(2, volunteerCV.getDescription());
            statement.setString(3, volunteerCV.getSkillDescription());
            statement.setDate(4, new java.sql.Date(volunteerCV.getCreatedAt().getTime()));
            statement.setString(5, volunteerCV.getCvImage());
            statement.setString(6, volunteerCV.getExperience());
            statement.setString(7, volunteerCV.getEducation());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void insertVolunteer(Volunteer volunteer) {
        String sql = "INSERT INTO Volunteers (user_id,status, created_at) VALUES (?,?, ?)";

        try {
            PreparedStatement statement = connection.prepareStatement(sql);
//            ResultSet rs = statement.executeQuery(sql);
            statement.setInt(1, volunteer.getUserId().getUserId());
            statement.setString(2, volunteer.getStatus());
            statement.setDate(3, new java.sql.Date(volunteer.getCreatedAt().getTime()));

            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    // Method to update a VolunteerCV in the database

    public void updateVolunteerCV(VolunteerCV volunteerCV) {
        String sql = "UPDATE VolunteerCV SET description = ?, skill_description = ?, created_at = ?, cv_image = ?, Experience = ?,Education = ? WHERE cv_id = ?";

        try {
            PreparedStatement pstmt = connection.prepareStatement(sql);
            pstmt.setString(1, volunteerCV.getDescription());
            pstmt.setString(2, volunteerCV.getSkillDescription());
            pstmt.setDate(3, (java.sql.Date) volunteerCV.getCreatedAt());
            pstmt.setInt(4, volunteerCV.getCvId());
            pstmt.setString(5, volunteerCV.getCvImage());
            pstmt.setString(6, volunteerCV.getExperience());
            pstmt.setString(7, volunteerCV.getEducation());
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
                String status = rs.getString("status");
                Date createdAt = rs.getDate("created_at");
                Volunteer v = new Volunteer(volunteerId, d.selectUserById(id), status, createdAt);
                return v;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;

    }

    public Volunteer VolunteersByid(int id) {
        String sql = "select * from Volunteers where volunteer_id = ?";
        // Establish a connection
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            // Execute the query
            ResultSet rs = st.executeQuery();

            // Process the result set and retrieve user data
            if (rs.next()) {
                int userid = rs.getInt("user_id");
                String status = rs.getString("status");
                Date createdAt = rs.getDate("created_at");
                Volunteer v = new Volunteer(id, d.selectUserById(userid), status, createdAt);
                return v;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;

    }

    public VolunteerCV VolunteerCVByUserid(int userid) {
        String sql = "select * from VolunteerCV  where user_id = ?";
        // Establish a connection
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userid);
            // Execute the query
            ResultSet rs = st.executeQuery();

            // Process the result set and retrieve user data
            if (rs.next()) {
                int cvId = rs.getInt("cv_id");
                String description = rs.getString("description");
                String skillDescription = rs.getString("skill_description");
                String image = rs.getString("cv_image");
                String exper = rs.getString("Experience");
                Date createdAt = rs.getDate("created_at");
                String edu = rs.getString("Education");

                VolunteerCV volunteerCV = new VolunteerCV(cvId, d.selectUserById(userid), description, skillDescription, createdAt, image, exper, edu);
                return volunteerCV;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;

    }

    public List<CampaignParticipant> getCPByVolunteerId(int volunteerId) {
        List<CampaignParticipant> participants = new ArrayList<>();
        String sql = "SELECT [participant_id], [campaign_id], [volunteer_id], [job], [participation_type], [participation_date] FROM [CampaignParticipants] WHERE [volunteer_id] = ?";

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, volunteerId);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int participantId = resultSet.getInt("participant_id");
                int campaignId = resultSet.getInt("campaign_id");
                String job = resultSet.getString("job");
                String participationType = resultSet.getString("participation_type");
                Date participationDate = resultSet.getDate("participation_date");

                CampaignParticipant participant = new CampaignParticipant(participantId, pd.getCamById(campaignId), VolunteersByid(volunteerId), job, participationType, participationDate);
                participants.add(participant);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return participants;
    }

    public static void main(String[] args) {
        DAO d = new DAO();
        VolunteerDAO vlD = new VolunteerDAO();
        List<VolunteerCV> allcv = new ArrayList<>();
        vlD.deleteVolunteerCV(9);
    }
}
