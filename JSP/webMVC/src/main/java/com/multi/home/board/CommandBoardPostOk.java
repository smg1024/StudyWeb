package com.multi.home.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.multi.home.CommandService;

public class CommandBoardPostOk implements CommandService {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// 한글 인코딩하기
		req.setCharacterEncoding("UTF-8");
		
		BoardVO vo = new BoardVO();
		// form의 제목, 글 내용 가져오기
		vo.setSubject(req.getParameter("subject"));
		vo.setContent(req.getParameter("content"));
		
		// request의 접속자 ip
		vo.setIpAddr(req.getRemoteAddr());
		
		// 세션의 글쓴이 (logUsername)
		HttpSession session = req.getSession();
		vo.setUsername((String)session.getAttribute("logUsername"));
		
		BoardDAO dao = BoardDAO.getInstance();
		
		// View페이지에서 result
		req.setAttribute("result", dao.boardPost(vo));
		req.setAttribute("vo", vo);
		
		// return을 jsp밖에 못하기 때문에 여기에서 실행결과에 따라 나눠서 할 수 없음
		// history.back()을 하지 못함
//		int result = dao.boardPost(vo);
//		String viewName;
//		if(result>0) {
//			viewName = "/board/boardList.jsp";
//		}else {
//			viewName = "/board/boardPostOk.jsp";
//		}
		
		return "/board/boardPostOk.jsp";
	}

}
