<%@page import="com.multi.app.board.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.multi.app.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	// 게시판 목록에서 DB조회
	BoardDAO dao = new BoardDAO();
	List<BoardDTO> lst = dao.boardListAll();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board List</title>
<style>
	.container{
		width:1000px;
		margin:0 auto;
		/* background:#ddd; */
	}
	ul, li{
		margin:0;
		padding:0;
		list-style-type:none;
	}
	
	#lst>li{
		float:left;
		width:10%;
		height:40px;
		line-height:40px;
		border-bottom:1px solid #ddd;
	}
	
	#lst>li:nth-child(5n+2){
		width:55%;
	}
	
	#lst>li:nth-child(5n+5){
		width:15%;
		/* background:blue; */
	}
	
	.wordCut{
		white-spce:nowrap;	/* 줄 안바꾸기 */
		overflow:hidden;	/* 넘친 데이터 숨기기 */
		text-overflow:ellipsis;	/* ...표시하기 */
	}
</style>
</head>
<body>
	<div class="container">
		<h1>Board List</h1>
		<div>
			<a href="/webApp/board/boardWrite.jsp">New</a>
		</div>
		<ul id="lst">
			<li>No.</li>
			<li>Title</li>
			<li>Author</li>
			<li>Hit</li>
			<li>Date</li>
			
			<%-- <%
				for(int i=0; i<lst.size(); i++){	// List에 담긴 ResultSet 데이터를 반복문으로 출력
					BoardDTO dto = lst.get(i);
			%>
					<li><%= dto.getPostno() %></li>
					<li><%= dto.getSubject() %></li>
					<li><%= dto.getUsername() %></li>
					<li><%= dto.getHitcount() %></li>
					<li><%= dto.getRegdate() %></li>
			<%
				}
			%> --%>
			
			<!-- jstl로 목록 출력하기 -->
			<c:forEach var="dto2" items="<%= lst %>">
				<li>${ dto2.postno }</li>
				<li class="wordCut"><a href="/webApp/board/boardView.jsp?postno=${ dto2.postno }">${ dto2.subject }</a></li>	<!-- 글 제목에 해당 글 내용 조회페이지 링크등록 -->
				<li>${ dto2.username }</li>
				<li>${ dto2.hitcount }</li>
				<li>${ dto2.regdate }</li>
			</c:forEach>
		</ul>
	</div>
</body>
</html>