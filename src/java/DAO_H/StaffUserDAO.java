/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO_H;

import DBContext.DBContext;
import model.Staff_1;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
/**
 *
 * @author pc
 */
public class StaffUserDAO extends DBContext {
    PreparedStatement ps = null;
    ResultSet rs = null;
   public List<Staff_1> getStaffUserInfo() {
        List<Staff_1> staffUserList = new ArrayList<>();
        String sql = "SELECT Users.fullname, Staff.approval_date, Users.address, Users.phone, Users.email, Staff.role " +
                     "FROM Staff LEFT JOIN Users ON Staff.user_id = Users.user_id";

        try {
                PreparedStatement statement = connection.prepareStatement(sql);
                ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Staff_1 dto = new Staff_1();
                dto.setFullname(resultSet.getString("fullname"));
                dto.setApprovalDate(resultSet.getString("approval_date"));
                dto.setAddress(resultSet.getString("address"));
                dto.setPhone(resultSet.getString("phone"));
                dto.setEmail(resultSet.getString("email"));
                dto.setRole(resultSet.getString("role"));
                
                staffUserList.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return staffUserList;
    } 
   
    public static void main(String[] args) {
         Staff_1 staff = new Staff_1(
            "Nguyễn Văn A",        // fullname
            "2024-10-29",          // approvalDate
            "123 Đường ABC",       // address
            "0123456789",          // phone
            "nguyenvana@example.com", // email
            "Manager"              // role
        );

        // Kiểm tra các phương thức getter
        System.out.println("Fullname: " + staff.getFullname());
        System.out.println("Approval Date: " + staff.getApprovalDate());
        System.out.println("Address: " + staff.getAddress());
        System.out.println("Phone: " + staff.getPhone());
        System.out.println("Email: " + staff.getEmail());
        System.out.println("Role: " + staff.getRole());

    }
}
