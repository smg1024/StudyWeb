<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>aLink.jsp</title>
</head>
<body>
<div>
	request 내장객체(tomcat 내장) : client의 데이터를 server로 가져갈 수 있다.<br>
	client 컴퓨터 ip구하기<br>
	현재 실행중인 파일의 경로와 파일명을 구할 수 있다.<br>
	서버url, port도 구할 수 있다.
</div>
<h2>a태그를 이용하여 서버로 데이터 보내기 : get방식 전송됨</h2>
<pre>
	get방식 전송 : 주소표시줄에 변수와 값이 공개되어있음
	post방식 전송 : 주소표시줄에 변수와 값이 보이지 않음
</pre>
<a href="aLinkOk.jsp?num=1234&username=김상민&gender=M">클릭하세요.</a>
</body>
</html>