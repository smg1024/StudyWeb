<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- CommandBoardView에서 넘어온 attribute : vo -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/board/boardView.jsp</title>
<link rel="stylesheet" href="/webMVC/css/style.css" type="text/css">
<script>
	function confirmDelete(){
		if(confirm("정말로 삭제하시겠습니까?")){
			location.href = "<%= request.getContextPath() %>/board/boardDelete.do?postno=${ vo.postno }";
		}
	}
</script>
</head>
<body>
	<div class="container">
		<h1>글 내용 보기</h1>
		<ul>
			<li>No.</li>
			<li>${ vo.postno }</li>
			<li>작성자</li>
			<li>${ vo.username }</li>
			<li>조회수</li>
			<li>${ vo.hitcount }</li>
			<li>등록일</li>
			<li>${ vo.regdate }</li>
			<li>제목</li>
			<li>${ vo.subject }</li>
			<li>글 내용</li>
			<li>${ vo.content }</li>
		</ul>
		<div>
			<c:if test="${ logUsername==vo.username }">
				<a href="<%= request.getContextPath() %>/board/boardEdit.do?postno=${ vo.postno }">수정</a>
				<a href="javascript:confirmDelete()">삭제</a>
			</c:if>
			<a href="<%= request.getContextPath() %>/board/boardList.do">목록</a>
		</div>
	</div>
</body>
</html>