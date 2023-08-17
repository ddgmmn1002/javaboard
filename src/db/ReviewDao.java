package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ReviewDao {
	
	private static ReviewDao instance = null;
	private ReviewDao(){};
	public static ReviewDao getInstance() {
		if (instance == null) {
			instance = new ReviewDao();
		}
		return instance;
	}
	
	public boolean insertReview(int vno, String userId) {
		DBcon db = new DBcon();
		Connection conn = null;
		PreparedStatement stmt = null;
		boolean result = false;
		try {
			conn = db.getConnection();
			String query = "INSERT INTO tbl_reviews (vno, user_id)"
					+ " VALUES (?, ?)";
			stmt = conn.prepareStatement(query);
			stmt.setInt(1, vno);
			stmt.setString(2, userId);
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
