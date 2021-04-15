<%@page import="member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Member member = null;
	if(session != null && session.getAttribute("member") != null) {
		member = (Member)session.getAttribute("member");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>GYM CARRY짐캐리</title>
<link rel="stylesheet" type="text/css" href="resources/css/main.css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Anton&family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
</head>
<body>
	<header>
<div class="frame">
			<a href="/index.jsp"><img src="/resources/img/logo.png"></a>
			<ul class="navbar">
				<a href="/gymstory.jsp"><li class="nav-menu first-nav">GYM STORY</li></a>
				<a href="#"><li class="nav-menu second-nav">GYM POT</li></a>
				<a href="#"><li class="nav-menu third-nav">GYM MARKET</li></a>
				<a href="#"><li class="nav-menu fourth-nav">GEUN DEAL</li></a>
			</ul>
			<!-- 로그인 하지 않았을 때 보여지는 nav버튼 -->
			<%
			if(member == null) {
			%>
			<ul class="login-box">
				<a href="/member/login" role="button"><li>LOGIN</li></a>
				<a href="/member/enroll" role="button"><li>JOIN</li></a>
			</ul>
			<!-- 로그인 했을 때 보여지는 nav버튼(admin) -->
			<% } else if(member != null && member.getUserId().equals("admin")) { %>
				<ul class="login-box">
					<a href="/message/list" role="button"><li>CFM DEAL</li></a>
					<a href="#" role="button"><li>ADMIN PAGE</li></a>
				</ul>
			<!-- 로그인 했을 때 보여지는 nav버튼(user) -->
			<%
				} else {
			%>
				<ul class="login-box">
					<a href="/message/list" role="button"><li>MESSAGE</li></a>
					<a href="#" role="button"><li>MY PAGE</li></a>
				</ul>
			<% } %>
</div>
</header>
	<main>
		<div class="frame">
			<div class="banner">
				<img class="bannerimg" src="resources/img/mainbanner.png">
				<p>솔직한 리뷰, 믿을 수 있는 정보!</p>
				<img src="resources/img/main-imglogo.png"> <img
					src="resources/img/main_contlogo.png">
			</div>
			<div class="moving"></div>
			<div id="market">
				<h1>GYM MARKET</h1>
				<h5>실시간 거래되는 회원권을 한눈에 비교해보자.</h5>
				<table>
					<tr class="tableheader">
						<th>NO</th>
						<th>TITLE</th>
						<th>NAME</th>
						<th>DATE</th>
					</tr>
					<tr>
						<a href="#">
							<td>4</td>
							<td>양도권 판매합니다</td>
							<td>박다인</td>
							<td>2021-02-03</td>
						</a>
					</tr>
					<tr>
						<a href="#">
							<td>4</td>
							<td>양도권 판매합니다</td>
							<td>박다인</td>
							<td>2021-02-03</td>
						</a>
					</tr>
					<tr>
						<a href="#">
							<td>4</td>
							<td>양도권 판매합니다</td>
							<td>박다인</td>
							<td>2021-02-03</td>
						</a>
					</tr>
				</table>
			</div>
			<div id="deal">
				<h1>GEUN DEAL</h1>
				<h5>짐캐리에서만 만날 수 있는 초특가 이벤트를 확인해보자.</h5>
				<div class="moving"></div>
				<ul>
					<li class="contents"><a
						href="#">
							<div class="img-box">
								<img src="resources/img/ex-gym.png">
							</div>
							<div class="content-text">
								<div class="title-area">
									<span>올라 휘트니스 센터</span>
									<p>신촌</p>
								</div>
								<div class="sale-time">
									<p>1년 360000원 + PT 5회</p>
									<p>공휴일휴무 08:00~22:00</p>
								</div>
								<button>GO</button>
							</div>
					</a></li>
					<li class="contents"><a href="#">
						<div class="img-box">
							<img src="resources/img/ex-gym.png">
						</div>
						<div class="content-text">
							<div class="title-area">
								<span>올라 휘트니스 센터</span>
								<p>신촌</p>
							</div>
							<div class="sale-time">
								<p>1년 360000원 + PT 5회</p>
								<p>공휴일휴무 08:00~22:00</p>
							</div>
							<button>GO</button>
						</div>
					</a></li>
					<li class="contents"><a href="#">
							<div class="img-box">
								<img src="resources/img/ex-gym.png">
							</div>
							<div class="content-text">
								<div class="title-area">
									<span>올라 휘트니스 센터</span>
									<p>신촌</p>
								</div>
								<div class="sale-time">
									<p>1년 360000원 + PT 5회</p>
									<p>공휴일휴무 08:00~22:00</p>
								</div>
								<a href="#"><button>GO</button></a>
							</div>
					</a></li>
				</ul>
			</div>
			<div class="enddiv">
				<div id="story">
					<div class="titlebox">
						<h2>GYM STORY</h2>
						<h1>
							WHY DID WE<br>STARTED THIS PROJECT?
						</h1>
						<p>짐 캐리의 시작, 그 이유는 어디에서 출발했을까.</p>
						<a href="/gymstory.html"><button>GO</button></a>
					</div>
				</div>
				<div id="business">
					<h2>FOR</h2>
					<h1>BUSINESS</h1>
					<P>비즈니스 문의는 여기에서</P>
					<a href="/geundeal/write"><button>GO</button></a>
				</div>
			</div>
		</div>
	</main>
	<footer>
		<div class="frame">
			<a href="#"><img src="resources/img/wLogo.png"></a>
			<div class="footer-contents">
				<p>
					(주)올라운덕 <span class="stick"></span> 대표이사 올라운덕 <span class="stick"></span>
					사업자등록번호 123-45-67890
				</p>
				<p>
					서울특별시 종로구 종로대로 1000 <span class="stick"></span> 고객센터 080-1234-5678
					(수신자요금부담)
				</p>
			</div>
			<p class="copyright">
				<span>©</span>ALL ROUNDUK. All rights reserved.
			</p>
		</div>
	</footer>
</body>
</html>