<%@page import="vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.tiny.cloud/1/qin272fijzzkwqe5r2qk9myu4pr5qfybcdh0cmqj8eq5pwvz/tinymce/6/tinymce.min.js" referrerpolicy="origin"></script>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
	<div class="container shadow p-3 mb-5 bg-body rounded">
		<form action="insertPost" method="post">
			<label for="title" class="form-label">제목</label>
			<input id="title" type="text" name="title" class="form-control">
			<br>
			<label for="tinyeditor" class="form-label">본문</label>
			<textarea id="tinyeditor" name="content" placeholder="글 본문 작성"></textarea>
			<button type="submit">게시글 작성하기</button>
		</form>
	</div>
<script type="text/javascript">
	tinymce.init({
		selector: 'textarea#tinyeditor',
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