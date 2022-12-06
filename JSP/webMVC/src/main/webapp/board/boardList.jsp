<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/board/boardList.jsp</title>
<link rel="stylesheet" href="/webMVC/css/style.css" type="text/css">
<style>
	.head-info>div{
		float:left;
		width:50%;
		height:50px;
		background:#ddd;
		line-height:50px;
	}
	.head-info>div:last-child{
		text-align:right;
	}
	
	.board-list>li{
		float:left;
		width:10%;
		height:40px;
		line-height:40px;
		border-bottom:1px solid #ddd;
	}
	.board-list>li:nth-child(5n+2){
		width:55%;
	}
	.board-list>li:nth-child(5n){
		width:15%;
	}
</style>
</head>
<!-- CommandBoardList에서 넘어온 attribute : list, postCount -->
<body>
	<div class="container">
		<h1>게시판 목록</h1>
		<div class="head-info">
			<div>글 전체 개수 : ${ postCount }개</div>
			<div>
				<!-- 로그인 되어있는 경우 -->
				<c:if test="${ logUsername != null && logUsername != '' }">
					<a href="<%= request.getContextPath() %>/board/boardPost.do">글 쓰기</a>
				</c:if>
				<c:if test="${ logUsername == null || logUsername == '' }">
					<a href="#">로그인</a>
				</c:if>
			</div>
		</div>
		<ul class="board-list">
			<li>No.</li>
			<li>제목</li>
			<li>작성자</li>
			<li>조회수</li>
			<li>등록일</li>
			
			<c:forEach var="vo" items="${ list }">
				<li>${ vo.postno }</li>
				<li class="word-cut"><a href="<%= request.getContextPath() %>/board/boardView.do?postno=${ vo.postno }">${ vo.subject }</a></li>
				<li>${ vo.username }</li>
				<li>${ vo.hitcount }</li>
				<li>${ vo.regdate }</li>
			</c:forEach>
		</ul>
	</div>
</body>
</html>