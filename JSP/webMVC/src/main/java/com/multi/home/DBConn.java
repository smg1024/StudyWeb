package com.multi.home;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

// DB 연결 클래스
// 상속시킬 예정이기 때문에 main 메소드 필요없음

public class DBConn {
	// DB연결에 필요한 변수와 메소드 정의
	// 0. 변수 선언
	protected Connection conn = null;	// 패키지가 다를 경우 상속받아 사용 가능
	protected PreparedStatement pstmt = null;
	protected CallableStatement cstmt = null;	// 프로시저를 이용한 statement
	protected ResultSet rs = null;	// SELECT문에 사용됨
	
	protected String sql = null;
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String username = "poby";
	String password = "981024";
	
	// 1. JDBC 로딩
	static {	// 멤버변수와 생성자메소드 실행되기 전에 먼저 실행된다
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		}catch(ClassNotFoundException e) {
			System.out.println("JDBC 드라이버 로딩 예외 발생." + e.getMessage());
		}
	}
	
	// 2. DB 연결
	public void dbConn() {	// Connection 인터페이스 객체생성
		try {
			conn = DriverManager.getConnection(url, username, password);
		} catch (SQLException e) {
			System.out.println("DB 연결 예외발생" + e.getMessage());
		}
	}
	
	// 3. DB 닫기
	public void dbClose() {
		// 생성된 객체를 역순으로 닫는다
		try {
			if(rs!=null) rs.close();
			if(pstmt!=null) pstmt.close();
			if(cstmt!=null) cstmt.close();
			if(conn!=null) conn.close();
		}catch(SQLException e) {
			System.out.println("DB 닫기 예외발생" + e.getMessage());
		}
	}
}
