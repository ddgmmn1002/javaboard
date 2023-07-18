package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import db.UserDao;
import vo.UserVO;

@WebServlet("/updateUser")
public class UpdateUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		UserDao dao = UserDao.getInstance();
		
		UserVO user = (UserVO) session.getAttribute("userInfo");
		String id = user.getId();
		String[] _phone = request.getParameterValues("phone");
		String phone = _phone[0] + "-" + _phone[1] + "-" + _phone[2];
		String[] _email = request.getParameterValues("email");
		String email = _email[0] + _email[1];
		String password = request.getParameter("pw");
		String nickname = request.getParameter("nickname");
		
		boolean userIsUpdated = dao.updateUser(phone, email, password, nickname, id);
		
		if (userIsUpdated) {
			System.out.println("user 정보 업데이트 성공");
			response.sendRedirect("home.jsp");
		} else {
			System.out.println("user 정보 업데이트 실패");
			response.sendRedirect("home.jsp");
		}
	}
	
}
