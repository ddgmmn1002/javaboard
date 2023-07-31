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
	<div class="container bg-light p-5 mt-5 mb-5 rounded">
		<div class="d-grid gap-4">
			<core:forEach var="video" items="${list }">
				<div class="row">
					<div class="col">
						<div class="p-3 rounded" style="background-color: black; width: 500px; height: 400px">
							<img alt="poster" src="${video.getPoster() }" width="200px" height="300px">
						</div>
					</div>
				</div>		
			</core:forEach>
		</div>
	</div>
</body>
</html>