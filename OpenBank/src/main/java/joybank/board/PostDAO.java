package joybank.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PostDAO {
    private Connection connection;

    public PostDAO(Connection connection) {
        this.connection = connection;
    }

    public List<PostVO> getAllPosts() {
        List<PostVO> posts = new ArrayList<>();

        try {
            String query = "SELECT * FROM BOARD";
            PreparedStatement statement = connection.prepareStatement(query);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                PostVO post = new PostVO();
                post.setPostCd(resultSet.getInt("POST_CD"));
                post.setuCd(resultSet.getInt("U_CD"));
                post.setPostTitle(resultSet.getString("POST_TITLE"));
                post.setPostContent(resultSet.getString("POST_CONTENT"));
                post.setPostDate(resultSet.getDate("POST_DATE"));
                post.setPostStat(resultSet.getInt("POST_STAT"));
                post.setRepCd(resultSet.getString("REP_CD"));

                posts.add(post);
            }

            resultSet.close();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return posts;
    }

    public PostVO getPostById(int postCd) {
        PostVO post = null;

        try {
            String query = "SELECT * FROM BOARD WHERE POST_CD = ?";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setInt(1, postCd);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                post = new PostVO();
                post.setPostCd(resultSet.getInt("POST_CD"));
                post.setuCd(resultSet.getInt("U_CD"));
                post.setPostTitle(resultSet.getString("POST_TITLE"));
                post.setPostContent(resultSet.getString("POST_CONTENT"));
                post.setPostDate(resultSet.getDate("POST_DATE"));
                post.setPostStat(resultSet.getInt("POST_STAT"));
                post.setRepCd(resultSet.getString("REP_CD"));
            }

            resultSet.close();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return post;
    }

    public void insertPost(PostVO post) {
        try {
            String query = "INSERT INTO BOARD (POST_CD, U_CD, POST_TITLE, POST_CONTENT, POST_DATE, POST_STAT, REP_CD) VALUES (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setInt(1, post.getPostCd());
            statement.setInt(2, post.getuCd());
            statement.setString(3, post.getPostTitle());
            statement.setString(4, post.getPostContent());
            statement.setDate(5, new java.sql.Date(post.getPostDate().getTime()));
            statement.setInt(6, post.getPostStat());
            statement.setString(7, post.getRepCd());
            statement.executeUpdate();

            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updatePost(PostVO post) {
        try {
            String query = "UPDATE BOARD SET U_CD = ?, POST_TITLE = ?, POST_CONTENT = ?, POST_DATE = ?, POST_STAT = ?, REP_CD = ? WHERE POST_CD = ?";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setInt(1, post.getuCd());
            statement.setString(2, post.getPostTitle());
            statement.setString(3, post.getPostContent());
            statement.setDate(4, new java.sql.Date(post.getPostDate().getTime()));
            statement.setInt(5, post.getPostStat());
            statement.setString(6, post.getRepCd());
            statement.setInt(7, post.getPostCd());
            statement.executeUpdate();

            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deletePost(int postCd) {
        try {
            String query = "DELETE FROM BOARD WHERE POST_CD = ?";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setInt(1, postCd);
            statement.executeUpdate();

            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
