package com.multi.home;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class HomeController
 */
@WebServlet("/*.do")
public class HomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	// url매핑주소와 Command파일명을 Hashmap에 보관
	// key는 String, value는 CommandService인터페이스
	HashMap<String, CommandService> map = new HashMap<String, CommandService>();
	
    public HomeController() {
        super();
    }

	public void init(ServletConfig config) throws ServletException {
		// web.xml에서 매핑주소가 담긴.properties파일의 위치와 파일명을 얻어온다
		// /Users/poby/StudyWeb/JSP/webMVC/src/main/webapp/WEB-INF/prop/urlMapping.properties
		String propertiesFileName = config.getInitParameter("proConfig");
		
		// 파일에 있는 문자열을 읽어와 properties객체로 변환해준다
		Properties propObject = new Properties();
		try {
			FileInputStream fis = new FileInputStream(propertiesFileName);
			propObject.load(fis);	// '='을 기준으로 key/value를 나눈다
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		//-------------------------------------------------------------------
		// properties객체의 key는 HashMap의 key로 적용하고
		// properties객체의 value는 Object(CommandService)로 만들어서 HashMap의 value로 적용
		
		try {
			// properties객체에서 모든 key를 구해오기
			Enumeration keyList = propObject.propertyNames();	// key목록 구하기
			// key에 해당하는 Command클래스를 객체로 만들어 HashMap에 추가하기
			while(keyList.hasMoreElements()) {	// 객체 존재 유무
				String key = (String)keyList.nextElement();	// key값 가져오기 ex)"*.do", "index.do"
				String className = propObject.getProperty(key);	// value값 가져오기 ex)"com.multi.home.CommandIndex"
				
//				System.out.println(key + "=" + className);
				
				// 패키지와 클래스명이 문자열로 되어있는 경우, Class객체로 생성할 수 있다.
				Class commandClass = Class.forName(className);
				
				// CommandService객체를 Class객체에서 얻어오기
				CommandService service = (CommandService)commandClass.getDeclaredConstructors()[0].newInstance();
				
				// key와 service를 HashMap객체에 추가
				map.put(key, service);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// /*.do, /index.do, /board/boardList.do, /member/login.do
		
		// url주소를 구하여 해당 CommandService 호출
		String uri = request.getRequestURI();	// /context/path/filename	/webMVC/index.do
		String ctxPath = request.getContextPath();	// /webMVC
		
		// path주소(key값)
		String commandKey = uri.substring(ctxPath.length());	// /index.do
		String viewName = null;
		try {
			// commandKey의 value값: CommandService 객체
			CommandService service = map.get(commandKey);
			
			// 메소드 호출
			viewName = service.process(request, response);
		}catch(Exception e) {
			viewName = "index.jsp";	// CommandService객체가 없을때 홈페이지로 이동
		}
		
		// View페이지로 이동
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewName);
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
