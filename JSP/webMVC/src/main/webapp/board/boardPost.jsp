<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 로그인이 안 됐을때 로그인 페이지로 보내기 -->
<c:if test="${ logUsername==null || logUsername=='' }">
	<script>
		alert("로그인해주세요.");
		location.href = "/webMVC/member/login.do"
	</script>
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/board/boardPost.jsp</title>
<link rel="stylesheet" href="/webMVC/css/style.css" type="text/css">
<style>
	#subject{
		width:70%;
	}
	
	#content{
		width:100%;
		height:200px;
	}
</style>
<script>
	//form의 버튼을 클릭하면 호출되는 함수
	function boardFormClick(){
		// 제목이 비어있을때
		var subj = document.getElementById("subject");
		if(document.getElementById("subject").value==""){
			alert("제목을 입력하세요.");
			subj.focus();	// 커서 위치 지정
			return;	// 함수 실행 종료
		}
		// 내용이 비어있을때
		var content = document.getElementById("content");
		if(document.getElementById("content").value==""){
			alert("내용을 입력하세요.");
			content.focus();
			return;
		}
		
		// 모두 입력됐을때 form태그의 action지정
		var form = document.getElementById("boardForm");
		form.action = "/webMVC/board/boardPostOk.do";
		form.submit();
	}
</script>
</head>
<body>
	<div class="container">
		<h1>게시판 글쓰기 form</h1>
		<form method="post" id="boardForm">
			<ul>
				<li>제목</li>
				<li><input type="text" name="subject" id="subject"></li>
				<li>글 내용</li>
				<li>
					<textarea name="content" id="content"></textarea>
				</li>
				<li><input type="button" value="글 등록" onclick="boardFormClick()"></li>
			</ul>
		</form>
	</div>
</body>
</html>