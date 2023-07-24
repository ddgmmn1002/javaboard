package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.InteractionVO;

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
	
	public ArrayList<InteractionVO> selectInteractionList(String userId) {
		DBcon db = new DBcon();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		ArrayList<InteractionVO> list = new ArrayList<>();
		try {
			conn = db.getConnection();
			String query = "SELECT i.interaction_id, i.like_status, i.interacted_at, p.pno, p.title" + 
					" FROM tbl_interaction AS i, tbl_post AS p" + 
					" WHERE i.pno = p.pno AND i.user_id = ?" +
					" ORDER BY i.interacted_at DESC";
			stmt = conn.prepareStatement(query);
			stmt.setString(1, userId);
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				InteractionVO interaction = new InteractionVO();
				interaction.setInteractionId(rs.getInt("interaction_id"));
				interaction.setLikeStatus(rs.getBoolean("like_status"));
				interaction.setInteractedAt(rs.getTimestamp("interacted_at"));
				interaction.setPno(rs.getInt("pno"));
				interaction.setTitle(rs.getString("title"));
				
				list.add(interaction);
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
}
