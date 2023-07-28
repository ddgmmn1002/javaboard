package servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.PostDao;
import service.Paging;
import vo.PostVO;

@WebServlet("/postList")
public class PostListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PostDao dao = PostDao.getInstance();
		String currentPageStr = request.getParameter("page");
		int currentPage = 1;
		
		if (currentPageStr != null) {
			try {
				currentPage = Integer.parseInt(currentPageStr);
			} catch (Exception e) {
				currentPage = 1;
			}
		}
		
		Paging paging = new Paging(currentPage, dao.countTotalRow());
		
		ArrayList<PostVO> list = dao.selectPostListByPage(paging.getStartRow(), paging.getPageSize());
		
		request.setAttribute("list", list);
		request.setAttribute("paging", paging);
		request.getRequestDispatcher("postList.jsp").forward(request, response);
	}
}
