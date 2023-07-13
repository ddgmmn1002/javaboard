package servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import db.CommentDao;
import db.InteractionDao;
import db.PostDao;
import vo.CommentVO;
import vo.PostVO;
import vo.UserVO;

@WebServlet("/postDetail")
public class PostDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		PostDao postDao = PostDao.getInstance();
		CommentDao commentDao = CommentDao.getInstance();
		InteractionDao interactionDao = InteractionDao.getInstance();
		
		String _pno = request.getParameter("pno");
		int pno = Integer.parseInt(_pno);
		UserVO user = (UserVO)session.getAttribute("userInfo");
		String userId = "";
		
		if (user != null) {
			userId = user.getId();
			if (interactionDao.isAlreadyViewed(pno, userId)) {
				System.out.println("이미 조회수에 집계된 계정");
			} else {
				boolean isInteracted = interactionDao.insertInteraction(pno, userId);
				System.out.println("조회 이력 등록됨");
			}
		}
		
		
		PostVO post = postDao.selectPostOne(pno);
		ArrayList<CommentVO> commentList = commentDao.selectCommentList(pno);
		
		request.setAttribute("post", post);
		request.setAttribute("commentList", commentList);
		request.getRequestDispatcher("postDetail.jsp").forward(request, response);
	}
}
