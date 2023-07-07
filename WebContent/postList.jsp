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
<script src="js/jquery-3.7.0.js"></script>
</head>
<body>
	<core:if test="${not empty userInfo }">
		<a href="postForm.jsp">게시글 작성</a>
	</core:if>
	<table border="1">
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
				<tr>
					<td>${post.getPno()}</td>
					<td>${post.getNickname() }</td>
					<td><a href="postDetail?pno=${post.getPno() }">${post.getTitle() }</a></td>
					<td>${post.getCreated_at() }</td>
				</tr>
			</core:forEach>
		</tbody>		
	</table>
</body>
</html>