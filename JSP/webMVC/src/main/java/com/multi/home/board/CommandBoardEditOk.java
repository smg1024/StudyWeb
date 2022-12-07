package com.multi.home.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.multi.home.CommandService;

public class CommandBoardEditOk implements CommandService {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		BoardVO vo = new BoardVO();
		
		vo.setPostno(Integer.parseInt(req.getParameter("postno")));
		vo.setSubject(req.getParameter("subject"));
		vo.setContent(req.getParameter("content"));
		
		BoardDAO dao = BoardDAO.getInstance();
		
		req.setAttribute("result", dao.boardEdit(vo));
		req.setAttribute("postno", vo.getPostno());
		
		return "/board/boardEditOk.jsp";
	}

}
