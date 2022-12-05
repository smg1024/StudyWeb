<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/login.jsp</title>
</head>
<body>
	<h1>로그인form</h1>
	<form method="post" action="<%= request.getContextPath() %>/member/loginOk.do">
		아이디 : <input type="text" name="username"><br>
		비밀번호 : <input type="password" name="password"><br>
		<input type="submit" value="로그인">
	</form>
</body>
</html>