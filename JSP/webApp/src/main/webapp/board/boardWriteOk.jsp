<%@page import="com.multi.app.board.BoardDAO"%>
<%@page import="com.multi.app.board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	// boardWrite.jsp에서 form으로 보내준 데이터를 request로 받아서 DTO에 등록한다
/* 	BoardDTO dto = new BoardDTO();

	dto.setUsername(request.getParameter("username"));
	dto.setSubject(request.getParameter("subject"));
	dto.setContent(request.getParameter("content")); */
%>
<!--
	Bean, Beans 객체 생성
	action태그 useBean은 객체를 생성한다
	id : 객체 이름
	class : 클래스 이름
	scope : 유효 범위	
-->
<jsp:useBean id="dto" class="com.multi.app.board.BoardDTO" scope="page"></jsp:useBean>	<!-- BoardDTO dto = new BoardDTO(); -->
<!-- action태그 setProperty는 이전 페이지 값을 request해서 DTO객체에 세팅해준다. -->
<jsp:setProperty name="dto" property="*"></jsp:setProperty>	<!-- dto.set~~(); -->

<%
	dto.setIpAddr(request.getRemoteAddr());	// username의 ip주소
	
	BoardDAO dao = new BoardDAO();
	int result = dao.boardPost(dto);	// 글 등록
	
	if(result>0){	// 글 등록 성공 -> Board List로 이동
		response.sendRedirect("/webApp/board/boardList.jsp");
	}else{	// 글 등록 실패 -> Board Write로 이동
		%>
		<script>
			alert("Failed to post.");
			history.back();	// history.go(-1);
		</script>
		<%
	}
%>