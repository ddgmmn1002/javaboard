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
import vo.InteractionVO;
import vo.PostVO;
import vo.UserVO;

@WebServlet("/history")
public class HistoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PostDao postDao = PostDao.getInstance();
		CommentDao commentDao = CommentDao.getInstance();
		InteractionDao interactionDao = InteractionDao.getInstance();
		
		HttpSession session = request.getSession();
		UserVO user = (UserVO) session.getAttribute("userInfo");
		String userId = user.getId();
		
		ArrayList<PostVO> postList =  postDao.selectPostListById(userId);
		ArrayList<CommentVO> commentList = commentDao.selectCommentListById(userId);
		ArrayList<InteractionVO> interactionList = interactionDao.selectInteractionList(userId);
		
		request.setAttribute("postList", postList);
		request.setAttribute("commentList", commentList);
		request.setAttribute("interactionList", interactionList);
		
		request.getRequestDispatcher("history.jsp").forward(request, response);
	}

}
