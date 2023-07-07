<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<div>
	<nav>
		<a href="home.jsp">홈 화면</a>
		<a href="postList">게시글 목록</a>
		<%
			System.out.println(session.getAttribute("userInfo"));
		%>
		<core:choose>
			<core:when test="${not empty userInfo }">
				<div>
					<a>마이페이지</a>
					<a>로그아웃</a>
				</div>
			</core:when>
			<core:otherwise>
				<div>
					<a href="signUpForm.jsp">회원 가입</a>
					<a href="signInForm.jsp">회원 로그인</a>
				</div>
			</core:otherwise>
		</core:choose>
	</nav>
</div>