<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>createCookie.jsp</title>
<script>
	// Javascript에서 쿠키 생성하기
	document.cookie = "food=pizza;path=/;expire=2023";
	document.cookie = "notice=true";
</script>
<%
	// Cookie : jsp사용자 컴퓨터(브라우저) 쿠키 기록하기
	Cookie coo = new Cookie("username"/*Name*/,"smg1024"/*Value*/);
	coo.setMaxAge(60*60);	// javascript의 expires와 같음, 소멸시기(초 단위)
	
	// 쿠키 객체 coo를 클라이언트에게 보내기
	response.addCookie(coo);
%>
</head>
<body>
	<h1>쿠키 생성하기</h1>
	<a href="#">쿠키 확인하기</a>
</body>
</html>