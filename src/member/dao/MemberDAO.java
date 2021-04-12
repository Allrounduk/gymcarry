package member.model.dao;

import java.sql.Connection;
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

}
