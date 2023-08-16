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
	<div class="container p-5 mt-5 mb-5 bg-light rounded">
		<div class="row">
			<div class="col">
				<div class="rounded p-3">
					<h3><span class="badge bg-secondary mb-1">내 게시글</span></h3>
					<table class="table table-sm table-hover shadow-sm rounded" style="border:1px solid gray;">
						<thead>
							<tr>
								<td style="width:15%"></td>
								<td style="width:65%">제목</td>
								<td>작성일</td>
							</tr>
						</thead>
						<tbody class="table-group-divider">
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
										<tr onclick="postIsClicked(${post.getPno()})">
											<td>${post.getPno() }</td>
											<td>${post.getTitle() }</td>
											<td>
													${post.getCreatedAt() }
											</td>
										</tr>
									</core:forEach>
								</core:otherwise>
							</core:choose>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col">
				<div class="rounded p-3">
					<h3><span class="badge bg-secondary mb-1">내 댓글</span></h3>
					<table class="table table-sm table-hover mb-5 shadow-sm rounded" style="border:1px solid gray;">
						<thead>
							<tr>
								<td style="width:15%"></td>
								<td style="width:65%">게시글</td>
								<td>작성일</td>
							</tr>
						</thead>
						<tbody class="table-group-divider">
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
										<tr onclick="postIsClicked(${comment.getPno()})">
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
			</div>
		</div>
		<div class="row">
			<div class="col">
				<div class="rounded p-3">
					<h3><span class="badge bg-secondary mb-1">조회한 게시글</span></h3>
					<table class="table table-sm table-hover mb-5 shadow-sm rounded" style="border:1px solid gray;">
						<thead>
							<tr>
								<td style="width:15%"></td>
								<td style="width:65%">제목</td>
								<td>조회한 날짜</td>
							</tr>
						</thead>
						<tbody class="table-group-divider">
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
										<tr onclick="postIsClicked(${interaction.getPno()})">
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
			</div>
		</div>
		<div class="row">
			<div class="col">
				<div class="rounded p-3">
					<h3><span class="badge bg-secondary mb-1">좋아요 누른 게시글</span></h3>
					<table class="table table-sm table-hover mb-5 shadow-sm rounded" style="border:1px solid gray;">
						<thead>
							<tr>
								<td style="width:15%"></td>
								<td style="width:65%">제목</td>
								<td>조회한 날짜</td>
							</tr>
						</thead>
						<tbody class="table-group-divider">
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
											<tr onclick="postIsClicked(${interaction.getPno()})">
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
		</div>
	</div>
<script>
	function postIsClicked(pno){
		location.href = "postDetail?pno=" + pno;
	}
</script>
</body>
</html>