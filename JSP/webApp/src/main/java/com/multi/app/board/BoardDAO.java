package com.multi.app.board;

import java.util.ArrayList;
import java.util.List;

import com.multi.app.DBConn;

public class BoardDAO extends DBConn{
	// 목록 선택 : board_tbl을 전체 선택해서 DTO에 데이터를 set하고,
	// DTO에서 컬렉션(List)로 리턴한다
	public List<BoardDTO> boardListAll() {
		List<BoardDTO> list = new ArrayList<BoardDTO>();
		try {
			dbConn();
			
			sql = "SELECT postno, subject, username, hitcount, to_char(regdate, 'mm-dd HH:MI')\n"
					+ "FROM board_tbl ORDER BY postno DESC";
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setPostno(rs.getInt(1));
				dto.setSubject(rs.getString(2));
				dto.setUsername(rs.getString(3));
				dto.setHitcount(rs.getInt(4));
				dto.setRegdate(rs.getString(5));
				
				list.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			dbClose();
		}
		return list;
	}
	// 글 내용보기, 글 수정
	public BoardDTO boardSelectOne(int postno, int part) {
		BoardDTO dto = new BoardDTO();
		try {
			// 조회수 증가
			// part -> 1 : 글 내용 보기, 2 : 글 수정
			if(part==1) hitCount(postno);
			
			// 글 선택
			dbConn();
			
			sql = "select postno, username, subject, content, hitcount, regdate "
					+ "from board_tbl where postno=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, postno);
			
			rs = pstmt.executeQuery();
			
			// DTO에 담아서 리턴
			if(rs.next()) {
				dto.setPostno(rs.getInt(1));
				dto.setUsername(rs.getString(2));
				dto.setSubject(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setHitcount(rs.getInt(5));
				dto.setRegdate(rs.getString(6));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			dbClose();
		}
		return dto;
	}
	
	// 조회수 증가
	public void hitCount(int postno) {
		try {
			dbConn();
			sql = "update board_tbl set hitcount=hitcount+1 where postno=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, postno);
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			dbClose();
		}
	}
	
	// 글 등록
	public int boardPost(BoardDTO dto) {
		int result = 0;
		try {
			dbConn();
			
			sql = "INSERT INTO BOARD_TBL(postno, subject, content, username, ipAddr) VALUES (board_seq.nextval,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getSubject());
			pstmt.setString(2, dto.getContent());
			pstmt.setString(3, dto.getUsername());
			pstmt.setString(4, dto.getIpAddr());
			
			result = pstmt.executeUpdate();	// 수정된 데이터 개수
			
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			dbClose();
		}
		return result;
	}
	
	// 글 수정
	public int boardEdit(BoardDTO dto) {
		int result = 0;
		try {
			dbConn();
			
			sql = "UPDATE board_tbl SET subject=?, content=? WHERE postno=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getSubject());
			pstmt.setString(2, dto.getContent());
			pstmt.setInt(3, dto.getPostno());
			
			result = pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			dbClose();
		}
		
		return result;
	}
	
	// 글 삭제
}
