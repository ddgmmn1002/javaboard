<%@page import="vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../smarteditor/js/service/HuskyEZCreator.js"></script>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
	<div class="container shadow p-3 mb-5 bg-body rounded">
		<form action="insertPost" method="post">
			<input type="text" name="title" placeholder="글 제목 작성">
			<textarea id="editor" name="content" placeholder="글 본문 작성"></textarea>
			<button type="submit">게시글 작성하기</button>
		</form>
	</div>
<script>
	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
		oAppRef: oEditors,
		elPlaceHolder: "ir1",
		sSkinURI: "../se2/SmartEditor2Skin.html",
		fCreator: "createSEditor2"
	});
</script>
</body>
</html>