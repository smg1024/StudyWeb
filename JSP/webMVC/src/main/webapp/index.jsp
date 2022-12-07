<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>webMVC/index.jsp</title>
</head>
<body>
	<div class="container">
		<h1>MVC패턴을 이용한 홈페이지</h1>
		<ol>
			<li>라이브러리 추가 : ojdbc11.jar, jstl.jar, standard.jar</li>
			<li>패키지 생성 : Java Resources에 com.multi.home생성</li>
			<li>DB연결 클래스 : DBConn클래스 추가</li>
			<li>요청 주소와 해당 클래스 관리하는 properties파일 생성 /WEB-INF/prop/urlMapping.properties</li>
			<li>톰캣서버에서 /ROOT/WEB-INF/web.xml 가져오기</li>
		</ol>
	</div>	
</body>
</html>