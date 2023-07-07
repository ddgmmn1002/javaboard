<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	header {
		padding: 6px 10px;
		display: flex;
		align-items: center;
		justify-content: space-between;
		position: relative;
		box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);
	}
	header > label{
		display: flex;
		flex-direction: column;
		justify-content: space-between;
		cursor: pointer;
		width: 35px;
		height: 25px;
	}
	header > label > span {
		background-color: white;
		width: 100%;
		height: 5px;
		border: 1px solid black;
		border-radius: 10px;
	}
	header > label:hover span{
		background-color: lightgray;
	}
	
	header > input {
		display: none;
	}
	
	nav {
		width: 20vw;
		height: 100vh;
		box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);
		transform: translateX(-100%);
		transition: transform 0.5s ease-in-out;
	}
	nav ul {
		padding: 0;
		margin: 0;
		display: flex;
		flex-direction: column;
		list-style: none;
		gap: 20px;
		padding: 20px 0px 0px 20px;
		font-size: 20;
	}
	header:has(input:checked) ~ nav {
		transform: translate(0%);
	}
	
	a {
		text-decoration: none;
		color: black;
	}
	a:hover {
		color: gray;
	}
</style>

<header>
	<label for="nav-checkbox">
		<span></span>
		<span></span>
		<span></span>
	</label>
	<input type="checkbox" id="nav-checkbox">
	<h1>Header</h1>
</header>
<nav>
	<ul>
		<li><a href="home.jsp">홈</a></li>
		<li><a href="#">로그인 / 회원가입</a></li>
		<li><a href="">게시글 목록</a></li>
	</ul>
</nav>