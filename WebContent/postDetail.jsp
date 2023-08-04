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
	<core:when test="${not empty post.getPoster() }">
		<div style="
			background:url('${post.getPoster()}');
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
					<div class="col text-light">
						[작성자: ${post.getNickname() }]
						<core:choose>
							<core:when test="${not empty post.getUpdatedAt() }">
								[수정일: ${post.getUpdatedAt() }]
							</core:when>
							<core:otherwise>
								[작성일: ${post.getCreatedAt() }]
							</core:otherwise>
						</core:choose>
						[조회수: ${post.getViewCount() }]
					</div>
				</div>
			
				<div class="row">
					<div class="col m-3 text-light">
						<h1>${post.getTitle() }</h1>
					</div>
				</div>
			
				<div class="row">
					<div class="col">
						<div class="d-flex justify-content-center">
							<core:choose>
								<core:when test="${not empty post.getTrailer() }">
									<div id="player" data-videoid="${post.getTrailer() }"></div>
								</core:when>
							</core:choose>
						</div>
					</div>
				</div>
			
				<div class="row">
					<div class="col m-5 text-light">
						${post.getContent()}
					</div>
				</div>		
			
				<div class="row">
					<div class="col d-flex justify-content-center">
						<div class="d-flex gap-3 text-light">
							<div>
								<input type="checkbox" checked>
								<span>좋아요 😎: ${post.getLikeCount() }</span>
							</div>
							<div>
								<span>싫어요 🤬: ${post.getDislikeCount() }</span>
								<input type="checkbox" checked>
							</div>
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
							<div class="container shadow p-3 mb-1 bg-body rounded d-grid gap-1" data-cno="${comment.getCno() }">
								<div class="row">
									<div class="col">
										[${comment.getNickname()}]
										<core:if test="${comment.getUserId() eq post.getUserId()}">
											(작성자)
										</core:if>
									</div>
								</div>
								<div class="row">
									<div class="col m-2">
										${comment.getContent()}
									</div>
								</div>
								<div class="row">
									<div class="col">
										<core:choose>
											<core:when test="${not empty comment.getUpdatedAt() }">
												${comment.getUpdatedAt() }
												(수정됨)
											</core:when>
											<core:otherwise>
												${comment.getCreatedAt() }
											</core:otherwise>
										</core:choose>
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