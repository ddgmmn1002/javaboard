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
import service.IpAddress;
import vo.CommentVO;
import vo.InteractionVO;
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
		
		int pno = Integer.parseInt(request.getParameter("pno"));
		UserVO user = (UserVO)session.getAttribute("userInfo");
		String userId = "";
		
		boolean isInteracted = false;
		if (user != null) {
			userId = user.getId();
			if (interactionDao.isAlreadyViewed(pno, userId)) {
				isInteracted = true;
				System.out.println("이미 조회수에 집계된 계정");
			} else {
				isInteracted = interactionDao.insertInteraction(pno, userId);
				System.out.println("회원 조회 이력 등록");
			}
			
		} else {
			String addr = IpAddress.getAddress(request);
			if (interactionDao.isAlreadyViewedWithIp(pno, addr)) {
				System.out.println("이미 조회수에 집계된 IP주소");
			} else {
				interactionDao.insertInteractionWithIp(pno, addr);
				System.out.println("비회원 조회 이력 등록");
			}
		}
		
		if (isInteracted) {
			InteractionVO interaction = interactionDao.selectInteractionOne(userId, pno);
			request.setAttribute("interaction", interaction);
		}
		
		PostVO post = postDao.selectPostOne(pno);
		ArrayList<CommentVO> commentList = commentDao.selectCommentList(pno);
		
		request.setAttribute("post", post);
		request.setAttribute("commentList", commentList);
		request.getRequestDispatcher("postDetail.jsp").forward(request, response);
	}
}
