<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- CommandBoardEditOk에서 넘어온 attribute : result -->
<c:if test="${ result==0 }">
	<!-- 글 삭제 실패 -->
	<script>
		alert("글 삭제 실패");
		history.back();
	</script>
</c:if>
<c:if test="${ result>0 }">
	<!-- 글 삭제 성공 location, sendRedirect -->
	<script>
		location.href = "/webMVC/board/boardList.do";
	</script>
</c:if>