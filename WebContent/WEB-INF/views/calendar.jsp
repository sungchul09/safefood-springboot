<%@page import="com.ssafy.edu.dto.CalendarDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
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

<title>food list</title>

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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	
</script>
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<script src="https://unpkg.com/vue"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.18.0/axios.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue"></script>
<script type="text/javascript">
	var newJquery = $.noConflict(true);
	newJquery(function() {

		newJquery("#autocomplete")
				.autocomplete(
						{
							source : function(request, response) {
								$
										.ajax({
											type : 'get',
											url : "http://192.168.208.82:8198/ssafy/api/getFoodDetail/"
													+ request.term,
											dataType : "json",
											success : function(data) {
												response($.map(data, function(
														item) {
													return {
														label : item.name,
														value : item.data
													}

												}));
											}
										});

							},

							focus : function(event, ui) {

								return false;

								//event.preventDefault();

							}

						});
		newJquery('#searchSubmit').click(function() {
			$('#btnSearch').submit();
		});

	});
</script>
</head>
<jsp:include page="header.jsp"></jsp:include>
<body>
	<!-- Header -->
	<header class="masthead text-white text-center"
		style="background-image: url('img/foodlist.jpeg');">
		<h1 class=" mb-0 text-center text-uppercase text-white">내 섭취 정보</h1>
		<br>
		<br>
		<h2 class="font-weight-light mb-0 text-white"> 내 섭취
			정보를 확인하실 수 있습니다.</h2>
		

	</header>
	
	<div class="container" style="margin-top:5%; margin-bottom:5%;">
		<c:if test="${not empty member}"><h1 class="text-center">${member.username}님이 ${year}년 ${month}월 ${day}일에 섭취한 영양성분</h1></c:if>
		<table class="table table-striped text-center">
		<c:choose>
		<c:when test="${not empty daycals}">
			<tr>
				<td style="color:${calorycol}">칼로리</td>
				<td style="color:${calorycol}">${calory}</td>
			</tr>
			<tr>
				<td style="color:${carbocol}">탄수화물</td>
				<td style="color:${carbocol}">${carbo}</td>
			</tr>
			<tr>
				<td style="color:${proteincol}">단백질</td>
				<td style="color:${proteincol}">${protein}</td>
			</tr>
			<tr>
				<td style="color:${fatcol}">지방</td>
				<td style="color:${fatcol}">${fat}</td>
			</tr>
			<tr>
				<td style="color:${sugarcol}">당류</td>
				<td style="color:${sugarcol}">${sugar}</td>
			</tr>
			<tr>
				<td style="color:${natriumcol}">나트륨</td>
				<td style="color:${natriumcol}">${natrium}</td>
			</tr>
			<tr>
				<td style="color:${cholecol}">콜레스테롤</td>
				<td style="color:${cholecol}">${chole}</td>
			</tr>
			<tr>
				<td style="color:${fattyacidcol}">포화지방산</td>
				<td style="color:${fattyacidcol}">${fattyacid}</td>
			</tr>
			<tr>
				<td style="color:${transfatcol}">트랜스지방</td>
				<td style="color:${transfatcol}">${transfat}</td>
			</tr>
		</c:when>
		<c:otherwise>
			<c:if test="${not empty member}">
			<tr>
				<td class="text-center"><h4>현재 날짜의 자료가 존재하지 않습니다.</h4></td>
			</tr>
			</c:if>
		</c:otherwise>
		</c:choose>
		</table>
	</div>
	<div class="container" style="margin-top:5%; margin-bottom:5%;">
		<div class="wrap-login100 p-l-55 p-r-55 p-t-80 p-b-30">
			<table class="table table-striped border border-light">
				<c:if test="${not empty member}">
				<tr>
					<h4 class="text-center">현재 날짜의 자료가 존재하지 않습니다.</h4>
				</tr>
				</c:if>
				<c:if test="${empty member}">
				<tr>
					<h4 class="text-center">로그인해주시기 바랍니다.</h4>
				</tr>	
				</c:if>
				<tr class="c1 text-center">
					<td colspan="7"><a href='./calendar.do?left=ok&y=${year}&m=${month}&d=${day}'>(이전)</a> ${year}년 ${month}월<a href='./calendar.do?right=ok&y=${year}&m=${month}&d=${day}'>(다음)</a></td>
				</tr>
				<tr>
					<th class="sun">일</th>
					<th>월</th>
					<th>화</th>
					<th>수</th>
					<th>목</th>
					<th>금</th>
					<th class="sat">토</th>
				</tr>
				<tr>
					<c:forEach var="dayofweek" begin="1" end="${dayofweek-1}" step="1">
						<td>&nbsp;</td>
					</c:forEach>
					<c:forEach var="day" begin="1" end="${lastday}" step="1">
						<c:set var="val" value="${day + dayofweek - 1}"></c:set>
						<c:choose>
							<c:when test="${val%7 == 0}">
								<td class="sat">
								<a href='./calendar.do?y=${year}&m=${month}&d=${day}'>${day} </a>
								<a href='./calwritebf.do?y=${year}&m=${month}&d=${day}'><c:if test="${not empty member}"><img src='./img/pencil.png'/></c:if></a>
								</td>
							</c:when>
							<c:when test="${val%7 == 1}">
								<td class='sun'>
								<a href='./calendar.do?y=${year}&m=${month}&d=${day}'>${day} </a>
								<a href='./calwritebf.do?y=${year}&m=${month}&d=${day}'><c:if test="${not empty member}"><img src='./img/pencil.png'/></c:if></a>
								</td>
							</c:when>
							<c:otherwise>
								<td>
								<a href='./calendar.do?y=${year}&m=${month}&d=${day}'>${day} </a>
								<a href='./calwritebf.do?y=${year}&m=${month}&d=${day}'><c:if test="${not empty member}"><img src='./img/pencil.png'/></c:if></a>
								</td>
							</c:otherwise>
						</c:choose>
						<c:if test="${val % 7 == 0}">
						</tr><tr>
						</c:if>
					</c:forEach>
					<td></td>
					</tr>
			</table>
		</div>
	</div>
	<c:if test="${not empty member}">	
	<div class="container" style="margin-top:5%; margin-bottom:5%;">
		<h1 class="text-center">${year}년 ${month}월 ${day}일 등록한 상품</h1>
		<table class="table table-stripe">
			<tr class="text-center">
				<td width=10%>번호</td>
				<td>상품명</td>
				<td>제목</td>
				<td width=40%>내용</td>
				<td>날짜</td>
				<td>삭제</td>
			</tr>
			<c:if test="${empty daycals}">
			<tr >
				<td colspan="7" class="text-center"><h4>현재 날짜의 자료가 존재하지 않습니다.</h4></td>
			</tr>
			</c:if>
			<c:if test="${not empty daycals}">
				<c:forEach var="cal" items="${daycals}" varStatus="vs">
					<tr class="text-center">
						<td>${vs.count}</td>
						<td><a href="./calupdatebf.do?code=${cal.code}&quantity=${cal.quantity}&title=${cal.title}&content=${cal.content}&wdate=${cal.wdate}">${foods[vs.index].name}</td>
						<td>${cal.title}</td>
						<td>${cal.content}</td>
						<td>${cal.wdate}</td>
						<td> 
							<a href='./deletecal.do?isbn=${cal.isbn}' style="margin-top: 15%;">
							<img alt="삭제" src="<%=request.getContextPath()%>/img/trash.png" style="border-radius: 20px solid black; width: 25px;">
							</a>
                        </td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
	</div>
	</c:if>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
</body>
</html>