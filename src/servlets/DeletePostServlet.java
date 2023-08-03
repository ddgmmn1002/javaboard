package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.CommentDao;
import db.InteractionDao;
import db.PostDao;

@WebServlet("/deletePost")
public class DeletePostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("게시글 삭제 서블릿 호출");
		PostDao postDao = PostDao.getInstance();
		String pno = request.getParameter("pno");
		
		boolean postIsDeleted = postDao.deletePost(Integer.parseInt(pno));
		if (postIsDeleted) {
			response.sendRedirect("postList");
		} else {
			System.out.println("삭제 실패");
			response.sendRedirect("postDetail?pno=" + pno);
		}
	}
}
