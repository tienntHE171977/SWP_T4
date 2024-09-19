/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Users;
/**
 *
 * @author FPT
 */
public class LoginDAO extends DBContext{
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Users> getAllAccount() {
        List<Users> list = new ArrayList<>();
        String query = "select * from Users";

        try {
            ps = connection.prepareStatement(query);

            rs = ps.executeQuery();

            while (rs.next()) {
                Users account = new Users(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5));
                list.add(account);

            }
            return list;

        } catch (SQLException exception) {
            System.out.println(exception);
        }

        return null;
    }
    
    public static void main(String[] args) {
        LoginDAO ad = new LoginDAO();
        List<Users> list = ad.getAllAccount();
        System.out.println(list.get(1).getRole());
    }
}
