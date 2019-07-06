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

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" >
<meta name="description" content="">
<meta name="author" content="">

<title>건강한 삶을 위한 먹거리 프로젝트</title>

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
<style>
tr{
	height:10%;
}
th{
	width:30%;
}
 #map {
        height: 100%;
      } 
</style>

<!-- Custom fonts for this template -->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">

<!-- Plugin CSS -->
<link href="vendor/magnific-popup/magnific-popup.css" rel="stylesheet" type="text/css">

<!-- Custom styles for this template -->
<link href="css/freelancer.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script type="text/javascript">
	$(function() {
		$('#searchSubmit').click(function() {
			$('#btnSearch').submit();
		});

	});
</script>


<style>



</style>
</head>
<jsp:include page="header.jsp"></jsp:include>
<body class="bg-light">
<header class="masthead">
	<div class="container text-dark">
		<h2 clas="page-title"> 본사 </h2>
		<h5 class="page-sub-title point-color-01">
		글로벌 안전먹거리의 허브
		<br>
		바로 여기입니다
		</h5>
	</div>
</header>
<section style="margin-top:-5%; margin-bottom:-5%;">
	<div class="container">
	    <div id="map-canvas" style="height: 400px"></div> 
	 	<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js? sensor=true"></script>
 	</div>
</section>
<section>
	<div class="container">
		<hr class="page-sub-title">
		<div class="map-detail">
			<table>
				<tr>
					<td><img src="img/ssafy.jpg"></td>
					<td class="text-left map-table-size1"><table>
						<tr>
							<td class="text-left map-table-size2"><h4>오시는 길</h4></td>
							<td><strong class="point-color-01">지하철</strong>
								<p>대전역 → 현충원역 하차(3번 출구)</p>
								<strong class="point-color-01">버스</strong>
								<p>버스 11번,102번,103번,104번,113번 승차</p>
								<p>지하철 30분소요, 버스 5분소요</p></td>
							</tr>
						</table>
					</td>
				</tr>
					
			</table>
		</div>
	</div>
</section>


<!--javascript 소스코드-->
<script type="text/javascript">
function initialize() {
        var myLatlng;
        var map;
        var marker;


        <!-- 구글맵에서 좌표값을 얻고 입력해주세요.  -->
        
        myLatlng = new google.maps.LatLng(36.355289, 127.298280);  

       
var mapOptions = {
                    zoom: 15, <!--지도 확대, 축소 정도 설정 -->
                    center: myLatlng,
                    mapTypeId: google.maps.MapTypeId.ROADMAP,
                    scrollwheel: true, <!-- 마우스 스크롤 false -->
                    draggable: true<!-- 마우스 드레그(클릭) false -->
        };

        map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
        
        <!-- 위치정보이름 및 위치정보주소 입력하세요. -->
        var contentString ='<p style="line-height: 20px;">삼성화재유성연수원</p><p>대전광역시 유성구 덕명동 124</p>'; 

        var infowindow = new google.maps.InfoWindow({
                content: contentString
        });

        marker = new google.maps.Marker({
                position: myLatlng,
                map: map,
                title: 'Marker'
        });

        infowindow.open(map, marker);

        google.maps.event.addListener(marker, 'click', function () {
                infowindow.open(map, marker);
        });
}

google.maps.event.addDomListener(window, 'load', initialize);
</script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD9ZMSQ7WGVso549_lkuxhIwj05rxRkx1M&callback=initMap" async defer></script>
</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>






