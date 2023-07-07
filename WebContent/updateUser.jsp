<%@page import="vo.UserVO"%>
<%@page import="jdk.nashorn.internal.runtime.UserAccessorProperty"%>
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
		border-radius: 10px;
		padding: 10px;
		
		box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24)
	}
	.inner-area {
		margin: 1%;
	}
	.input-phone {
		width: 20%;
	}
	.input-birthdate{
		width: 20%;
	}
	.duplicate::placeholder{
		color: red;
		font-weight: bold;
	}
</style>
</head>
<body>
<h1>회원 정보 업데이트</h1>
<div class="flex-box">
		<div class="form-wrap">
			<form action="updateUser" method="post" class="signup-form" id="signup-form">
				
				<div class="inner-area">
						<label class="inner-label">연락처</label>
						<select class="select-box" name="phone">
							<option value="010">010</option>
							<option value="051">051</option>
							<option value="02">02</option>
						</select>
						<input type="text" class="input-phone" name="phone" value="${userInfo.getPhone().substring(4, 8) }">
						<input type="text" class="input-phone" name="phone" value="${userInfo.getPhone().substring(9, 13) }">
				</div>
				<hr>
				
				<div class="inner-area">
					<label class="inner-label">Email</label>
					<input type="text" class="" name="email" placeholder="이메일">
					<select name="email">
						<option value="@naver.com">naver.com</option>
						<option value="@daum.net">daum.net</option>
						<option value="@gmail.com">gmail.com</option>
					</select>
				</div>
				<hr>			
				
				<div class="inner-area">
					<label class="inner-label">비밀번호</label>
					<input type="text" class="input-text" name="pw" placeholder="비밀번호" value="${userInfo.getPw() }">
				</div>
				<hr>				
				<div class="inner-area">
					<label class="inner-label">닉네임</label>
					<input type="text" class="input-text" name="nickname" placeholder="닉네임" value="${userInfo.getNickname() }">
				</div>
				<hr>
				
				<div class="inner-area">
					<input type="submit" class="button-submit" value="회원 정보 수정하기">
					<input type="button" class="button-cancel" value="취소">
				</div>
			</form>
		</div>
	</div>
</body>
</html>