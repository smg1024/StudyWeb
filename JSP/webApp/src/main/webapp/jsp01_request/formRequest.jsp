<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>formRequest.jsp</title>
</head>
<body>
<h1>form태그를 이용한 데이터 전송</h1>
<pre>
	get방식 : 데이터 전송하는 default 방법, 변수값 url에 표시
	post방식 : 변수값을 url에 표시 안 하게 하면서 데이터를 전송하는 방법
	action="도메인+경로+파일" : form내에서 submit 발생하면 접속할 주소
</pre>
<form method="post" action="<%= request.getContextPath() %>/jsp01_request/formRequestOk.jsp">
	Username : <input type="text" name="username"><br>
	Password : <input type="password" name="password"><br>
	Name : <input type="text" name="name"><br>
	Memo : <textarea name="memo"></textarea><br>
	Interest :  
		<select name="interest">
			<option>Soccer</option>
			<option>Basketball</option>
			<option>Baseball</option>
			<option>Volleyball</option>
		</select>
	Gender : 
		<input type="radio" name="gender" value="M">Male
		<input type="radio" name="gender" value="F">Female<br>
	Region : 
		<input type="checkbox" name="location" value="Seoul">Seoul
		<input type="checkbox" name="location" value="Incheon">Incheon
		<input type="checkbox" name="location" value="Busan">Busan
		<input type="checkbox" name="location" value="Gwangju">Gwangju
		<input type="checkbox" name="location" value="Ulsan">Ulsan<br>
		<input type="submit" value="Subimt">
		<input type="button" value="Send">	<!-- 이건 아무 기능 없는 버튼 -->
</form>
</body>
</html>