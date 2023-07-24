<%@page import="java.sql.Timestamp"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.If"%>
<%@page import="vo.CommentVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.UserVO"%>
<%@page import="vo.PostVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>view post</title>
<script src="js/jquery-3.7.0.js"></script>
<script src="https://cdn.tiny.cloud/1/qin272fijzzkwqe5r2qk9myu4pr5qfybcdh0cmqj8eq5pwvz/tinymce/6/tinymce.min.js" referrerpolicy="origin"></script>
</head>
<jsp:include page="header.jsp"></jsp:include>
<body class="bg-dark">
	<div class="container shadow-lg p-3 mb-3 bg-light rounded">
	
		<div class="shadow-lg p-3 mb-5 bg-light rounded">
			<div class="row">
				<div class="col">
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
				<div class="col m-3">
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
							<core:otherwise>
							</core:otherwise>
						</core:choose>
					</div>
				</div>
			</div>
		
			<div class="row">
				<div class="col m-5">
					${post.getContent()}
				</div>
			</div>		
		
			<div class="row">
				<div class="col d-flex justify-content-center">
					<div class="d-flex gap-3">
						<span>좋아요😎: ${post.getLikeCount() }</span>
						<span>싫어요🤬: ${post.getDislikeCount() }</span>
					</div>
				</div>
			</div>
		
			<div class="row">
				<div class="col mt-5 d-flex justify-content-end">
					<div>
						<core:if test="${not empty userInfo}">
							<core:if test="${userInfo.getId().equals(post.getUser_id()) }">				
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
						<div id="comment-${comment.getCno() } " class="container shadow p-3 mb-1 bg-body rounded d-grid gap-1">
							<div class="row">
								${comment.getCno() }
							</div>
							<div class="row">
								<div class="col">
									[${comment.getNickname()}]
									<core:if test="${comment.getUser_id() eq post.getUser_id()}">
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
										<core:when test="${not empty comment.getUpdated_at() }">
											${comment.getUpdated_at() }
											(수정됨)
										</core:when>
										<core:otherwise>
											${comment.getCreated_at() }
										</core:otherwise>
									</core:choose>
								</div>
								<div class="col d-flex justify-content-end">
									<div>
										<core:choose>
											<core:when test="${comment.getUser_id() eq userInfo.getId() }">
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
<script>

	//비디어 플레이어 객체
	var tag = document.createElement('script');
	tag.src = "https://www.youtube.com/iframe_api";
	var firstScriptTag = document.getElementsByTagName('script')[0];
	firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

	var player;
	function onYouTubeIframeAPIReady() {
		player = new YT.Player('player', {
			height: '540',
			width: '960',
			videoId: document.querySelector("#player").getAttribute("data-videoid"),
			playerVars: {
				'rel': 0,
				'controls': 0,
				'autoplay' : 1,
				'mute' : 1,
				'playsinline' : 1    //iOS환경에서 전체화면으로 재생하지 않게
			}
		});
	}
	
	
	//댓글용 텍스트 에디터 객체
 	tinymce.init({
		selector: '.comment-tinyeditor',
		  language: 'ko_KR',
		  height: 200,
		  menubar: false,
		  plugins: [
		    'advlist', 'autolink', 'lists', 'link', 'image', 'charmap', 'preview',
		    'anchor', 'searchreplace', 'visualblocks', 'code', 'fullscreen',
		    'insertdatetime', 'media', 'table', 'help', 'wordcount', 'emoticons'
		  ],
		  toolbar: 'bold italic underline strikethrough | forecolor backcolor | bullist numlist | outdent indent | charmap emoticons',
		  content_style: 'body { font-family:Helvetica,Arial,sans-serif; font-size:16px }'
	});
 	
 	
	// 댓글 수정 요청 처리 AJAX
	$('.update-comment').on('click', function(event){
		
		const cno = $(event.target).parent().parent().parent().siblings()[0].innerText;
		const content = $(event.target).parent().parent().parent().siblings()[2].innerHTML;
		
		if ($("#update-div").length) {
			$("#update-div").remove();
		} else {
	        const updateDiv = $("<div>").prop("id", "update-div");
	        const updateInput = $("<input>").prop("id", "update-input").val(content);
	        const updateButton = $("<button>").prop("id", "update-button")
				.text("수정")
	        	.click(function(event){
	        		const updateContent = $(event.target).siblings()[0].value;
	                $.ajax({
	                	url: "updateComment",
	                	type: "post",
	                	data: {
	                    	cno: cno,	
	                    	content: updateContent
	                	},
	                	success: function () {
	                		updateDiv.parent().siblings()[2].innerText = updateContent;
	                		updateDiv.remove();
	                	},
	        		});
	        	});
	        updateButton.addClass("update-comment btn btn-outline-secondary");
	        const cancelButton = $("<button>")
	        	.text("취소")
	        	.click(function(event){
	        		updateDiv.remove();
	        	});
	        cancelButton.addClass("btn btn-outline-danger");
	        updateDiv.append(updateInput);
	        updateDiv.append(updateButton);
	        updateDiv.append(cancelButton);
	        $(this).parent().parent().parent().append(updateDiv);
		}
	});
</script>
</body>
</html>