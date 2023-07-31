package servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.PostDao;
import db.VideoDao;
import vo.PostVO;
import vo.VideoVO;

@WebServlet("/videoList")
public class VideoListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		VideoDao dao = VideoDao.getInstance();
		
		ArrayList<VideoVO> list = dao.selectList();
		
		request.setAttribute("list", list);
		request.getRequestDispatcher("videoList.jsp").forward(request, response);;
	}

}
