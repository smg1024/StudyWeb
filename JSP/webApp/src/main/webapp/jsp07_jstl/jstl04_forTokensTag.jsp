<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>forTokensTag.jsp</title>
</head>
<body>
	<h1>forTokens 태그 : 특정 문자 기준으로 문자열 조각내기</h1>
	<!-- items에 담긴 문자열을 delims기준으로 조각낸다 -->
	<c:forTokens var="flowers" items="rose,cosmos,tulip,sunflower" delims=",">
		[${ flowers }], 
	</c:forTokens>
</body>
</html>