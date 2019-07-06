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
$(function(){
   $('#_btnwrite').click(function(){
      alert('befor write');
      location.href='<%=request.getContextPath()%>
   /main.do?action=bfwrite';
                  });
      $('#_btnlog').click(function() {
         var st = " 입력하세요!";
         if ($('#_lid').val() == '') {
            alert($('#_lid').attr('data-msg') + st);
            $('#_lid').focus();
         } else if ($('#_lpwd').val() == '') {
            alert($('#_lpwd').attr('data-msg') + st);
            $('#_lpwd').focus();
         } else {
            alert("로그인!");
            $('#_fo3').submit();
         }
      });
   });

   function deleteBoard(codee) {
      alert('delete');
      alert(codee);
      var tmp = '?';
      location.href = "dsfsdf";
   }
</script>
</head>
<jsp:include page="header.jsp"></jsp:include>
<body>
<!-- Header -->
<header class="masthead text-primary text-center bg-light mb-auto" >
      <h1 class=" mb-0 text-center text-uppercase text-dark">섭취  상품 등록</h1>
      <h2 class="font-weight-light mt-3 text-dark">섭취한 식품에 대해 글을 작성해주세요.</h2>
      <div class="container" style="margin-top: 50px; margin-bottom: 50px;">
      </div>
   
</header>
<section>
	<div class="container">
		<div class="textleft">
			<form method="post" name="cal" id="cal" action="./calwriteaf.do">
				<fieldset>
					<table class="horizontal-list">
						<input type="hidden" name="email" id="email" value="${member.email}">
						<colgroup>
			            	<col width=190px>
			            	<col width=auto>
			            </colgroup>
						<tr>
							<th>이메일<em class="fc06">*</em></th>
							<td>${member.email}</td>
						</tr>
						<tr>
							<th>상품<em class="fc06">*</em></th>
							<td>
								<select name="code" id="code">
									<c:forEach var="food" items="${foods}" varStatus="vs">
										<option value="${food.code}">${food.name}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th>수량<em class="fc06">*</em></th>
							<td><input type="number" name="quantity" id="quantity" min="0" max="999" step="1" value="1" width="200px"></td>
						</tr>
						<tr>
							<th>제목<em class="fc06">*</em></th>
							<td><input type="text" name="title" id="title"></td>
						</tr>
						<tr>
							<th>내용<em class="fc06">*</em></th>
							<td><textarea type="text" name="content" id="content" cols="100%" rows="20"></textarea></td>
						</tr>
						<tr>
		                	<th>날짜<em class="fc06">*</em></th>
		                	<td><input type="date" name="wdate" id="wdate" value="${y}-${m}-${d}"></td>
		                </tr>
						<tr>
							<td colspan="2"><button type="submit" style="float:right;">등록하기</button></td>	
						</tr>
					</table>
				</fieldset>
			</form>
		</div>
	</div>
</section>
</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>