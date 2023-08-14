<%@page import="vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body class="bg-dark">
	<jsp:include page="header.jsp"></jsp:include>
	<div class="container p-5 mt-5 mb-5 bg-light rounded">
		<form action="adminUpdateUser" method="post">
			<div class="row">
				<div class="col">
					<table class="table align-middle table-bordered rounded">
						<tr>
							<td colspan="2">
								<h3 id="user-id" class="ms-3">
									${user.getId() }
								</h3>
							</td>
						</tr>
						<tr>
							<td style="width:20%;">
								<div class="d-flex justify-content-center">
									이름
								</div>
							</td>
							<td>
								<div id="user-name" class="ms-3">
									${user.getName() }
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div class="d-flex justify-content-center">
									생년월일
								</div>
							</td>
							<td>
								<div id="user-birthdate" class="ms-3">
									${user.getBirthDate() }
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div class="d-flex justify-content-center">
									연락처
								</div>
							</td>
							<td>
								<div id="user-phone" class="ms-3">
									${user.getPhone() }
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div class="d-flex justify-content-center">
									E-mail
								</div>
							</td>
							<td>
								<div id="user-email" class="ms-3">
									${user.getEmail() }
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div class="d-flex justify-content-center">
									성별
								</div>
							</td>
							<td>
								<div id="user-gender" class="ms-3">
									${ user.getGender().equals("m") ? "남성" : "여성"}
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div class="d-flex justify-content-center">
									가입일자
								</div>
							</td>
							<td>
								<div id="user-signupdate" class="ms-3">
									${user.getSignupDate() }
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div class="d-flex justify-content-center">
									닉네임
								</div>
							</td>
							<td>
								<div id="user-nickname" class="ms-3">
									${user.getNickname() }
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div class="d-flex justify-content-center">
									회원등급
								</div>
							</td>
							<td>
								<div id="user-grade" class="ms-3">
									${user.getGrade() }
								</div>
							</td>
						<tr>
						<tr>
							<td>
								<div class="d-flex justify-content-center">차단 여부</div>
							</td>
							<td>
								<div id="user-blocked" class="ms-3">
									${ user.isBlocked() ? "차단된 이용자" : "X" }
								</div>
							</td>
						</tr>
					</table>
				</div>
			</div>
			<div class="row">
				<div class="col">
					<div class="d-flex justify-content-end">
						<button id="updateButton" class="btn btn-outline-secondary">회원 정보 수정</button>
					</div>
				</div>
			</div>
		</form>
	</div>

<script src="js/userDetail_update.js"></script>
</body>
</html>