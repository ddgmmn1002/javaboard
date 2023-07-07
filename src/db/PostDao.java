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
	
	
	public boolean insertPost(String user, String title, String content) {
		DBcon db = new DBcon();
		Connection conn = null;
		PreparedStatement stmt = null;
		boolean result = false;
		try {
			conn = db.getConnection();
			String query = "INSERT INTO tbl_post(writer, title, created_at, content)"
					+ " VALUES (?, ?, CURRENT_TIMESTAMP(), ?)";
			stmt = conn.prepareStatement(query);
			stmt.setString(1, user);
			stmt.setString(2, title);
			stmt.setString(3, content);
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
			String query = "SELECT p.pno, p.title, p.created_at, p.writer, u.nickname, u.grade"
					+ " FROM tbl_post AS p, tbl_user AS u"
					+ " WHERE p.writer = u.user_id"
					+ " ORDER BY created_at DESC";
			stmt = conn.prepareStatement(query);
			rs = stmt.executeQuery();
			while (rs.next()) {
				PostVO post = new PostVO();
				post.setPno(rs.getInt("pno"));
				post.setWriter(rs.getString("writer"));
				post.setTitle(rs.getString("title"));
				post.setCreated_at(rs.getTimestamp("created_at"));
				post.setNickname(rs.getString("nickname"));
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
			String query = "SELECT p.pno, p.title, p.created_at, p.writer, p.content, u.nickname, u.grade"
					+ " FROM tbl_post AS p, tbl_user AS u"
					+ " WHERE p.writer = u.user_id AND pno = ?";
			stmt = conn.prepareStatement(query);
			stmt.setInt(1, pno);
			rs = stmt.executeQuery();
			rs.next();
			
			post.setPno(rs.getInt("pno"));
			post.setTitle(rs.getString("title"));
			post.setContent(rs.getString("content"));
			post.setNickname(rs.getString("nickname"));
			post.setCreated_at(rs.getTimestamp("created_at"));
			post.setWriter(rs.getString("writer"));
			post.setGrade(rs.getString("grade"));
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
	
	public boolean updatePost(int pno, String title, String content) {
		DBcon db = new DBcon();
		boolean result = false;
		
		Connection conn = null;
		PreparedStatement stmt = null;
		
		try {
			conn = db.getConnection();
			String query = "UPDATE tbl_post"
					+ " SET title = ?, content = ?, updated_at = CURRENT_TIMESTAMP()"
					+ " WHERE pno = ?";
			stmt = conn.prepareStatement(query);
			stmt.setString(1, title);
			stmt.setString(2, content);
			stmt.setInt(3, pno);
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
	
	public int findPno(String writer, String title) {
		int result = -1;
		
		DBcon db = new DBcon();
		
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			conn = db.getConnection();
			String query = "SELECT pno from tbl_post"
					+ " WHERE writer = ? AND title= ?"
					+ " order by pno DESC;";
			stmt = conn.prepareStatement(query);
			stmt.setString(1, writer);
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
