package com.multi.home.board;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.multi.home.CommandService;

public class CommandBoardList implements CommandService {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		BoardDAO dao = BoardDAO.getInstance();
		
		// 레코드 선택
		List<BoardVO> list = dao.boardSelectAll();
		
		// 총 레코드 수
		int postCount = dao.postCount();
		
		// View페이지에서 사용할 수 있도록 DB에서 선택한 데이터를 담아놓은 List컬렉션을 req에 세팅한다
		req.setAttribute("list", list);
		req.setAttribute("postCount", postCount);
		
		return "/board/boardList.jsp";
	}

}
