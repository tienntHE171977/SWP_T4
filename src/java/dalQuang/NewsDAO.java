/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dalQuang;

import ModelQuang.News;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.sql.SQLException;
import java.time.format.DateTimeFormatter;
import java.util.Comparator;

/**
 *
 * @author admin
 */
public class NewsDAO extends DBContext{
    
    
    public List<News> getAllNews() {
        
        List<News> newsList = new ArrayList<>();
        String sql = "select * from News";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                int newsId = rs.getInt("news_id");
                String title = rs.getString("title");
                int categoryId = rs.getInt("category_id");
                String content = rs.getString("content");
                String message = rs.getString("message");
                int authorId = rs.getInt("author_id");
                String image = rs.getString("image");
                String status = rs.getString("status");
                LocalDateTime createdAt_raw = rs.getTimestamp("created_at").toLocalDateTime();
                String createdAt = formatDate(createdAt_raw);
                
                News news = new News(newsId, title, categoryId, content, message, authorId, image, status, createdAt);

                newsList.add(news);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return newsList;
    }
    public static String formatDate(LocalDateTime date) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MMMM d, yyyy");
        return date.format(formatter);
    }
    public static void main(String[] args) {
        NewsDAO n = new NewsDAO();
        List<News> m = n.getAllNews();
        m.sort(Comparator.comparing(News::getCreatedAt).reversed());
        System.out.println(m.size());
        
        for (News news : m) {
            System.out.println(news.getCreatedAt());
//            System.out.println(formatDate(news.getCreatedAt()));
        }
    }
}

