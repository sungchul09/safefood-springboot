<%@page import="java.util.Date"%>
<%@page import="java.lang.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%! String today=""; %>
<fmt:requestEncoding value="utf-8" />
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title></title>
</style>
<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<link href="https://fonts.googleapis.com/css?family=Black+And+White+Picture|Do+Hyeon|East+Sea+Dokdo|Gamja+Flower|Gothic+A1|Gugi|Hi+Melody|Jua|Nanum+Gothic|Nanum+Gothic+Coding|Nanum+Myeongjo|Nanum+Pen+Script|Noto+Sans+KR|Noto+Serif+KR|Song+Myung|Sunflower:300|Yeon+Sung" rel="stylesheet">
<!-- Custom fonts for this template -->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
	rel="stylesheet" type="text/css">

<!-- Plugin CSS -->
<link href="vendor/magnific-popup/magnific-popup.css" rel="stylesheet"
	type="text/css">




<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom fonts for this template -->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.c	om/css?family=Lato:400,700,400italic,700italic"
	rel="stylesheet" type="text/css">

<!-- Plugin CSS -->
<link href="vendor/magnific-popup/magnific-popup.css" rel="stylesheet"
	type="text/css">

<!-- Custom styles for this template -->
<link href="css/freelancer.min.css" rel="stylesheet">
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('#searchSubmit').click(function() {
			$('#btnSearch').submit();
		});

	});
</script>
</head>

	<!-- Navigation -->
	<nav class="navbar-expand-lg bg-white fixed-top" id="mainNav">
		<div class="container">
				<ul class="navbar-nav">
					<li>
						<img class="mr-3 mb-3" height="35px" width="35px" src="img/header-logo.png">
						<a class="navbar-brand js-scroll-trigger text-dark text-uppercase header-font" href="index.jsp" >SAFFY 바른먹거리</a>
						<button
							class="navbar-toggler navbar-toggler-right  bg-primary text-dark rounded"
							type="button" data-toggle="collapse"
							data-target="#navbarResponsive" aria-controls="navbarResponsive"
							aria-expanded="false" aria-label="Toggle navigation">
							Menu <i class="fas fa-bars"></i>
						</button>
						<button
							class="navbar-toggler navbar-toggler-right  bg-primary text-dark rounded"
							type="button" data-toggle="collapse"
							data-target="#navbarResponsive2" aria-controls="navbarResponsive"
							aria-expanded="false" aria-label="Toggle navigation">
							회원버튼 <i class="fas fa-bars"></i>
						</button>
					</li>
					<span class="ml-auto" >
					<ul class="navbar-nav collapse navbar-collapse" id="navbarResponsive2">
						<c:if test="${empty member}">
								<li class="nav-item header-font">
									<a class="nav-link rounded js-scroll-trigger text-success header-font" href='./registerbf.do' >Sing up</a>
								</li>
								<li class="nav-item header-font">
									<a class="nav-link rounded js-scroll-trigger text-success header-font" href='./loginbf.do' >Login</a>
								</li>
						</c:if>
						<c:if test="${not empty member}">
							<li class="nav-item mx-0 mx-lg-1">
								<a href='./detail_membf.do?email=${member.email}'>[${member.username}]</a>
								<a class="header-font">님 반갑습니다. </a>
							</li>
							<li class="nav-item mx-0 mx-lg-1">
								<a class="header-font login-a" style="font-size: 14px" href='./basket.do' >장바구니</a>
							</li>
							<li class="nav-item mx-0 mx-lg-1">
								<a class="header-font login-a" style="font-size: 14px" href='./logout.do' >로그아웃</a>
							</li>
						</c:if>
					</ul>
					</span>
				</ul>
			<span class="text-dark">
				<div class="collapse navbar-collapse gnb" id="navbarResponsive">
					<ul class="navbar-nav gnb-ul text-center">
						<li class="nav-item mx-0 mx-lg-1">
							<div class="one">
								<a class="nav-link text-dark rounded js-scroll-trigger header-font" href="./notice.do" >공지 사항</a>
								<p class="line" ></p>
							</div>
						</li>
						<li class="nav-item mx-0 mx-lg-1">
							<div class="one">
								<a class="nav-link text-dark rounded js-scroll-trigger header-font" href="./location.do" >위치안내</a>
								<p class="line" ></p>
							</div>
						</li>
						<li class="nav-item mx-0 mx-lg-1">
							<div class="one">
								<a class="nav-link text-dark rounded js-scroll-trigger header-font" href='./foodlist.do' >상품 정보</a>
								<p class="line"></p>
							</div>
						</li>
						<li class="nav-item mx-0 mx-lg-1">
							<div class="one">
								<a class="nav-link text-dark rounded js-scroll-trigger header-font" href='./bestlist.do' >베스트 섭취 정보</a>
								<p class="line"></p>
							</div>
						</li>
						<li class="nav-item mx-0 mx-lg-1">
							<div class="one">
									<%@ page import="java.util.*, java.text.*"  %>
									<%
									 java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
									 String today = formatter.format(new java.util.Date());
									%>
								<a class="nav-link text-dark rounded js-scroll-trigger header-font" href="./calendar.do?wdate=<%=today %>" >내 섭취 정보</a>
								<p class="line"></p>
							</div>
						</li>
						<!-- <li class="nav-item mx-0 mx-lg-1">
							<div class="one">
								<a class="nav-link text-dark rounded js-scroll-trigger header-font" href="#contact" >예상 섭취 정보</a>
								<p class="line"></p>
							</div>
						</li> -->
						<c:if test="${not empty member}">
						<li class="nav-item mx-0 mx-lg-1">
							<div class="one">
								<a class="nav-link text-dark rounded js-scroll-trigger header-font" href="./msglistreceive.do">메세지함</a>
								<p class="line"></p>
							</div>
						</li>
						</c:if>
						<li class="nav-item mx-0 mx-lg-1">
							<div class="one">
								<a class="nav-link text-dark rounded js-scroll-trigger header-font" href='./foodqna.do' >Q&A</a>
								<p class="line"></p>
							</div>
						</li>
					</ul>
				</div>
			</span>
		</div>
	</nav>
</body>
</html>