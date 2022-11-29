<%@ page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>formRequestOk.jsp</title>
</head>
<body>
	<h1>form에서 submit발생함</h1>
	<%
	// post방식으로 전송할땐 한글을 인코딩해주어야한다.
	request.setCharacterEncoding("UTF-8");

	// form의 데이터를 서버로 가져오기
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	String memo = request.getParameter("memo");
	String interest = request.getParameter("interest");
	String gender = request.getParameter("gender");
	// 같은 변수로 데이터를 여러개 보낸 경우: <checkbox>
	String location[] = request.getParameterValues("location");
	%>
	<ul>
		<li>Username : <%=username%></li>
		<li>Password : <%=password%></li>
		<li>Name : <%=name%></li>
		<li>Memo : <%=memo%></li>
		<li>Interest : <%=interest%></li>
		<li>Gender : <%=gender%></li>
		<li>Location : <%=Arrays.toString(location)%></li>
	</ul>
	<hr>
	<ol>
		<li>Connected IP Address : <%= request.getRemoteAddr() %></li>
		<li>Encoding : <%= request.getCharacterEncoding() %></li>
		<li>ContentType : <%= request.getContentType() %></li>
		<li>Method : <%= request.getMethod() %></li>
		<li>HTTP Protocol : <%= request.getProtocol() %></li>
		<li>URI : <%= request.getRequestURI() %></li>	<!-- context명, 경로, 파일명 -->
		<li>ContextPath : <%= request.getContextPath() %>	<!-- context->/webApp form action에 파일경로 넣을때 사용 가능-->
		<li>Server name : <%= request.getServerName() %></li>	<!-- Domain, ip -->
		<li>Port : <%= request.getServerPort() %></li>
		<li>Servlet Context : <%= request.getServletContext().getRealPath("/img") %></li>
		<li>Query : <%= request.getQueryString() %></li>	<!-- get방식의 쿼리문 -->
	</ol>
</body>
</html>