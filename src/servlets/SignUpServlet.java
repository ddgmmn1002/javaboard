package servlets;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.UserDao;
import vo.UserVO;

@WebServlet("/signUp")
public class SignUpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserDao dao = UserDao.getInstance();
		
		String name = request.getParameter("name");
		String[] _birthDate = request.getParameterValues("birth");
		String birthDate = _birthDate[0] + "-" + _birthDate[1] + "-" + _birthDate[2];
		String country = request.getParameter("country");
		String[] _phone = request.getParameterValues("phone");
		String phone = _phone[0] + "-" + _phone[1] + "-" + _phone[2];
		String[] _email = request.getParameterValues("email");
		String email = _email[0] + _email[1];
		String gender = request.getParameter("gender");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String nickname = request.getParameter("nickname");
		
		UserVO user = new UserVO();
		user.setName(name);
		user.setBirth_date(Date.valueOf(birthDate));
		user.setCountry(country);
		user.setPhone(phone);
		user.setEmail(email);
		user.setGender(gender);
		user.setId(id);
		user.setPw(pw);
		user.setNickname(nickname);
		
		boolean signupSuccess = dao.signUp(user);
		if (signupSuccess) {
			response.sendRedirect("signInForm.jsp");
		} else {
			request.getRequestDispatcher("signUpForm.jsp").forward(request, response);
		}
	}
}
