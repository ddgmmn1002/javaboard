package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import db.InteractionDao;
import vo.InteractionVO;
import vo.UserVO;

@WebServlet("/likePost")
public class LikePostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		InteractionDao dao = InteractionDao.getInstance();
		
		boolean isLike = Boolean.parseBoolean(request.getParameter("isLike"));
		int pno = Integer.parseInt(request.getParameter("pno"));
		UserVO user = (UserVO) session.getAttribute("userInfo");
		String userId = user.getId();
		
		InteractionVO interaction = dao.selectInteractionOne(userId, pno);
		int interactionId = interaction.getInteractionId();
		
		if (isLike) {
			if (interaction.isLikeStatus()) {
				dao.cancelLike(interactionId);
			} else {
				dao.like(interactionId);
			}
			
		} else {
			if (interaction.isDislikeStatus()) {
				dao.canceldislike(interactionId);
			} else {
				dao.dislike(interactionId);
			}
		}
		
		
		int totalLikeCount = dao.getTotalLikeCount(pno);
		int totalDislikeCount = dao.getTotalDislikeCount(pno);
		out.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
