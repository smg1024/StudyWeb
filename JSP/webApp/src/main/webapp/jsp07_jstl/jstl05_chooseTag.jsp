<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstl05_chooseTag.jsp</title>
</head>
<body>
	<h1>choose태그 : 다중 if문(switch문)</h1>
	<pre>
	조건에 맞는 명령문이 나오면 바로 조건문 탈출
	</pre>
	<c:choose>
		<c:when test="${ param.name=='kim' && param.age<25 }">
			Your last name is ${ param.name } and you are younger than 25. 
		</c:when>
		<c:when test="${ param.name=='kim' }">
			Your last name is ${ param.name }.
		</c:when>
		<c:when test="${ param.age<25 }">
			You are younger than 25.
		</c:when>
		<c:otherwise>
			Your last name is not kim and you are older than 25.
		</c:otherwise>
	</c:choose>
</body>
</html>