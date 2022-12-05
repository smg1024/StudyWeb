package com.multi.home.member;

import com.multi.home.DBConn;

public class MemberDAO extends DBConn {
	public void memberLogin(MemberVO vo) {
		try {
			dbConn();
			
			sql = "SELECT username, name FROM member_tbl WHERE username=? AND password=?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, vo.getUsername());
			pstmt.setString(2, vo.getPassword());
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo.setUsername(rs.getString(1));
				vo.setName(rs.getString(2));
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			dbClose();
		}
	}
}
