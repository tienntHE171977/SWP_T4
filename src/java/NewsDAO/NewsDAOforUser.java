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

/**
 *
 * @author admin
 */
public class NewsDAOforUser {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    // For News Category
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

    public int getTotalNewsbyCID(String categoryID) {
        String query = "SELECT COUNT(*) FROM News \n"
                + "where category_id = ? \n"
                + "AND status = 'on'";

        try {
            conn = new DBContext().makeConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, categoryID);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public List<News> getNewsByCID(String categoryID, int index) {
        List<News> list = new ArrayList<>();
        String query = "select * from News\n"
                + "where category_id = ? "
                + "AND status = 'on'\n"
                + "ORDER BY created_at DESC\n"
                + "OFFSET ? ROWS FETCH NEXT 5 ROWS ONLY";
        try {
            conn = new DBContext().makeConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, categoryID);
            ps.setInt(2, (index - 1) * 5);
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

    // For News
    public int getTotalNews() {
        String query = "select count(*) from News\n"
                + " where status = 'on'";
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

    public List<News> getAllNews(int index) {
        List<News> list = new ArrayList<>();
        String query = "SELECT * FROM News\n"
                + "WHERE status = 'on'\n"
                + "ORDER BY news_id\n"
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

    public List<News> getLast() {
        List<News> list = new ArrayList<>();
        String query = "SELECT TOP 3 * FROM News\n"
                + "WHERE status = 'on'\n"
                + "ORDER BY created_at DESC;";
        try {
            conn = new DBContext().makeConnection();
            ps = conn.prepareStatement(query);
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
        }
        return list;
    }

    public List<News> SortPostByNewsName(int index) {
        List<News> list = new ArrayList<>();
        String query = "select*from News \n"
                + " where status = 'on' \n"
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
                list.add(new News(newsID, updatedDate, title, content, image, status, message));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<News> SortPostByNewsDate(int index) {
        List<News> list = new ArrayList<>();
        String query = "select*from News \n"
                + " where status = 'on' \n"
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
                list.add(new News(newsID, updatedDate, title, content, image, status, message));
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

    public int getTotalNewsbyTitle(String txtSearch) {
        String query = "SELECT COUNT(*) FROM News "
                + "WHERE (title LIKE ? OR content LIKE ?) "
                + "AND status = 'on'";
        try {
            conn = new DBContext().makeConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + txtSearch + "%");
            ps.setString(2, "%" + txtSearch + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;

    }

    public List<News> searchByName(String txtSearch, int index) {
        List<News> list = new ArrayList<>();
        String query = "select * from News\n"
                + "where (title like ? or content like ?)\n"
                + "AND status = 'on'\n"
                + "ORDER BY created_at DESC\n"
                + "OFFSET ? ROWS FETCH NEXT 5 ROWS ONLY";
        try {
            conn = new DBContext().makeConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + txtSearch + "%");
            ps.setString(2, "%" + txtSearch + "%");
            ps.setInt(3, (index - 1) * 5);
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
// for comment
    public int getTotalComment(String newsID) {
        String query = "select count(*) from NewsComment\n"
                + "WHERE news_id = ?\n"
                + "AND status = 'on'";

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
                + "WHERE nc.news_id = ? "
                + "AND status = 'on'";
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

    public void insertComment(int newsId, int userId, String comment) {
        String query = "INSERT INTO NewsComment (news_id, user_id, comment) VALUES (?, ?, ?)";
        try {
            conn = new DBContext().makeConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, newsId);
            ps.setInt(2, userId);
            ps.setString(3, comment);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {

        }
    }
// for next and previous post
    public News getPreviousPost(String currentNewsID) {
        String query = "SELECT TOP 1 * FROM News WHERE news_id < ? ORDER BY news_id DESC";
        try {
            conn = new DBContext().makeConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, currentNewsID);
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

    public News getNextPost(String currentNewsID) {
        String query = "SELECT TOP 1 * FROM News WHERE news_id > ? ORDER BY news_id ASC";
        try {
            conn = new DBContext().makeConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, currentNewsID);
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

    public static void main(String[] args) {

        NewsDAOforUser dao = new NewsDAOforUser();
        String currentNewsID = "1";
        String searchText = "2";
        int categoryID = 2;
        int pageIndex = 1;

        List<NewsComment> results = dao.getCommentbyNewID(searchText);
        for (NewsComment o : results) {
            System.out.println(o);
        }
    }

}
