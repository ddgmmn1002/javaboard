package servlets;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import db.UserDao;
import vo.UserVO;

@WebServlet("/signUp")
public class SignUpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		UserDao dao = UserDao.getInstance();
		
		String name = request.getParameter("name");
		String birthDate = String.join("-", request.getParameterValues("birth"));
		String phone = String.join("-", request.getParameterValues("phone"));
		String email = String.join("@", request.getParameterValues("email"));
		String gender = request.getParameter("gender");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String nickname = request.getParameter("nickname");
		
		UserVO user = new UserVO();
		user.setName(name);
		user.setBirthDate(Date.valueOf(birthDate));
		user.setPhone(phone);
		user.setEmail(email);
		user.setGender(gender);
		user.setId(id);
		user.setPw(pw);
		user.setNickname(nickname);
		
		boolean signupSuccess = dao.signUp(user);
		if (signupSuccess) {
			session.setAttribute("userInfo", dao.signIn(id, pw));
			response.sendRedirect("home.jsp");
		} else {
			request.getRequestDispatcher("signUpForm.jsp").forward(request, response);
		}
	}
}
