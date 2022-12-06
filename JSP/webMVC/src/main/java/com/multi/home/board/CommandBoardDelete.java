package com.multi.home.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.multi.home.CommandService;

public class CommandBoardDelete implements CommandService {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// 파라미터로 넘어온 postno 선언
		int postno = Integer.parseInt(req.getParameter("postno"));
		
		// 세션에 저장된 로그인 정보 중 logUsername 가져오기
		HttpSession session = req.getSession();
		String username = (String)session.getAttribute("logUsername");
		
		
		BoardDAO dao = BoardDAO.getInstance();
		
		req.setAttribute("result", dao.boardDelete(postno, username));
		
		return "/board/boardDelete.jsp";
	}

}
