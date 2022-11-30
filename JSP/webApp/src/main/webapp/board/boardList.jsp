<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board List</title>
<style>
	.container{
		width:1000px;
		margin:0 auto;
		background:#ddd;
	}
	ul, li{
		margin:0;
		padding:0;
		list-style-type:none;
	}
	
	#lst>li{
		float:left;
		width:10%;
		height:40px;
		line-height:40px;
		border-bottom:1px solid #ddd;
	}
	
	#lst>li:nth-child(5n+2){
		width:55%;
	}
	
	#lst>li:nth-child(5n+5){
		width:15%;
		/* background:blue; */
	}
</style>
</head>
<body>
	<div class="container">
		<h1>Board List</h1>
		<ul id="lst">
			<li>No.</li>
			<li>Title</li>
			<li>Author</li>
			<li>Hit</li>
			<li>Date</li>
			
			<li>10</li>
			<li>How to~</li>
			<li>Sangmin</li>
			<li>0</li>
			<li>MM-DD hh:mm</li>
			
			<li>9</li>
			<li>What is~</li>
			<li>John</li>
			<li>5</li>
			<li>MM-DD hh:mm</li>
		</ul>
	</div>
</body>
</html>