package member.model.service;

import java.sql.Connection;
import java.sql.SQLException;

import common.JDBCTemplate;
import member.dao.MemberDAO;
import member.vo.Member;

public class MemberService {

	private JDBCTemplate factory;

	public MemberService() {
		factory = JDBCTemplate.getConnection();
	}

//로그인
	public Member selectOneUser(String userId, String userPwd) {
		Member member = null;
		Connection conn = null;

		try {
			conn = factory.createConnection();
			member = new MemberDAO().selectOneUser(conn, userId, userPwd);
			System.out.println(member.toString());

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(conn);
		}

		return member;
	}

//회원가입
	public int registerMember(Member member) {
		// TODO Auto-generated method stub
		return 0;
	}

}
