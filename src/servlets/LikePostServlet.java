package servlets;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import db.InteractionDao;
import vo.InteractionVO;
import vo.UserVO;

@WebServlet("/likePost")
public class LikePostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BufferedReader br = request.getReader();
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		InteractionDao dao = InteractionDao.getInstance();
		
		JSONObject reqData = new JSONObject(br.readLine());
		
		boolean isLike = reqData.getBoolean("isLike");
		int pno = reqData.getInt("pno");
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
		
		interaction = dao.selectInteractionOne(userId, pno);
		JSONObject interactionJson = new JSONObject();
		interactionJson.put("likeStatus", interaction.isLikeStatus());
		interactionJson.put("dislikeStatus", interaction.isDislikeStatus());
		
		int totalLikeCount = dao.getTotalLikeCount(pno);
		int totalDislikeCount = dao.getTotalDislikeCount(pno);
		
		JSONObject resData = new JSONObject();
		resData.put("userInteraction", interactionJson.toString());
        resData.put("totalLikeCount", totalLikeCount);
        resData.put("totalDislikeCount", totalDislikeCount);
        
        out.print(resData.toString());
        out.flush();
		out.close();
	}

}
