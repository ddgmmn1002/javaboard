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
		<div class="row row-cols-3">
			<core:forEach var="video" items="${list}" varStatus="status">
				<div class="col">
					<a href="videoDetail?vno=${video.getVno() }" style="text-decoration: none;">
						<div class="bg-black p-3 mb-4 rounded" style="border: 1px solid black; height:600px;">
							<img class="mb-3" src="${video.getPoster() }" width="60%" height="60%">
							<h3 class="text-light mb-3" style="font-weight: bold;">${video.getTitle() }</h3>
							<p class="text-light">감독: ${video.getDirector() }</p>
							<p class="text-light">출연: ${video.getCast() }</p>
							<p class="text-light">장르: ${video.getGenre() }</p>
					    </div>
			  		</a>
				</div>
			</core:forEach>
		</div>
	</div>
</body>
</html>