package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.CommentDao;

@WebServlet("/deleteComment")
public class DeleteCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CommentDao dao = CommentDao.getInstance();
		
		String cno = request.getParameter("cno");
		String pno = request.getParameter("pno");
		
		if (dao.deleteCommentOne(Integer.parseInt(cno))) {
			System.out.println("삭제 성공");
		} else {
			System.out.println("삭제 실패");
		}
		
		request.getRequestDispatcher("postDetail?pno=" + pno).forward(request, response);
	}
}
