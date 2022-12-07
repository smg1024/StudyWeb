<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- CommandBoardEdit에서 넘어온 attribute : vo -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/board/boardEdit.jsp</title>
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
	function boardEditFormCheck(){
		// 제목이 비어있을때
		var subj = document.getElementById("subject");
		if(document.getElementById("subject").value==""){
			alert("제목을 입력하세요.");
			subj.focus();	// 커서 위치 지정
			return false;	// 함수 실행 종료
		}
		// 내용이 비어있을때
		var content = document.getElementById("content");
		if(document.getElementById("content").value==""){
			alert("내용을 입력하세요.");
			content.focus();
			return false;
		}
		
		return true;
		// 모두 입력됐을때 form태그의 action지정
		/* var form = document.getElementById("boardEditForm");
		form.action = "/webMVC/board/boardEditOk.do";
		form.submit(); */
	}
</script>
</head>
<body>
	<div class="container">
		<h1>게시판 수정하기 form</h1>
		<form method="post" action="/webMVC/board/boardEditOk.do" onsubmit="return boardEditFormCheck()"> <!-- id="boardEditForm" -->
			<input type="hidden" name="postno" value="${ vo.postno }">
			<ul>
				<li>제목</li>
				<li><input type="text" name="subject" id="subject" value="${ vo.subject }"></li>
				<li>글 내용</li>
				<li>
					<textarea name="content" id="content">${ vo.content }</textarea>
				</li>
				<li>
					<!-- 
						submit 기능을 가지고 있는 태그
						<input type="submit">
						<button>
						<input type="image">
					 -->
					<button>글 수정</button>
					<!-- <input type="button" value="글 수정" onclick="boardEditFormClick()"> -->
					<input type="image" src="/webMVC/img/google.gif">
					<input type="reset" value="초기화">
					<input type="button" value="취소" onclick="history.back()">
					<a href="javascript:window.history.back()">취소</a>
				</li>
			</ul>
		</form>
	</div>
</body>
</html>