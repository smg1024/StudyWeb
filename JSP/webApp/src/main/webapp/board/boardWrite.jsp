<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New article</title>
<!-- jquery홈페이지에서 CDN 링크 불러오기 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<style>
	ul,li{
		padding:0;
		margin:0;
		list-style-type:none;
	}
	.container{
		width:1000px;
		margin:0 auto;
	}
	#subject{
		width:700px;
	}
	#content{
		width:100%;
		height:200px;
	}
</style>
<script>
	$(function(){
		// jquery는 body가 실행된 후에 적용된다
		// form에서 submit이벤트가 발생하면 처리할 이벤트 함수
		$("#writeForm").submit(function(){
			if($("#username").val()==""){	// username이 있는지 확인
				alert("Author is empty");
				return false;
			}
			if($("#subject").val()==""){
				alert("Title is empty");
				return false;
			}
			if($("#content").val()==""){
				alert("Content is empty");
				return false;
			}
			return true;
		});
	});
</script>
</head>
<body>
	<div class="container">
		<h1>New post</h1>
		<form method="post" action="/webApp/board/boardWriteOk.jsp" id="writeForm">
			<ul>
				<li>Author : <input type="text" name="username" id="username" value="poby"></li>
				<li>Title : <input type="text" name="subject" id="subject"></li>
				<li>Content<br>
					<textarea name="content" id="content"></textarea></li>
				<li><input type="submit" value="Post"></li>
			</ul>
		</form>
	</div>
	<div>
		<a href="/webApp/">Home</a>
		<a href="/webApp/board/boardList.jsp">List</a>
	</div>
</body>
</html>