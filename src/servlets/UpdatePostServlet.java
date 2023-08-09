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
		
		String pno = request.getParameter("pno");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		boolean postIsUpdated = dao.updatePost(Integer.parseInt(pno), title, content);
		if (postIsUpdated) {
			response.sendRedirect("postDetail?pno="+pno);
		} else {
			response.sendRedirect("postList");			
		}
		
	}
	
}
