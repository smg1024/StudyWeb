package kr.co.campus;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class IndexServlet
 */
@WebServlet("/IndexServlet")
public class IndexServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IndexServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
    // doGet(), doPost()가 실행되기 전 초기화하는 메소드
	public void init(ServletConfig config) throws ServletException {
		
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	// 클라이언트 요청 시 get방식으로 접속하면 실행되는 메소드
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// response.getWriter().append("Served at: ").append(request.getContextPath());
		System.out.println("doGet()메소드 실행");
		// 클라이언트 측에서  보내온 데이터 서버로 가져오기
//		int num = Integer.parseInt(request.getParameter("num"));
//		String name = request.getParameter("name");
//		System.out.println("번호: " + num);
//		System.out.println("이름: " + name);
		
		// 클라이언트에게 문자열(html)을 response로 쓰기
		// 웹 브라우저가 받아서 표시
		// 1. response객체에 헤더 설정
		response.setContentType("text/html; charset=UTF-8");
		
		// 2. response객체에서 PrintWriter객체 구하기
		PrintWriter pw = response.getWriter();
		pw.println("<!DOCTYPE html>");
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<title>서블릿 홈페이지</title>");
		pw.println("<style>");
		pw.println("h1{background-color:yellow;}");
		pw.println("</style>");
		pw.println("</head>");
		pw.println("<body>");
		pw.println("<h1 class='b'>Servlet Homepage</h1>");
		
		// Session에서 로그인 정보 확인하고 버튼 표시
		HttpSession session = request.getSession();
		String logName = (String)session.getAttribute("logName");
		
		if(logName==null || logName.equals("")) {	// 로그인이 안 되어있을 때
			pw.println("<a href='"+request.getContextPath()+"/login.do'>로그인</a><br>");
		}else {	// 로그인이 되어있을 때
			pw.println(logName + "님 <a href='"+request.getContextPath()+"/logout.do'>로그아웃</a><br>");
		}
		
		
//		pw.println("번호: "+num+"<br>");
//		pw.println("이름: "+name+"<br>");
		pw.println("</body>");
		pw.println("</html>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	// 클라이언트 요청 시 post방식으로 접속하면 실행되는 메소드
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// doGet(request, response);
	}

}
