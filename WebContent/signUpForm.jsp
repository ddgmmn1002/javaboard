<%@page import="java.util.HashMap"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	HashMap<String, String> countries = new HashMap<>();
	countries.put("KR", "한국");
	countries.put("US", "미국");
	countries.put("CN", "중국");
	countries.put("JP", "일본");
	countries.put("GB", "영국");
	countries.put("FR", "프랑스");
	
	pageContext.setAttribute("countries", countries);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign up</title>
<script src="js/jquery-3.7.0.js"></script>
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
	<div class="flex-box">
		<div class="form-wrap">
			<form action="signUp" method="post" class="signup-form" id="signup-form" data-duplicateCheck="fail">
			
				<div class="inner-area">
					<input type="text" class="input-text" name="name" id="name" placeholder="이름">
				</div>
				<hr>
				<div class="inner-area">
					<label class="inner-label">생년월일</label>
					<input type="text" class="input-birthdate" name="birth" placeholder="연도">
					<input type="text" class="input-birthdate" name="birth" placeholder="월">
					<input type="text" class="input-birthdate" name="birth" placeholder="일">
				</div>
				<hr>
				
				<div class="inner-area">
					<select class="select-box" name="country" id="country">
						<option disabled="disabled" selected="selected">국가 선택</option>
						<core:forEach var="country" items="${countries}">
							<option value="${country.key}">${country.value}</option>
						</core:forEach>
					</select>
				</div>
				<hr>
				
				<div class="inner-area">
						<label class="inner-label">연락처</label>
						<select class="select-box" name="phone">
							<option value="010">010</option>
							<option value="051">051</option>
							<option value="052">052</option>
							<option value="02">02</option>
						</select>		
						<input type="text" class="input-phone" name="phone">
						<input type="text" class="input-phone" name="phone">
				</div>
				<hr>
				
				<div class="inner-area">
					<label class="inner-label">Email</label>
					<input type="text" class="" name="email">
					<select class="" name="email">
						<option value="@naver.com">naver.com</option>
						<option value="@daum.net">daum.net</option>
						<option value="@gmail.com">gmail.com</option>
					</select>
				</div>
				<hr>
				
				<div class="inner-area">
					<input class="" type="radio" name="gender" value="m">
					<label class="">남성</label>
					<input class="" type="radio" name="gender" value="f">
					<label class="">여성</label>
				</div>
				<hr>
				
				<div class="inner-area">
					<input type="text" class="input-text" id="id" name="id" placeholder="ID">
					<button id="id-check">중복 검사</button>
				</div>
				<hr>				
				
				<div class="inner-area">
					<input type="text" class="input-text" id="pw" name="pw" placeholder="비밀번호">
				</div>
				<hr>				
				<div class="inner-area">
					<input type="text" class="input-text" id="nickname" name="nickname" placeholder="닉네임">
				</div>
				<hr>				
				
				<div class="inner-area">
					<input type="button" id="btn" class="button-submit" value="회원가입">
				</div>
			</form>
		</div>
	</div>
<script>
	const form = $("#signup-form");
	const idCheckButton = $("#id-check");
	const inputId = $("#id");
	
	idCheckButton.on("click", function(event){
		event.preventDefault();
		$.ajax({
			url: "idCheck",
			type: "post",
			data: {"id": inputId.val()},
			success: function (resp) {
				if (resp == "true") {
					inputId.val("");
					inputId.addClass("duplicate");
					inputId.attr("placeholder", "이미 존재하는 ID입니다.");
					form.attr("data-duplicateCheck", "fail");
				} else {
					inputId.removeClass("duplicate");
					inputId.attr("placeholder", "ID");
					form.attr("data-duplicateCheck", "pass");
				}
			}
		});
	});
	
	inputId.on("change", function(){
		form.attr("data-duplicateCheck", 'fail');
	});
	
	$("#btn").on("click", function(event){
		event.preventDefault();
		if (form.attr("data-duplicateCheck") == "pass") {
			form.submit();
		}else {
			alert("ID 중복확인 해주세요.")
		}
	});
</script>
</body>
</html>
