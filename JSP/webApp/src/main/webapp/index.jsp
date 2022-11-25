<!-- 지시부 : page 상단에 기술한다 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.Calendar" %>
<%@page import="java.text.SimpleDateFormat"%>
<!-- 서버언어가 실행 영역에 표시되는 공백라인을 안 보이도록 설정하는 방법 -->
<%@ page trimDirectiveWhitespaces="true" %>
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
<title>221125 Scriptlet</title>
<link rel="stylesheet" href="./css_js/style.css" type="text/css">
<style>
	hr{border:1px solid red;}
</style>
<script>
	document.write("<h2>내장 자바스크립트에서 실행됨</h2>");
</script>
<script src="./css_js/script.js"></script>
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
sum(100) -> <%= sum(100) %><br>
<%
	// JSP : Java Server Page = php, asp
	System.out.println("JSP에서 출력문 사용하기");

	// 서버 컴퓨터의 날짜/시간 정보 구하기
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 HH:mm");
	Calendar servertime = Calendar.getInstance();
	int year = servertime.get(Calendar.YEAR);	// now.get(1)이랑 같음
	int month = servertime.get(Calendar.MONTH)+1;	// 0->1월, 1->2월,... 
	int day = servertime.get(Calendar.DAY_OF_MONTH);
	int hour = servertime.get(Calendar.HOUR_OF_DAY);
	int minute = servertime.get(Calendar.MINUTE);
	String time = sdf.format(servertime.getTime());
%>
<h1>서버 시간 = <%= year %>년 <%= month %>월 <%= day %>일 <%= hour %>:<%= minute %></h1>
<h1>Server Time = <%= time %></h1>
<img src="./img/flower.jpg" width="80%">
</body>
</html>