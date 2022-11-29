<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sessionSave.jsp</title>
</head>
<body>
	<h1>Session 처리하기</h1>
	<pre>
		Session 내장객체는 클라이언트가 서버에 접속하면 자동할당된다.
		Session에 기록한 정보는 session객체가 없어지면 기록 정보도 사라진다.
		Session의 소멸 시간은 접속 종료를 기준으로 일정 시간(30분)이 지나면 지워진다.
	</pre>
	Session ID : <%= session.getId() %> -> 16진수<br>
	
	<%
		// Session영역에 정보 기록하기
		session.setAttribute("username", "smg1024");
		session.setAttribute("name", "Sangmin Kim");
		session.setAttribute("nickname", "poby");
	%>

</body>
</html>