<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 로그아웃처럼 현재 접속에서 사용된 모든 정보를 제거하고자 할때
	// session 객체를 지우면, 세션에 저장된 모든 데이터를 지우고
	// 서버가 새로운 session을 자동으로 할당한다.
	session.invalidate();
	response.sendRedirect(request.getContextPath());
%>