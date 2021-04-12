package market.model.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import common.JDBCTemplate;
import event.model.vo.PageData;
import market.model.dao.MarketDAO;
import market.model.vo.MPageData;
import market.model.vo.Market;


public class MarketService {
	
	private JDBCTemplate factory;
	
	public MarketService() {
		factory = JDBCTemplate.getConnection();
	}
	
	public MPageData printAllMarketList(int currentPage) {
		Connection conn = null;
		MPageData pd = new MPageData();
		
		try {
			conn = factory.createConnection();
			pd.setMarketList(new MarketDAO().printAllMarketList(conn,currentPage));
			pd.setPageNavi(new MarketDAO().getPageNavi(conn, currentPage));
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(conn);
		}
		return pd;
	}

	public int insertMarket(Market market) {
		Connection conn = null;
		int result = 0;
		
		try {
			conn = factory.createConnection();
			result = new MarketDAO().insertMarket(conn, market);
			if(result > 0 ) {
				JDBCTemplate.commit(conn);
			} else {
				JDBCTemplate.rollback(conn);
			} 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(conn);
		}
		return result;
	}

	public Market printOneMarket(int marketNo) {
		Connection conn = null;
		Market market =null;
		
		try {
			conn = factory.createConnection();
			market = new MarketDAO().printOneMarket(conn,marketNo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(conn);
		}
		
		return market;
	}

}
