<%@page import="event.model.vo.Event"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	ArrayList<Event> eList = (ArrayList<Event>)request.getAttribute("eList");
	String pageNavi = (String)request.getAttribute("pageNavi");
%>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <title>GYM CARRY 근딜</title>
    <link rel="stylesheet" type="text/css" href="${path}/resources/css/geundeal.css">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Anton&family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
</head>
<body>
    <header>
        <div class="frame">
            <a href="/"><img src="${path}/resources/img/logo.png"></a>
            <ul class="navbar">
                <a href="/gymstory.html"><li class="nav-menu first-nav">GYM STORY</li></a>
                <a href="#"><li class="nav-menu second-nav">GYM POT</li></a>
                <a href="/market/list"><li class="nav-menu third-nav">GYM MARKET</li></a>
                <a href="/geundeal/list"><li class="nav-menu fourth-nav">GEUN DEAL</li></a>
            </ul>
            <ul class="login-box">
                <a href="#"><li>LOGIN</li></a>
                <a href="#"><li>JOIN</li></a>
            </ul>
        </div>
    </header>
    <main>
        <div class="frame">
            <img class="banner" src="${path}/resources/img/dealbanner.png">
            <p><span>GEUN DEAL</span><br>짐캐리에서만 만날 수 있는 초특가 이벤트</p>
            <div class="main-visual">
                <ul class="contents-frame">
                	<% for(Event event : eList) { %>
                    <li class="contents"><a href="/geundeal/detail?eventNum=<%= event.getEventNo() %>">
                        <div class="img-box">
                            <img src="${path}/resources/img/ex-gym.png">
                        </div>
                        <div class="content-text">
                            <div class="title-area">
                                <span><%= event.getPartnerName() %></span>
                                <p><%= event.getEventAddress() %></p>
                            </div>
                            <div class="sale-time">
                                <p><%= event.getEventTitle() %></p>
                                <p><%= event.getStartDate() %> ~ <%= event.getEndDate() %></p>
                            </div>
                            <button>GO</button>
                        </div>
                    </a></li>
                	<% } %>
                </ul>  
                    <div class="paging">
                    <%= pageNavi %>
                        <!-- <a href="#" class="btn_arr prev"><span class="hide">이전페이지</span></a>     
                        <a href="#" class="on">1</a>활성화페이지일 경우 : on 처리
                        <a href="#">2</a>
                        <a href="#">3</a>
                        <a href="#">4</a>
                        <a href="#">5</a>
                        <a href="#" class="btn_arr next"><span class="hide">다음페이지</span></a>     -->
                    </div>
            </div>
        </div>
    </main>
    <footer>
        <div class="frame">
            <a href="#"><img src="${path}/resources/img/wLogo.png"></a>
            <div class="footer-contents">
                <p>(주)올라운덕	<span class="stick"></span>	대표이사 올라운덕	<span class="stick"></span>	사업자등록번호 123-45-67890</p>
                <p>서울특별시 종로구 종로대로 1000  	 <span class="stick"></span>	고객센터 080-1234-5678 (수신자요금부담)</p>
            </div>
            <p class="copyright"><span>©</span>ALL ROUNDUK. All rights reserved.</p>
        </div>
    </footer>
</body>
</html>