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
<script>
	// 현재 글 삭제 확인 함수
	// yes : 삭제, no : 취소
	function verifyDel(){
		// 대화상자 : alert, confirm, prompt
		// alert() -> 통보, 확인버튼 1개
		// alert("확인 대화상자");
		
		// confirm() -> 확인, 예(true)/아니오(false)
		// confirm("confirm");
		
		// prompt() -> 값을 입력할 수 있음
		// prompt("prompt", "John Smith");
		
		if(confirm("Are you sure you want to delete the post?")){
			// 삭제를 구현하는 페이지로 데이터를 가지고 이동한다
			location.href = "/webApp/board/boardDel.jsp?postno=<%= dto.getPostno() %>";
		}
	}
</script>
</head>
<body>
	<div class="container">
		<h1>View post content</h1>
		<% if(dto.getSubject()!=null){ %>
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
				<a href="javascript:verifyDel()">Delete</a>	<!-- a태그의 href속성값에 javascript:function()을 쓰면 자바스크립트 함수를 호출한다 -->
				<a href="/webApp/board/boardList.jsp">List</a>
			</div>
		<% }else{
			out.println("<h2>The post doesn't exist.</h2>");
		} %>
		
	</div>
</body>
</html>