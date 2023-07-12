package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.swing.text.html.HTMLDocument.HTMLReader.PreAction;

public class InteractionDao {
	
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
	
	public boolean checkAlreadyView(int pno, String id) {
		DBcon db = new DBcon();
		boolean result = false;
		
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			conn = db.getConnection();
			String query = "";
		} catch (Exception e) {
			// TODO: handle exception
		}
		try {
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return result;
	}
}
