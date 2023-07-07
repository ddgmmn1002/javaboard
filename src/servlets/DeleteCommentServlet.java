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
		
		String _cno = request.getParameter("cno");
		String _pno = request.getParameter("pno");
		int cno = Integer.parseInt(_cno);
		
		if (dao.deleteCommentOne(cno)) {
			System.out.println("삭제 성공");
		} else {
			System.out.println("삭제 실패");
		}
		
		request.getRequestDispatcher("postDetail?pno=" + _pno).forward(request, response);
	}
}
