<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cookieView.jsp</title>
</head>
<body>
	<h1>쿠키 정보 얻어오기</h1>
<%
	Cookie coo[] = request.getCookies();
	
	for(int i=0; i<coo.length; i++){
		%>
		<li><%= coo[i].getName() %>=<%= coo[i].getValue() %>, <%= coo[i].getMaxAge() %></li>
		<%
	}
%>
</body>
</html>