<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>includeMain_jsp.jsp</title>
<style>
	.body{
		height:500px;
		border:1px solid red;
	}
</style>
</head>
<body>
	<!-- 상단부분(Header)를 include하기 -->
	<jsp:include page="Header.jsp"/>
	<div class="body">
		Body
		<%
			// Header.jsp에서 선언된 변수 num은 다른 jsp파일에서 호환되지 않는다
			// out.println(num);
		
			String name = "Sangmin Kim";
		%>
	</div>
	<!-- 하단부분(Footer)를 include하기 -->
	<jsp:include page="Footer.jsp"/>
</body>
</html>