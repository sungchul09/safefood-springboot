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

<title>msg add</title>

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


<header class="masthead bg-light text-white text-center">
	<div class="container" style="margin-left:35%" >
		<div class="login100-form-title" style="width:500px; " p-l-55p-r-55p-t-80p-b-30">
			<form class="login100-form validate-form"  action="Msgadd.do"
				method="post">
				<h5 style="font-size: 50px; color: rgb(44, 62, 80);">메세지 보내기</h5>
				
				<hr style="border: 2px solid rgb(44, 62, 80);" />
				
				<div class="wrap-input100 validate-input m-b-20"
						data-validate="Enter product code" style="margin-bottom: 20px;">
						<input class="form-control" style=
							width:500px; margin:auto " type="text" name="receive_email"
							placeholder="받을분 이메일"> <span class="focus-input100"></span>
					</div>
					
					<div class="wrap-input100 validate-input m-b-25"
						data-validate="Enter material" style="margin-bottom: 20px;">
						<textarea class="form-control" style=
							width:500px; margin:auto type="text" name="contents"
							placeholder="내용"></textarea> <span class="focus-input100"></span>
					</div>
				
					
					<hr style="border: 2px solid rgb(44, 62, 80);" />
					<button class="btn btn-success round"
						style="background: rgb(44, 62, 80); height: 52px; margin-left: 5px; border: none;"
						type="submit">메일 보내기</button>
						
					<button class="btn btn-success round"
					type="button"
						style="background: rgb(44, 62, 80); height: 52px; margin-left: 5px; border: none;"
						onclick = "location.href = './msglistsend.do'">취소</button>
		</form>
		
		
		
		</div>
	</div>
</header>

<jsp:include page="footer.jsp"></jsp:include>
</body>

</html>
