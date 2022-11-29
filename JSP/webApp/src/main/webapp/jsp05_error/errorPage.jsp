<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isErrorPage = "true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>errorPage.jsp</title>
</head>
<body>
	<h1>에러 발생 시 요청되는 페이지</h1>
	<a href="/webApp/?num=2">홈으로 이동</a><br>
	에러 메시지 : 
	<%
		out.print(exception.getMessage());
	%>
	<img src="/webApp/img/error.jpg" width="80%">
</body>
</html>