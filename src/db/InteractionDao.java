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
	
	public boolean insertInteractionWithIp(int pno, String addr) {
		DBcon db = new DBcon();
		boolean result = false;
		
		Connection conn = null;
		PreparedStatement stmt = null;
		try {
			conn = db.getConnection();
			String query = "INSERT INTO tbl_interaction(pno, ip_address, interacted_at)" + 
					" VALUES (?, ?, CURRENT_TIMESTAMP())";
			stmt = conn.prepareStatement(query);
			stmt.setInt(1, pno);
			stmt.setString(2, addr);
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
	
	public boolean isAlreadyViewedWithIp(int pno, String addr) {
		DBcon db = new DBcon();
		boolean result = false;
		
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			conn = db.getConnection();
			String query = "SELECT interaction_id FROM tbl_interaction" + 
					" WHERE pno = ? AND ip_address = ?";
			stmt = conn.prepareStatement(query);
			stmt.setInt(1, pno);
			stmt.setString(2, addr);
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
	
	public InteractionVO selectInteractionOne(String userId, int pno) {
		DBcon db = new DBcon();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		InteractionVO interaction = new InteractionVO();
		try {
			conn = db.getConnection();
			String query = "SELECT * FROM tbl_interaction" + 
						" WHERE user_id = ? AND pno = ?";
			stmt = conn.prepareStatement(query);
			stmt.setString(1, userId);
			stmt.setInt(2, pno);
			rs = stmt.executeQuery();
			if (rs.next()) {
				interaction.setInteractionId(rs.getInt("interaction_id"));
				interaction.setInteractedAt(rs.getTimestamp("interacted_at"));
				interaction.setUserId(rs.getString("user_id"));
				interaction.setPno(rs.getInt("pno"));
				interaction.setLikeStatus(rs.getBoolean("like_status"));
				interaction.setDislikeStatus(rs.getBoolean("dislike_status"));
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
		
		return interaction;
	}
	
	public boolean like(int interactionId) {
		DBcon db = new DBcon();
		Connection conn = null;
		PreparedStatement stmt = null;
		
		boolean result = false;
		try {
			conn = db.getConnection();
			String query = "UPDATE tbl_interaction" + 
					" SET like_status = 1, dislike_status = 0 " +
					" WHERE interaction_id = ?";
			stmt = conn.prepareStatement(query);
			stmt.setInt(1, interactionId);
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
	
	public boolean cancelLike (int interactionId) {
		DBcon db = new DBcon();
		Connection conn = null;
		PreparedStatement stmt = null;
		
		boolean result = false;
		try {
			conn = db.getConnection();
			String query = "UPDATE tbl_interaction" + 
					" SET like_status = 0" +
					" WHERE interaction_id = ?";
			stmt = conn.prepareStatement(query);
			stmt.setInt(1, interactionId);
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
	
	public boolean dislike(int interactionId) {
		DBcon db = new DBcon();
		Connection conn = null;
		PreparedStatement stmt = null;
		
		boolean result = false;
		try {
			conn = db.getConnection();
			String query = "UPDATE tbl_interaction" + 
					" SET like_status = 0, dislike_status = 1" +
					" WHERE interaction_id = ?";
			stmt = conn.prepareStatement(query);
			stmt.setInt(1, interactionId);
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
	
	public boolean canceldislike (int interactionId) {
		DBcon db = new DBcon();
		Connection conn = null;
		PreparedStatement stmt = null;
		
		boolean result = false;
		try {
			conn = db.getConnection();
			String query = "UPDATE tbl_interaction" + 
					" SET dislike_status = 0" +
					" WHERE interaction_id = ?";
			stmt = conn.prepareStatement(query);
			stmt.setInt(1, interactionId);
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
	
	public int getTotalLikeCount(int pno) {
		DBcon db = new DBcon();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		int totalCount = 0;
		try {
			conn = db.getConnection();
			String query = "SELECT SUM(like_status) as total_like FROM tbl_interaction" + 
					" WHERE pno = ?";
			stmt = conn.prepareStatement(query);
			stmt.setInt(1, pno);
			rs = stmt.executeQuery();
			if (rs.next()) {
				totalCount = rs.getInt("total_like");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
				stmt.close();
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return totalCount;
	}
	
	public int getTotalDislikeCount(int pno) {
		DBcon db = new DBcon();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		int totalCount = 0;
		try {
			conn = db.getConnection();
			String query = "SELECT SUM(dislike_status) as total_dislike FROM tbl_interaction" + 
					" WHERE pno = ?";
			stmt = conn.prepareStatement(query);
			stmt.setInt(1, pno);
			rs = stmt.executeQuery();
			if (rs.next()) {
				totalCount = rs.getInt("total_dislike");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
				stmt.close();
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return totalCount;
	}
	
	
}
