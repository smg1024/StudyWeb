<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstl06_boardList</title>
</head>
<body>
	<%--
		String subject = request.getParameter("subject");
		out.println("글 제목 : "+subject);
	--%>
	글 제목 : ${ param.subject }<br>
	글 내용 : ${ param.content }<br>

</body>
</html>