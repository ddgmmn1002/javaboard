<%@page import="java.sql.Timestamp"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.If"%>
<%@page import="vo.CommentVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.UserVO"%>
<%@page import="vo.PostVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/jquery-3.7.0.js"></script>
</head>
<body>
	<div>
		<h1>${post.getTitle() }</h1>
		<h3>작성자: ${post.getNickname() }</h3>
		<p>${post.getContent()}</p>
	
		<core:if test="${not empty userInfo}">
			<core:if test="${userInfo.getId().equals(post.getWriter()) }">				
				<a href="prepareUpdatePost?pno=${post.getPno() }">수정</a>
				<a href="deletePost?pno=${post.getPno() }">삭제</a>		
			</core:if>
		</core:if>
		
		<core:if test="${not empty userInfo }">
			<div>
				<form action="insertComment" method="post">
					<input type="hidden" name="pno" value="${post.getPno() }">
					<input type="text" name="content" placeholder="댓글 작성">
					<button type="submit">댓글 추가</button>
				</form>
			</div>			
		</core:if>

		<core:if test="${commentList.size() ne 0 }">
			<core:forEach var="comment" items="${commentList }" varStatus="status">
				<div id="comment-${status.index + 1}">
					<span>${comment.getCno() }</span>
					<span>
						[${comment.getNickname()}]
						<core:if test="${comment.getWriter() eq post.getWriter()}">
							<span>(작성자)</span>
						</core:if>
					</span>
					<span>${comment.getContent()}</span>
					<core:choose>
						<core:when test="${not empty comment.getUpdated_at() }">
							<span>${comment.getUpdated_at() }</span>
							<span>(수정됨)</span>
						</core:when>
						<core:otherwise>
							<span>${comment.getCreated_at() }</span>
						</core:otherwise>
					</core:choose>
					<core:choose>
						<core:when test="${comment.getWriter() eq userInfo.getId() }">
							<span class="update-comment">수정</span>
							<span><a href="deleteComment?cno=${comment.getCno() }&pno=${post.getPno() }">삭제</a></span>						
						</core:when>
					</core:choose>
				</div>
			</core:forEach>			
		</core:if>
	</div>
<script>
	$('.update-comment').on('click', function(event){
		const cno = $(event.target).siblings()[0].innerText;
		const content = $(event.target).siblings()[2].innerText;

		if ($("#update-form").length) {	        
			$("#update-form").remove();
		} else {
	        const updateDiv = $("<div>").prop("id", "update-form")
	        const updateInput = $("<input>").attr("type", "text").val(content);
	        const updateButton = $("<button>")
	        	.text("확인")
	        	.click(function(event){
	        		const updateContent = $(event.target).siblings()[0].value;
	                $.ajax({
	                	url: "updateComment",
	                	type: "post",
	                	data: {
	                    	cno: cno,	
	                    	content: updateContent,
	                	},
	                	success: function () {
	                		updateDiv.parent().children()[2].innerText = updateContent;
	                		updateDiv.remove();
	                	},
	        		});
	        	});
	        const cancelButton = $("<button>")
	        	.text("취소")
	        	.click(function(event){
	        		updateDiv.remove();
	        	});
	        
	        updateDiv.append(updateInput);
	        updateDiv.append(updateButton);
	        updateDiv.append(cancelButton);
	        $(this).parent().append(updateDiv);
		}
	});
</script>
</body>
</html>