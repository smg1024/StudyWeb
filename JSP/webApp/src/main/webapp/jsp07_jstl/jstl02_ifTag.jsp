<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstl02_ifTag.jsp</title>
</head>
<body>
	<h2>if Tag : 조건문 (else가 없음)</h2>
	<c:set var="n1" value="15"/>
	<c:set var="n2" value="15"/>
	<!-- n1과 n2 중 큰 값 출력하기 -->
	<c:if test="${ n1>n2 }">	<!-- 조건이 참일때 실행 -->
		n1(${ n1 })이 n2(${ n2 })보다 크다
	</c:if>
	<c:if test="${ n1<n2 }">
		n1(${ n1 })이 n2(${ n2 })보다 작다
	</c:if>
	<c:if test="${ n1==n2 }">
		n1(${ n1 })과 n2(${ n2 })는 같다
	</c:if>
	<%
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
	%>
	<h2>el 표현식을 이용한 request -> param.이용</h2>
	Name : ${ param.name }<br>
	Age : ${ param.age+10 }<br>
	Lastname : ${ param.lastname }<br>
	<hr>
	<c:if test="${ param.name=='Sangmin' }">
		이름이 ${ param.name }입니다.
	</c:if>
</body>
</html>