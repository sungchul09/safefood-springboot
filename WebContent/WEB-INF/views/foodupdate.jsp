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

<title>food update</title>

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
			<form class="login100-form validate-form"  action="Foodupdate.do?code=${food.code}"
				method="post">
				<h5 style="font-size: 50px; color: rgb(44, 62, 80);">제품 수정</h5>
				
				<hr style="border: 2px solid rgb(44, 62, 80);" />
					<div class="wrap-input100 validate-input m-b-20"
						data-validate="Enter product name" style="margin-bottom: 20px;">제품명
						<input class="form-control" style=
							width:500px; margin:auto" type="text" name="name"
							value=${food.name}> <span class="focus-input100"></span>
					</div>
					<div class="wrap-input100 validate-input m-b-20"
						data-validate="Enter supportpereat" style="margin-bottom: 20px;">일회 제공량
						<input class="form-control" style=
							width:500px; margin:auto" type="text" name="supportpereat"
							value=${food.supportpereat}> <span class="focus-input100"></span>
					</div>
					<div class="wrap-input100 validate-input m-b-25"
						data-validate="Enter calory" style="margin-bottom: 20px;">칼로리
						<input class="form-control" style=
							width:500px; margin:auto type="text" name="calory"
							value=${food.calory}> <span class="focus-input100"></span>
					</div>
					<div class="wrap-input100 validate-input m-b-25"
						data-validate="Enter carbo" style="margin-bottom: 20px;">탄수화물
						<input class="form-control" style=
							width:500px; margin:auto type="text" name="carbo"
							value=${food.carbo}> <span class="focus-input100"></span>
					</div>
					<div class="wrap-input100 validate-input m-b-25"
						data-validate="Enter protein" style="margin-bottom: 20px;">단백질
						<input class="form-control" style=
							width:500px; margin:auto type="text" name="protein"
							value=${food.protein}> <span class="focus-input100"></span>
					</div>
					<div class="wrap-input100 validate-input m-b-25"
						data-validate="Enter fat" style="margin-bottom: 20px;">지방
						<input class="form-control" style=
							width:500px; margin:auto type="text" name="fat"
							value=${food.fat}> <span class="focus-input100"></span>
					</div>
					<div class="wrap-input100 validate-input m-b-25"
						data-validate="Enter sugar" style="margin-bottom: 20px;">당류
						<input class="form-control" style=
							width:500px; margin:auto type="text" name="sugar"
							value=${food.sugar}> <span class="focus-input100"></span>
					</div>
					<div class="wrap-input100 validate-input m-b-25"
						data-validate="Enter natrium" style="margin-bottom: 20px;">나트륨
						<input class="form-control" style=
							width:500px; margin:auto type="text" name="natrium"
							value=${food.natrium}> <span class="focus-input100"></span>
					</div>
					<div class="wrap-input100 validate-input m-b-25"
						data-validate="Enter chole" style="margin-bottom: 20px;">콜레스테롤
						<input class="form-control" style=
							width:500px; margin:auto type="text" name="chole"
							value=${food.chole}> <span class="focus-input100"></span>
					</div>
					<div class="wrap-input100 validate-input m-b-25"
						data-validate="Enter fattyacid" style="margin-bottom: 20px;">포화지방산
						<input class="form-control" style=
							width:500px; margin:auto type="text" name="fattyacid"
							value=${food.fattyacid}> <span class="focus-input100"></span>
					</div>
					<div class="wrap-input100 validate-input m-b-25"
						data-validate="Enter transfat" style="margin-bottom: 20px;">트렌스지방
						<input class="form-control" style=
							width:500px; margin:auto type="text" name="transfat"
							value=${food.transfat}> <span class="focus-input100"></span>
					</div>
					<div class="wrap-input100 validate-input m-b-25"
						data-validate="Enter maker" style="margin-bottom: 20px;">제조사
						<input class="form-control" style=
							width:500px; margin:auto type="text" name="maker"
							value=${food.maker}> <span class="focus-input100"></span>
					</div>
					<div class="wrap-input100 validate-input m-b-25"
						data-validate="Enter material" style="margin-bottom: 20px;">원재료
						<textarea class="form-control" style=
							width:500px; margin:auto type="text" name="material"
							>${food.material}</textarea> <span class="focus-input100"></span>
					</div>
					<div class="wrap-input100 validate-input m-b-25"
						data-validate="Enter img" style="margin-bottom: 20px;">이미지 경로
						<input class="form-control" style=
							width:500px; margin:auto type="text" name="img"
							value=${food.img}> <span class="focus-input100"></span>
					</div>
					
					<hr style="border: 2px solid rgb(44, 62, 80);" />
					<button class="btn btn-success round"
						style="background: rgb(44, 62, 80); height: 52px; margin-left: 5px; border: none;"
						type="submit">수정</button>
						
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
