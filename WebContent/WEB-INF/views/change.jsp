<%@page import="java.util.Date"%>
<%@page import="java.lang.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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

<title>회원정보수정</title>

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

 <script type="text/javascript">
   $(function() {
      $('#submitbt').click(function() {
       
    	if($('#pass').val()==''){
       		alert('비밀번호를 입력하세요!');
       		return false;
       	}
    	else if($('#pass1').val()==''){
       		alert('비밀번호를 다시 입력하세요!');
       		return false;
       	}
    	else if($('#pass1').val()!=$('#pass').val()){
       		alert('비밀번호가 일치하지 않습니다!');
       		return false;
       	}
       	else if($('#tall').val()==''){
       		alert('키를 입력하세요!');
       		return false;
       	}
       	else if(isNaN($('#tall').val())){
       		alert('키 숫자를 입력하세요!');
       		return false;
       	}
       	else{
       		
         $('#memsub').submit();
         }
      });

   });
   </script>
</head>

<jsp:include page="header.jsp"></jsp:include>


<!-- Header -->
<header class="masthead bg-primary text-white text-center" >
	<h1 class=" mb-0 text-center text-uppercase" style="color: rgb(44, 62, 80);">회원정보수정</h1>
	<br>
	<h2 class="font-weight-light mb-0" style="color: rgb(44, 62, 80);">원하는 항목을 수정해주세요.</h2>
</header>
<section class="portfolio text-white text-center" id="portfolio">
	<div class="container">
		<form class="login100-form validate-form" action="./change.do" method="post" id="memsub">
			<div class="wrap-input100 validate-input m-b-20" data-validate="Enter your name" style="margin-bottom: 20px;">
				<hr style="border: 2px solid rgb(44, 62, 80);" />
				<a class="text-dark" style="font-weight: bold;">이름</a>
				<input class="form-control style=" width:500px; margin:auto; margin-bottom:5px;" type="text" name="username" value='${member.username}' readonly="readonly">
				<span class="focus-input100"></span>
			</div>
			<a style="margin-bottom: 20px;">
			<div class="wrap-input100 validate-input m-b-20" data-validate="email" style="margin-bottom: 20px;">
				<a class="text-dark" style="font-weight: bold;">이메일</a> 
				<input class="form-control style="width:500px; margin:auto" type="text" name="email" value='${member.email}'  readonly="readonly"> 
				<span class="focus-input100"></span>
			</div> 
			<div class="wrap-input100 validate-input m-b-25" data-validate="Enter your phone number" style="margin-bottom: 20px;">
				<a class="text-dark" style="font-weight: bold;">전화번호</a>
				<input class="form-control style=" width:500px; margin:auto" type="text" name="phonenum" value='${member.phonenum}'> 
				<span class="focus-input100"></span>
			</div> 
			<div class="wrap-input100 validate-input m-b-25" data-validate="Enter your tall" style="margin-bottom: 20px;">
				<a class="text-dark" style="font-weight: bold;">tall</a>
				<input class="form-control style=" width:500px; margin:auto" type="text" name="tall" id="tall" value='${member.tall}'> 
				<span class="focus-input100"></span>
			</div> 
			<div class="wrap-input100 validate-input m-b-25" data-validate="Enter password" style="margin-bottom: 20px;">
				<a class="text-dark" style="font-weight: bold;">패스워드</a>
				<input class="form-control style="width:500px; margin:auto" type="password" name="pass" placeholder="password" id="pass" value="${member.pass}"> 
				<span class="focus-input100"></span>
			</div> 
			<div class="wrap-input100 validate-input m-b-25" data-validate="Enter password again" style="margin-bottom: 20px;">
				<a class="text-dark" style="font-weight: bold;">패스워드확인</a>
				<input class="form-control style=" width:500px; margin:auto" type="password" name="cpass" placeholder="password again" id="pass1" value="${member.pass}"> 
				<span class="focus-input100"></span>
			</div>
			<hr style="border: 2px solid rgb(44, 62, 80);" />
			<div class="wrap-input100 validate-input m-b-25" style="margin-bottom: 20px; color: black;" name="allergies">
				<input type="checkbox" name="allergy" value="대두" <c:if test="${not empty bean}">checked</c:if> />대두 
				<input type="checkbox" name="allergy" value="우유"<c:if test="${not empty milk}">checked</c:if> />우유 
				<input type="checkbox" name="allergy" value="게" <c:if test="${not empty crap}">checked</c:if> />게 
				<input type="checkbox" name="allergy" value="새우" <c:if test="${not empty shirimp}">checked</c:if> />새우 
				<input type="checkbox" name="allergy" value="참치" <c:if test="${not empty tuna}">checked</c:if> />참치 
				<input type="checkbox" name="allergy" value="연어" <c:if test="${not empty salmon}">checked</c:if> />연어 
				<input type="checkbox" name="allergy" value="쑥" <c:if test="${not empty ssuk}">checked</c:if> />쑥 
				<input type="checkbox" name="allergy" value="소고기" <c:if test="${not empty beef}">checked</c:if> />소고기 
				<input type="checkbox" name="allergy" value="닭고기" <c:if test="${not empty chicken}">checked</c:if> />닭고기
				<input type="checkbox" name="allergy" value="돼지고기" <c:if test="${not empty pork}">checked</c:if> />돼지고기
				<input type="checkbox" name="allergy" value="복숭아" <c:if test="${not empty peach}">checked</c:if> />복숭아 
				<input type="checkbox" name="allergy" value="민들레" <c:if test="${not empty flower}">checked</c:if> />민들레 
				<input type="checkbox" name="allergy" value="계란흰자" <c:if test="${not empty egg}">checked</c:if> />계란흰자
			</div>
			<hr style="border: 2px solid rgb(44, 62, 80);" />
			<a href="./deletemem.do?email=${member.email}" style="color:grey; display:block; margin-bottom:10%;">회원탈퇴</a>
			<button class="btn btn-success round" style="background: rgb(44, 62, 80); height: 52px; margin-left: 5px; border: none;" id="submitbt">수정하기</button>
			<button class="btn btn-success round" style="background: rgb(44, 62, 80); height: 52px; margin-left: 5px; border: none;" href="index.jsp">취소</button>
		</form>
	</div>
</section>
<jsp:include page="footer.jsp"></jsp:include>




</body>

</html>
