<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
	boolean isLogined = (boolean)request.getAttribute("isLogined");
	int loginedMemberId = (int)request.getAttribute("loginedMemberId");
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
</head>
<body>

	<h1>MAIN</h1>
	
	<%if(isLogined){ %>
	<div>
	<%=loginedMemberId %> 번 회원 로그인중
	<a href="../member/doLogout">로그아웃</a>
	</div>
	<%} %>
	
	<%if(isLogined == false){ %>
	<div>
	<a href="../member/login">로그인</a>
	</div>
	<%} %>
	
	<ul>
		<li><a href="../article/list">게시물 리스트</a></li>
	</ul>
	<ul>
		<li><a href="../member/join">회원가입</a></li>
	</ul>

</body>
</html>