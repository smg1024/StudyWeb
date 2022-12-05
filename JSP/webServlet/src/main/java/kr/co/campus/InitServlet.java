package kr.co.campus;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class InitServlet
 */
@WebServlet("/InitServlet")
public class InitServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public InitServlet() {
        super();
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
    String name;
    String addr;
    // 클라이언트의 요청 시 doGet(), doPost()메소드 실행 이전에 자동실행됨
	public void init(ServletConfig config) throws ServletException {
		name = config.getInitParameter("name");
		addr = config.getInitParameter("addr");
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// web.xml의 <init-param>태그에 있는 데이터를 서블릿으로 가져오기
		// getInitParameter()를 이용한다
//		String name = getInitParameter("name");
//		String addr = getInitParameter("addr");
		
		res.setContentType("text/html; charset=UTF-8");
		
		PrintWriter pw = res.getWriter();
		String html = "<!DOCTYPE html>"
				+ "<html>"
				+ "<head>"
				+ "<title>Init Parameter</title>"
				+ "<body>";
		html += "<h1>Init Test</h1>"
				+ "<ol>"
				+ "<li>Name : "+name+"</li>"
				+ "<li>Address : "+addr+"</li>"
				+ "</ol>"
				+ "</body>"
				+ "</html>";
		
		pw.println(html);
	}

}
