package market.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import market.model.service.MarketService;
import market.model.vo.Market;

/**
 * Servlet implementation class MarketWriteServlet
 */
@WebServlet("/market/write")
public class MarketWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public MarketWriteServlet() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/gymmarket/marketWrite.html");
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String title = request.getParameter("title");
		String price = request.getParameter("price");
		String content = request.getParameter("content");
//		String pic1 = request.getParameter("pic1");
//		String pic2 = request.getParameter("pic2");
//		String pic3 = request.getParameter("pic3");
		
		HttpSession session = request.getSession(); // 로그인한 사용자니까 세션에서 정보 가져오기
		
		if(session != null && (session.getAttribute("uniqId")) != null) {
			int uniqId = (int)session.getAttribute("uniqId");
			Market market = new Market();
			market.setMarketTitle(title);
			market.setMarketPrice(price);
			market.setMarketContent(content);
			int result = new MarketService().insertMarket(market);
			
			if(result > 0) {
				response.sendRedirect("/market/list"); // 전값을 url로 넘겨줌
			} else {
				RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/market/error.html");
				view.forward(request, response);
			}
			
		} else {
			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/view/market/error.html");
		}
		
		
	}

}
