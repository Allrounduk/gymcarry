package member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class EnrollServlet
 */
@WebServlet("/member/enroll")
public class EnrollServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EnrollServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//한글 깨지지 않도록 인코딩
		request.setCharacterEncoding("UTF-8");
		
		// uniqId, userId, userPwd, nickname, name, gender, email, phone, addressCity, addressGu, adminYn
		// user객체를 사용해 한 번에 넘겨줄 예정.
		Member member = new Member();
		member.setUserId(request.getParameter("user-id")); // enroll.html의 input태그를 넣을 것.
		member.setUserPwd(request.getParameter("user-pwd"));
		member.setNickname(request.getParameter("nickname"));
		member.setName(request.getParameter("user-name"));
		member.setGender(request.getParameter("gender"));
		member.setEmail(request.getParameter("email"));
		member.setPhone(request.getParameter("phone"));
		member.setAddressCity(request.getParameter("addr-city"));
		member.setAddressGu(request.getParameter("addr-gu"));
		
		int result = new MemberService().registerMember(member);
		
		if(result > 0) {
			response.sendRedirect("/index.jsp");
		}else {
			System.out.println("회원가입에 실패하였습니다.");
			response.sendRedirect("/member/memberError.html");
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
