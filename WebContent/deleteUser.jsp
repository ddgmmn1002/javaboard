<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>회원 탈퇴하시겠습니까?</h3>
	<p>탈퇴를 위해 비밀번호를 입력해주세요.</p>
	<form action="deleteUser" method="post">
		<input type="text" name="pw">
		<button type="submit">회원탈퇴</button>
	</form>
</body>
</html>