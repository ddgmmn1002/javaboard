package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.PostDao;


@WebServlet("/updatePost")
public class UpdatePostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PostDao dao = PostDao.getInstance();
		
		String _pno = request.getParameter("pno");
		int pno = Integer.parseInt(_pno);
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String poster = request.getParameter("poster");
		String trailer = request.getParameter("trailer");
		
		boolean postIsUpdated = dao.updatePost(pno, title, content, poster, trailer);
		if (postIsUpdated) {
			response.sendRedirect("postDetail?pno="+pno);
		} else {
			response.sendRedirect("postList");			
		}
		
	}
	
}
