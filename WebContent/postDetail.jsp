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
<style>
	#background-img-div {
		background:url('${video.getPoster()}');
		background-size: cover;
		background-position: center center;
		background-attachment: fixed;
	}

 	#like-button {
		display: none;
	}
	#dislike-button {
		display: none;
	}
	.hidden {
		display: none;
	}
	
</style>
</head>
<body class="bg-dark">
<jsp:include page="header.jsp"></jsp:include>
<core:choose>
	<core:when test="${post.getBlocked() }">
		<div>
	</core:when>
	<core:otherwise>
		<div id='${not empty video.getPoster() ? "background-img-div" : ""}'>
	</core:otherwise>
</core:choose>
	<div class="d-flex" style="backdrop-filter: blur(10px);">
		<core:choose>
			<core:when test="${post.getBlocked() }">
			
				<div class="container mt-5 mb-5 p-4 rounded" style="background-color:black;">
					<div class="shadow-lg p-3 mb-5 rounded">
						<div class="row">
							<div class="col bg-light rounded p-5 m-2 d-grid justify-content-center gap-3">
								<h3>
									차단된 이용자의 게시글입니다.
								</h3>
								<a class="btn btn-lg btn-primary" href="postList">돌아가기</a>
							</div>
						</div>
					</div>
				</div>
				
			</core:when>
			<core:otherwise>
			
				<div class="container mt-5 mb-5 p-4 rounded" style="background-color:black;">
					<div class="shadow-lg p-3 mb-5 rounded">
						<div class="row">
							<div class="col text-light d-flex gap-2 align-items-center">
								<span>작성자: ${post.getNickname() }</span>
								<core:choose>
									<core:when test='${post.getGrade() eq "admin"}'>
										<span class="badge bg-primary">관리자</span>
									</core:when>
									<core:when test='${post.getGrade() eq "critic"}'>
										<span class="badge bg-success ">평론가</span>
									</core:when>
								</core:choose>
							</div>
							<div class="col text-light d-flex justify-content-end gap-2">
								<core:choose>
									<core:when test="${not empty post.getUpdatedAt() }">
										<span class="me-2">수정일: ${post.getUpdatedAt() }</span>
									</core:when>
									<core:otherwise>
										<span class="me-2">작성일: ${post.getCreatedAt() }</span>
									</core:otherwise>
								</core:choose>
								<span>조회수: ${post.getViewCount() }</span>
							</div>
						</div>
					
						<div class="row">
							<div class="col m-3 text-light">
								<h1>${post.getTitle() }</h1>
							</div>
						</div>

						<core:if test="${post.getVno() ne 19}">
							<div class="p-5 m-5 rounded" style="border: 2px solid gray;">
								<div class="row mb-5">
									<div class="col">
										<div class="d-flex justify-content-center">
											<core:if test="${not empty video.getTrailer() }">
												<div id="player" data-videoid="${video.getTrailer() }"></div>
											</core:if>
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
										<p>러닝타임: ${video.getRuntime() } (분)</p>
									</core:if>
										<p>관람제한연령: ${video.getFilmRating() }</p>
										<p>주요사용언어: ${video.getLanguage() }</p>
										<p>분류: ${video.getCategory() }</p>
									</div>
								</div>
								<div class="row">
									<div class="col p-5 m-3 text-light">
										<p>${video.getPlot()}</p>
									</div>
								</div>
							</div>
						</core:if>
						
						
					
						<div class="row mb-5">
							<div class="col">
								<div class="bg-light rounded p-5 m-2">
									${post.getContent() }
								</div>
							</div>
						</div>		
					
						<div class="row justify-content-center">
						
							<div class="col d-flex justify-content-end align-items-center gap-2">
								<core:if test="${not empty userInfo }">
									<input type="checkbox" id="like-button" ${interaction.isLikeStatus() ? "checked" : ""}>
								</core:if>
								<label for="like-button" class="text-light">
									<svg id="like-icon" xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class='bi bi-hand-thumbs-up ${interaction.isLikeStatus() ? "hidden" : "" }' viewBox="0 0 16 16">
		  								<path d="M8.864.046C7.908-.193 7.02.53 6.956 1.466c-.072 1.051-.23 2.016-.428 2.59-.125.36-.479 1.013-1.04 1.639-.557.623-1.282 1.178-2.131 1.41C2.685 7.288 2 7.87 2 8.72v4.001c0 .845.682 1.464 1.448 1.545 1.07.114 1.564.415 2.068.723l.048.03c.272.165.578.348.97.484.397.136.861.217 1.466.217h3.5c.937 0 1.599-.477 1.934-1.064a1.86 1.86 0 0 0 .254-.912c0-.152-.023-.312-.077-.464.201-.263.38-.578.488-.901.11-.33.172-.762.004-1.149.069-.13.12-.269.159-.403.077-.27.113-.568.113-.857 0-.288-.036-.585-.113-.856a2.144 2.144 0 0 0-.138-.362 1.9 1.9 0 0 0 .234-1.734c-.206-.592-.682-1.1-1.2-1.272-.847-.282-1.803-.276-2.516-.211a9.84 9.84 0 0 0-.443.05 9.365 9.365 0 0 0-.062-4.509A1.38 1.38 0 0 0 9.125.111L8.864.046zM11.5 14.721H8c-.51 0-.863-.069-1.14-.164-.281-.097-.506-.228-.776-.393l-.04-.024c-.555-.339-1.198-.731-2.49-.868-.333-.036-.554-.29-.554-.55V8.72c0-.254.226-.543.62-.65 1.095-.3 1.977-.996 2.614-1.708.635-.71 1.064-1.475 1.238-1.978.243-.7.407-1.768.482-2.85.025-.362.36-.594.667-.518l.262.066c.16.04.258.143.288.255a8.34 8.34 0 0 1-.145 4.725.5.5 0 0 0 .595.644l.003-.001.014-.003.058-.014a8.908 8.908 0 0 1 1.036-.157c.663-.06 1.457-.054 2.11.164.175.058.45.3.57.65.107.308.087.67-.266 1.022l-.353.353.353.354c.043.043.105.141.154.315.048.167.075.37.075.581 0 .212-.027.414-.075.582-.05.174-.111.272-.154.315l-.353.353.353.354c.047.047.109.177.005.488a2.224 2.224 0 0 1-.505.805l-.353.353.353.354c.006.005.041.05.041.17a.866.866 0 0 1-.121.416c-.165.288-.503.56-1.066.56z"/>
									</svg>
									<svg id="like-icon-fill" xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class='bi bi-hand-thumbs-up-fill ${interaction.isLikeStatus() ? "" : "hidden" }' viewBox="0 0 16 16">
										<path d="M6.956 1.745C7.021.81 7.908.087 8.864.325l.261.066c.463.116.874.456 1.012.965.22.816.533 2.511.062 4.51a9.84 9.84 0 0 1 .443-.051c.713-.065 1.669-.072 2.516.21.518.173.994.681 1.2 1.273.184.532.16 1.162-.234 1.733.058.119.103.242.138.363.077.27.113.567.113.856 0 .289-.036.586-.113.856-.039.135-.09.273-.16.404.169.387.107.819-.003 1.148a3.163 3.163 0 0 1-.488.901c.054.152.076.312.076.465 0 .305-.089.625-.253.912C13.1 15.522 12.437 16 11.5 16H8c-.605 0-1.07-.081-1.466-.218a4.82 4.82 0 0 1-.97-.484l-.048-.03c-.504-.307-.999-.609-2.068-.722C2.682 14.464 2 13.846 2 13V9c0-.85.685-1.432 1.357-1.615.849-.232 1.574-.787 2.132-1.41.56-.627.914-1.28 1.039-1.639.199-.575.356-1.539.428-2.59z"/>
									</svg>
								</label>
								<h3 id="total-like-count" class="text-light m-0">${post.getLikeCount() }</h3>
							</div>
							
							<div class="col d-flex justify-content-start align-items-center gap-2">
								<core:if test="${not empty userInfo }">
									<input type="checkbox" id="dislike-button" ${interaction.isDislikeStatus() ? "checked" : ""}>
								</core:if>
								<label for="dislike-button" class="text-light">
									<svg id="dislike-icon" xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class='bi bi-hand-thumbs-down ${interaction.isDislikeStatus() ? "hidden" : ""}' viewBox="0 0 16 16">
										<path d="M8.864 15.674c-.956.24-1.843-.484-1.908-1.42-.072-1.05-.23-2.015-.428-2.59-.125-.36-.479-1.012-1.04-1.638-.557-.624-1.282-1.179-2.131-1.41C2.685 8.432 2 7.85 2 7V3c0-.845.682-1.464 1.448-1.546 1.07-.113 1.564-.415 2.068-.723l.048-.029c.272-.166.578-.349.97-.484C6.931.08 7.395 0 8 0h3.5c.937 0 1.599.478 1.934 1.064.164.287.254.607.254.913 0 .152-.023.312-.077.464.201.262.38.577.488.9.11.33.172.762.004 1.15.069.13.12.268.159.403.077.27.113.567.113.856 0 .289-.036.586-.113.856-.035.12-.08.244-.138.363.394.571.418 1.2.234 1.733-.206.592-.682 1.1-1.2 1.272-.847.283-1.803.276-2.516.211a9.877 9.877 0 0 1-.443-.05 9.364 9.364 0 0 1-.062 4.51c-.138.508-.55.848-1.012.964l-.261.065zM11.5 1H8c-.51 0-.863.068-1.14.163-.281.097-.506.229-.776.393l-.04.025c-.555.338-1.198.73-2.49.868-.333.035-.554.29-.554.55V7c0 .255.226.543.62.65 1.095.3 1.977.997 2.614 1.709.635.71 1.064 1.475 1.238 1.977.243.7.407 1.768.482 2.85.025.362.36.595.667.518l.262-.065c.16-.04.258-.144.288-.255a8.34 8.34 0 0 0-.145-4.726.5.5 0 0 1 .595-.643h.003l.014.004.058.013a8.912 8.912 0 0 0 1.036.157c.663.06 1.457.054 2.11-.163.175-.059.45-.301.57-.651.107-.308.087-.67-.266-1.021L12.793 7l.353-.354c.043-.042.105-.14.154-.315.048-.167.075-.37.075-.581 0-.211-.027-.414-.075-.581-.05-.174-.111-.273-.154-.315l-.353-.354.353-.354c.047-.047.109-.176.005-.488a2.224 2.224 0 0 0-.505-.804l-.353-.354.353-.354c.006-.005.041-.05.041-.17a.866.866 0 0 0-.121-.415C12.4 1.272 12.063 1 11.5 1z"/>
									</svg>
									<svg id="dislike-icon-fill" xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class='bi bi-hand-thumbs-down-fill ${interaction.isDislikeStatus() ? "" : "hidden"}' viewBox="0 0 16 16">
										<path d="M6.956 14.534c.065.936.952 1.659 1.908 1.42l.261-.065a1.378 1.378 0 0 0 1.012-.965c.22-.816.533-2.512.062-4.51.136.02.285.037.443.051.713.065 1.669.071 2.516-.211.518-.173.994-.68 1.2-1.272a1.896 1.896 0 0 0-.234-1.734c.058-.118.103-.242.138-.362.077-.27.113-.568.113-.856 0-.29-.036-.586-.113-.857a2.094 2.094 0 0 0-.16-.403c.169-.387.107-.82-.003-1.149a3.162 3.162 0 0 0-.488-.9c.054-.153.076-.313.076-.465a1.86 1.86 0 0 0-.253-.912C13.1.757 12.437.28 11.5.28H8c-.605 0-1.07.08-1.466.217a4.823 4.823 0 0 0-.97.485l-.048.029c-.504.308-.999.61-2.068.723C2.682 1.815 2 2.434 2 3.279v4c0 .851.685 1.433 1.357 1.616.849.232 1.574.787 2.132 1.41.56.626.914 1.28 1.039 1.638.199.575.356 1.54.428 2.591z"/>
									</svg>
								</label>
								<h3 id="total-dislike-count" class="text-light m-0">${post.getDislikeCount() }</h3>
							</div>
							
						</div>
					
						<div class="row">
							<div class="col mt-5 d-flex justify-content-end">
								<div>
									<core:if test="${not empty userInfo}">
										<core:if test="${userInfo.getId().equals(post.getUserId()) and !userInfo.isBlocked()}">				
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
								<core:if test="${!userInfo.isBlocked() }">							
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
							</core:if>
						</div>
					</div>			
					
					<div class="row">
						<div class="col">
							<core:if test="${commentList.size() ne 0 }">
								<core:forEach var="comment" items="${commentList }" varStatus="status">
									<core:choose>
										<core:when test="${comment.getBlocked() }">
										
											<div class="container shadow p-3 mb-1 bg-body rounded d-grid gap-1 comment" data-cno="${comment.getCno() }">
												<div class="row">
													<div class="col d-flex align-items-center gap-1">
														<h5></h5>
														<h5></h5>
													</div>
												</div>
												<div class="row">
													<div class="col m-2 content text-secondary">
														차단된 이용자의 댓글입니다.
													</div>
												</div>
												<div class="row">
													<div class="col">
														<span></span>
													</div>
													<div class="col d-flex justify-content-end">
														<div>
														</div>
													</div>
												</div>		
											</div>
											
										</core:when>
										
										<core:otherwise>
										
											<div class="container shadow p-3 mb-1 bg-body rounded d-grid gap-1 comment" data-cno="${comment.getCno() }">
												<div class="row">
													<div class="col d-flex align-items-center gap-1">
														<h5>
															${comment.getNickname()}
														</h5>
														<h5>
															<core:choose>
																<core:when test="${comment.getUserId() eq post.getUserId()}">
																	<span class="badge bg-dark">작성자</span>
																</core:when>
																<core:when test='${comment.getGrade().equals("admin")}'>
																	<span class="badge bg-primary">관리자</span>
																</core:when>
															</core:choose>
															<core:if test="${comment.getUserId() eq post.getUserId()}">
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
															<core:if test="${ comment.getUserId() eq userInfo.getId() and !userInfo.isBlocked() }">
																<a class="update-comment btn btn-outline-secondary" style="--bs-btn-padding-y: .25rem; --bs-btn-padding-x: .5rem; --bs-btn-font-size: .75rem;">수정</a>
																<a class="btn btn-outline-danger" href="deleteComment?cno=${comment.getCno() }&pno=${post.getPno() }" style="--bs-btn-padding-y: .25rem; --bs-btn-padding-x: .5rem; --bs-btn-font-size: .75rem;">삭제</a>													
															</core:if>
														</div>
													</div>
												</div>		
											</div>
											
										</core:otherwise>
									</core:choose>
									
								</core:forEach>			
							</core:if>
						</div>
					</div>
				</div>
				
			</core:otherwise>
		</core:choose>
	</div>
