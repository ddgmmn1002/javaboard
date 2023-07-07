<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="updatePost" method="post">
		<input type="hidden" value="${post.getPno() }" name="pno">
		<input type="text" value="${post.getTitle() }" name="title">
		<textarea name="content">${post.getContent() }</textarea>
		<button type="submit">수정하기</button>
	</form>
</body>
</html>