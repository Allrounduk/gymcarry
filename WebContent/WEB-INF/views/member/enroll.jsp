<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String userId = (String) session.getAttribute("userId"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>GYM CARRY</title>
<link rel="stylesheet" type="text/css" href="/css/gymstory.css">
<link rel="stylesheet" type="text/css" href="/css/enroll.css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Anton&family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>

<script>
    $(function() {
      message = $(".message");
      userId = $("#user-id");
      userPwd = $("#user-pwd");
     
        // ID는 영어소문자, 숫자만 가능. (4~20자리, 소문자로 시작해야함)
        $('#user-id').on("keyup", function() {
          message.html("");
          var regExp = /^[a-z][a-z0-9]{3,19}$/;
          if (!regExp.test(userId.val())) {
            message.html("아이디는 소문자, 숫자만 가능하고 4~12글자로 입력해주세요.");
          } else {
            message.html("사용 가능한 ID입니다.");
          }
        })
        // PW는 영어소문자, 대문자, 숫자만 입력 가능하며 최소 8~20자리
        var pwRegExp = /^[a-z0-9A-Z]{8,20}$/;
    })
  </script>
</head>


<body>
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

	<div class="main">
		<div class="main-frame">
			<div class="title">
				<legend class="title-1">GYM CARRY</legend>
				<legend class="title-2">회원가입</legend>
			</div>
			<div class="enroll">
			<span class="message" id="message" style="color: blue;"></span>
				<fieldset">
					<form class="enroll-form" method="post" action="/member/enroll">
						<ul>
							<li>아이디<a>*</a><br>
							<input type="text" name="user-id" placeholder="영문소문자,숫자 4자 이상"
								required></li>
							<font id="message" style="color: blue;" size="2">
							<br>
							<li>비밀번호<a>*</a><br>
							<input type="password" name="user-pwd" required></li>
							<br>
							<li>닉네임<a>*</a><br>
							<input type="text" name="nickname" required></li>
							<br>
							<li>이름<a>*</a><br>
							<input type="text" name="user-name" required></li>
							<br>
							<li>성별<a>*</a><br>
							<input type="radio" name="gender" value="M">남 <input
								type="radio" name="gender" value="F">여
							</li>
							<br>
							<li>이메일<a>*</a><br>
							<input type="text" name="email" required></li>
							<br>
							<li>연락처<a>*</a><br>
							<input type="text" name="phone" required></li>
							<br>
							<li>주소(시/도)<a>*</a><br>
							<input type="text" name="addr-city" required></li>
							<br>
							<li>주소(구)<a>*</a><br>
							<input type="text" name="addr-gu" required></li>
							<br>
							<input type="submit" id="joinBtn" value="회원가입">
							<input type="reset" id="cancelBtn" value="취소">
						</ul>
				</fieldset>
			</div>
		</div>
	</div>
	</form>

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