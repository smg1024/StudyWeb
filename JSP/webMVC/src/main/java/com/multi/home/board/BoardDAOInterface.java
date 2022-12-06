package com.multi.home.board;

import java.util.List;

public interface BoardDAOInterface {
	// 게시판 목록
	public List<BoardVO> boardSelectAll();
	
	// 글 보기 (조회수 선택)
	public BoardVO boardSelect(int postno);
	
	// 글 작성
	public int boardPost(BoardVO vo);
	
	// 글 수정
	public int boardEdit(BoardVO vo);
	
	// 글 삭제
	public int boardDelete(int postno, String username);
	
	// 조회수
	public void hitCount(int postno);
	
	// 글 총 개수
	public int postCount();
}