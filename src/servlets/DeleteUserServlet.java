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

@WebServlet("/deleteUser")
public class DeleteUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		UserDao dao = UserDao.getInstance();
		UserVO user = (UserVO) session.getAttribute("userInfo");
		String id = user.getId();
		String pw = request.getParameter("pw");
		
		boolean userIsDeleted = dao.deleteUser(id, pw);
		
		if (userIsDeleted) {
			System.out.println("user 정보 삭제 성공");
			response.sendRedirect("home.jsp");
		} else {
			System.out.println("user 정보 삭제 실패");
			response.sendRedirect("myPage.jsp");
		}
	}

}
