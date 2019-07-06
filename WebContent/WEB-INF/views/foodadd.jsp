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

<title>food add</title>

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


<header class="masthead bg-primary text-white text-center">
	<div class="container" style="margin-left:35%" >
		<div class="login100-form-title" style="width:500px; " p-l-55p-r-55p-t-80p-b-30">
			<form class="login100-form validate-form"  action="Foodadd.do"
				method="post">
				<h5 style="font-size: 50px; color: rgb(44, 62, 80);">제품 추가</h5>
				
				<hr style="border: 2px solid rgb(44, 62, 80);" />
				
				<div class="wrap-input100 validate-input m-b-20"
						data-validate="Enter product code" style="margin-bottom: 20px;">
						<input class="form-control" style=
							width:500px; margin:auto " type="text" name="code"
							placeholder="제품 코드"> <span class="focus-input100"></span>
					</div>
					<div class="wrap-input100 validate-input m-b-20"
						data-validate="Enter product name" style="margin-bottom: 20px;">
						<input class="form-control" style=
							width:500px; margin:auto" type="text" name="name"
							placeholder="제품명"> <span class="focus-input100"></span>
					</div>
					<div class="wrap-input100 validate-input m-b-20"
						data-validate="Enter supportpereat" style="margin-bottom: 20px;">
						<input class="form-control" style=
							width:500px; margin:auto" type="text" name="supportpereat"
							placeholder="일회 제공량"> <span class="focus-input100"></span>
					</div>
					<div class="wrap-input100 validate-input m-b-25"
						data-validate="Enter calory" style="margin-bottom: 20px;">
						<input class="form-control" style=
							width:500px; margin:auto type="text" name="calory"
							placeholder="칼로리"> <span class="focus-input100"></span>
					</div>
					<div class="wrap-input100 validate-input m-b-25"
						data-validate="Enter carbo" style="margin-bottom: 20px;">
						<input class="form-control" style=
							width:500px; margin:auto type="text" name="carbo"
							placeholder="탄수화물"> <span class="focus-input100"></span>
					</div>
					<div class="wrap-input100 validate-input m-b-25"
						data-validate="Enter protein" style="margin-bottom: 20px;">
						<input class="form-control" style=
							width:500px; margin:auto type="text" name="protein"
							placeholder="단백질"> <span class="focus-input100"></span>
					</div>
					<div class="wrap-input100 validate-input m-b-25"
						data-validate="Enter fat" style="margin-bottom: 20px;">
						<input class="form-control" style=
							width:500px; margin:auto type="text" name="fat"
							placeholder="지방"> <span class="focus-input100"></span>
					</div>
					<div class="wrap-input100 validate-input m-b-25"
						data-validate="Enter sugar" style="margin-bottom: 20px;">
						<input class="form-control" style=
							width:500px; margin:auto type="text" name="sugar"
							placeholder="당류"> <span class="focus-input100"></span>
					</div>
					<div class="wrap-input100 validate-input m-b-25"
						data-validate="Enter natrium" style="margin-bottom: 20px;">
						<input class="form-control" style=
							width:500px; margin:auto type="text" name="natrium"
							placeholder="나트륨"> <span class="focus-input100"></span>
					</div>
					<div class="wrap-input100 validate-input m-b-25"
						data-validate="Enter chole" style="margin-bottom: 20px;">
						<input class="form-control" style=
							width:500px; margin:auto type="text" name="chole"
							placeholder="콜레스테롤"> <span class="focus-input100"></span>
					</div>
					<div class="wrap-input100 validate-input m-b-25"
						data-validate="Enter fattyacid" style="margin-bottom: 20px;">
						<input class="form-control" style=
							width:500px; margin:auto type="text" name="fattyacid"
							placeholder="포화지방산"> <span class="focus-input100"></span>
					</div>
					<div class="wrap-input100 validate-input m-b-25"
						data-validate="Enter transfat" style="margin-bottom: 20px;">
						<input class="form-control" style=
							width:500px; margin:auto type="text" name="transfat"
							placeholder="트렌스지방"> <span class="focus-input100"></span>
					</div>
					<div class="wrap-input100 validate-input m-b-25"
						data-validate="Enter maker" style="margin-bottom: 20px;">
						<input class="form-control" style=
							width:500px; margin:auto type="text" name="maker"
							placeholder="제조사"> <span class="focus-input100"></span>
					</div>
					<div class="wrap-input100 validate-input m-b-25"
						data-validate="Enter material" style="margin-bottom: 20px;">
						<textarea class="form-control" style=
							width:500px; margin:auto type="text" name="material"
							placeholder="원료"></textarea> <span class="focus-input100"></span>
					</div>
					<div class="wrap-input100 validate-input m-b-25"
						data-validate="Enter img" style="margin-bottom: 20px;">
						<input class="form-control" style=
							width:500px; margin:auto type="text" name="img"
							placeholder="이미지 경로"> <span class="focus-input100"></span>
					</div>
					
					<hr style="border: 2px solid rgb(44, 62, 80);" />
					<button class="btn btn-success round"
						style="background: rgb(44, 62, 80); height: 52px; margin-left: 5px; border: none;"
						type="submit">제품 추가</button>
						
					<button class="btn btn-success round"
						style="background: rgb(44, 62, 80); height: 52px; margin-left: 5px; border: none;"
						href="./index.do">취소</button>
		</form>
		</div>
	</div>
</header>

<jsp:include page="footer.jsp"></jsp:include>
</body>

</html>
