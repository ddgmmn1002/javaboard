<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>post list</title>
</head>
<body class="bg-dark">
	<jsp:include page="header.jsp"></jsp:include>
	<div class="container p-5 mt-5 mb-5 bg-light rounded">
		<div class="row">
			<div class="col">
				<h3><span class="badge bg-secondary mb-1">회원 명단</span></h3>
				<table class="table table-hover align-middle bg-white rounded shadow-sm">
					<thead>
						<tr class="ps-5">
							<td></td>
							<td style="width:10%">아이디</td>
							<td style="width:30%">닉네임</td>
							<td style="width:25%">이름</td>
							<td style="width:25%">등급</td>
							<td>가입 일자</td>
						</tr>
					</thead>
					<tbody class="table-group-divider">
						<core:forEach var="user" items="${userList}" varStatus="status">
							<tr onclick="userIsClicked('${user.getId()}')">
								<td></td>
								<td>${user.getId() }</td>
								<td>${user.getNickname() }</td>
								<td>${user.getName() }</td>
								<core:choose>
									<core:when test='${user.getGrade() eq "critic"}'>
										<td>평론가</td>										
									</core:when>
									<core:otherwise>
										<td>일반 이용자</td>
									</core:otherwise>
								</core:choose>
								<td>${user.getSignupDate() }</td>
							</tr>
						</core:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<div class="row">
			<div class="col">
				<nav>
					<ul class="pagination justify-content-center">
						<li class="page-item">
							<core:choose>
								<core:when test="${paging.getCurrentPage() <= 1 }">								
									<a class="page-link disabled" href="userList?page=${paging.getCurrentPage()-1 }" aria-label="Previous">
										<span aria-hidden="true">&laquo;</span>
									</a>
								</core:when>
								<core:otherwise>
									<a class="page-link" href="userList?page=${paging.getCurrentPage()-1 }" aria-label="Previous">
										<span aria-hidden="true">&laquo;</span>
									</a>
								</core:otherwise>
							</core:choose>
						</li>
						<core:forEach var="page" begin="${paging.getStartPage() }" end="${paging.getEndPage() }">
							<core:choose>
								<core:when test="${paging.getCurrentPage() == page}">
									<li class="page-item active">
										<a class="page-link" href="userList?page=${page }">${page }</a>								
									</li>
								</core:when>
								<core:otherwise>
									<li class="page-item">
										<a class="page-link" href="userList?page=${page }">${page }</a>								
									</li>
								</core:otherwise>
							</core:choose>
						</core:forEach>
						<li class="page-item">
							<core:choose>
								<core:when test="${paging.getCurrentPage() >= paging.getTotalPage() }">								
									<a class="page-link disabled" href="userList?page=${paging.getCurrentPage()+1 }" aria-label="Next">
										<span aria-hidden="true">&raquo;</span>
									</a>
								</core:when>
								<core:otherwise>
									<a class="page-link" href="userList?page=${paging.getCurrentPage()+1 }" aria-label="Next">
										<span aria-hidden="true">&raquo;</span>
									</a>
								</core:otherwise>
							</core:choose>
						</li>
					</ul>
				</nav>
			</div>
		</div>
	</div>

<script>
	function userIsClicked(id){
		location.href = "userDetail?id=" + id;
	}
</script>
</body>
</html>

