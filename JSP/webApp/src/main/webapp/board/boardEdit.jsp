<%@page import="com.multi.app.board.BoardDTO"%>
<%@page import="com.multi.app.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	int postno = Integer.parseInt(request.getParameter("postno"));

	BoardDAO dao = new BoardDAO();
	BoardDTO dto = dao.boardSelectOne(postno, 2);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Post</title>
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
	// 수정된 사항이 있는지 확인하는 함수
	function boardEditCheck(){
		if(document.getElementById("subject").value==""){
			alert("Title is empty");
			return false;
		}
		if(document.getElementById("content").value==""){
			alert("Content is empty");
			return false;
		}
		return true;
	}
</script>
</head>
<body>
	<div class="container">
		<h1>Edit post</h1>
		<form method="post" action="/webApp/board/boardEditOk.jsp" id="editForm" onsubmit="return boardEditCheck()">
			<input type="hidden" name="postno" value="<%= dto.getPostno() %>">	<!-- 수정 대상의 데이터중 postno로 식별 -->
			<ul>
				<li>Author : <input type="text" name="username" id="username" value="<%= dto.getUsername() %>" readonly></li>
				<li>Title : <input type="text" name="subject" id="subject" value="<%= dto.getSubject() %>"></li>
				<li>Content<br>
					<textarea name="content" id="content"><%= dto.getContent() %></textarea></li>
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