<%@page import="vo.PostVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 목록</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="container shadow p-3 mb-5 bg-body rounded">
	<core:if test="${not empty userInfo }">
		<a class="btn btn-primary" href="postForm.jsp">게시글 작성</a>
		<br>
	</core:if>
		<table class="table table-hover">
			<thead>
				<tr>
					<td>게시글 번호</td>
					<td>작성자</td>
					<td>제목</td>
					<td>작성일</td>
				</tr>
			</thead>
			<tbody>
				<core:forEach var="post" items="${list}">
					<tr onclick="postIsClicked(${post.getPno()})">
						<td>${post.getPno()}</td>
						<td>${post.getNickname() }</td>
						<td>${post.getTitle() }</td>
						<td>${post.getCreated_at() }</td>
					</tr>
				</core:forEach>
			</tbody>		
		</table>
	</div>
<script>
	function postIsClicked(pno){
		location.href = "postDetail?pno=" + pno;
	}
</script>
</body>
</html>