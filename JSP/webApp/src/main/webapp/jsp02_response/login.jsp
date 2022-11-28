<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login.jsp</title>
<script>
	// 아이디와 비밀번호를 모두 입력했는지 확인하기
	function loginCheck() {
		// 아이디, 비밀번호가 있는지 확인
		var username = document.getElementById("username").value; /* <input type="text" name="username" id="username"> */
		var password = document.getElementById("password").value;
		if(username==""){
			alert("Please insert username");
			return false;
		}
		if(password==""){
			alert("Please insert password")
			return false;
		}
		return true;		
	}
</script>
</head>
<body>
	<h1>Sign in</h1>
	<form method="post" action="/webApp/jsp02_response/loginOk.jsp" onsubmit="return loginCheck()">	<!-- onsubmit이 true면 action실 -->
		Username : <input type="text" name="username" id="username"><br>	<!-- name은 서버에서 사용, id는 CSS,JS에 사용 -->
		Password : <input type="password" name="password" id="password"><br>
		<input type="submit" value="Sign in">
	</form>
</body>
</html>