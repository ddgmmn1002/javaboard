<%@page import="vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>write new post</title>
<script src="https://cdn.tiny.cloud/1/qin272fijzzkwqe5r2qk9myu4pr5qfybcdh0cmqj8eq5pwvz/tinymce/6/tinymce.min.js" referrerpolicy="origin"></script>
</head>
<body class="bg-dark">
<jsp:include page="header.jsp"></jsp:include>
	<div class="container p-3 mt-5 mb-5 bg-light rounded">
		<form action="insertPost" method="post">
			<div class="d-grid gap-3">
				<div class="row">
					<div class="col">
						<label for="title" class="form-label">제목</label>
						<input id="title" type="text" name="title" class="form-control">
					</div>
				</div>
				<div class="row">
					<div class="col">
						<label for="poster" class="form-label">poster</label>
						<input id="poster" type="text" name="poster" class="form-control">
					</div>
				</div>
				<div class="row">
					<div class="col">
						<label for="trailer" class="form-label">trailer</label>
						<input id="trailer" type="text" name="trailer" class="form-control">
					</div>
				</div>
				<div class="row">
					<div class="col">
						<label for="post-tinyeditor" class="form-label">본문</label>
						<textarea id="post-tinyeditor" name="content" placeholder="글 본문 작성"></textarea>
					</div>
				</div>
				<div class="row">
					<div class="col d-flex justify-content-end">
						<button type="submit" class="btn btn-primary">게시하기</button>
					</div>
				</div>
			</div>
		</form>
	</div>
<script type="text/javascript">
	tinymce.init({
		selector: '#post-tinyeditor',
		  language: 'ko_KR',
		  height: 700,
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