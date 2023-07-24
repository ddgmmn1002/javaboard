<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body class="bg-dark">
	<jsp:include page="header.jsp"></jsp:include>
	<div class="container shadow-lg p-3 mb-5 bg-light rounded">
		<div>
			<label>내 게시글</label>
			<table class="table table-hover mb-5">
				<thead>
					<tr class="shadow-sm p-3 mb-1">
						<td>게시글 번호</td>
						<td>제목</td>
						<td>작성일</td>
					</tr>
				</thead>
				<tbody>
					<core:choose>
						<core:when test="${postList.size() eq 0 }">
							<tr>
								<td></td>
								<td>작성한 게시글이 없습니다.</td>
								<td></td>
							</tr>
						</core:when>
						<core:otherwise>
							<core:forEach var="post" items="${postList }">
								<tr class="shadow-sm p-3 mb-1" onclick="postIsClicked(${post.getPno()})">
									<td>${post.getPno() }</td>
									<td>${post.getTitle() }</td>
									<td>${post.getCreatedAt() }</td>
								</tr>
							</core:forEach>
						</core:otherwise>
					</core:choose>
				</tbody>
			</table>
		</div>
		<div>
			<label>내 댓글</label>
			<table class="table table-hover mb-5">
				<thead>
					<tr class="shadow-sm p-3 mb-1">
						<td>댓글번호</td>
						<td>게시글 제목</td>
						<td>작성일</td>
					</tr>
				</thead>
				<tbody>
					<core:choose>
						<core:when test="${commentList.size() eq 0}">
							<tr>
								<td></td>
								<td>작성한 댓글이 없습니다.</td>
								<td></td>
							</tr>
						</core:when>
						<core:otherwise>
							<core:forEach var="comment" items="${commentList }">
								<tr class="shadow-sm p-3 mb-1" onclick="postIsClicked(${comment.getPno()})">
									<td>${comment.getCno() }</td>
									<td>${comment.getTitle() }</td>
									<td>${comment.getCreatedAt() }</td>
								</tr>
							</core:forEach>
						</core:otherwise>
					</core:choose>
				</tbody>
			</table>
		</div>
		<div>
			<label>조회한 게시글</label>
			<table class="table table-hover mb-5">
				<thead>
					<tr class="shadow-sm p-3 mb-1">
						<td>게시글 번호</td>
						<td>게시글 제목</td>
						<td>조회한 날짜</td>
					</tr>
				</thead>
				<tbody>
					<core:choose>
						<core:when test="${interactionList.size() eq 0}">
							<tr>
								<td></td>
								<td>조회한 글이 없습니다.</td>
								<td></td>
							</tr>
						</core:when>
						<core:otherwise>
							<core:forEach var="interaction" items="${interactionList }">
								<tr class="shadow-sm p-3 mb-1" onclick="postIsClicked(${interaction.getPno()})">
									<td>${interaction.getPno() }</td>
									<td>${interaction.getTitle() }</td>
									<td>${interaction.getInteractedAt() }</td>
								</tr>
							</core:forEach>
						</core:otherwise>
					</core:choose>
				</tbody>
			</table>
		</div>
		<div>
			<label>좋아요 누른 게시글</label>
			<table class="table table-hover mb-5">
				<thead>
					<tr class="shadow-sm p-3 mb-1">
						<td>게시글 번호</td>
						<td>게시글 제목</td>
						<td>조회한 날짜</td>
					</tr>
				</thead>
				<tbody>
					<core:choose>
						<core:when test="${interactionList.size() eq 0}">
							<tr>
								<td></td>
								<td>좋아요 누른 글이 없습니다.</td>
								<td></td>
							</tr>
						</core:when>
						<core:otherwise>
							<core:forEach var="interaction" items="${interactionList }">
								<core:if test="${interaction.isLikeStatus()}">
									<tr class="shadow-sm p-3 mb-1" onclick="postIsClicked(${interaction.getPno()})">
										<td>${interaction.getPno() }</td>
										<td>${interaction.getTitle() }</td>
										<td>${interaction.getInteractedAt() }</td>
									</tr>
								</core:if>
							</core:forEach>
						</core:otherwise>
					</core:choose>
				</tbody>
			</table>
		</div>
	</div>
<script>
	function postIsClicked(pno){
		location.href = "postDetail?pno=" + pno;
	}
</script>
</body>
</html>