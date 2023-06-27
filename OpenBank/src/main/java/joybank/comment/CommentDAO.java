package joybank.comment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import joybank.common.ConnectionFactory;

public class CommentDAO {


	public void insertComment(CommentVO comment) {
		
		StringBuilder sql = new StringBuilder();
		sql.append("INSERT INTO M_REPLY (REP_CD, U_ID, REP_CONTENT, Post_cd) VALUES (?, ?, ?, ?)");
		
		try (
				Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
				
				){
			pstmt.setInt(1, comment.getRepCd());
			pstmt.setString(2, comment.getU_id());
			pstmt.setString(3, comment.getRepContent());
			pstmt.setInt(4, comment.getPost_cd());
			pstmt.executeUpdate();

			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public List<CommentVO> getCommentsByPostId(int postId) {
		List<CommentVO> comments = new ArrayList<>();
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT * FROM M_REPLY WHERE POST_CD = ?");
		
		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
			pstmt.setInt(1, postId);
			
			ResultSet rs = pstmt.executeQuery();
			
			while (rs.next()) {
				CommentVO comment = new CommentVO();
				comment.setRepCd(rs.getInt("REP_CD"));
				comment.setRepContent(rs.getString("REP_CONTENT"));
				comment.setU_id(rs.getString("U_ID"));
				comment.setPost_cd(rs.getInt("POST_CD"));
				comments.add(comment);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return comments;
	}

	
	public void updateComment(CommentVO comment) {
		
		StringBuilder sql = new StringBuilder();
		sql.append("UPDATE M_REPLY SET U_ID = ?, REP_CONTENT = ? WHERE REP_CD = ?");
		try(
				Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		){
			
			pstmt.setString(1, comment.getU_id());
			pstmt.setString(2, comment.getRepContent());
			pstmt.setInt(3, comment.getRepCd());
			pstmt.executeUpdate();

			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void deleteComment(int repCd) {
		
		StringBuilder sql = new StringBuilder();
		sql.append("DELETE FROM M_REPLY WHERE REP_CD = ?");
		
		try (
				Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			){
			
			pstmt.setInt(1, repCd);
			pstmt.executeUpdate();

			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
