<%@page import="com.multi.app.board.BoardDAO"%>
<%@page import="com.multi.app.board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!-- 
	수정성공 글 내용보기
	수정실패 글 수정 페이지 이동
 -->
<%
	BoardDTO dto = new BoardDTO();
	dto.setPostno(Integer.parseInt(request.getParameter("postno")));
	dto.setSubject(request.getParameter("subject"));
	dto.setContent(request.getParameter("content"));
%>

<%
	BoardDAO dao = new BoardDAO();
	int result = dao.boardEdit(dto);
	
	if(result>0){	// 수정성공 시 해당 postno 받아서 내용보기
		response.sendRedirect("/webApp/board/boardView.jsp?postno=" + dto.getPostno());
	}else{	// 수정실패 시 글 수정 페이지 이동
		%>
		<script>
			alert("Failed to edit.");
			history.back();
		</script>
		<%	
	}
%>
<%-- <jsp:useBean id="dto2" class="com.multi.app.board.BoardDTO" scope="page"></jsp:useBean> --%>
