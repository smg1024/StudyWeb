<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/board/boardList.jsp</title>
<link rel="stylesheet" href="/webMVC/css/style.css" type="text/css">
<!-- jQuery 사용 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
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
	.board-list>li:nth-child(6n+3){
		width:56%;
	}
	.board-list>li:nth-child(6n+1){
		width:4%;
	}
	.footer-menu>li{
		float:left;
		width:50%;
		height:30px;
		line-height:30px;
	}
	.footer-menu>li:last-child{
		text-align:right;
	}
</style>
<script>
	$(function(){
		// 전체선택을 클릭하면 목록의 체크박스 모두를 선택 또는 해제하기
		$("#checkAll").click(function(){
			// $("h1").attr("title","연습");
			// 값 바꾸기 -> $("#bb").prop("checked", true);	// 값 구하기 -> $("#bb").prop("checked"); 
			// $(this) : 이벤트가 발생한 객체			this.checked	
			$(".board-list input[type=checkbox]").prop("checked", $(this).prop("checked"));
		});
		
		// 선택삭제 버튼 클릭 시
		$("#selectDel").on('click',function(){
			// 최소 1개 이상 선택되어야 이동
			// <input type="checkbox" name="postno" value="15">
			// each() 객체에 대한 반복문
			// obj에 담긴 input태그의 체크여부를 구하여 개수를 구한다
			var checkCount = 0;
			$("input[name=postno]").each(function(i, obj){
				if(obj.checked){
					checkCount++;
				}
			});
			if(checkCount>0){
				if(confirm(checkCount+"개의 글을 삭제하시겠습니까?")){
					$("#delForm").submit();
				}
			}else{
				alert("최소 1개 이상의 글을 선택하세요.");
			}
		});
	});
</script>
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
					<a href="<%= request.getContextPath() %>/member/login.do">로그인</a>
				</c:if>
			</div>
		</div>
		<form method="get" action="<%= request.getContextPath() %>/board/boardMultiDel.do" id="delForm">
			<ul class="board-list">
				<li><input type="checkbox" id="checkAll"></li>
				<li>No.</li>
				<li>제목</li>
				<li>작성자</li>
				<li>조회수</li>
				<li>등록일</li>
				
				<c:forEach var="vo" items="${ list }">
					<li>
						<c:if test="${ logUsername==vo.username }">
							<input type="checkbox" name="postno" value="${ vo.postno }">
						</c:if>
						<c:if test="${ logUsername!=vo.username }">
							<input type="checkbox" disabled>
						</c:if>
					</li>
					<li>${ vo.postno }</li>
					<li class="word-cut"><a href="<%= request.getContextPath() %>/board/boardView.do?postno=${ vo.postno }">${ vo.subject }</a></li>
					<li>${ vo.username }</li>
					<li>${ vo.hitcount }</li>
					<li>${ vo.regdate }</li>
				</c:forEach>
			</ul>
		</form>
		<ul class="footer-menu">
			<li><input type="button" value="삭제" id="selectDel"></li>
			<li><a href="<%= request.getContextPath() %>/index.do">홈으로</a></li>
		</ul>
	</div>
</body>
</html>