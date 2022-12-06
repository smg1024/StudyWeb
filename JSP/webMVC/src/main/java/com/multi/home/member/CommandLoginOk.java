package com.multi.home.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.multi.home.CommandService;

public class CommandLoginOk implements CommandService {
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		MemberDAO dao = new MemberDAO();
		MemberVO vo = new MemberVO();
		
		vo.setUsername(req.getParameter("username"));
		vo.setPassword(req.getParameter("password"));
		
		dao.memberLogin(vo);	// 회원정보 조회
		
		// 로그인 성공 시 세션에 아이디/이름 저장
		String viewName = null;
		if(vo.getName()!=null) {
			HttpSession session = req.getSession();
			session.setAttribute("logUsername", vo.getUsername());
			session.setAttribute("logName", vo.getName());
			viewName = "/index.jsp";
		}else {
			viewName = "/member/login.jsp";
		}
		return viewName;
	}

}
