package servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.UserDao;
import service.Paging;
import vo.UserVO;

@WebServlet("/userList")
public class UserListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserDao dao = UserDao.getInstance();
		int currentPage = 1;
		String currentPageStr = request.getParameter("page");
		
		if (currentPageStr != null) {
			try {
				currentPage = Integer.parseInt(currentPageStr);
			} catch (Exception e) {
				currentPage = 1;
			}
		}
				
		Paging paging = new Paging(10, currentPage, dao.userListTotalRow());
				
		ArrayList<UserVO> userList = dao.selectUserListByPage(paging.getStartRow(), paging.getPageSize());
				
		request.setAttribute("userList", userList);
		request.setAttribute("paging", paging);
		request.getRequestDispatcher("userList.jsp").forward(request, response);
	}
}
