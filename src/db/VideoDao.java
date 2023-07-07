package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.VideoVO;

public class VideoDao {
	
	//singleton
	private static VideoDao instance = null;
	private VideoDao() {}
	public static VideoDao getInstance() {
		if (instance == null) {
			instance = new VideoDao();
		}
		return instance;
	}
	
	public boolean insertVideoInfo(VideoVO video){
		DBcon db = new DBcon();
		Connection conn = null;
		PreparedStatement stmt = null;
		boolean result = false;
		
		try {
			conn = db.getConnection();
			String query = "INSERT INTO tbl_video "
					+ "(title, genre, director, cast, plot, release_date, runtime, film_rating, country, language, image, category, episodes_count, series) "
					+ "VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			stmt = conn.prepareStatement(query);
			stmt.setString(1, video.getTitle());
			stmt.setString(2, String.join(", ", video.getGenre()));
			stmt.setString(3, video.getDirector());
			stmt.setString(4, String.join(", ", video.getCast()));
			stmt.setString(5, video.getPlot());
			stmt.setDate(6, video.getRelease_date());
			stmt.setInt(7, video.getRuntime());
			stmt.setString(8, video.getFilm_rating());
			stmt.setString(9, video.getCountry());
			stmt.setString(10, String.join(", ", video.getLanguage()));
			stmt.setNString(11, video.getImage());
			stmt.setString(12, String.join(", ", video.getCategory()));
			stmt.setInt(13, video.getEpisodes_count());
			stmt.setString(14, String.join(", ", video.getSeries()));
			
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
	
	public ArrayList<VideoVO> selectList() {
		DBcon db = new DBcon();
		ArrayList<VideoVO> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			conn = db.getConnection();
			String query = "SELECT * FROM tbl_video";
			stmt = conn.prepareStatement(query);
			rs = stmt.executeQuery();
			while (rs.next()) {
				VideoVO video = new VideoVO();
				video.setVno(rs.getInt("vno"));
				video.setTitle(rs.getString("title"));
				video.setGenre(rs.getString("genre").split(", "));
				video.setDirector(rs.getString("director"));
				video.setCast(rs.getString("cast").split(", "));
				video.setPlot(rs.getString("plot"));
				video.setRelease_date(rs.getDate("release_date"));
				video.setRuntime(rs.getInt("runtime"));
				video.setFilm_rating(rs.getString("film_rating"));
				video.setCountry(rs.getString("country"));
				video.setLanguage(rs.getString("language").split(", "));
				video.setImage(rs.getString("image"));
				video.setCategory(rs.getString("category").split(", "));
				video.setEpisodes_count(rs.getInt("episodes_count"));
				video.setSeries(rs.getString("series").split(", "));
				
				list.add(video);
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
	
	public VideoVO selectOne(int vno) {
		DBcon db = new DBcon();
		VideoVO video = new VideoVO();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			conn = db.getConnection();
			String query = "SELECT * FROM tbl_video WHERE vno = ?";
			stmt = conn.prepareStatement(query);
			stmt.setInt(1, vno);
			rs = stmt.executeQuery();
			rs.next();
			
			video.setVno(rs.getInt("vno"));
			video.setTitle(rs.getString("title"));
			video.setGenre(rs.getString("genre").split(", "));
			video.setDirector(rs.getString("director"));
			video.setCast(rs.getString("cast").split(", "));
			video.setPlot(rs.getString("plot"));
			video.setRelease_date(rs.getDate("release_date"));
			video.setRuntime(rs.getInt("runtime"));
			video.setFilm_rating(rs.getString("film_rating"));
			video.setCountry(rs.getString("country"));
			video.setLanguage(rs.getString("language").split(", "));
			video.setImage(rs.getString("image"));
			video.setCategory(rs.getString("category").split(", "));
			video.setEpisodes_count(rs.getInt("episodes_count"));
			video.setSeries(rs.getString("series").split(", "));
			
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
		
		return video;
	}
}
