package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.VideoDao;
import vo.VideoVO;

@WebServlet("/prepareUpdateVideo")
public class PrepareUpdateVideoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("영상 수정 서블릿 호출");
		VideoDao dao = VideoDao.getInstance();
		
		int vno = Integer.parseInt(request.getParameter("vno"));
		
		VideoVO video = dao.selectOne(vno);
	}

}
