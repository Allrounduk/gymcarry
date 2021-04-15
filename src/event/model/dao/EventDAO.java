package event.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import common.JDBCTemplate;
import event.model.vo.Event;

public class EventDAO {

	public ArrayList<Event> selectEventList(Connection conn, int currentPage) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Event> eList = null;
		String query = "SELECT * FROM(SELECT ROW_NUMBER() OVER(ORDER BY EVENT_NO DESC) AS NUM, EVENT_NO, PARTNER_NAME, EVENT_ADDRESS, EVENT_TITLE, START_DATE, END_DATE FROM TB_EVENT)WHERE NUM BETWEEN ? AND ?";
		
		int recordCountPerPage = 6;
		int start = currentPage * recordCountPerPage - (recordCountPerPage -1);
		int end = currentPage * recordCountPerPage;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rset = pstmt.executeQuery();
			eList = new ArrayList<Event>();
			if (rset != null) {
				while (rset.next()) {
					Event event = new Event();
					event.setEventNo(rset.getInt("EVENT_NO"));
					event.setPartnerName(rset.getString("PARTNER_NAME"));
					event.setEventAddress(rset.getString("EVENT_ADDRESS"));
					event.setEventTitle(rset.getString("EVENT_TITLE"));
					event.setStartDate(rset.getDate("START_DATE"));
					event.setEndDate(rset.getDate("END_DATE"));
					eList.add(event);
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return eList;
	}

	public String getPageNavi(Connection conn, int currentPage) {
		int recordTotalCount = totalCount(conn);
		int recordCountPerPage = 6;
		int pageTotalCount = 0;
		//�������� 0�� �ƴѰ�� : 3������ �������� - �������� �߰��������
		if (recordTotalCount % recordCountPerPage > 0) { 
			pageTotalCount = recordTotalCount / recordCountPerPage + 1;
		}else {
			pageTotalCount = recordTotalCount / recordCountPerPage;
		}
		
		// ���������ڵ�
		if (currentPage<1) {
			currentPage = 1;
		}else if (currentPage >pageTotalCount) {
			currentPage = pageTotalCount;
		}
		
		// ���� ���������� �������� ������ ��� �����ٰ���
		// 1 2 3 4 5, 6 7 8
		int naviCountPerPage = 5;
		int startNavi = ((currentPage - 1) / naviCountPerPage) * naviCountPerPage + 1;
		int endNavi = startNavi + naviCountPerPage - 1;
		if (endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		}
		
		boolean needPrev = true;
		boolean needNext = true;
		if (startNavi == 1) {
			needPrev = false;
		}
		if (endNavi == pageTotalCount) {
			needNext = false;
		}
		StringBuilder sb = new StringBuilder();
		if (needPrev) {
			sb.append("<a href='/geundeal/list?currentPage=" + (startNavi-1) + "' class='btn_arr prev'> < </a>");
		}
		for (int i = startNavi; i <= endNavi; i++) {
			if(i == currentPage) {
				sb.append("<a href='/geundeal/list?currentPage=" + i + "' class='on'>" + i + " </a>");
			}else {
				sb.append("<a href='/geundeal/list?currentPage=" + i + "'>" + i + " </a>");
			};
		}
		if (needNext) {
			sb.append("<a href='/geundeal/list?currentPage=" + (endNavi + 1) + "' class='btn_arr next> > </a>");
		}
		return sb.toString();
	}

	private int totalCount(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		String query = "SELECT COUNT(*) AS TOTALCOUNT FROM TB_EVENT";
		int recordTotalCount = 0;
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			if (rset.next()) {
				recordTotalCount = rset.getInt("TOTALCOUNT");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(stmt);
		}
		return recordTotalCount;
	}

	public Event selectOneEvent(Connection conn, int eventNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Event event = null;
		String query = "SELECT * FROM TB_EVENT WHERE EVENT_NO = ?"; // 위치홀더는 물음표
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, eventNo);
			rset = pstmt.executeQuery(); //이거 안적으면 쿼리문실행 안됨
			if (rset.next()) { // 한개만 가져올테니 if문으로 체크
				event = new Event();
				event.setEventNo(rset.getInt("EVENT_NO"));
				event.setPartnerName(rset.getString("PARTNER_NAME"));
				event.setEventAddress(rset.getString("EVENT_ADDRESS"));
				event.setEventTitle(rset.getString("EVENT_TITLE"));
				event.setEventContent(rset.getString("EVENT_CONTENT"));
				event.setStartDate(rset.getDate("START_DATE"));
				event.setEndDate(rset.getDate("END_DATE"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rset);
		}
		return event;
	}

}
