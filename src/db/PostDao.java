package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.PostVO;

public class PostDao {
	private static PostDao instance = null;
	private PostDao() {};
	public static PostDao getInstance() {
		if (instance == null) {
			instance = new PostDao();
		}
		return instance;
	}
	
	
	public boolean insertPost(PostVO post) {
		DBcon db = new DBcon();
		Connection conn = null;
		PreparedStatement stmt = null;
		boolean result = false;
		try {
			conn = db.getConnection();
			String query = "INSERT INTO tbl_post(user_id, title, created_at, content, trailer)"
					+ " VALUES (?, ?, CURRENT_TIMESTAMP(), ?, ?)";
			stmt = conn.prepareStatement(query);
			stmt.setString(1, post.getUser_id());
			stmt.setString(2, post.getTitle());
			stmt.setString(3, post.getContent());
			stmt.setString(4, post.getTrailer());
			if (stmt.executeUpdate() == 1) {
				result = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				stmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return result;
	}
	
	public ArrayList<PostVO> selectPostList() {
		ArrayList<PostVO> list = new ArrayList<>();
		
		DBcon db = new DBcon();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			conn = db.getConnection();
			String query = "SELECT p.pno, p.user_id, u.nickname, p.title, p.created_at, p.updated_at, u.grade," + 
					" COUNT(DISTINCT i.interaction_id) AS view_count, COUNT(DISTINCT c.cno) AS comment_count," + 
					" COUNT(DISTINCT case when i.like_status = 1 then i.interaction_id END) AS like_count" + 
					" FROM tbl_post AS p JOIN tbl_user AS u ON p.user_id = u.user_id" + 
					" LEFT JOIN tbl_interaction AS i ON p.pno = i.pno" + 
					" LEFT JOIN tbl_comment AS c ON c.pno = p.pno" + 
					" GROUP BY p.pno" + 
					" ORDER BY created_at DESC";
			stmt = conn.prepareStatement(query);
			rs = stmt.executeQuery();
			while (rs.next()) {
				PostVO post = new PostVO();
				post.setPno(rs.getInt("pno"));
				post.setUser_id(rs.getString("user_id"));
				post.setTitle(rs.getString("title"));
				post.setCreatedAt(rs.getTimestamp("created_at"));
				post.setUpdatedAt(rs.getTimestamp("updated_at"));
				post.setNickname(rs.getString("nickname"));
				post.setViewCount(rs.getInt("view_count"));
				post.setCommentCount(rs.getInt("comment_count"));
				post.setLikeCount(rs.getInt("like_count"));
				post.setGrade(rs.getString("grade"));
				list.add(post);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				stmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return list;
	}
	
	public PostVO selectPostOne(int pno) {
		PostVO post = new PostVO();
		
		DBcon db = new DBcon();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			conn = db.getConnection();
			String query = "SELECT p.*, u.nickname, u.grade," + 
					" COUNT(DISTINCT i.interaction_id) AS view_count," + 
					" COUNT(DISTINCT case when i.like_status = 1 then i.interaction_id END) AS like_count," + 
					" COUNT(DISTINCT case when i.dislike_status = 1 then i.interaction_id END) AS dislike_count" + 
					" FROM tbl_post AS p JOIN tbl_user AS u ON p.user_id = u.user_id" + 
					" LEFT JOIN tbl_interaction AS i ON i.pno = p.pno" + 
					" WHERE p.pno = ?";
			stmt = conn.prepareStatement(query);
			stmt.setInt(1, pno);
			rs = stmt.executeQuery();
			rs.next();
			
			post.setPno(rs.getInt("pno"));
			post.setUser_id(rs.getString("user_id"));
			post.setTitle(rs.getString("title"));
			post.setCreatedAt(rs.getTimestamp("created_at"));
			post.setUpdatedAt(rs.getTimestamp("updated_at"));
			post.setContent(rs.getString("content"));
			post.setNickname(rs.getString("nickname"));
			post.setGrade(rs.getString("grade"));
			post.setViewCount(rs.getInt("view_count"));
			post.setLikeCount(rs.getInt("like_count"));
			post.setDislikeCount(rs.getInt("dislike_count"));
			post.setTrailer(rs.getString("trailer"));
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				stmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return post;
	}
	
	public boolean deletePost(int pno) {
		DBcon db = new DBcon();
		boolean result = false;
		
		Connection conn = null;
		PreparedStatement stmt = null;
		
		try {
			conn = db.getConnection();
			String query = "DELETE FROM tbl_post WHERE pno = ?";
			stmt = conn.prepareStatement(query);
			stmt.setInt(1, pno);
			if (stmt.executeUpdate() == 1) {				
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				stmt.close();
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return result;
	}
	
	public boolean updatePost(int pno, String title, String content, String trailer) {
		DBcon db = new DBcon();
		boolean result = false;
		
		Connection conn = null;
		PreparedStatement stmt = null;
		
		try {
			conn = db.getConnection();
			String query = "UPDATE tbl_post"
					+ " SET title = ?, content = ?, updated_at = CURRENT_TIMESTAMP(), trailer = ?"
					+ " WHERE pno = ?";
			stmt = conn.prepareStatement(query);
			stmt.setString(1, title);
			stmt.setString(2, content);
			stmt.setString(3, trailer);
			stmt.setInt(4, pno);
			if (stmt.executeUpdate() == 1) {
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				stmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return result;
	}
	
	public int findPno(String user, String title) {
		int result = -1;
		
		DBcon db = new DBcon();
		
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			conn = db.getConnection();
			String query = "SELECT pno from tbl_post"
					+ " WHERE user_id = ? AND title= ?"
					+ " order by pno DESC;";
			stmt = conn.prepareStatement(query);
			stmt.setString(1, user);
			stmt.setString(2, title);
			rs = stmt.executeQuery();
			
			if (rs.next()) {
				result = rs.getInt("pno");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				stmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return result;
	}
	
}
