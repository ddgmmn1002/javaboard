<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>view post</title>
<script src="js/jquery-3.7.0.js"></script>
<script src="https://cdn.tiny.cloud/1/no-api-key/tinymce/6/tinymce.min.js" referrerpolicy="origin"></script>
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
				<div class="row">
					<div class="col text-light d-flex gap-2">
						<span>[작성자: ${post.getNickname() }]</span>
						<core:choose>
							<core:when test="${not empty post.getUpdatedAt() }">
								<span>[수정일: ${post.getUpdatedAt() }]</span>
							</core:when>
							<core:otherwise>
								<span>[작성일: ${post.getCreatedAt() }]</span>
							</core:otherwise>
						</core:choose>
						<span>[조회수: ${post.getViewCount() }]</span>
					</div>
				</div>
			
				<div class="row">
					<div class="col m-3 text-light">
						<h1>${post.getTitle() }</h1>
					</div>
				</div>
				
				<div>
					<div class="row mb-5">
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
					<div class="row">
						<div class="col d-flex justify-content-center m-3 text-light">
							<img src="${video.getPoster() }" width="300" height="500">
						</div>
						<div class="col d-grid align-items-center m-3 text-light">
							<p>감독: ${video.getDirector()}</p>
							<p>출연: ${video.getCast()}</p>
							<p>장르: ${video.getGenre()}</p>
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
				</div>
				
			
				<div class="row mb-5">
					<div class="col">
						<div class="bg-light rounded p-5 m-2">
							${post.getContent() }
						</div>
					</div>
				</div>		
			

			
				<div class="row">
					<div class="col mt-5 d-flex justify-content-end">
						<div>
							<core:if test="${not empty userInfo}">
								<core:if test="${userInfo.getId().equals(post.getUserId()) }">				
										<a class="btn btn-outline-secondary" href="prepareUpdatePost?pno=${post.getPno() }">수정</a>
										<a class="btn btn-outline-danger" href="deletePost?pno=${post.getPno() }">삭제</a>		
								</core:if>
							</core:if>
						</div>
					</div>
				</div>
			</div>
			
			<div class="row mb-2">
				<div class="col">
					<core:if test="${not empty userInfo }">
						<form action="insertComment" method="post" class="form-floating">
							<div class="d-flex flex-column gap-2 shadow p-3 bg-body rounded">
								<input type="hidden" name="pno" value="${post.getPno() }">
								<input id="comment-tinyeditor" type="text" name="content" class="form-control comment-tinyeditor">
								<div class="d-flex justify-content-end">
									<button type="submit" class="btn btn-primary btn-sm">댓글 추가</button>
								</div>
							</div>
						</form>
					</core:if>
				</div>
			</div>			
			
			<div class="row">
				<div class="col">
					<core:if test="${commentList.size() ne 0 }">
						<core:forEach var="comment" items="${commentList }" varStatus="status">
							<div class="container shadow p-3 mb-1 bg-body rounded d-grid gap-1 comment" data-cno="${comment.getCno() }">
								<div class="row">
									<div class="col d-flex align-items-center gap-1">
										<h5>
											${comment.getNickname()}
										</h5>
										<h5>
											<core:if test="${comment.getUserId() eq post.getUserId()}">
												<span class="badge bg-dark">작성자</span>
											</core:if>
										</h5>
									</div>
								</div>
								<div class="row">
									<div class="col m-2 content">
										${comment.getContent()}
									</div>
								</div>
								<div class="row">
									<div class="col">
										<span>
											<core:choose>
												<core:when test="${not empty comment.getUpdatedAt() }">
													<span>${comment.getUpdatedAt() }</span>
													<span class="badge bg-secondary">수정됨</span>
												</core:when>
												<core:otherwise>
													<span>${comment.getCreatedAt() }</span>
												</core:otherwise>
											</core:choose>
										</span>
									</div>
									<div class="col d-flex justify-content-end">
										<div>
											<core:choose>
												<core:when test="${comment.getUserId() eq userInfo.getId() }">
													<a class="update-comment btn btn-outline-secondary" style="--bs-btn-padding-y: .25rem; --bs-btn-padding-x: .5rem; --bs-btn-font-size: .75rem;">수정</a>
													<a class="btn btn-outline-danger" href="deleteComment?cno=${comment.getCno() }&pno=${post.getPno() }" style="--bs-btn-padding-y: .25rem; --bs-btn-padding-x: .5rem; --bs-btn-font-size: .75rem;">삭제</a>													
												</core:when>
											</core:choose>
										</div>
									</div>
								</div>		
							</div>
						</core:forEach>			
					</core:if>
				</div>
			</div>
		</div>
	</div>
</div>
<script src="js/postDetail_videoPlayer.js"></script>
<script src="js/postDetail_editor.js"></script>
<script src="js/postDetail_commentUpdate.js"></script>
</body>
</html>