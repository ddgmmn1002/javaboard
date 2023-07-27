package servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.PostDao;
import vo.PostVO;

@WebServlet("/postList")
public class PostListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PostDao dao = PostDao.getInstance();
		
		ArrayList<PostVO> list = dao.selectPostListByPage(0, 10);
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("postList.jsp").forward(request, response);
	}
}
