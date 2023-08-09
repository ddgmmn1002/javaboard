<%@page import="vo.VideoVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>video</title>
<script src="js/jquery-3.7.0.js"></script>
</head>
<body class="bg-dark">
<jsp:include page="header.jsp"></jsp:include>
<core:choose>
<core:when test="${not empty video.getPoster() }">
<div style="
	background:url('${video.getPoster()}');
	background-size: cover;
	background-position: center center;
	background-attachment: fixed;
">		
</core:when>
<core:otherwise>
<div>
</core:otherwise>
</core:choose>
	<div class="d-flex" style="backdrop-filter: blur(10px);">
		<div class="container mt-5 mb-5 p-4 rounded" style="background-color:black;">
			<div class="shadow-lg p-3 mb-5 rounded">
			
				<% VideoVO video = (VideoVO) request.getAttribute("video"); %>
				<% String[] release = video.getReleaseDate().toString().split("-"); %>
				<% String releaseYear = release[0]; %>
				<% String releaseMonth = release[1]; %>
				<% String releaseDay = release[2]; %>
				<% pageContext.setAttribute("releaseYear", releaseYear); %>
				<% pageContext.setAttribute("releaseMonth", releaseMonth); %>
				<% pageContext.setAttribute("releaseDay", releaseDay); %>
				
				<div class="row">
					<div class="col m-3 text-light">
						<h1>${video.getTitle() }</h1>
					</div>
				</div>
				<div class="row">
					<div class="col d-flex justify-content-center m-3 text-light">
						<img src="${video.getPoster() }" width="300" height="500">
					</div>
					<div class="col m-3 text-light">
						<p>감독: ${video.getDirector()}</p>
						<p>출연: ${video.getCast()}</p>
						<p>장르: ${video.getGenre()}</p>
						<p>개봉: ${releaseYear }년 ${releaseMonth }월 ${releaseDay }일</p>
					<core:if test="${video.getRuntime() != 0}">
						<p>러닝타임: ${video.getRuntime() }</p>
					</core:if>
						<p>관람제한연령: ${video.getFilmRating() }</p>
						<p>주요사용언어: ${video.getLanguage() }</p>
						<p>분류: ${video.getCategory() }</p>
					</div>
				</div>
				<div class="row">
					<div class="col p-5 m-3 text-light">
						<p>줄거리: ${video.getPlot()}</p>
					</div>
				</div>
			
				<div class="row">
					<div class="col">
						<div class="d-flex justify-content-center">
							<core:choose>
								<core:when test="${not empty video.getTrailer() }">
									<div id="player" data-videoid="${video.getTrailer() }"></div>
								</core:when>
							</core:choose>
						</div>
					</div>
				</div>
			
			</div>
		</div>
	</div>
</div>
<script src="js/postDetail_videoPlayer.js"></script>
</body>
</html>