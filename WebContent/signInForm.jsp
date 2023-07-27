<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sign in</title>
</head>
<body class="bg-dark">
<jsp:include page="header.jsp"></jsp:include>
	<div class="container p-3 mt-5 mb-5 bg-light rounded">
		<form action="signIn" method="post">
			<div class="d-grid gap-2">
			
				<div class="row">
					<div class="col">		
							<div class="form-floating">
								<input class="form-control" type="text" name="id" placeholder="ID">
								<label for="id">ID</label>
							</div>
					</div>
				</div>
					
				<div class="row">
					<div class="col">
						<div class="form-floating">
							<input class="form-control" type="text" name="pw" placeholder="비밀번호">
							<label for="pw">Password</label>
						</div>
					</div>
				</div>
		
				<div class="row">
					<div class="col d-flex justify-content-end">
						<button class="btn btn-primary" type="submit">log in</button>
					</div>
				</div>
				
			</div>
		</form>
	</div>
</body>
</html>