<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%!
	public Connection getConnection(){
		Connection conn = null;
		
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		
		try{
			// 드라이버 로딩
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			// DB연결
			conn = DriverManager.getConnection(url, "poby", "981024");
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return conn;
		
}
%>
<%
	// client 로그인폼에 아이디와 비밀번호를 입력하고 submit을 발생시키면 요청하는 페이지
	
	// client가 입력해놓은 아이디와 비밀번호를 서버로 request객체를 이용하여 가져온다
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	
	// DB를 연결시키기 위해서는 ojdbc.jar파일을 WEB-INF/lib폴더 안에 추가
	
	// 1. 드라이버 로딩, 2. DB연결
	Connection conn = getConnection();
	
	// 3. PreparedStatement
	String sql = "select count(username) from member_tbl where username=? and password=?";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	pstmt.setString(1, username);
	pstmt.setString(2, password);
	
	ResultSet rs = pstmt.executeQuery();
	
	if(rs.next()){	// 커서 이동
		int cnt = rs.getInt(1);	// count(username)의 결과값
		/* if(cnt==1){	// 로그인 성공 -> 아이디, 비밀번호 일치
			// 홈페이지로 이동
			response.sendRedirect(request.getContextPath() + "/index.jsp");	//response.sendRedirect("/webApp");
		}else{	// 로그인 실패 -> 아이디, 비밀번호 중 1개 이상이 일치하지 않음
			// 로그인 페이지로 이동
			response.sendRedirect(request.getContextPath() + "/jsp02_response/login.jsp");
		} */
		
		// Client에게 로그인 성공여부 대화상자 띄워주기
		if(cnt>0){
			%>
			<script>
				alert("Sign in complete. Proceeding to website...");
				// document, location, history, window, screen... --> JS 명령어들
				location.href = request.getContextPath();
			</script>
			<%
		}else{
			%>
			<script>
				alert("Invalid username or password.");
				// history.go(): +forward/-back, history.forward(), history.back()
				history.back();
			</script>
			<%
		}
	}
%>