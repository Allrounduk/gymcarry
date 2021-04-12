package market.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import common.JDBCTemplate;
import market.model.vo.Market;

public class MarketDAO {

	public ArrayList<Market> printAllMarketList(Connection conn,int currentPage) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Market> mList = null;
		String query="SELECT * FROM (SELECT ROW_NUMBER() OVER (ORDER BY MARKET_NO DESC) AS NUM, MARKET_NO, (SELECT NICKNAME FROM MEMBER WHERE UNIQ_ID='1') AS NICKNAME, MARKET_TITLE, MARKET_PRICE, MARKET_CONTENT, MARKET_FILED,MARKET_DATE FROM MARKET ) WHERE NUM BETWEEN ? AND ?"
				+ "";
		int recordCountPerPage = 6;
		int start = currentPage*recordCountPerPage - (recordCountPerPage-1);
		int end = currentPage*recordCountPerPage;
		try {
			pstmt = conn.prepareStatement(query);
			//pstmt.setInt(1, uniqId);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rset = pstmt.executeQuery();
			mList = new ArrayList<Market>();
			while(rset.next()) {
				Market market = new Market();
				market.setMarketNo(rset.getInt("MARKET_NO"));
				market.setNickName(rset.getString("NICKNAME"));
				market.setMarketTitle(rset.getString("MARKET_TITLE"));
				market.setMarketPrice(rset.getString("MARKET_PRICE"));
				market.setMarketContent(rset.getString("MARKET_CONTENT"));
				market.setMarketField(rset.getString("MARKET_FILED"));
				market.setMarketDate(rset.getDate("MARKET_DATE"));
				mList.add(market);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return mList;
	}

	public String getPageNavi(Connection conn, int currentPage) {
		int recordTotalCount = totalCount(conn);
		int recordCountPerPage = 6;
		int pageTotalCount = 0;
		if(recordTotalCount % recordCountPerPage > 0) {
			pageTotalCount = recordTotalCount / recordCountPerPage + 1;
		} else {
			pageTotalCount = recordTotalCount/ recordCountPerPage;
		}
		// 오류방지 코드
		if(currentPage < 1) {
			currentPage = 1;
		} else if(currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		}
		
		int naviCountPerPage = 5;
		int startNavi = ((currentPage-1)/naviCountPerPage) * naviCountPerPage +1;
		int endNavi = startNavi + naviCountPerPage -1;
		
		// 오류 방지 코드
		// 페이지 수 만큼 짤라줌 
		if(endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		}
		
		boolean needPrev = true;
		boolean needNext = true;
		if(startNavi == 1) {
			needPrev = false;
		}
		if(endNavi == pageTotalCount) {
			needNext = false;
		}
		
		StringBuilder sb = new StringBuilder();
		if(needPrev) {
			sb.append("<a href='/market/list?currentPage="+ (startNavi-1)+ "'> < </a>");
		}
		for(int i = startNavi; i<=endNavi; i++) {
			sb.append("<a href='/market/list?currentPage="+ i +"'> "+ i + " </a>");
		}
		if(needNext) {
			sb.append("<a href='/market/list?currentPage="+ (endNavi+1) + "'> > </a>");
		}
		return sb.toString();
	}
	
	public int totalCount(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		String query = "SELECT COUNT(*) AS TOTALCOUNT FROM MARKET";
		int recordTotalCount = 0;
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			if(rset.next()) {
				recordTotalCount = rset.getInt("TOTALCOUNT");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(stmt);
		}
		return recordTotalCount;
	}

	public int insertMarket(Connection conn, Market market) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1,market.getMarketField());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

	public Market printOneMarket(Connection conn, int marketNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Market market = null;
		String query = "SELECT MARKET_NO,(SELECT NICKNAME FROM MEMBER WHERE UNIQ_ID='1')AS NICKNAME,MARKET_TITLE,MARKET_PRICE,MARKET_CONTENT,MARKET_FILED,MARKET_DATE FROM MARKET WHERE MARKET_NO=?"
				+ "";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, marketNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				market = new Market();
				market.setMarketNo(rset.getInt("MARKET_NO"));
				market.setNickName(rset.getString("NICKNAME"));
				market.setMarketTitle(rset.getString("MARKET_TITLE"));
				market.setMarketPrice(rset.getString("MARKET_PRICE"));
				market.setMarketContent(rset.getString("MARKET_CONTENT"));
				market.setMarketField(rset.getString("MARKET_FILED"));
				market.setMarketDate(rset.getDate("MARKET_DATE"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return market;
	}

}
