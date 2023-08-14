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

@WebServlet("/adminUpdateUser")
public class AdminUpdateUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserDao dao = UserDao.getInstance();
		
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String birth = request.getParameter("birth");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String gender = request.getParameter("gender");
		String signupDate = request.getParameter("signupdate");
		String nickname = request.getParameter("nickname");
		String grade = request.getParameter("grade");
		String blocked = request.getParameter("blocked");
		
		UserVO user = new UserVO();
		user.setId(id);
		user.setName(name);
		user.setBirthDate(Date.valueOf(birth));
		user.setPhone(phone);
		user.setEmail(email);
		user.setGender(gender);
		user.setSignupDate(Date.valueOf(signupDate));
		user.setNickname(nickname);
		user.setGrade(grade);
		if (Boolean.parseBoolean(blocked)) {
			user.setBlocked(true);
		} else {
			user.setBlocked(false);
		}
		
		boolean updateSuccess = dao.updateUserByAdmin(user);
		
		if (updateSuccess) {
			System.out.println("유저 정보 수정 성공 (관리자 권한)");
			response.sendRedirect("userDetail?id=" + id);
		} else {
			System.out.println("유저 정보 수정 실패 (관리자 권한)");
			request.getRequestDispatcher("userDetail").forward(request, response);
			response.sendRedirect("userDetail?id=" + id);
		}
	}

}
