<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
	<div class="container shadow-lg p-3 mb-5 bg-body rounded">
		<div class="row">
			<div class="col-3">		
				<form action="signIn" method="post">
					<div class="form-floating">
						<input class="form-control" type="text" name="id" placeholder="ID">
						<label for="id">ID</label>
					</div>
					<div class="form-floating">
						<input class="form-control" type="text" name="pw" placeholder="비밀번호">
						<label for="pw">Password</label>
					</div>
					<button class="btn btn-primary" type="submit">log in</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>