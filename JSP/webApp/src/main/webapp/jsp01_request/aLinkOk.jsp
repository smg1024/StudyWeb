<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>aLinkOk.jsp</title>
</head>
<body>
<h1>aLinkOk.jsp 페이지입니다.</h1>
<%
	// request객체를 이용하여 client측에 보낸 데이터를 서버로 가져옴
	// request로 넘어온 데이터는 문자열이다
	int num = Integer.parseInt(request.getParameter("num"));	// 1234
	String username = request.getParameter("username");	// 김상민
	String gender = request.getParameter("gender");	// M
	
	System.out.println("Number: " + num);
	System.out.println("Name: " + username);
	String genderStr = (gender.equals("M"))? "Male" : "Female";
	System.out.println("Gender: " + genderStr);
%>
번호 : <%= num %><br>
이름 : <%= username %><br>
성별 : <%= genderStr %><br>
</body>
</html>