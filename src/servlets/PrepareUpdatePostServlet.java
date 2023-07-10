package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.PostDao;
import vo.PostVO;

@WebServlet("/prepareUpdatePost")
public class PrepareUpdatePostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PostDao dao = PostDao.getInstance();
		
		String _pno = request.getParameter("pno");
		int pno = Integer.parseInt(_pno);
		
		PostVO post = dao.selectPostOne(pno);
		
		request.setAttribute("post", post);
		request.getRequestDispatcher("updatePostForm.jsp").forward(request, response);
	}
}
