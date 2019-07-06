<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<fmt:requestEncoding value="utf-8" />
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>상세보기</title>

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
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart1);
      function drawChart1() {

         var data = google.visualization.arrayToDataTable([
          ['Task', '1회 제공량'],
          ['탄수화물',  ${food.carbo}],
          ['단백질',  ${food.protein}],
          ['지방', ${food.fat}],	
          ['당류',${food.sugar}],
          ['나트륨', ${food.natrium}],
          ['콜레스테롤', ${food.chole}],
          ['포화지방산', ${food.fattyacid}],
          ['트렌스지방', ${food.transfat}]
        ]); 

        var options = {
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart1'));

        chart.draw(data, options);
      }
    </script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	$('#_btnupdate2').click(function(){
		var st=" 입력하세요!";
		if($('#_code2').val()==''){
			alert($('#_code2').attr('data-msg')+st);
			$('#_code2').focus();
		}else if($('#_id2').val()==''){
			alert($('#_id2').attr('data-msg')+st);
			$('#_id2').focus();
		}else if($('#_title2').val()==''){
			alert($('#_title2').attr('data-msg')+st);
			$('#_title2').focus();
		}else if($('#_wdate2').val()==''){
			alert($('#_wdate2').attr('data-msg')+st);
			$('#_wdate2').focus();
		}else if($('#_content2').val()==''){
			alert($('#_content2').attr('data-msg')+st);
			$('#_content2').focus();
		}else{
			alert("글수정!");
			$('#_fo2').submit();
		}
	});
	
	$('#_btncancel2').click(function(){
		$('#_code2').val("");
		$('#_id2').val("");
		$('#_title2').val("");
		$('#_wdate2').val("");
		$('#_content2').val("");
		$('#_code2').focus();
	});

});
function deleteBoard(seeq){
	alert('delete');
	location.href='<%=request.getContextPath()%>/main.do?action=delete&code='+seeq;
	}
</script>
</head>

<jsp:include page="header.jsp"></jsp:include>
<body>
	<div class="container-fluid" style="margin-top: 15%; margin-left: 20%;">
		<div class="row" style="margin-left: -15%;">
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<h2 style="padding-left: 10%;" class="sub-header">
					<c:set var="status" value="1" />
					<c:forEach var='allergy' items='${userarg}' varStatus='vs'>
						<c:if test="${fn:contains(food.material,allergy)}">
							<c:if test="${status eq 1}">
								<a style="color: red;">${food.name} (allergy!)</a>
								<c:set var="status" value="0" />
							</c:if>
						</c:if>
					</c:forEach>
					<c:if test="${status eq 1}">
							<a>${food.name}</a>
					</c:if>
				</h2>
				<div class="row placeholders">
					<div style="width: 40%; padding-left: 15%; padding-right: 10%;"
						class="placeholder">
						<img src='${food.img}' width="200" height="200"
							class="img-responsive" alt="Generic placeholder thumbnail">
						<h4>${food.name}
						<c:if test="${not empty member.email}">
							<a href='./basketadd.do?code=${food.code}' style="margin-top: 15%;"> 
								<img alt="장바구니" src="<%=request.getContextPath()%>/img/basket.png" style="border-radius: 20px solid black; width: 30px;">
							</a>
						</c:if>
						</h4>
						<span class="text-muted">
							<h5>
							<c:if test="${member.email =='root@root.com'}">
								<ul class="navbar-nav ml-auto">
									<li class="nav-item mx-0 mx-lg-1">
										<a class="nav-link rounded js-scroll-trigger" href="./updateFood.do?code=${food.code}">식품 정보 수정</a>
									</li>
								</ul>
							</c:if>
							</h5>
						</span>
					</div>
					
					<div style="width: 60%;" class="col-xs-3 col-sm-6  placeholder">

						<table class="table table table-striped">
							<tr style="vertical-align: middle;">
								<th style="width: 40%;">제품명</th>
								<td>${food.name}</td>
							</tr>
							<tr>
								<th style="vertical-align: middle; width: 40%;">제조사</th>
								<td>${food.maker}</td>
							</tr>
							<tr>
								<th style="vertical-align: middle; width: 40%;">원재료</th>
								<td>${food.material}</td>
							</tr>
							<tr>
								<th style="vertical-align: middle; width: 40%;">알레르기 성분</th>
								<td><c:forEach var='allergy' items='${allergies}'
										varStatus='vs'>
										<c:if
											test="${fn:contains(food.material,allergy.argingredient)}">
										${allergy.argingredient}
										</c:if>
									</c:forEach></td>
								</td>
							</tr>
						</table>
					</div>
				</div>
				<hr>
				<h2 style="padding-left: 10%;" class="sub-header">영양정보</h2>
				<div class="row placeholders">
					<div style="width: 50%;">
						<!--  graph start -->
						<div style="margin-right: 25%;" class="placeholder">
							<div class="panel panel-default">
								<div class="panel-heading">
									<!-- chart start -->
									<div class="panel-body">
										<div id="piechart1" style="width: 700px; height: 200px;"></div>
									</div>

								</div>
								<div class="panel-body">
									<div id="chart1"></div>
								</div>
							</div>
						</div>
						<!--  graph end -->

					</div>
					<div style="width: 50%;">
						<!--  table start -->
						<div class="col-xs-3 col-sm-6 placeholder">
							<div class="table-responsive">
								<table class="table table-striped">
									<tr>
										<th style="vertical-align: middle; width: 40%;">일일제공량</th>
										<td>${food.supportpereat}g</td>
									</tr>
									<tr>
										<td style="vertical-align: middle; width: 40%;">칼로리</td>
										<td>${food.calory}kcal</td>
									</tr>
									<tr>
										<td style="vertical-align: middle; width: 40%;">탄수화물</td>
										<td>${food.carbo}</td>
									</tr>
									<tr>
										<td style="vertical-align: middle; width: 40%;">단백질</td>
										<td>${food.protein}</td>
									</tr>
									<tr>
										<td style="vertical-align: middle; width: 40%;">지방</td>
										<td>${food.fat}</td>
									</tr>
									<tr>
										<td style="vertical-align: middle; width: 40%;">당류</td>
										<td>${food.sugar}</td>
									</tr>
									<tr>
										<td style="vertical-align: middle; width: 40%;">나트륨</td>
										<td>${food.natrium}</td>
									</tr>
									<tr>
										<td style="vertical-align: middle; width: 40%;">콜레스테롤</td>
										<td>${food.chole}</td>
									</tr>
									<tr>
										<td style="vertical-align: middle; width: 40%;">포화지방산</td>
										<td>${food.fattyacid}</td>
									</tr>
									<tr>
										<td style="vertical-align: middle; width: 40%;">트랜스지방</td>
										<td>${food.transfat}</td>
									</tr>
								</table>
							</div>
						</div>
						<!--  table end -->
					</div>


				</div>
			</div>
		</div>
	</div>
	<c:if test="${not empty sessionScope.id}">
		<div id='_divbtn'>
			<button id='_btnupdate2'>
				<img alt="글수정" src="<%=request.getContextPath()%>/img/write.png">
			</button>
			<button onclick="deleteBoard('${food.name}')">
				<img alt="삭제" src="<%=request.getContextPath()%>/img/delete.png">
			</button>
		</div>
	</c:if>
	<jsp:include page="footer.jsp"></jsp:include>


</body>
</html>
