package com.multi.home.board;

import java.util.ArrayList;
import java.util.List;

import com.multi.home.DBConn;

public class BoardDAO extends DBConn implements BoardDAOInterface{
	
	protected BoardDAO() {}
	
	public static BoardDAO getInstance() {
		return new BoardDAO();
	}
	
	// 게시판 목록
	@Override
	public List<BoardVO> boardSelectAll() {
		List<BoardVO> list = new ArrayList<BoardVO>();
		try {
			dbConn();
			
			sql = "SELECT postno, subject, username, hitcount, to_char(regdate, 'MM-DD HH:MI') regdate "
					+ "FROM board_tbl ORDER BY postno DESC";
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardVO vo = new BoardVO();
				vo.setPostno(rs.getInt(1));
				vo.setSubject(rs.getString("subject"));
				vo.setUsername(rs.getString(3));
				vo.setHitcount(rs.getInt(4));
				vo.setRegdate(rs.getString(5));
				
				list.add(vo);
			}
		}catch(Exception e) {
			System.out.println("게시판 목록 예외");
			e.printStackTrace();
		}finally {
			dbClose();
		}
		
		return list;
	}
	
	// 글 보기 - postno에 해당하는 데이터 선택
	@Override
	public BoardVO boardSelect(int postno) {
		BoardVO vo = new BoardVO();
		
		try {
			dbConn();
			
			sql = "SELECT postno, subject, username, content, hitcount, regdate "
					+ "FROM board_tbl WHERE postno=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, postno);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo.setPostno(rs.getInt(1));
				vo.setSubject(rs.getString(2));
				vo.setUsername(rs.getString(3));
				vo.setContent(rs.getString(4));
				vo.setHitcount(rs.getInt(5));
				vo.setRegdate(rs.getString(6));
			}
		}catch(Exception e) {
			System.out.println("글 보기 예외");
			e.printStackTrace();
		}finally {
			dbClose();
		}
		
		return vo;
	}
	
	// 글 작성
	@Override
	public int boardPost(BoardVO vo) {
		int result = 0;
		
		try {
			dbConn();
			
			sql = "INSERT INTO board_tbl(postno, username, subject, content, ipAddr) "
					+ "VALUES(board_seq.nextval, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, vo.getUsername());
			pstmt.setString(2, vo.getSubject());
			pstmt.setString(3, vo.getContent());
			pstmt.setString(4, vo.getIpAddr());
			
			result = pstmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("글 작성 예외");
			e.printStackTrace();
		}finally {
			dbClose();
		}
		return result;
	}
	
	// 글 수정
	
	@Override
	public int boardEdit(BoardVO vo) {
		int result = 0;
		
		try {
			dbConn();
			
			sql = "UPDATE board_tbl SET subject=?, content=?, hitcount=hitcount-1 WHERE postno=?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, vo.getSubject());
			pstmt.setString(2, vo.getContent());
			pstmt.setInt(3, vo.getPostno());
			
			result = pstmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("글 수정 예외");
			e.printStackTrace();
		}finally {
			dbClose();
		}
		return result;
	}
	
	// 글 삭제
	@Override
	public int boardDelete(int postno, String username) {
		int result = 0;
		
		try {
			dbConn();
			
			sql = "DELETE FROM board_tbl WHERE postno=? AND username=?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, postno);
			pstmt.setString(2, username);
			result = pstmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("글 삭제 예외");
			e.printStackTrace();
		}finally {
			dbClose();
		}
		
		return result;
	}
	
	// 조회수
	@Override
	public void hitCount(int postno) {
		try {
			dbConn();
			
			sql = "UPDATE board_tbl SET hitcount=hitcount+1 WHERE postno=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, postno);
			pstmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("조회수 예외");
			e.printStackTrace();
		}finally {
			dbClose();
		}
		
	}
	
	// 글 총개수
	@Override
	public int postCount() {
		int postCount = 0;
		try {
			dbConn();
			
			sql = "SELECT count(postno) FROM board_tbl";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				postCount = rs.getInt(1);
			}
		}catch(Exception e) {
			System.out.println("글 총 개수 예외");
			e.printStackTrace();
		}finally {
			dbClose();
		}
		return postCount;
	}
	
	// 글 선택 삭제
	@Override
	public int boardMultiDel(int[] postno, String username) {
		int result = 0;
		
		try {
			dbConn();
			
			sql = "DELETE FROM board_tbl WHERE username=? and postno IN (?";
			for(int i=1; i<postno.length; i++) {
				sql += ",?";
			}
			sql += ")";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, username);
			for(int i=0; i<postno.length; i++) {
				pstmt.setInt(i+2, postno[i]);
			}
			
			result = pstmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("글 선택 삭제 예외");
			e.printStackTrace();
		}finally {
			dbClose();
		}
		
		return result;
	}
}
