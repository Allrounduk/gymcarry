package member.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import common.JDBCTemplate;
import member.model.vo.Member;

public class MemberDAO {

	public MemberDAO() {
	}

	// 싱글턴 적용하기
	// 1. 자기자신의 참조변수를 static으로 소유
	// 2. 생성자를 private으로 감춤
	// 3. 1에 대한 getter를 만들되, 1이 null이면 객체를 할당

//로그인
	public Member selectOneUser(Connection conn, String userId, String userPwd) {
		Statement stmt = null;
		ResultSet rset = null;
		Member member = null;
		String query = "SELECT * FROM MEMBER WHERE USER_ID = '" + userId + "' AND USER_PWD = '" + userPwd + "'";

		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);

			if (rset.next()) {
				member = new Member();
				member.setUniqId(rset.getInt("UNIQ_ID"));
				member.setUserId(rset.getString("USER_ID"));
				member.setUserPwd(rset.getString("USER_PWD"));
				member.setNickname(rset.getString("NICKNAME"));
				member.setName(rset.getString("NAME"));
				member.setGender(rset.getString("GENDER"));
				member.setEmail(rset.getString("EMAIL"));
				member.setPhone(rset.getString("PHONE"));
				member.setAddressCity(rset.getString("ADDRESS_CITY"));
				member.setAddressGu(rset.getString("ADDRESS_GU"));
				member.setAdminYn(rset.getString("ADMIN_YN"));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(stmt);
		}

		return member;
	}

// 회원가입
	public int insertMember(Connection conn, Member member) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		String query = "INSERT INTO MEMBER VALUES(USER_SEQ.NEXTVAL,?,?,?,?,?,?,?,?,?,?,'N')";
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(query);
			// uniqId, userId, userPwd, nickname, name, gender, email, phone, addressCity, addressGu, adminYn
			pstmt.setString(1, member.getUserId());
			pstmt.setString(2, member.getUserPwd());
			pstmt.setString(3, member.getNickname());
			pstmt.setString(4, member.getName());
			pstmt.setString(5, member.getGender());
			pstmt.setString(6, member.getEmail());
			pstmt.setString(7, member.getEmail());
			pstmt.setString(8, member.getPhone());
			pstmt.setString(9, member.getAddressCity());
			pstmt.setString(10, member.getAddressGu());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

}
