package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.swing.text.html.HTMLDocument.HTMLReader.PreAction;

public class InteractionDao {
	
	private static InteractionDao instance = null;
	private InteractionDao() {}
	public static InteractionDao getInstance() {
		if (instance == null) {
			instance = new InteractionDao();
		}
		return instance;
	}
	
	public boolean insertInteraction(int pno, String id) {
		DBcon db = new DBcon();
		boolean result = false;
		
		Connection conn = null;
		PreparedStatement stmt = null;
		try {
			conn = db.getConnection();
			String query = "INSERT INTO tbl_interaction(pno, user_id, interacted_at)" + 
					" VALUES (?, ?, CURRENT_TIMESTAMP())";
			stmt = conn.prepareStatement(query);
			stmt.setInt(1, pno);
			stmt.setString(2, id);
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
	
	public boolean isAlreadyViewed(int pno, String id) {
		DBcon db = new DBcon();
		boolean result = false;
		
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			conn = db.getConnection();
			String query = "SELECT interaction_id FROM tbl_interaction" + 
					" WHERE pno = ? AND user_id = ?";
			stmt = conn.prepareStatement(query);
			stmt.setInt(1, pno);
			stmt.setString(2, id);
			rs = stmt.executeQuery();
			
			if (rs.next()) {
				result = true;
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
	
	public boolean deleteInteractionAll(int pno) {
		DBcon db = new DBcon();
		boolean result = false;
		
		Connection conn = null;
		PreparedStatement stmt = null;
		
		try {
			conn = db.getConnection();
			String query = "DELETE FROM tbl_interaction WHERE pno = ?";
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
	
	
}
