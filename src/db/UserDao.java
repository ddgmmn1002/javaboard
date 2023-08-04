package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

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
					+ " VALUES (?, ?, ?, ?, ?, ?, ?, ?, CURDATE(), ?, 'regular')";
			stmt = conn.prepareStatement(query);
			stmt.setString(1, user.getId());
			stmt.setString(2, user.getPw());
			stmt.setString(3, user.getName());
			stmt.setDate(4, user.getBirthDate());
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
				user.setBirthDate(rs.getDate("birth_date"));
				user.setCountry(rs.getString("country"));
				user.setPhone(rs.getString("phone"));
				user.setEmail(rs.getString("email"));
				user.setGender(rs.getString("gender"));
				user.setSignupDate(rs.getDate("signup_date"));
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
	
	public boolean updateUser(String phone, String email, String pw, String nickname, String id) {
		boolean result = false;
		DBcon db = new DBcon();
		
		Connection conn = null;
		PreparedStatement stmt = null;
		try {
			conn = db.getConnection();
			String query = "UPDATE tbl_user"
					+ " SET phone = ?, email = ?, user_pw = ?, nickname = ?"
					+ " WHERE user_id = ?";
			stmt = conn.prepareStatement(query);
			stmt.setString(1, phone);
			stmt.setString(2, email);
			stmt.setString(3, pw);
			stmt.setString(4, nickname);
			stmt.setString(5, id);
			if (stmt.executeUpdate() == 1) {
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public boolean deleteUser(String id, String pw) {
		boolean result = false;
		DBcon db = new DBcon();
		
		Connection conn = null;
		PreparedStatement stmt = null;
		try {
			conn = db.getConnection();
			String query = "DELETE FROM tbl_user WHERE user_id = ? AND user_pw = ?";
			stmt = conn.prepareStatement(query);
			stmt.setString(1, id);
			stmt.setString(2, pw);
			if (stmt.executeUpdate() == 1) {
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public ArrayList<UserVO> selectUserListByPage(int start, int count){
		DBcon db = new DBcon();
		
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		ArrayList<UserVO> userList = new ArrayList<>();
		try {
			conn = db.getConnection();
			String query = "SELECT user_id, nickname, name, grade, signup_date" + 
					" FROM tbl_user" + 
					" WHERE grade != 'admin'" + 
					" ORDER BY signup_date DESC" + 
					" LIMIT ?, ?";
			stmt = conn.prepareStatement(query);
			stmt.setInt(1, start);
			stmt.setInt(2, count);
			rs = stmt.executeQuery();
			while (rs.next()) {
				UserVO user = new UserVO();
				user.setId(rs.getString("user_id"));
				user.setName(rs.getString("name"));
				user.setSignupDate(rs.getDate("signup_date"));
				user.setNickname(rs.getString("nickname"));
				user.setGrade(rs.getString("grade"));
				
				userList.add(user);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				stmt.close();
				rs.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return userList;
		
	}
	
	public int userListTotalRow(){
		int totalRow = 0;
		DBcon db = new DBcon();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			conn = db.getConnection();
			String query = "SELECT COUNT(*) as totalRow FROM tbl_user WHERE grade != 'admin'";
			stmt = conn.prepareStatement(query);
			rs = stmt.executeQuery();
			if (rs.next()) {
				totalRow = rs.getInt("totalRow");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				stmt.close();
				rs.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return totalRow;
	}
	
	public UserVO selectUserOne(String userId) {
		DBcon db = new DBcon();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		UserVO user = new UserVO();
		try {
			conn = db.getConnection();
			String query = "SELECT user_id, name, birth_date, country, phone, email, gender, signup_date, nickname, grade" + 
			" FROM tbl_user" +
			" WHERE user_id = ?";
			stmt = conn.prepareStatement(query);
			stmt.setString(1, userId);
			rs = stmt.executeQuery();
			if (rs.next()) {
				user.setId(rs.getString("user_id"));
				user.setName(rs.getString("name"));
				user.setBirthDate(rs.getDate("birth_date"));
				user.setCountry(rs.getString("country"));
				user.setPhone(rs.getString("phone"));
				user.setEmail(rs.getString("email"));
				user.setGender(rs.getString("gender"));
				user.setSignupDate(rs.getDate("signup_date"));
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
	
}