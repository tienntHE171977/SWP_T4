/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.VCategory;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.sql.SQLException;

/**
 *
 * @author admin
 */
public class VCategoryDAO extends DBContext{
    public List<VCategory> getAllVCategories() {
        List<VCategory> categories = new ArrayList<>();
        String sql = "SELECT * FROM VCategories";
        try  {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                VCategory category = new VCategory(
                    rs.getInt("category_id"),
                    rs.getString("category_name"),
                    rs.getString("description")
                );
                categories.add(category);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return categories;
    }
    // Retrieve a category by ID
    public VCategory getVCategoryById(int categoryId) {
        String sql = "SELECT * FROM VCategories WHERE category_id = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, categoryId);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    return new VCategory(
                        resultSet.getInt("category_id"),
                        resultSet.getString("category_name"),
                        resultSet.getString("description")
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    public static void main(String[] args) {
        VCategoryDAO d = new VCategoryDAO();
        List<VCategory> categories = d.getAllVCategories();
        for (VCategory category : categories) {
            System.out.println(category.getCategoryName());
        }
    }
}

