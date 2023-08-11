<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>
		<!DOCTYPE html>

		<script src="js/jquery-3.7.0.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" />
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css" />
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

		<nav class="navbar navbar-dark navbar-expand-lg bg-dark">
			<div class="container-fluid m-3">
				<a class="navbar-brand text-light ms-2 me-5" href="home.jsp"> <h1>CRITIC</h1> </a>
				<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
					data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
					aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav me-auto mb-2 mb-lg-0 gap-4">
						<li class="nav-item">
							<a class="nav-link text-light" aria-current="page" href="home.jsp">
								<div class="d-flex align-items-center gap-2">
									<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor"
										class="bi bi-house-fill" viewBox="0 0 16 16">
										<path
											d="M8.707 1.5a1 1 0 0 0-1.414 0L.646 8.146a.5.5 0 0 0 .708.708L8 2.207l6.646 6.647a.5.5 0 0 0 .708-.708L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.707 1.5Z" />
										<path
											d="m8 3.293 6 6V13.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 13.5V9.293l6-6Z" />
									</svg>
									<h5 class="m-0">홈으로</h5>
								</div>
							</a>
						</li>
						<li class="nav-item">
							<a class="nav-link text-light" href="videoList">
								<div class="d-flex align-items-center gap-2">
									<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-play-btn" viewBox="0 0 16 16">
										<path d="M6.79 5.093A.5.5 0 0 0 6 5.5v5a.5.5 0 0 0 .79.407l3.5-2.5a.5.5 0 0 0 0-.814l-3.5-2.5z"/>
										<path d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4zm15 0a1 1 0 0 0-1-1H2a1 1 0 0 0-1 1v8a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4z"/>
									</svg>  
									<h5 class="m-0">영상 정보 목록</h5>
								</div>
							</a>
						</li>
						<li class="nav-item">
							<a class="nav-link text-light" href="postList">
								<div class="d-flex align-items-center gap-2">
									<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor"
										class="bi bi-card-list" viewBox="0 0 16 16">
										<path
											d="M14.5 3a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-.5.5h-13a.5.5 0 0 1-.5-.5v-9a.5.5 0 0 1 .5-.5h13zm-13-1A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h13a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-13z" />
										<path
											d="M5 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 5 8zm0-2.5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5zm0 5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5zm-1-5a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0zM4 8a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0zm0 2.5a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0z" />
									</svg>
									<h5 class="m-0">게시글 목록</h5>
								</div>
							</a>
						</li>
						<core:choose>
							<core:when test="${not empty userInfo }">
								<li class="nav-item dropdown">
									<button class="btn btn-lg nav-link dropdown-toggle text-light" role="button"
										data-bs-toggle="dropdown" aria-expanded="false">
										<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
											fill="currentColor" class="bi bi-person-vcard-fill" viewBox="0 0 16 16">
											<path
												d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4Zm9 1.5a.5.5 0 0 0 .5.5h4a.5.5 0 0 0 0-1h-4a.5.5 0 0 0-.5.5ZM9 8a.5.5 0 0 0 .5.5h4a.5.5 0 0 0 0-1h-4A.5.5 0 0 0 9 8Zm1 2.5a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 0-1h-3a.5.5 0 0 0-.5.5Zm-1 2C9 10.567 7.21 9 5 9c-2.086 0-3.8 1.398-3.984 3.181A1 1 0 0 0 2 13h6.96c.026-.163.04-.33.04-.5ZM7 6a2 2 0 1 0-4 0 2 2 0 0 0 4 0Z" />
										</svg>
										마이페이지
									</button>
									<ul class="dropdown-menu dropdown-menu-dark">
										<li>
											<a class="dropdown-item" href="updateUser.jsp">회원정보 수정</a>
										</li>
										<li><a class="dropdown-item" href="history">내 활동</a></li>
										<li>
											<a class="dropdown-item" href="deleteUser.jsp">회원탈퇴</a>
										</li>
										<li><a class="dropdown-item" href="signOut">로그아웃</a></li>
									</ul>
								</li>
							</core:when>
							<core:otherwise>
								<li class="nav-item">
									<a href="signUpForm.jsp" class="nav-link text-light">
										<div class="d-flex align-items-center gap-1">
											<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
												fill="currentColor" class="bi bi-person-plus-fill" viewBox="0 0 16 16">
												<path
													d="M1 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z" />
												<path fill-rule="evenodd"
													d="M13.5 5a.5.5 0 0 1 .5.5V7h1.5a.5.5 0 0 1 0 1H14v1.5a.5.5 0 0 1-1 0V8h-1.5a.5.5 0 0 1 0-1H13V5.5a.5.5 0 0 1 .5-.5z" />
											</svg>
											<h5 class="m-0">회원 가입</h5>
										</div>
									</a>
								</li>
								<li class="nav-item">
									<a href="#" class="nav-link text-light" data-bs-toggle="modal"
										data-bs-target="#signin-modal">
										<div class="d-flex align-items-center gap-1">
											<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
												fill="currentColor" class="bi bi-person-check-fill" viewBox="0 0 16 16">
												<path fill-rule="evenodd"
													d="M15.854 5.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 0 1 .708-.708L12.5 7.793l2.646-2.647a.5.5 0 0 1 .708 0z" />
												<path
													d="M1 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z" />
											</svg>
											<h5 class="m-0">회원 로그인</h5>
										</div>
									</a>
								</li>
							</core:otherwise>
						</core:choose>
						<core:if test="${not empty userInfo }">
							<core:if test="${userInfo.getGrade() eq 'admin' }">
								<li class="nav-item dropdown">
									<button class="btn btn-lg nav-link dropdown-toggle text-light" role="button"
										data-bs-toggle="dropdown" aria-expanded="false">
										<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-tools" viewBox="0 0 16 16">
  											<path d="M1 0 0 1l2.2 3.081a1 1 0 0 0 .815.419h.07a1 1 0 0 1 .708.293l2.675 2.675-2.617 2.654A3.003 3.003 0 0 0 0 13a3 3 0 1 0 5.878-.851l2.654-2.617.968.968-.305.914a1 1 0 0 0 .242 1.023l3.27 3.27a.997.997 0 0 0 1.414 0l1.586-1.586a.997.997 0 0 0 0-1.414l-3.27-3.27a1 1 0 0 0-1.023-.242L10.5 9.5l-.96-.96 2.68-2.643A3.005 3.005 0 0 0 16 3c0-.269-.035-.53-.102-.777l-2.14 2.141L12 4l-.364-1.757L13.777.102a3 3 0 0 0-3.675 3.68L7.462 6.46 4.793 3.793a1 1 0 0 1-.293-.707v-.071a1 1 0 0 0-.419-.814L1 0Zm9.646 10.646a.5.5 0 0 1 .708 0l2.914 2.915a.5.5 0 0 1-.707.707l-2.915-2.914a.5.5 0 0 1 0-.708ZM3 11l.471.242.529.026.287.445.445.287.026.529L5 13l-.242.471-.026.529-.445.287-.287.445-.529.026L3 15l-.471-.242L2 14.732l-.287-.445L1.268 14l-.026-.529L1 13l.242-.471.026-.529.445-.287.287-.445.529-.026L3 11Z"/>
										</svg>
										관리자 메뉴
									</button>
									<ul class="dropdown-menu dropdown-menu-dark">
										<li><a class="dropdown-item" href="videoForm.jsp">영상 정보 등록</a></li>
										<li><a class="dropdown-item" href="userList">회원관리</a></li>
									</ul>
								</li>
							</core:if>
						</core:if>
					</ul>
				</div>
			</div>
		</nav>

		<div class="modal fade" id="signin-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h1 class="modal-title fs-5" id="signin-modal-title">Log In</h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<form>
							<div class="mb-3">
								<label for="signin-id" class="col-form-label">ID</label>
								<input type="text" class="form-control" id="signin-id" />
							</div>
							<div class="mb-3">
								<label for="sign-password" class="col-form-label">비밀번호</label>
								<input class="form-control" id="signin-password" />
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" id="signin-btn">
							로그인
						</button>
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
							취소
						</button>
					</div>
				</div>
			</div>
		</div>

		<script src="js/header_signIn.js"></script>