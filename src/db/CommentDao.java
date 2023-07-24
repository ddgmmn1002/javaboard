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
	
	
	public boolean insertComment(int pno, String user, String content) {
		DBcon db = new DBcon();
		boolean result = false;
		
		Connection conn = null;
		PreparedStatement stmt = null;
		
		try {
			conn = db.getConnection();
			String query = "INSERT INTO tbl_comment(pno, user_id, content, created_at) " + 
					"VALUES (?, ?, ?, CURRENT_TIMESTAMP())";
			stmt = conn.prepareStatement(query);
			stmt.setInt(1, pno);
			stmt.setString(2, user);
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
				comment.setCreatedAt(rs.getTimestamp("created_at"));
				comment.setNickname(rs.getString("nickname"));
				comment.setPno(rs.getInt("pno"));
				comment.setUpdatedAt(rs.getTimestamp("updated_at"));
				comment.setUserId(rs.getString("user_id"));
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
			String query = "SELECT cno, pno, c.user_id, content, created_at, updated_at, nickname" + 
					" FROM tbl_comment AS c, tbl_user AS u" + 
					" WHERE c.user_id = u.user_id AND pno = ?";
			stmt = conn.prepareStatement(query);
			stmt.setInt(1, pno);
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				CommentVO comment = new CommentVO();
				comment.setCno(rs.getInt("cno"));
				comment.setPno(rs.getInt("pno"));
				comment.setUserId(rs.getString("user_id"));
				comment.setContent(rs.getString("content"));
				comment.setCreatedAt(rs.getTimestamp("created_at"));
				comment.setUpdatedAt(rs.getTimestamp("updated_at"));
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
	
	public ArrayList<CommentVO> selectCommentListById(String userId){
		DBcon db = new DBcon();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		ArrayList<CommentVO> list = new ArrayList<>();
		try {
			conn = db.getConnection();
			String query = "SELECT c.cno, p.pno, p.title, c.created_at, c.updated_at" + 
					" FROM tbl_comment AS c, tbl_post AS p" + 
					" WHERE c.pno = p.pno AND c.user_id = ?" +
					" ORDER BY c.created_at DESC";
			stmt = conn.prepareStatement(query);
			stmt.setString(1, userId);
			rs = stmt.executeQuery();
			while(rs.next()) {
				CommentVO comment = new CommentVO();
				comment.setCno(rs.getInt("cno"));
				comment.setPno(rs.getInt("pno"));
				comment.setTitle(rs.getString("title"));
				comment.setCreatedAt(rs.getTimestamp("created_at"));
				comment.setUpdatedAt(rs.getTimestamp("updated_at"));
				
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
			String query = "DELETE FROM tbl_comment WHERE pno = ?";
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
