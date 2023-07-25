<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete user information</title>
</head>
<body class="bg-dark">
	<jsp:include page="header.jsp"></jsp:include>
	<div class="container shadow p-3 mb-5 bg-body rounded">
		<div class="row">
			<div class="col">
				<h3>회원 탈퇴하시겠습니까?</h3>
			</div>
		</div>
		<div class="row">
			<div class="col">
				<p>탈퇴를 위해 비밀번호를 입력해주세요.</p>
			</div>
		</div>
		<form action="deleteUser" method="post">
			<div class="d-grid gap-2">
				<div class="row">
					<div class="col">
						<input type="text" name="pw" class="form-control">
					</div>
				</div>
				<div class="row">
					<div class="col d-flex justify-content-end">
						<button type="submit" class="btn btn-danger">회원탈퇴</button>
					</div>
				</div>
			</div>
		</form>
	</div>
</body>
</html>