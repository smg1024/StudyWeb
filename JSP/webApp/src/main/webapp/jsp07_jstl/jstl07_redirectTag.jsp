<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- html을 이용한 자동 페이지 이동
<meta http-equiv="Refresh" content="5; https://www.naver.com/"> -->
<title>jstl07_redirectTag.jsp</title>
<script>
	// Javascript로 페이지 이동
	// location.href = "https://www.naver.com";
</script>
</head>
<%
	// 서버에서 다른 페이지로 이동하기
	// response.sendRedirect("https://www.naver.com");
%>
<body>
	<h1>JSTL로 자동으로 포워딩하기</h1>
	<c:redirect url="jstl06_boardList.jsp">
		<c:param name="subject" value="Title"></c:param>
		<c:param name="content" value="Blah Blah"></c:param>
	</c:redirect>
</body>
</html>