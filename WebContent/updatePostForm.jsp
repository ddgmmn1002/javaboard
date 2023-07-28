<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>rewrite post</title>
<script src="https://cdn.tiny.cloud/1/qin272fijzzkwqe5r2qk9myu4pr5qfybcdh0cmqj8eq5pwvz/tinymce/6/tinymce.min.js" referrerpolicy="origin"></script>
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
<script>
	tinymce.init({
		selector: 'textarea#tiny',
		  language: 'ko_KR',
		  height: 700,
		  resize: false,
		  plugins: [
		    'advlist', 'autolink', 'lists', 'link', 'image', 'charmap', 'preview',
		    'anchor', 'searchreplace', 'visualblocks', 'code', 'fullscreen',
		    'insertdatetime', 'media', 'table', 'help', 'wordcount', 'emoticons'
		  ],
		  toolbar: 'undo redo | blocks typography fontsize | bold italic underline strikethrough | forecolor backcolor | alignleft aligncenter alignright alignjustify | bullist numlist | outdent indent | charmap emoticons | removeformat',
		  content_style: 'body { font-family:Helvetica,Arial,sans-serif; font-size:16px }'
	});
</script>
</body>
</html>