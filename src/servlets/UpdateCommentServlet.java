package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import db.CommentDao;

@WebServlet("/updateComment")
public class UpdateCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CommentDao dao = CommentDao.getInstance();
		
        ObjectMapper objectMapper = new ObjectMapper();
        JsonNode jsonNode = objectMapper.readTree(request.getInputStream());

        int cno = jsonNode.get("cno").asInt();
        String content = jsonNode.get("content").asText();
        System.out.println(cno);
        System.out.println(content);
        
        boolean commentIsUpdated = dao.updateComment(cno, content);

		if (commentIsUpdated) { System.out.println("댓글 업데이트 성공"); }
		else {System.out.println("댓글 업데이트 실패"); }
	}

}
