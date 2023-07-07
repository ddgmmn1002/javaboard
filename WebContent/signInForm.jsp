<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.flex-box {
		height: 100vh;
		display: flex;
		justify-content: center;
		align-items: center;
	}
	.form-wrap {
		border: 1px solid black;
		border-radius: 10px;
		box-shadow: 3px 3px 1px gray;
		padding: 10px;
	}
	.submit-button-area {
		display:flex;
		justify-content: center;
		align-items: center;
		margin: 1%;
		margin-top: 3%;
	}
</style>
</head>
<body>
	<div class="flex-box">
		<div class="form-wrap">
			<form action="signIn" method="post">
				<div>
					<input type="text" name="id" placeholder="ID">
				</div>
				<div>
					<input type="text" name="pw" placeholder="비밀번호">
				</div>
				<div class="submit-button-area">
					<input type="submit" value="log in">
				</div>
			</form>
		</div>
	</div>
</body>
</html>