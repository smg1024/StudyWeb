<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Write a new post</title>
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
</head>
<body>
	<div class="container">
		<h1>New post</h1>
		<ul>
			<li>Author : <input type="text" name="username" id="username" value="poby"></li>
			<li>Title : <input type="text" name="subject" id="subject"></li>
			<li>Content<br>
				<textarea name="content" id="content"></textarea></li>
			<li><input type="submit" value="Post"></li>
		</ul>
	</div>
	<div>
		<a href="/webApp/">Home</a>
		<a href="/webApp/board/boardList.jsp">List</a>
	</div>
</body>
</html>