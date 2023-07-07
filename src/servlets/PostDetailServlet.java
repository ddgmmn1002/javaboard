package servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.CommentDao;
import db.PostDao;
import vo.CommentVO;
import vo.PostVO;

@WebServlet("/postDetail")
public class PostDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PostDao postDao = PostDao.getInstance();
		CommentDao commentDao = CommentDao.getInstance();
		String _pno = request.getParameter("pno");
		int pno = Integer.parseInt(_pno);
		
		PostVO post = postDao.selectPostOne(pno);
		ArrayList<CommentVO> commentList = commentDao.selectCommentList(pno);
		
		request.setAttribute("post", post);
		request.setAttribute("commentList", commentList);
		request.getRequestDispatcher("postDetail.jsp").forward(request, response);
	}
}
