<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- jstl태그를 사용하기 위해서는 지시부에 tag library에 대한 정의가 필수다 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstl01_setTag.jsp</title>
</head>
<body>
	<h1>JSTL : JSP Standard Tag Library</h1>
	<h1>set태그 : 변수를 선언하거나 삭제할 때</h1>
	<%
		// jsp에서 변수선언
		int num = 1111;
		String name = "Sangmin Kim";
		
		out.println("num=" + num + "<br>");
	%>
	<%= name %><br>
	
	<h2>JSTL로 변수 선언하기</h2>
	<c:set var="age" value="12"></c:set>
	<c:set var="class1" value="2"/>
	<c:set var="addr">Gangnam-gu, Seoul</c:set>
	<c:set var="today" value="<%= new Date() %>"></c:set>
	
	<h1>EL : Expression Language</h1>
	<pre>
	JSTL로 선언된 변수
	request, session, application 등 내장객체가 가지고 있는 정보를 사용할 수 있음
	</pre>
	Age = ${ age }<br>
	Class = ${ class1 }<br>
	Address = ${ addr }<br>
	Date = ${ today }<br>
	
	<h2>JSP로 선언된 변수는 JSTL로 불러올 수 없지만, 에러는 안 뜨고 ""문자로 처리한다.</h2>
	num -> ${ num }<br>
	<%-- addr --%>
	<hr>
	
	<h2>EL 표현식</h2>
	수식 age+20 = ${ age+20 }<br>
	수식 100/200 = ${ 100/200 }<br>
	수식 age>10 ? ${ age>10 }<br>
	<c:set var="num" value="${ age+50 }"/>
	num = ${ num }<br>
	
	<h2>변수 삭제</h2>
	<pre>
	scope : 생명 주기
		application, session, page, request 사용 가능
	</pre>
	<c:remove var="age" scope="page"/>
	age = ${ age }
</body>
</html>