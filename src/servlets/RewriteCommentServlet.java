package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import db.CommentDao;
import vo.CommentVO;

@WebServlet("/rewriteComment")
public class RewriteCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		CommentDao dao = CommentDao.getInstance();
		String cno = request.getParameter("cno");
		
		CommentVO comment = dao.selectCommentOne(Integer.parseInt(cno));
		
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("cno", comment.getCno());
		jsonObj.put("updated_at", comment.getUpdatedAt());
		jsonObj.put("content", comment.getContent());
		
		System.out.println(jsonObj.toString());
		out.print(jsonObj.toString());
	}

}
