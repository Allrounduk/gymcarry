<%@page import="member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String userId = (String) session.getAttribute("userId");
Member member = (Member) session.getAttribute("member");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>GYM CARRY</title>
<link rel="stylesheet" type="text/css"
	href="/resources/css/gymstory.css">
<link rel="stylesheet" type="text/css"
	href="/resources/css/modifyMember.css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Anton&family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
</head>

<body>
	<!-- ********************************** 헤더 *********************************** -->
	<header>
		<div class="frame">
			<a href="#"><img src="/img/gym-carry.png"></a>
			<ul class="navbar">
				<a href="gymstory.html"><li class="nav-menu first-nav">GYM
						STORY</li></a>
				<a href="#"><li class="nav-menu second-nav">GYM POT</li></a>
				<a href="#"><li class="nav-menu third-nav">GYM MARKET</li></a>
				<a href="#"><li class="nav-menu fourth-nav">GEUN DEAL</li></a>
			</ul>
			<!-- 로그인 하지 않았을 때 보여지는 화면 -->
			<%
			if (userId == null) {
			%>
			<ul class="login-box">
				<a href="login.jsp" role="button"><li>LOGIN</li></a>
				<a href="enroll.jsp" role="button"><li>JOIN</li></a>
			</ul>
			<%
			} else {
			%>
			<ul class="login-box">
				<a href="#" role="button"><li>MESSAGE</li></a>
				<a href="#" role="button"><li>MY PAGE</li></a>
			</ul>
			<%
			}
			%>
		</div>
	</header>

	<!-- ********************************** 메인 *********************************** -->
	<main>
		<div class="main-frame">
			<div class="title">
				<legend class="title-1">GYM CARRY</legend>
				<legend class="title-2">회원정보 수정</legend>
			</div>
			<div class="update">
				<fieldset>
					<form class="update-form" method="post" action="/member/update">
						<ul>
							<li>아이디<br> <input type="text" name="user-id" value="<%=member.getUserId()%>" readonly></li>
							<li>비밀번호<br> <input type="password" name="user-pwd"
								value="<%=member.getUserPwd()%>"></li>
							<br>
							<li>닉네임<br> <input type="text" name="nickname"
								value="<%=member.getNickname()%>" readonly></li>
							<br>
							<li>이름<br> <input type="text" name="user-name"
								value="<%=member.getName()%>" readonly></li>
							<br>
							<li>성별<br> <%=member.getGender()%>
							</li>
							<br>
							<li>이메일<br> <input type="text" name="email"
								value="<%=member.getEmail()%>"></li>
							<br>
							<li>연락처<br> <input type="text" name="phone"
								value="<%=member.getPhone()%>"></li>
							<br>
							<li>주소(시/도)<br> <input type="text" name="addr-city"
								value="<%=member.getAddressCity()%>"></li>
							<br>
							<li>주소(구)<br> <input type="text" name="addr-gu"
								value="<%=member.getAddressGu()%>"></li>
							<br>

							<input type="submit" id="submitBtn" value="수정하기">
							<input type="reset" id="cancelBtn" value="취소">
						</ul>
				</fieldset>
				</form>
			</div>
			<div class="delete">
			<br>
			<a href="#">메인페이지로 이동</a>
			<a class="deleteMember" href="/member/delete">회원 탈퇴하기</a>			
			</div>
		</div>
	</main>

	<!-- ********************************** footer *********************************** -->
	<footer>
		<div class="frame">
			<a href="#"><img src="/img/wLogo.png"></a>
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