<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String tel = "010-1234-5678";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>includeMain_jspf.jsp</title>
<style>
	.body{
		height:300px; background:#ddd;
	}
</style>
</head>
<body>
	<!-- 조각파일(.jspf) include -->
	<%@ include file="HeaderF.jspf" %>
	
	<div class="body">
		Body
		<h1>include된 조각파일에서 선언된 변수 사용하기</h1>
		Name : <%= name %><br>
		Address : <%= addr %><br>
		Contact : <%= tel %><br>
		<c:out value="Hello World!"/>
	</div>
	
	<%@ include file="FooterF.jspf" %>
	
</body>
</html>