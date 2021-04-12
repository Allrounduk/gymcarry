package market.controller;

import java.io.IOException;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import market.model.service.MarketService;
import market.model.vo.Market;

/**
 * Servlet implementation class MarketDetailServlet
 */
@WebServlet("/market/detail")
public class MarketDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public MarketDetailServlet() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int marketNo = Integer.parseInt(request.getParameter("marketNo"));
		Market market = new MarketService().printOneMarket(marketNo);
		if(market != null) {
			request.setAttribute("market", market);
			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/gymmarket/marketDetail.jsp");
			view.forward(request, response);
		} else {
			RequestDispatcher view =request.getRequestDispatcher("/WEB-INF/views/gymmarket/error.html");
			view.forward(request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
