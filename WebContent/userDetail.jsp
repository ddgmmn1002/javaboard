<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body class="bg-dark">
	<jsp:include page="header.jsp"></jsp:include>
	<div class="container p-5 mt-5 mb-5 bg-light rounded">
		<div class="row">
			<div class="col">
				닉네임:
			</div>
			<div class="col">
				${user.getNickname() }
			</div>
		</div>
	</div>
</body>
</html>