<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>rewrite post</title>
<script src="https://cdn.tiny.cloud/1/no-api-key/tinymce/6/tinymce.min.js" referrerpolicy="origin"></script>
</head>
<body class="bg-dark">
<jsp:include page="header.jsp"></jsp:include>
	<div class="container p-5 mt-5 mb-5 bg-light rounded">
		<form action="updatePost" method="post">
			<div class="d-grid gap-3">
				<input type="hidden" value="${post.getPno() }" name="pno">
				
				<div class="row">
					<div class="col">
						<div class="form-floating">
							<input class="form-control" type="text" value="${post.getTitle() }" name="title">
							<label for="title">제목</label>
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="col">
						<div class="form-floating">
							<input class="form-control" type="text" value="${post.getPoster() }" name="poster">
							<label for="poster">poster</label>
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="col">
						<div class="form-floating">
							<input class="form-control" type="text" value="${post.getTrailer() }" name="trailer">
							<label for="trailer">trailer</label>
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="col">
						<label for="post-tinyeditor" class="form-label">본문</label>
						<textarea id="tiny" name="content">${post.getContent() }</textarea>
					</div>
				</div>
				<div class="row">
					<div class="col d-flex justify-content-end">
						<button type="submit" class="btn btn-primary me-1">수정하기</button>
						<a href="postDetail?pno=${post.getPno() }" class="btn btn-danger">취소</a>
					</div>
				</div>
			</div>
		</form>
	</div>
<script src="js/updatePostForm_editor.js"></script>
</body>
</html>