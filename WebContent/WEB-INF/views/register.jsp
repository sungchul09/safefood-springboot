<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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

<title>Freelancer - Start Bootstrap Theme</title>

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
       	if($('#uname').val()==''){
       		alert('이름을 입력하세요!');
       		return false;
       	}
    	else if($('#email').val()==''){
       		alert('이메일을 입력하세요!');
       		return false;
       	}
    	else if($('#pass').val()==''){
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
	<h1 class=" mb-0 text-center text-uppercase" style="color: rgb(44, 62, 80);">회원가입</h1>
	<br>
	<h2 class="font-weight-light mb-0" style="color: rgb(44, 62, 80);">SafeFood 페이지 회원가입을 환영합니다.</h2>
</header>
<section class="portfolio text-white text-center" id="portfolio">
	<div class="container">
		<div class="login100-form-title style="width:500px; margin:auto" p-l-55p-r-55p-t-80p-b-30">
			<form class="login100-form validate-form" action="register.do"
				method="post" id="memsub">
				<hr style="border: 2px solid rgb(44, 62, 80);" />
				<div class="wrap-input100 validate-input m-b-20"
					data-validate="Enter your name" style="margin-bottom: 20px;">
					<input class="form-control style="
						width:500px; margin:auto; margin-bottom:5px;" type="text"
						name="username" id="uname" placeholder="username"> <span
						class="focus-input100" ></span>
				</div>
				<a style="margin-bottom: 20px;">
					<div class="wrap-input100 validate-input m-b-20"
						data-validate="email" style="margin-bottom: 20px;">
						<input class="form-control style="
							width:500px; margin:auto" type="text" name="email" id="email"
							placeholder="email"> <span class="focus-input100"></span>
					</div>
					<div class="wrap-input100 validate-input m-b-25"
						data-validate="Enter password" style="margin-bottom: 20px;">
						<input class="form-control style="
							width:500px; margin:auto" type="password" name="pass" id="pass"
							placeholder="password"> <span class="focus-input100"></span>
					</div>
					<div class="wrap-input100 validate-input m-b-25"
						data-validate="Enter password again" style="margin-bottom: 20px;">
						<input class="form-control style="
							width:500px; margin:auto" type="password" name="cpass" id="pass1"
							placeholder="password again"> <span
							class="focus-input100"></span>
					</div>
					<div class="wrap-input100 validate-input m-b-25"
						data-validate="Enter your phone number"
						style="margin-bottom: 20px;">
						<input class="form-control style="
							width:500px; margin:auto" type="text" name="phonenum" id="phonenum"
							placeholder="phone number"> <span class="focus-input100"></span>
					</div>
					<div class="wrap-input100 validate-input m-b-25"
						data-validate="Enter your stature"
						style="margin-bottom: 20px;">
						<input class="form-control style="
							width:500px; margin:auto" type="text" name="tall" id="tall"
							placeholder="tall"> <span class="focus-input100"></span>
					</div>
					<div class="wrap-input100 validate-input m-b-25"
						data-validate="Enter your gender"
						style="margin-bottom: 20px; color: black;">
<!-- 						<input class="form-control style="
							width:500px; margin:auto" type="text" name=gender
							placeholder="male or female"> <span class="focus-input100"></span> -->
					<select class="form-control input-lg" name="gender" id="gender" style="height: 40px; float: left;">
            			<option name="gender"  value="male">남성</option>
         				<option name="gender" value="female">여성</option>
           			</select>
				
					</div>
					<hr style="border: 2px solid rgb(44, 62, 80);" />
					

					<div class="wrap-input100 validate-input m-b-25"
						data-validate="Enter your phone number"
						style="margin-bottom: 20px; color: black;">
						<input type="checkbox" name="allergy" value="대두">대두 
						<input type="checkbox" name="allergy" value="우유">우유 
						<input type="checkbox" name="allergy" value="게">게 
						<input type="checkbox" name="allergy" value="새우">새우 
						<input type="checkbox" name="allergy" value="참치">참치 
						<input type="checkbox" name="allergy" value="연어">연어 
						<input type="checkbox" name="allergy" value="쑥">쑥 
						<input type="checkbox" name="allergy" value="소고기">소고기 
						<input type="checkbox" name="allergy" value="닭고기">닭고기 
						<input type="checkbox" name="allergy" value="돼지고기">돼지고기 
						<input type="checkbox" name="allergy" value="복숭아">복숭아 
						<input type="checkbox" name="allergy" value="민들레">민들레 
						<input type="checkbox" name="allergy" value="계란흰자">계란흰자
					</div>
					
					<hr style="border: 2px solid rgb(44, 62, 80);" />
					<button class="btn btn-success round" style="background: rgb(44, 62, 80); height: 52px; margin-left: 5px; border: none;" id="submitbt"
						>가입완료</button>
						
					<button class="btn btn-success round"
						style="background: rgb(44, 62, 80); height: 52px; margin-left: 5px; border: none;"
						href="./index.do">취소</button>
			</form>
		</div>
	</div>
	</div>
</section>

<jsp:include page="footer.jsp"></jsp:include>
</body>

</html>
