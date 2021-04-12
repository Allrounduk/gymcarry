<%@page import="market.model.vo.Market"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% 
    	Market market = (Market)request.getAttribute("market");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://code.jquery.com/jquery-3.3.1.js" integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60=" crossorigin="anonymous"></script>
<title>양도권 게시글 작성</title>
<link rel="stylesheet" type="text/css" href="/resources/css/marketDetail.css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Anton&family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
</head>
<body>
    <script>
        $(document).ready(function(){

            $(".bin").show();
            $(".full").hide();
            $('.bin').on("click", function(){
                $(".bin").hide();
                $(".full").show();
            });
            $('.full').on("click", function(){
                $(".bin").show();
                $(".full").hide();
            });
        })
    </script>
    <!-- <div id="wrapper"> -->
        <header id="header">
            <!-- 네이게이션 바 -->
            <div class="frame">
                <a href="#"><img src="${path}/resources/img/gym-carry.png"></a>
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
                <div id="marketdetail">
                    <div class="titlewrapper">
                        <span class="category"><%= market.getMarketField() %></span><br>
                        <span class="title"><%= market.getMarketTitle() %></span> <div class="zzim">
                            <img class="star bin" src="${path}/resources/img/linestar.png"/>
                            <img class="star full" src="${path}/resources/img/colorstar.png"/><br>
                            <span id="textzzim">찜하기</span>
                        </div><br>
                        <div class="info">
                            <span class="name"><%= market.getNickName() %></span><span class="date"><%= market.getMarketDate() %></span>
                        </div>
                    </div>

                    <div class="contents">
                        <div class="product-title">
                            <div class="img-box">
                                <img class="main-pic" src="${path}/resources/img/gympic1.png">
                            </div></div><br>
                            <div class="product-title">
                                <div class="img-box">
                                    <img class="main-pic" src="${path}/resources/img/trainer1.jpg">
                                </div></div><br>
                            
                            <span class="price">희망 가격 : <%= market.getMarketPrice() %></span>
                            <p class="content"><%= market.getMarketContent() %>
                            </p>
                    </div>        
                    <div style="text-align: center;">
                            <input type="button" id="sendmsgbtn" value="쪽지보내기">
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