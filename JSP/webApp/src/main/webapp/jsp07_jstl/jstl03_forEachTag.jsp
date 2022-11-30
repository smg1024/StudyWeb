<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstl03_forEachTag.jsp</title>
</head>
<body>
	<h1>forEach문 : 반복문</h1>
	<c:set var="times" value="8"/>
	<!-- 1~9까지 1씩 증가 -->
	<!-- step은 1이 default -->
	<c:forEach var="i" begin="1" end="9" step="1">
		${ times } * ${ i } = ${ times*i }<br>
	</c:forEach>
	
	<h2>JSP의 배열객체를 반복처리하기</h2>
	<%
		int data[] = {34,25,63,72,53,23,6,30};
	%>
	<c:forEach var="d" items="<%= data %>">
		[${ d }], 
	</c:forEach>
	
	<h2>컬렉션(List)을 이용한 반복문 사용</h2>
	<%
		List<String> list = new ArrayList<String>();
		list.add("Sangmin");
		list.add("Poby");
		list.add("Alex");
		list.add("Rowen");
	%>
	<ol>
		<c:forEach var="name" items="<%= list %>">
			<li>Name : ${ name }</li>
		</c:forEach>
	</ol>
	
	<h2>컬렉션(Map)을 이용한 반복문 사용</h2>
	<%
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("name", "Daniel");
		map.put("tel", "010-1234-5678");
		map.put("addr", "Gangnam-gu, Seoul");
		map.put("email", "dan@naver.com");
	%>
	<ul>
		<c:forEach var="n" items="<%= map %>">
			<li>${ n.key } : ${ n.value }</li>
		</c:forEach>
	</ul>
</body>
</html>