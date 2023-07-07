<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>${userInfo.getNickname()}님의 마이페이지</h1>
	<ul>
		<li>
			<a href="prepareUpdateUser">회원정보 수정</a>
		</li>
		<li>
			내 활동
		</li>
		<li>
			<a href="userDelete.jsp">회원탈퇴</a>
		</li>
	</ul>
</body>
</html>