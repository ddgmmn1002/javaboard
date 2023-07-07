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

@WebServlet("/signIn")
public class SignInServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserDao dao = UserDao.getInstance();
		HttpSession session = request.getSession();
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		UserVO user = dao.signIn(id, pw);
		
		if(user.getId() == null) {
			session.setAttribute("signInFail", true);
			response.sendRedirect("signInForm.jsp");
		} else {
			session.setAttribute("userInfo", user);
			response.sendRedirect("postList");
		}
	}

}
