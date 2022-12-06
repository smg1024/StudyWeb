package com.multi.home.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.multi.home.CommandService;

public class CommandBoardEdit implements CommandService {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		int postno = Integer.parseInt(req.getParameter("postno"));
		
		BoardDAO dao = BoardDAO.getInstance();
		
		BoardVO vo = dao.boardSelect(postno);
		
		req.setAttribute("vo", vo);
		
		return "/board/boardEdit.jsp";
	}

}
