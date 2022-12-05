package com.multi.home;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// 모든 Command클래스는 CommandService 인터페이스를 상속받아 생성한다.
public interface CommandService {
	// view파일명을 리턴함
	public String process(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException;
}