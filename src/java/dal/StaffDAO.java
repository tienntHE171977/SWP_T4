package dal;

import Model.Staff;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class StaffDAO extends DBContext {
    
    public List<Staff> getAllStaff() {
        List<Staff> staffList = new ArrayList<>();
        String sql = "SELECT * FROM Staff";
        
        try  {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet resultSet = st.executeQuery(sql);
            while (resultSet.next()) {
                Staff staff = new Staff();
                staff.setStaffId(resultSet.getInt("staff_id"));
                staff.setUserId(resultSet.getInt("user_id"));
                staff.setRole(resultSet.getString("role"));
                staff.setStatus(resultSet.getString("status"));
                staff.setApprovalDate(resultSet.getDate("approval_date"));
                staff.setFirstPassword(resultSet.getString("first_password"));
                staff.setCreatedAt(resultSet.getDate("created_at"));
                staff.setUpdatedAt(resultSet.getDate("updated_at"));
                
                staffList.add(staff);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return staffList;
    }
    public Staff getStaffByUserId(int id) {
//        List<Staff> staffList = new ArrayList<>();
        String sql = "SELECT * FROM Staff where user_id = ?";
        
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            // Execute the query
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Staff staff = new Staff();
                staff.setStaffId(rs.getInt("staff_id"));
                staff.setUserId(rs.getInt("user_id"));
                staff.setRole(rs.getString("role"));
                staff.setStatus(rs.getString("status"));
                staff.setApprovalDate(rs.getDate("approval_date"));
                staff.setFirstPassword(rs.getString("first_password"));
                staff.setCreatedAt(rs.getDate("created_at"));
                staff.setUpdatedAt(rs.getDate("updated_at"));
                
                return staff;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    public static void main(String[] args) {
        DAO d = new DAO();
//         StaffDAO stD = new StaffDAO();
//        HttpSession session = request.getSession();
////        session.setAttribute("acc", d.selectUserById(1));
//        User user = (User) session.getAttribute("acc");
//        Staff staff = stD.getStaffByUserId(user.getUserId());
    }
}
