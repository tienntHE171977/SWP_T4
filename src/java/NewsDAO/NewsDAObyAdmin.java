/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package NewsDAO;

import DBContext.DBContext;
import Model.News;
import Model.NewsCategories;
import Model.NewsComment;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

/**
 *
 * @author admin
 */
public class NewsDAObyAdmin {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
// Use for News Management
// For category news    

    public List<NewsCategories> getAllCategory() {
        List<NewsCategories> list = new ArrayList<>();
        String query = "select * from NewsCategories";
        try {
            conn = new DBContext().makeConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new NewsCategories(rs.getInt(1),
                        rs.getString(2)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public void editNewsCategories(String ncategoryName, String ncategoriesID) {
        String query = "UPDATE NewsCategories SET category_name = ? WHERE category_id = ?";

        try {
            conn = new DBContext().makeConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, ncategoryName);
            ps.setString(2, ncategoriesID);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {

        }
    }

    public void insertNewsCategories(String ncategoryName) {
        String query = "INSERT INTO NewsCategories (category_name) VALUES (?)";
        try {
            conn = new DBContext().makeConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, ncategoryName);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {

        }
    }

// For news
    public int getTotalNews() {
        String query = "select count(*) from News";
        try {
            conn = new DBContext().makeConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public List<News> getAllNewsbyAdmin(int index) {
        List<News> list = new ArrayList<>();
        String query = "select*from News\n"
                + "ORDER BY news_id ASC\n"
                + "OFFSET ? ROWS FETCH NEXT 5 ROWS ONLY;";

        try {
            conn = new DBContext().makeConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, (index - 1) * 5);
            rs = ps.executeQuery();
            while (rs.next()) {
                int newsID = rs.getInt("news_id");
                String title = rs.getString("title");
                String content = rs.getString("content");
                String message = rs.getString("message");
                String image = rs.getString("image");
                String status = rs.getString("status");
                Date updatedDate = rs.getDate("created_at");
                list.add(new News(newsID, updatedDate, title, content, image, status, message));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<News> SortPostByNewsName(int index) {
        List<News> list = new ArrayList<>();
        String query = "select*from News \n"
                + "ORDER BY title \n"
                + "OFFSET ? ROWS FETCH NEXT 5 ROWS ONLY;";
        try {
            conn = new DBContext().makeConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, (index - 1) * 5);
            rs = ps.executeQuery();
            while (rs.next()) {
                int newsID = rs.getInt("news_id");
                String title = rs.getString("title");
                String content = rs.getString("content");
                String message = rs.getString("message");
                String image = rs.getString("image");
                String status = rs.getString("status");
                Date updatedDate = rs.getDate("created_at");
                list.add(new News(newsID, (java.sql.Date) updatedDate, title, content, image, status, message));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<News> SortPostByNewsDate(int index) {
        List<News> list = new ArrayList<>();
        String query = "select*from News \n"
                + "ORDER BY created_at DESC\n"
                + "OFFSET ? ROWS FETCH NEXT 5 ROWS ONLY;";
        try {
            conn = new DBContext().makeConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, (index - 1) * 5);
            rs = ps.executeQuery();
            while (rs.next()) {
                int newsID = rs.getInt("news_id");
                String title = rs.getString("title");
                String content = rs.getString("content");
                String message = rs.getString("message");
                String image = rs.getString("image");
                String status = rs.getString("status");
                Date updatedDate = rs.getDate("created_at");
                list.add(new News(newsID, (java.sql.Date) updatedDate, title, content, image, status, message));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public News getNewsByID(String newsID) {
        String query = "select * from News\n"
                + "where news_id = ?";
        try {
            conn = new DBContext().makeConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, newsID);
            rs = ps.executeQuery();
            if (rs.next()) {
                int retrievednewsID = rs.getInt("news_id");
                String title = rs.getString("title");
                String content = rs.getString("content");
                String message = rs.getString("message");
                String image = rs.getString("image");
                String status = rs.getString("status");
                Date updatedDate = rs.getDate("created_at");
                return new News(retrievednewsID, updatedDate, title, content, image, status, message);
            }
        } catch (Exception e) {
        }
        return null;
    }

    public String getCategoryIDByNewsID(String postID) {
        String categoryID = null;
        String query = "SELECT category_id FROM News\n"
                + "WHERE news_id = ?";

        try {
            conn = new DBContext().makeConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, postID);
            rs = ps.executeQuery();
            while (rs.next()) {
                categoryID = rs.getString("category_id");
            }

        } catch (Exception e) {
        }

        return categoryID;
    }

    public int getTotalNews(String name, int cateID) {
        String query = "select count(*) from News "
                + "WHERE (title LIKE ? OR content LIKE ?)";
        if (cateID != -1) {
            query += " AND category_id = ?";
        }
        try {
            conn = new DBContext().makeConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + name + "%");
            ps.setString(2, "%" + name + "%");
            if (cateID != -1) {
                ps.setInt(3, cateID);
            }
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        } finally {
        }
        return 0;
    }

    public List<News> searchNews(String name, int cateID, int index) {
        List<News> list = new ArrayList<>();
        String query = "SELECT * FROM News "
                + "WHERE (title LIKE ? OR content LIKE ?)";
        if (cateID != -1) {
            query += "AND category_id = ?";
        }
        query += " ORDER BY news_id ASC\n"
                + " OFFSET ? ROWS FETCH NEXT 5 ROWS ONLY;";
        try {
            conn = new DBContext().makeConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + name + "%");
            ps.setString(2, "%" + name + "%");

            if (cateID != -1) {
                ps.setInt(3, cateID);
                ps.setInt(4, (index - 1) * 5);
            } else {
                ps.setInt(3, (index - 1) * 5);
            }

            rs = ps.executeQuery();

            while (rs.next()) {
                int newsID = rs.getInt("news_id");
                String title = rs.getString("title");
                String content = rs.getString("content");
                String message = rs.getString("message");
                String image = rs.getString("image");
                String status = rs.getString("status");
                Date updatedDate = rs.getDate("created_at");
                list.add(new News(newsID, updatedDate, title, content, image, status, message));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {

        }

        return list;
    }

    public void deleteNews(String newsID) {
        String query = "delete from News\n"
                + "where news_id = ?";
        String query1 = "delete from NewsComment\n"
                + "where news_id = ?";
        try {
            conn = new DBContext().makeConnection();
            ps = conn.prepareStatement(query1);
            ps.setString(1, newsID);
            ps.executeUpdate();

            ps = conn.prepareStatement(query);
            ps.setString(1, newsID);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void insertNews(String title, String category_id, String content, String message, String author_id, String image) {
        String query = "INSERT INTO News (title, category_id, content, message, author_id, image, status, created_at) "
                + "VALUES (?, ?, ?, ?, ?, ?, 'on' ,GETDATE())";
        try {
            conn = new DBContext().makeConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, title);
            ps.setString(2, category_id);
            ps.setString(3, content);
            ps.setString(4, message);
            ps.setString(5, author_id);
            ps.setString(6, image);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {

        }
    }


    public void editNews(String title, String content, String message, String image, String category_id, String newsID) {
        String query = "UPDATE News "
                + "SET title = ?, "
                + "content = ?, "
                + "message = ?, "
                + "image = ?, "
                + "category_id = ?, "
                + "created_at = GETDATE() "
                + "WHERE news_id = ?";
        try {
            conn = new DBContext().makeConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, title);
            ps.setString(2, content);
            ps.setString(3, message);
            ps.setString(4, image);
            ps.setString(5, category_id);
            ps.setString(6, newsID);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {

        }
    }

    public void updateNewsStatus(String postID, String status) {
        String query = "UPDATE News SET status = ? WHERE news_id = ?";
        try {
            conn = new DBContext().makeConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, status);
            ps.setString(2, postID);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // For News comment
    public int getTotalComment(String newsID) {
        String query = "select count(*) from NewsComment\n"
                + "WHERE news_id = ?";

        try {
            conn = new DBContext().makeConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, newsID);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public List<NewsComment> getCommentbyNewID(String newsId) {
        List<NewsComment> list = new ArrayList<>();
        String query = "SELECT nc.comment_id, nc.comment, u.username, nc.status "
                + "FROM NewsComment nc "
                + "JOIN Users u ON nc.user_id = u.user_id "
                + "WHERE nc.news_id = ? ";

        try {
            conn = new DBContext().makeConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, newsId);
            rs = ps.executeQuery();

            while (rs.next()) {
                int ncommentID = rs.getInt("comment_id");
                String userName = rs.getString("username");
                String comment = rs.getString("comment");
                String status = rs.getString("status");
                list.add(new NewsComment(ncommentID, comment, userName, status));
            }
        } catch (Exception e) {
            e.printStackTrace();

        }
        return list;
    }

    public String getNewsIDByCommentID(String commentID) {
        String newsID = null;
        String query = "SELECT news_id FROM NewsComment WHERE comment_id = ?";
        try {
            conn = new DBContext().makeConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, commentID);
            rs = ps.executeQuery();
            while (rs.next()) {
                newsID = rs.getString("news_id");
            }
        } catch (Exception e) {
            e.printStackTrace();

        }
        return newsID;
    }

    public void updateNewsStatusComment(String commentID, String status) {
        String query = "UPDATE NewsComment SET status = ? WHERE comment_id = ?";
        try {
            conn = new DBContext().makeConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, status);
            ps.setString(2, commentID);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

// Main
    public static void main(String[] args) {

        NewsDAObyAdmin dao = new NewsDAObyAdmin();
        String testCategoryName = "Test Category";
        dao.insertNewsCategories(testCategoryName);

        // Kiểm tra lấy danh sách danh mục
        List<NewsCategories> categories = dao.getAllCategory();
        for (NewsCategories category : categories) {
            System.out.println(category);
        }
    }

}
