/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.ProjectCategory;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author admin
 */
public class ProjectCategoryDAO extends DBContext{
    public boolean addProjectCategory(ProjectCategory projectCategory) {
        String sql = "INSERT INTO ProjectCategories (project_id, category_id) VALUES (?, ?)";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, projectCategory.getProjectId());
            statement.setInt(2, projectCategory.getCategoryId());
            return statement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Retrieve all categories associated with a project
    public List<ProjectCategory> getCategoriesByProjectId(int projectId) {
        List<ProjectCategory> projectCategories = new ArrayList<>();
        String sql = "SELECT * FROM ProjectCategories WHERE project_id = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, projectId);
            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    ProjectCategory projectCategory = new ProjectCategory(
                        resultSet.getInt("project_id"),
                        resultSet.getInt("category_id")
                    );
                    projectCategories.add(projectCategory);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return projectCategories;
    }

    // Retrieve all projects associated with a category
    public List<ProjectCategory> getProjectsByCategoryId(int categoryId) {
        List<ProjectCategory> projectCategories = new ArrayList<>();
        String sql = "SELECT * FROM ProjectCategories WHERE category_id = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, categoryId);
            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    ProjectCategory projectCategory = new ProjectCategory(
                        resultSet.getInt("project_id"),
                        resultSet.getInt("category_id")
                    );
                    projectCategories.add(projectCategory);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return projectCategories;
    }

    // Delete an association between a project and a category
    public boolean deleteProjectCategory(int projectId, int categoryId) {
        String sql = "DELETE FROM ProjectCategories WHERE project_id = ? AND category_id = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, projectId);
            statement.setInt(2, categoryId);
            return statement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    public static void main(String[] args) {
        ProjectCategoryDAO p = new ProjectCategoryDAO();
        List<ProjectCategory> d = p.getProjectsByCategoryId(1);
        for (ProjectCategory projectCategory : d) {
            System.out.println();
        }
}
}
