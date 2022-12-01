<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>deleteCookie.jsp</title>
</head>
<body>
<%
	Cookie coo[] = request.getCookies();
	
	for(int i=0; i<coo.length; i++){
		coo[i].setMaxAge(0);
		response.addCookie(coo[i]);
	}
	for(int i=0; i<coo.length; i++){
		%>
		<ul>
			<li><%= coo[i].getName() %>=<%= coo[i].getValue() %>, <%= coo[i].getMaxAge() %></li>
		</ul>
		<%
	}
%>
<a href="/webApp">홈으로</a>
</body>
</html>