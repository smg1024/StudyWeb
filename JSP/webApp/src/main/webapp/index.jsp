<!-- 지시부 : page 상단에 기술한다 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.Calendar" %>
<%@page import="java.text.SimpleDateFormat"%>
<!-- 서버언어가 실행 영역에 표시되는 공백라인을 안 보이도록 설정하는 방법 -->
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page errorPage="jsp05_error/errorPage.jsp" %>
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
<title>index.jsp</title>
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
	<h1 style="background:pink"><a href="/webApp/board/boardList.jsp">Board</a></h1>
	<!-- 예외가 발생하면 errorPage.jsp로 이동 설정 -->
	<!-- 1. 지시부에 예외 발생 시 이동할 페이지정보를 기술한다. -->
	<!-- 2. 에러 발생 시 실행될 페이지에 지시부를 기술한다. -->
	<%--
		String numStr = request.getParameter("num");
		int num = Integer.parseInt(numStr);	// num값이 null일때 errorPage로 이동
	--%>
	<h1>Session값 확인</h1>
	<div>
		Username : <%= session.getAttribute("username") %><br>
		Name : <%= session.getAttribute("name") %><br>
		Nickname : <%= session.getAttribute("nickname") %><br>
	</div>
	<a href="/webApp/jsp02_response/login.jsp">로그인</a><br>
	<a href="/webApp/jsp04_session/sessionDel.jsp">로그아웃(세션객체 지우기)</a><br>
	<a href="<%= request.getContextPath() %>/jsp01_request/formRequest.jsp">회원가입</a><br>
	<hr>
	<h1>JSTL(JSP Standard Tag Library)</h1>
	<div>
		준비사항<br>
		1. https://tomcat.apache.org/taglibs/standard -> taglibs -> Apache Standard Taglib binary
		-> jakarta-taglibs-standard-1.1.2.zip 다운로드
		<br>
		2. 다운로드한 파일을 압축 해제 후
		../jakarta-taglibs-standard-1.1.2/lib 에서 jstl.jar, standard.jar파일을 이클립스의 WEB-INF/lib 폴더에 복사
	</div>
	<ol>
		<li><a href="/webApp/jsp07_jstl/jstl01_setTag.jsp">setTag : 변수 선언/삭제</a></li>
		<li><a href="/webApp/jsp07_jstl/jstl02_ifTag.jsp?name=Sangmin&age=24&lastname=Kim">ifTag : 조건문</a></li>
		<li><a href="./jsp07_jstl/jstl03_forEachTag.jsp">forEachTag : 반복문</a></li>
		<li><a href="./jsp07_jstl/jstl04_forTokensTag.jsp">forTokensTag : 특정 문자로 쪼개기</a></li>
		<li><a href="./jsp07_jstl/jstl05_chooseTag.jsp?name=kim&age=24">chooseTag : 다중 if문, switch문</a></li>
		<li><a href="./jsp07_jstl/jstl06_urlTag.jsp">urlTag : url주소와 데이터처리</a></li>
		<li><a href="./jsp07_jstl/jstl07_redirectTag.jsp">redirectTag : 자동으로 포워딩</a></li>
	</ol>
	<hr>
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