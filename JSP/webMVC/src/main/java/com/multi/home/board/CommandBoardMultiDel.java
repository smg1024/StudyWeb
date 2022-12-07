package com.multi.home.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.multi.home.CommandService;

public class CommandBoardMultiDel implements CommandService {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		BoardDAO dao = BoardDAO.getInstance();
		HttpSession session = req.getSession();
		
		// 삭제하기 위해 선택한 postno를 가져오기
		String[] postnoStr = req.getParameterValues("postno");
		int[] postno = new int[postnoStr.length];
		
		for(int i=0; i<postnoStr.length; i++) {
			postno[i] = Integer.parseInt(postnoStr[i]);
		}
		
		int result = dao.boardMultiDel(postno, (String)session.getAttribute("logUsername"));
		
		req.setAttribute("result", result);
		
		return "/board/boardMultiDel.jsp";
	}

}
