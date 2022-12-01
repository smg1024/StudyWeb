<%@page import="com.multi.app.board.BoardDTO"%>
<%@page import="com.multi.app.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	// 게시판 목록에서 제목을 선택하여 글 내용 보기로 이동
	// 제목 선택 시 보내준 postno를 request한다
	
	int postno = Integer.parseInt(request.getParameter("postno"));
	
	// postno에 해당되는 데이터를 DB에서 선택해야한다
	BoardDAO dao = new BoardDAO();
	
	// 데이터 선택, 조회수 +1
	BoardDTO dto = dao.boardSelectOne(postno, 1);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Post</title>
<style>
	.container{
		width:1000px;
		margin: 0 auto;
	}
	ul,li{
		margin:0;
		padding:0;
		list-style-type:none;
	}
	li{
		float:left;
		width:10%;
		margin:10px, 0;
	}
	li:nth-child(2n){
		width:90%;
	}
</style>
</head>
<body>
	<div class="container">
		<h1>View post content</h1>
		<ul>
			<li>Post No.</li>
			<li><%= dto.getPostno() %></li>
			<li>Author</li>
			<li><%= dto.getUsername() %>, Date: <%= dto.getRegdate() %>, Views: <%= dto.getHitcount() %></li>
			<li>Title</li>
			<li><%= dto.getSubject() %></li>
			<li>Content</li>
			<li><%= dto.getContent() %></li>
		</ul>
		<div>
			<a href="/webApp/board/boardEdit.jsp?postno=<%= dto.getPostno() %>">Edit</a>
			Delete
			<a href="/webApp/board/boardList.jsp">List</a>
		</div>
	</div>
</body>
</html>