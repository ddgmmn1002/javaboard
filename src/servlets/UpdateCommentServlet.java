package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.CommentDao;

@WebServlet("/updateComment")
public class UpdateCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CommentDao dao = CommentDao.getInstance();
		
		String cno = request.getParameter("cno");
		String content = request.getParameter("content");
		
		System.out.println(Integer.parseInt(cno));
		System.out.println(content);
		
		boolean commentIsUpdated = dao.updateComment(Integer.parseInt(cno), content);
		
		if (commentIsUpdated) {
			System.out.println("댓글 업데이트 성공");
		} else {
			System.out.println("댓글 업데이트 실패");
		}
	}

}
