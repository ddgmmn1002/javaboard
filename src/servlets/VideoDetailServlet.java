package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.VideoDao;
import vo.VideoVO;

@WebServlet("/videoDetail")
public class VideoDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String vno = request.getParameter("vno");
		
		VideoDao dao = VideoDao.getInstance();
		
		VideoVO video = dao.selectOne(Integer.parseInt(vno));
		
		request.setAttribute("video", video);
		request.getRequestDispatcher("videoDetail.jsp").forward(request, response);
	}
}
