<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8" />
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>login</title>

<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

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
	href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
	rel="stylesheet" type="text/css">

<!-- Plugin CSS -->
<link href="vendor/magnific-popup/magnific-popup.css" rel="stylesheet"
	type="text/css">

<!-- Custom styles for this template -->
<link href="css/freelancer.min.css" rel="stylesheet">
</head>

<jsp:include page="header.jsp"></jsp:include>


<!-- Header -->
<header class="masthead bg-primary text-white text-center" >
	<div class="container">
	<h1 class=" mb-0 text-center text-uppercase" style="color: rgb(44, 62, 80);">LOGIN</h1>
	<br>
	<h2 class="font-weight-light mb-0" style="color: rgb(44, 62, 80);">아이디가 존재하지않다면 회원가입을 먼저 진행해주세요.</h2>
	</div>
</header>
<section class="portfolio text-white text-center" id="portfolio">
	<div class="container">
		<form class="login100-form validate-form" action="./login.do" method="post" id='_fo1'>
				<hr style="border: 2px solid rgb(44, 62, 80); width: 500px;">
				<div class="wrap-input100 validate-input m-b-20"
					data-validate="Enter username or email"
					style="width: 500px; margin: auto">
					<input class="form-control" type="text" name="email"
						placeholder="email" style="margin-bottom: 20px;"> <span
						class="focus-input100"></span>
				</div>

				<div class="wrap-input100 validate-input m-b-25"
					data-validate="Enter password" style="width: 500px; margin: auto">
					<input class="form-control" type="password" name="pass"
						placeholder="password" style="margin-bottom: 20px;"> <span
						class="focus-input100"></span>
				</div>

				<div class="container-login100-form-btn" style="margin-bottom:10%;">
					<hr style="border: 2px solid rgb(44, 62, 80); width: 500px;">
					<button class="btn btn-success round"
						style="background: rgb(44, 62, 80); height: 52px; margin-left: 5px; border: none;"
						type="submit">로그인</button>
												<button class="btn btn-success round" type="button"
						style="background: rgb(44, 62, 80); height: 52px; margin-left: 5px; border: none;"
						onclick = "location.href = './searchpassbf.do'">비밀번호 찾기</button>
					<button class="btn btn-success round"
						style="background: rgb(44, 62, 80); height: 52px; margin-left: 5px; border: none;"
						src='./index.do'>취소</button>
				</div>
		</div>
	</div>
</header>


<jsp:include page="footer.jsp"></jsp:include>



</body>

</html>
