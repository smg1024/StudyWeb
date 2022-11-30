<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstl06_urlTag.jsp</title>
</head>
<body>
	<h1>url태그 : url주소와 쿼리(데이터)를 처리할 수 있는 태그</h1>
	<c:url var="home" value="/index.jsp"></c:url>
	
	<c:url var="board" value="/jsp07_jstl/jstl06_boardList.jsp">
		<c:param name="subject" value="Title"></c:param>
		<c:param name="content" value="Blah Blah"></c:param>
	</c:url>
	<hr>
	${ home }<br>
	${ board }
	<hr>
	<a href="${ home }">Home</a><br>
	<a href="${ board }">Board List</a>
</body>
</html>