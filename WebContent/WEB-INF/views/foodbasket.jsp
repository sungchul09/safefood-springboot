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
	
</script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	
</script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<header class="masthead bg-primary text-white text-center" >
		<h1 class=" mb-0 text-center text-uppercase" style="color: rgb(44, 62, 80);">장바구니</h1>
		<br>
		<h2 class="font-weight-light mb-0" style="color: rgb(44, 62, 80);">원하는 물품을 담은 장바구니 입니다. (로그아웃시 초기화)</h2>
	</header>
	<section class="portfolio" id="portfolio">
		<div class="container">
			<table class='table table-striped' style="border-radius: 30px; margin: auto; background: white">
				<thead class="thead-dark">
					<tr>
						<th>순번</th>
						<th>제조사</th>
						<th>제품명</th>
						<th>이미지</th>
						<th>삭제</th>
					</tr>
				</thead>
				<c:choose>
					<c:when test="${empty basket}">
						<tr>
							<td colspan="5" style="text-align:center;">장바구니에 상품이 존재하지 않습니다.</td>
						</tr>
					</c:when>
					<c:when test="${basket eq null}">
						    <tr>
								<td colspan="5" style="text-align:center;">장바구니에 상품이 존재하지 않습니다.</td>
							</tr>
				    </c:when>
				</c:choose>
				<c:if test="${basket ne null}">
					<c:forEach items="${foods}" var="food" varStatus="vs">
						<tr>
							<td class='td1' style="vertical-align: middle;">${vs.count}</td>
							<td class='td1' style="vertical-align: middle;">${food.maker}</td>
							<td style="vertical-align: middle;"><c:set var="status" value="1" /> 
								<c:forEach var='allergy' items='${userarg}' varStatus='vs'>
									<c:if test="${fn:contains(food.material,allergy)}">
										<c:if test="${status eq 1}">
											<a href='./foodview.do?code=${food.code}&name=${food.name}'
														style="font-weight: bold; color: red;">${food.name}
														(allergy!) <c:set var="status" value="0" />
										</c:if>
									</c:if>
								</c:forEach> 
								<c:if test="${status eq 1}">
									<a href='./foodview.do?code=${food.code}&name=${food.name}'
											style="font-weight: bold; color: black;">${food.name}
								</c:if></a>
							</td>
							<td style="vertical-align: middle;"><img
									src="${food.img}"
									style="border: 2px solid grey; height: 100px; width: 120px; border-radius: 10px;">
							</td>
							<td style="vertical-align: middle;">
								<c:if test="${not empty member.email}">
										<a href='./basketdelete.do?code=${food.code}'
											style="margin-top: 15%;"> <img alt="삭제"
											src="<%=request.getContextPath()%>/img/trash.png"
											style="border-radius: 20px solid black; width: 25px;">
										</a>
								</c:if>
							</td>
						</tr>
					</c:forEach>
				</c:if>
			</table>
		</div>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
