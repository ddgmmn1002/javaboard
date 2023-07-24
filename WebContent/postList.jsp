<%@page import="vo.PostVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>post list</title>
</head>
<body class="bg-dark">
	<jsp:include page="header.jsp"></jsp:include>
	<div class="container shadow-lg p-3 mb-5 bg-light rounded">
	<core:if test="${not empty userInfo }">
		<a class="btn btn-primary" href="postForm.jsp">게시글 작성</a>
		<br><br>
	</core:if>
		<table class="table table-hover bg-white rounded">
			<thead>
				<tr class="shadow-sm p-3 mb-1">
					<td>게시글 번호</td>
					<td>작성자</td>
					<td>제목</td>
					<td>작성일</td>
					<td></td>
				</tr>
			</thead>
			<tbody>
				<core:forEach var="post" items="${list}">
					<tr class="shadow-sm p-3 mb-1" onclick="postIsClicked(${post.getPno()})">
						<td>${post.getPno()}</td>
						<td>${post.getNickname() }</td>
						<td>${post.getTitle() }</td>
						<core:choose>
							<core:when test="${not empty post.getUpdatedAt()}">
								<td>${post.getUpdatedAt() } [수정됨]</td>
							</core:when>
							<core:otherwise>
								<td>${post.getCreatedAt() }</td>						
							</core:otherwise>
						</core:choose>
						<td>
							<div class="container">
								<div class="row">
									<div class="col">
										<svg xmlns="http://www.w3.org/2000/svg" width="15" height="15" fill="currentColor" class="bi bi-eye-fill" viewBox="0 0 16 16">
		  									<path d="M10.5 8a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0z"/>
		  									<path d="M0 8s3-5.5 8-5.5S16 8 16 8s-3 5.5-8 5.5S0 8 0 8zm8 3.5a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7z"/>
										</svg>
										${post.getViewCount() }
									</div>
								</div>
								<div class="row">
									<div class="col">
										<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chat-right-text-fill" viewBox="0 0 16 16">
  											<path d="M16 2a2 2 0 0 0-2-2H2a2 2 0 0 0-2 2v8a2 2 0 0 0 2 2h9.586a1 1 0 0 1 .707.293l2.853 2.853a.5.5 0 0 0 .854-.353V2zM3.5 3h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1 0-1zm0 2.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1 0-1zm0 2.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1 0-1z"/>
										</svg>
										${post.getCommentCount() }
									</div>
								</div>
								<div class="row">
									<div class="col">
										<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-hand-thumbs-up-fill" viewBox="0 0 16 16">
  											<path d="M6.956 1.745C7.021.81 7.908.087 8.864.325l.261.066c.463.116.874.456 1.012.965.22.816.533 2.511.062 4.51a9.84 9.84 0 0 1 .443-.051c.713-.065 1.669-.072 2.516.21.518.173.994.681 1.2 1.273.184.532.16 1.162-.234 1.733.058.119.103.242.138.363.077.27.113.567.113.856 0 .289-.036.586-.113.856-.039.135-.09.273-.16.404.169.387.107.819-.003 1.148a3.163 3.163 0 0 1-.488.901c.054.152.076.312.076.465 0 .305-.089.625-.253.912C13.1 15.522 12.437 16 11.5 16H8c-.605 0-1.07-.081-1.466-.218a4.82 4.82 0 0 1-.97-.484l-.048-.03c-.504-.307-.999-.609-2.068-.722C2.682 14.464 2 13.846 2 13V9c0-.85.685-1.432 1.357-1.615.849-.232 1.574-.787 2.132-1.41.56-.627.914-1.28 1.039-1.639.199-.575.356-1.539.428-2.59z"/>
										</svg>
										${post.getLikeCount() }
									</div>
								</div>
							</div>
						</td>
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