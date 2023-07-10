<%@page import="vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/jquery-3.7.0.js"></script>
</head>
<body>
	<form action="insertPost" method="post">
		<table>
			<tr>
				<td><input type="text" name="title" placeholder="글 제목 작성"></td>
			</tr>
			<tr>
				<td>
					<textarea class="" name="content" placeholder="글 본문 작성"></textarea>
				</td>
			</tr>
			<tr>
				<td><button type="submit">게시글 작성하기</button></td>
			</tr>
		</table>
	</form>
<script>
</script>
</body>
</html>