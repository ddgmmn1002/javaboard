<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="container">
		<h1>${userInfo.getNickname()}님의 마이페이지</h1>
		<div>
			<span>
				<a href="updateUser.jsp?">회원정보 수정</a>
			</span>
			<span>
				내 활동
			</span>
			<span>
				<a href="deleteUser.jsp">회원탈퇴</a>
			</span>
		</div>
	</div>
</body>
</html>