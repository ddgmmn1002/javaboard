package servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.VideoDao;
import vo.VideoVO;

@WebServlet("/prepareInsertPost")
public class PrepareInsertPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		VideoDao dao = VideoDao.getInstance();
		
		ArrayList<VideoVO> videos = dao.selectList();
		
		request.setAttribute("videos", videos);
		
		request.getRequestDispatcher("postForm.jsp").forward(request, response);
	}
}
