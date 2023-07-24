package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import db.PostDao;
import vo.PostVO;
import vo.UserVO;

@WebServlet("/insertPost")
public class InsertPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		UserVO user = (UserVO)session.getAttribute("userInfo");
		PostDao dao = PostDao.getInstance();
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String trailer = request.getParameter("trailer");
		String userId = user.getId();
		
		PostVO post = new PostVO();
		post.setUser_id(userId);
		post.setTitle(title);
		post.setContent(content);
		post.setTrailer(trailer);
		
		boolean postIsInserted = dao.insertPost(post);
		
		if (postIsInserted) {
			int pno = dao.findPno(userId, title);
			response.sendRedirect("postDetail?pno=" + pno);
		} else {
			response.sendRedirect("postList");
		}
		
	}
}
