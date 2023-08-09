<%@page import="java.util.HashMap"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>regist video</title>
<script src="js/jquery-3.7.0.js"></script>
</head>
<body class="bg-dark">
<jsp:include page="header.jsp"></jsp:include>
	<div class="container p-5 mt-5 mb-5 bg-body rounded">
	
		<form action="registVideo" method="post" id="movie-form">
			<div class="d-grid gap-3">
				
				<div class="row mb-4">
					<div class="col">
						<label class="form-label" for="title">제목</label>
						<input class="form-control" type="text" name="title" id="title">
					</div>			
				</div>
				
				<div class="row mb-3">
					<div class="col">
						<label class="form-label" for="genre">장르 (해당되는 사항 모두 선택)</label>
						<div style="border: 1px solid lightgrey" class="d-flex flex-wrap gap-5 p-4 rounded">
							<div class="form-check">
							  <input class="form-check-input" type="checkbox" value="action" id="genre-action" name="genre">
							  <label class="form-check-label" for="genre-action">액션</label>
							</div>
							<div class="form-check">
							  <input class="form-check-input" type="checkbox" value="adventure" id="genre-adventure" name="genre">
							  <label class="form-check-label" for="genre-adventure">모험</label>
							</div>
							<div class="form-check">
							  <input class="form-check-input" type="checkbox" value="romance" id="genre-romance" name="genre">
							  <label class="form-check-label" for="genre-romance">로맨스</label>
							</div>
							<div class="form-check">
							  <input class="form-check-input" type="checkbox" value="family" id="genre-family" name="genre">
							  <label class="form-check-label" for="genre-family">가족</label>
							</div>
							<div class="form-check">
							  <input class="form-check-input" type="checkbox" value="comedy" id="genre-comedy" name="genre">
							  <label class="form-check-label" for="genre-comedy">코미디</label>
							</div>
							<div class="form-check">
							  <input class="form-check-input" type="checkbox" value="drama" id="genre-drama" name="genre">
							  <label class="form-check-label" for="genre-drama">드라마</label>
							</div>
							<div class="form-check">
							  <input class="form-check-input" type="checkbox" value="horror" id="genre-horror" name="genre">
							  <label class="form-check-label" for="genre-horror">공포</label>
							</div>
							<div class="form-check">
							  <input class="form-check-input" type="checkbox" value="thriller" id="genre-thriller" name="genre">
							  <label class="form-check-label" for="genre-thriller">스릴러</label>
							</div>
							<div class="form-check">
							  <input class="form-check-input" type="checkbox" value="mystery" id="genre-mystery" name="genre">
							  <label class="form-check-label" for="genre-mystery">미스터리</label>
							</div>
							<div class="form-check">
							  <input class="form-check-input" type="checkbox" value="sf" id="genre-sf" name="genre">
							  <label class="form-check-label" for="genre-sf">SF</label>
							</div>
							<div class="form-check">
							  <input class="form-check-input" type="checkbox" value="fantasy" id="genre-fantasy" name="genre">
							  <label class="form-check-label" for="genre-fantasy">판타지</label>
							</div>
							<div class="form-check">
							  <input class="form-check-input" type="checkbox" value="western" id="genre-western" name="genre">
							  <label class="form-check-label" for="genre-western">서부</label>
							</div>
							<div class="form-check">
							  <input class="form-check-input" type="checkbox" value="war" id="genre-war" name="genre">
							  <label class="form-check-label" for="genre-war">전쟁</label>
							</div>
							<div class="form-check">
							  <input class="form-check-input" type="checkbox" value="disaster" id="genre-disaster" name="genre">
							  <label class="form-check-label" for="genre-disaster">재난</label>
							</div>
							<div class="form-check">
							  <input class="form-check-input" type="checkbox" value="crime" id="genre-crime" name="genre">
							  <label class="form-check-label" for="genre-crime">범죄</label>
							</div>
							<div class="form-check">
							  <input class="form-check-input" type="checkbox" value="whodunnit" id="genre-whodunnit" name="genre">
							  <label class="form-check-label" for="genre-whodunnit">추리</label>
							</div>
							<div class="form-check">
							  <input class="form-check-input" type="checkbox" value="sport" id="genre-sport" name="genre">
							  <label class="form-check-label" for="genre-sport">스포츠</label>
							</div>
							<div class="form-check">
							  <input class="form-check-input" type="checkbox" value="historical" id="genre-historical" name="genre">
							  <label class="form-check-label" for="genre-historical">역사</label>
							</div>
							<div class="form-check">
							  <input class="form-check-input" type="checkbox" value="animation" id="genre-animation" name="genre">
							  <label class="form-check-label" for="genre-animation">애니메이션</label>
							</div>
							<div class="form-check">
							  <input class="form-check-input" type="checkbox" value="musical" id="genre-musical" name="genre">
							  <label class="form-check-label" for="genre-musical">뮤지컬</label>
							</div>
							<div class="form-check">
							  <input class="form-check-input" type="checkbox" value="documentary" id="genre-documentary" name="genre">
							  <label class="form-check-label" for="genre-documentary">다큐멘터리</label>
							</div>
							<div class="form-check">
							  <input class="form-check-input" type="checkbox" value="variety" id="genre-variety" name="genre">
							  <label class="form-check-label" for="genre-variety">예능</label>
							</div>
						</div>
					</div>
				</div>
				
				<div class="row mb-4">
					<div class="col">
						<label class="form-label" for="director">감독</label>
						<input class="form-control" type="text" name="director" id="director">
					</div>			
					<div class="col">
						<label class="form-label" for="cast">출연</label>
						<input class="form-control" type="text" name="cast" id="cast">
					</div>			
				</div>
				
				<div class="row mb-4">
					<div class="col">
						<div class="input-group">
							<span class="input-group-text">포스터 링크</span>
							<input class="form-control" type="text" name="poster_link" id="poster_link">
						</div>
					</div>			
					<div class="col">
						<div class="input-group">
							<span class="input-group-text">트레일러 링크</span>
							<input class="form-control" type="text" name="trailer_link" id="trailer_link">
						</div>
					</div>			
				</div>
				
				<div class="row mb-4">
					<div class="col">
						<label class="form-label" for="plot">줄거리</label>
						<textarea class="form-control" placeholder="줄거리를 입력해주세요." id="plot" name="plot" style="height: 200px"></textarea>
					</div>
				</div>
				
				<div class="row mb-4">
					<div class="col">
						<div class="input-group">
							<span class="input-group-text">개봉일</span>
							<input class="form-control" type="text" name="release_date" placeholder="연도">
							<input class="form-control" type="text" name="release_date" placeholder="월">
							<input class="form-control" type="text" name="release_date" placeholder="일">
						</div>
					</div>
				</div>
				
				<div class="row mb-4">
					<div class="col">
						<label class="form-label" for="plot">총 러닝타임(분)</label>
						<input class="form-control" id="runtime" name="runtime"></input>
					</div>
				</div>
				
				<div class="row mb-4">
					<div class="col">
						<label class="form-label" for="film-rating">관람등급</label>
						<div style="border: 1px solid lightgrey" class="d-flex gap-5 p-4 rounded">
							<div class="form-check">
								<input class="form-check-input" type="radio" name="film-rating" value="all" id="film-rating-all">
								<label class="form-check-label" for="film-rating-all">ALL</label>
							</div>
							<div class="form-check">
								<input class="form-check-input" type="radio" name="film-rating" value="7" id="film-rating-7">
								<label class="form-check-label" for="film-rating-7">7세</label>
							</div>
							<div class="form-check">
								<input class="form-check-input" type="radio" name="film-rating" value="12" id="film-rating-12">
								<label class="form-check-label" for="film-rating-12">12세</label>
							</div>
							<div class="form-check">
								<input class="form-check-input" type="radio" name="film-rating" value="15" id="film-rating-15">
								<label class="form-check-label" for="film-rating-15">15세</label>
							</div>
							<div class="form-check">
								<input class="form-check-input" type="radio" name="film-rating" value="19" id="film-rating-19">
								<label class="form-check-label" for="film-rating-19">19세</label>
							</div>
						</div>
					</div>
				</div>
				
				<div class="row mb-4">
					<div class="col">
						<label class="form-label" for="language">주요 사용언어</label>
						<select class="form-select" name="language" id="language">
							<option disabled="disabled" selected="selected">언어 선택</option>
							<option value="KR">한국어</option>
							<option value="EN">영어</option>
							<option value="CN">중국어</option>
							<option value="JP">일본어</option>
							<option value="FR">프랑스어</option>
						</select>
					</div>
				</div>
				
				<div class="row mb-4">
					<div class="col">
						<label class="form-label" for="category">영상물 분류</label>
						<div style="border: 1px solid lightgrey" class="d-flex gap-5 p-4 rounded">
							<div class="form-check">
								<input class="form-check-input" type="radio" name="category" value="movie" id="category-movie">
								<label class="form-check-label" for="category-movie">영화</label>
							</div>
							<div class="form-check">
								<input class="form-check-input" type="radio" name="category" value="series" id="category-series">
								<label class="form-check-label" for="category-series">시리즈</label>
							</div>
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="col d-flex justify-content-end gap-3">
						<input type="submit" id="btn-submit" value="영상 정보 게시" class="btn btn-primary">
						<a id="btn-cancel" class="btn btn-danger" href="home.jsp">취소</a>
					</div>
				</div>
				
			</div>
		</form>
		
	</div>
</body>
</html>
