package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import vo.UserVO;

public class UserDao {
	
	private static UserDao instance = null;
	private UserDao() {}
	public static UserDao getInstance() {
		if (instance == null) {
			instance = new UserDao();
		}
		return instance;
	}
	//singleton
	
	public boolean signUp(UserVO user) {
		DBcon db = new DBcon();
		
		Connection conn = null;
		PreparedStatement stmt = null;
		boolean result = false;
		try {
			conn = db.getConnection();
			String query = "INSERT INTO tbl_user"
					+ " (user_id, user_pw, name, birth_date, country, phone, email, gender, signup_date, nickname, grade)"
					+ " VALUES (?, ?, ?, ?, ?, ?, ?, ?, CURDATE(), ?, 'green')";
			stmt = conn.prepareStatement(query);
			stmt.setString(1, user.getId());
			stmt.setString(2, user.getPw());
			stmt.setString(3, user.getName());
			stmt.setDate(4, user.getBirth_date());
			stmt.setString(5, user.getCountry());
			stmt.setString(6, user.getPhone());
			stmt.setString(7, user.getEmail());
			stmt.setString(8, user.getGender());
			stmt.setString(9, user.getNickname());
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
	
	public UserVO signIn(String id, String pw) {
		DBcon db = new DBcon();
		
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		UserVO user = new UserVO();
		
		try {
			conn = db.getConnection();
			String query = "SELECT * FROM tbl_user WHERE user_id = ? AND user_pw = ?";
			stmt = conn.prepareStatement(query);
			stmt.setString(1, id);
			stmt.setString(2, pw);
			rs = stmt.executeQuery();
			
			if (rs.next()) {
				user.setId(id);
				user.setPw(pw);
				user.setName(rs.getString("name"));
				user.setBirth_date(rs.getDate("birth_date"));
				user.setCountry(rs.getString("country"));
				user.setPhone(rs.getString("phone"));
				user.setEmail(rs.getString("email"));
				user.setGender(rs.getString("gender"));
				user.setSignup_date(rs.getDate("signup_date"));
				user.setNickname(rs.getString("nickname"));
				user.setGrade(rs.getString("grade"));
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
		
		
		return user;
	}
	
	public boolean idDuplicateCheck(String id) {
		DBcon db = new DBcon();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			conn = db.getConnection();
			String query = "SELECT * FROM tbl_user WHERE user_id = ?";
			stmt = conn.prepareStatement(query);
			stmt.setString(1, id);
			rs = stmt.executeQuery();
			if (rs.next()) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				rs.close();
				stmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return false;
	}
}