</div>
<script src="js/postDetail_videoPlayer.js"></script>
<script src="js/postDetail_comment.js"></script>
<script>
	const likeButton = document.querySelector("#like-button");
	const dislikeButton = document.querySelector("#dislike-button");
	
	const totalLikeCount = document.querySelector("#total-like-count");
	const totalDislikeCount = document.querySelector("#total-dislike-count");
	
	const likeIcon = document.querySelector("#like-icon");
	const likeIconFill = document.querySelector("#like-icon-fill")
	const dislikeIcon = document.querySelector("#dislike-icon");
	const dislikeIconFill = document.querySelector("#dislike-icon-fill")
	
	try {
		likeButton.addEventListener("click", () => {
			evaluateButton(true);
		});
		dislikeButton.addEventListener("click", () => {
			evaluateButton(false);
		});
	} catch(e){
		console.log("Guest User");
	}
	
	async function evaluateButton(isLike) {
		await fetch("likePost", {
			method: "POST",
			headers: {
				"Content-Type": "application/json"
			},
			body: JSON.stringify({
				pno: '${post.getPno()}',
				isLike: isLike
			})
		})
	 	.then((resp) => resp.json())
		.then((data) => {
			totalLikeCount.innerText = data.totalLikeCount;
			totalDislikeCount.innerText = data.totalDislikeCount;
			const userInteraction = JSON.parse(data.userInteraction);
	 		if (userInteraction.likeStatus) {
				likeButton.checked = true;
				likeIconFill.classList.remove("hidden");
				likeIcon.classList.add("hidden");
			} else {
				likeButton.checked = false;
				likeIconFill.classList.add("hidden");
				likeIcon.classList.remove("hidden");
			}
			if (userInteraction.dislikeStatus) {
				dislikeButton.checked = true;
				dislikeIconFill.classList.remove("hidden");
				dislikeIcon.classList.add("hidden");
			} else {
				dislikeButton.checked = false;
				dislikeIconFill.classList.add("hidden");
				dislikeIcon.classList.remove("hidden");
			}
		})
		.catch(error => {
				console.error("Error:", error);
		});
	}
</script>
</body>
</html>