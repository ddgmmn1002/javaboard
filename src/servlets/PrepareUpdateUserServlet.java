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

@WebServlet("/prepareUpdateUser")
public class PrepareUpdateUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserDao dao = UserDao.getInstance();
		
		HttpSession session = request.getSession();
		
		UserVO user = (UserVO)session.getAttribute("userInfo");
		
		System.out.println(user);
	}
	
}
