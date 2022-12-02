package kr.co.campus;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    // 로그인 form
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter pw = response.getWriter();
		pw.println("<!DOCTYPE: html>");
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<title>로그인 form</title>");
		pw.println("<style>");
		pw.println("h1{background-color:#ddd;}");
		pw.println("</style>");
		pw.println("</head>");
		pw.println("<body>");
		pw.println("<h1>Login Page</h1>");
		pw.println("<form method='post' action='"+request.getContextPath()+"/login.do'>");
		pw.println("아이디 : <input type='text' name='username'/><br>");
		pw.println("비밀번호 : <input type='password' name='password'/><br>");
		pw.println("<input type='submit' value='LOGIN'/>");
		pw.println("</form>");
		pw.println("</body>");
		pw.println("</html>");
	}

	// 로그인 DB조회
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			// 1. 드라이버 로딩
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			// 2. DB연
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "poby", "981024");
			
			// 3. pstmt 생성
			String sql = "SELECT username, name FROM member_tbl WHERE username=? AND password=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, username);
			pstmt.setString(2, password);
			
			// 3. 실행
			rs = pstmt.executeQuery();
			
			// 4. 결과 처리
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter pw = response.getWriter();
			if(rs.next()) {	// 로그인 성공 -> 홈페이지로 이동
				// Session에 로그인 정보(아이디, 이름)을 기록한다.
				// Session에 저장된 데이터가 소멸될때까지 현재 서버에서 사용할 수 있다.
				HttpSession session = request.getSession();
				session.setAttribute("logUsername", rs.getString(1));
				session.setAttribute("logName", rs.getString(2));
				
				// 홈페이지 이동
				pw.println("<script>");
				pw.println("alert('로그인 성공했습니다. 홈페이지로 이동 중...');");
				pw.println("location.href='"+request.getContextPath()+"/index.do';");
				pw.println("</script>");
			}else {	// 로그인 실패 -> 로그인 form으로 이동
				pw.println("<script>");
				pw.println("alert('로그인 실패했습니다. 다시 로그인해주세요.');");
				pw.println("history.back();");
				pw.println("</script>");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			// 5. DB닫기
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	}

}
