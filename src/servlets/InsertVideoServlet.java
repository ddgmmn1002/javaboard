package servlets;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.VideoDao;
import vo.VideoVO;

@WebServlet("/registVideo")
public class InsertVideoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("새 영상 정보 서블릿 호출");
		VideoDao dao = VideoDao.getInstance();
		
		String title = request.getParameter("title");
		String genre = String.join(" ", request.getParameterValues("genre"));
		System.out.println(genre);
		String director = request.getParameter("director");
		String cast = request.getParameter("cast");
		String poster = request.getParameter("poster_link");
		String trailer = request.getParameter("trailer_link");
		String plot = request.getParameter("plot");
		String releaseDate = String.join("-", request.getParameterValues("release_date"));
		String runtime = request.getParameter("runtime");
		String filmRating = request.getParameter("film-rating");
		String country = request.getParameter("country");
		String language = request.getParameter("language");
		String category = request.getParameter("category");
		
		
		
		VideoVO video = new VideoVO();
		video.setTitle(title);
		video.setGenre(genre);
		video.setDirector(director);
		video.setCast(cast);
		video.setPoster(poster);
		video.setTrailer(trailer);
		video.setPlot(plot);
		video.setReleaseDate(Date.valueOf(releaseDate));
		video.setRuntime(Integer.parseInt(runtime));
		video.setFilmRating(filmRating);
		video.setCountry(country);
		video.setLanguage(language);
		video.setCategory(category);
		
		
		boolean isInsertedVideo = dao.insertVideoInfo(video);
		
		if (isInsertedVideo) {
			System.out.println("영상 정보 등록 완료");
			response.sendRedirect("videoList");
		} else {
			System.out.println("영상 정보 등록 실패");
			response.sendRedirect("videoForm");
		}
	}
}
