<%@page import="com.multi.app.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	// 삭제할 글의 postno를 request
	int postno = Integer.parseInt(request.getParameter("postno"));

	BoardDAO dao = new BoardDAO();
	
	int result = dao.boardDel(postno);
	
	if(result>0){
		response.sendRedirect("/webApp/board/boardList.jsp");
	}else{
		%>
		<script>
			alert("Failed to delete post.");
			history.back();
		</script>
		<%
	}
%>