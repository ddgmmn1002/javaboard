	package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.CommentVO;

public class CommentDao {
	private static CommentDao instance = null;
	private CommentDao() {}
	public static CommentDao getInstance() {
		if (instance == null) {
			instance = new CommentDao();
		}
		return instance;
	}
	
	
	public boolean insertComment(int pno, String userId, String content) {
		DBcon db = new DBcon();
		boolean result = false;
		
		Connection conn = null;
		PreparedStatement stmt = null;
		
		try {
			conn = db.getConnection();
			String query = "INSERT INTO tbl_comment(post, writer, content, created_at)\r\n" + 
					"VALUES (?, ?, ?, CURRENT_TIMESTAMP())";
			stmt = conn.prepareStatement(query);
			stmt.setInt(1, pno);
			stmt.setString(2, userId);
			stmt.setString(3, content);
			
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
	
	public CommentVO selectCommentOne(int cno) {
		DBcon db = new DBcon();
		CommentVO comment = new CommentVO();
		
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			conn = db.getConnection();
			String query = "SELECT u.nickname, c.*"
					+ " FROM tbl_comment AS c, tbl_user AS u"
					+ " WHERE cno = ?";
			stmt = conn.prepareStatement(query);
			stmt.setInt(1, cno);
			rs = stmt.executeQuery();
			if (rs.next()) {
				comment.setCno(rs.getInt("cno"));
				comment.setContent(rs.getString("content"));
				comment.setCreated_at(rs.getTimestamp("created_at"));
				comment.setNickname(rs.getString("nickname"));
				comment.setPost(rs.getInt("post"));
				comment.setUpdated_at(rs.getTimestamp("updated_at"));
				comment.setWriter(rs.getString("writer"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return comment;
	}
	
	public ArrayList<CommentVO> selectCommentList(int pno) {
		DBcon db = new DBcon();
		
		ArrayList<CommentVO> list = new ArrayList<>();
		
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			conn = db.getConnection();
			String query = "SELECT cno, post, writer, content, created_at, updated_at, nickname" + 
					" FROM tbl_comment, tbl_user" + 
					" WHERE writer = user_id AND post = ?";
			stmt = conn.prepareStatement(query);
			stmt.setInt(1, pno);
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				CommentVO comment = new CommentVO();
				comment.setCno(rs.getInt("cno"));
				comment.setPost(rs.getInt("post"));
				comment.setWriter(rs.getString("writer"));
				comment.setContent(rs.getString("content"));
				comment.setCreated_at(rs.getTimestamp("created_at"));
				comment.setUpdated_at(rs.getTimestamp("updated_at"));
				comment.setNickname(rs.getString("nickname"));
				list.add(comment);
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
		
		return list;
	}
	
	public boolean deleteCommentAll(int pno) {
		DBcon db = new DBcon();
		boolean result = false;
		
		Connection conn = null;
		PreparedStatement stmt = null;
		
		try {
			conn = db.getConnection();
			String query = "DELETE FROM tbl_comment WHERE post = ?";
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
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return result;
	}
	
	public boolean deleteCommentOne(int cno) {
		DBcon db = new DBcon();
		boolean result = false;
		
		Connection conn = null;
		PreparedStatement stmt = null;
		
		try {
			conn = db.getConnection();
			String query = "DELETE FROM tbl_comment WHERE cno = ?";
			stmt = conn.prepareStatement(query);
			stmt.setInt(1, cno);
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
	
	public boolean updateComment(int cno, String content) {
		boolean result = false;
		DBcon db = new DBcon();
		Connection conn = null;
		PreparedStatement stmt = null;
		
		try {
			conn = db.getConnection();
			String query = "UPDATE tbl_comment"
					+ " SET content = ?, updated_at = CURRENT_TIMESTAMP()"
					+ " WHERE cno = ?";
			stmt = conn.prepareStatement(query);
			stmt.setString(1, content);
			stmt.setInt(2, cno);
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
}
