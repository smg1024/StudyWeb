package com.multi.app.board;

import com.multi.app.DBConn;

public class BoardDAO extends DBConn{
	
	public void test() {
		BoardDTO dto = new BoardDTO();
		dto.setPostno(10);
		System.out.println(dto.getPostno());
	}
	
	// 목록 선택
	
	// 글 1개 선택
	
	// 글 등록
	
	// 글 수정
	
	// 글 삭제
}
