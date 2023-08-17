package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import db.ReviewDao;
import db.VideoDao;
import vo.UserVO;
import vo.VideoVO;

@WebServlet("/videoDetail")
public class VideoDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		int vno = Integer.parseInt(request.getParameter("vno"));
		UserVO user = (UserVO) session.getAttribute("userInfo");
		String userId = null;
		if (user != null ) {
			userId = user.getId();
		}
		
		VideoDao videoDao = VideoDao.getInstance();
		ReviewDao reviewDao = ReviewDao.getInstance();
		
		VideoVO video = videoDao.selectOne(vno);
		
		if (reviewDao.insertReview(vno, userId)) {
			System.out.println("리뷰 데이터 생성 성공");
		} else {
			System.out.println("리뷰 데이터 생성 실패");
		}
		
		request.setAttribute("video", video);
		request.getRequestDispatcher("videoDetail.jsp").forward(request, response);
	}
}
