package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import db.CommentDao;
import vo.UserVO;

@WebServlet("/insertComment")
public class InsertCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CommentDao dao = CommentDao.getInstance();
		HttpSession session = request.getSession();
		
		String content = request.getParameter("content");
		String pno = request.getParameter("pno");
		UserVO user = (UserVO)session.getAttribute("userInfo");
		String userId = user.getId();


		if (dao.insertComment(Integer.parseInt(pno), userId, content)) {
			System.out.println("댓글 삽입 성공");
		} else {
			System.out.println("댓글 삽입 실패");
		}
		
		response.sendRedirect("postDetail?pno="+pno);			
	}
	
}
