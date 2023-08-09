<%@page import="vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>write new post</title>
<script src="https://cdn.tiny.cloud/1/no-api-key/tinymce/6/tinymce.min.js" referrerpolicy="origin"></script>
</head>
<body class="bg-dark">
<jsp:include page="header.jsp"></jsp:include>
	<div class="container p-3 mt-5 mb-5 bg-light rounded">
		<form action="insertPost" method="post">
			<div class="d-grid gap-3">
				<div class="row">
					<div class="col">
						<label for="title" class="form-label">제목</label>
						<input id="title" type="text" name="title" class="form-control">
					</div>
				</div>
				<div class="row">
					<div class="col">
						<select name="vno">
							<core:forEach var="video" items="${videos }">
								<option value="${video.getVno() }">${video.getTitle()}</option>
							</core:forEach>
						</select>
					</div>
				</div>
				
				<div class="row">
					<div class="col">
						<label for="post-tinyeditor" class="form-label">본문</label>
						<textarea id="post-tinyeditor" name="content" placeholder="글 본문 작성"></textarea>
					</div>
				</div>
				<div class="row">
					<div class="col d-flex justify-content-end">
						<button type="submit" class="btn btn-primary">게시하기</button>
					</div>
				</div>
			</div>
		</form>
	</div>
<script src="js/postForm_editor.js"></script>
</body>
</html>