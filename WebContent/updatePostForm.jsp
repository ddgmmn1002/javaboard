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
	<div class="container">
		<form action="updatePost" method="post">
			<input type="hidden" value="${post.getPno() }" name="pno">
			<input type="text" value="${post.getTitle() }" name="title">
			<textarea id="tiny" name="content">${post.getContent() }</textarea>
			<button type="submit">수정하기</button>
		</form>
	</div>
<script>
	tinymce.init({
		selector: 'textarea#tiny',
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