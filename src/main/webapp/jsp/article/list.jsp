<%@ page import="java.util.List"%>
<%@ page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
@SuppressWarnings("unchecked")
List<Map<String, Object>> articleRows = (List<Map<String, Object>>) request.getAttribute("articleRows");
int cPage = (int) request.getAttribute("page");
int totalPage = (int) request.getAttribute("totalPage");

int listPage = 10;
int startPage = ((cPage-1) / listPage) * listPage + 1;
int endPage = startPage + listPage - 1;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 리스트</title>
</head>
<body>
	<%@include file="../part/topbar.jspf" %>
	
	<h1>게시물 리스트</h1>

	<table style="border-collapse: collapse; border-color: green" border="2px">

		<tr>
			<th>번호</th>
			<th>작성날짜</th>
			<th>작성자</th>
			<th>제목</th>
			<th>수정</th>
			<th>삭제</th>
		</tr>
		<%
		for (Map<String, Object> articleRow : articleRows) {
		%>
		<tr style="text-align: center;">
			<td><%=articleRow.get("id")%></td>
			<td><%=articleRow.get("regDate")%></td>
			<td><%=articleRow.get("extra_writer")%></td>
			<td><a href="detail?id=<%=articleRow.get("id")%>"><%=articleRow.get("title")%></a></td>
			<td><a href="modify?id=<%=articleRow.get("id")%>">수정</a></td>
			<td><a href="doDelete?id=<%=articleRow.get("id")%>">삭제</a></td>
		</tr>
		<%
		}
		%>

	</table>

	<style type="text/css">
.page {
	background-color: gold;
}
.page>a {
	color: black;
}
.page>a.red {
	color: red;
}
</style>

	<div class="page">
	<%if(endPage > totalPage) {
			endPage = totalPage;%>
	<%}%>
	<%if(startPage > 1) {%>
		<button><a href="list?page=<%=startPage-listPage%>">◀◀;</a></button>
	<%}%>
		<%
		for (int i = startPage; i <= endPage; i++) {
		%>
			<a class="<%=cPage == i ? "red" : ""%>" href="list?page=<%=i%>"><%=i%></a>
		<%
		}
		%>
		<% if (endPage < totalPage) { %>
        <a href="list?page=<%=startPage+listPage%>">▶▶;</a>
    <% } %>
	</div>

</body>
</html>