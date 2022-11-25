<!-- 지시부 : page 상단에 기술한다 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
// 선언부 : jsp에서 메소드나 변수를 선언하는 곳
// 단을 매개변수로 전달받아 구구단을 출력하는 메소드
public String gugudan(int dan){
	String result = "";
	for(int i=1; i<=9; i++){
		// out.print(dan + "*" + i + "=" + (dan*i));
		result += dan + "*" + i + "=" + (dan*i) + "<br>";
	}
	return result;
}

// 임의의 수를 매개변수로 전달받아 그 수까지의 합을 구하여 반환하는 메소드
public int sum(int max){
	int s = 0;
	for(int i=1; i<=max; i++){
		s += i;
	}
	return s;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%
	String tel = "010-1234-5678";
%>
<title>221125 JSP Scriptlet</title>
</head>
<body>
<%
	// 스크립트릿 Scriptlet : 변수선언, 기본명령어(if, for, while, 객체생성, 배열)
	int a = 1234;
	String b = "<b>홍길동</b>";
	
	// 클라이언트에게 정보 보내기	내장객체: out -> PrintWriter
	out.println("이름=" + b);
%>
<hr>
<h1>구구단</h1>
<%
	// 구구단 메소드를 호출
	String gugu = gugudan(6);
	out.println(gugu);
	
	// <%=변수,수식,함수만 쓸 수 있음
%>
<hr>
a=<%=a %><br>
sum(100) -> <%= sum(100) %>
</body>
</html>