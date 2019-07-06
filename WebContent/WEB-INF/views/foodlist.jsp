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


<!-- Header -->
<header class="masthead text-white text-center" style="background-image:url('img/foodlist.jpeg');" >
      <h1 class=" mb-0 text-center text-uppercase text-white">상품정보</h1>
      <h2 class="font-weight-light mb-0 text-white">상품 제목을 클릭하시면 상품에 대한 정보를 확인하실 수 있습니다.</h2>
      <div class="container" style="margin-top: 50px; margin-bottom: 50px;">
      <form class="text-center text-white" id="btnSearch" action="./foodsearch.do">
         <input type="hidden" name='action' value='search'>
         <input type="hidden" name='currentPage' value='foodlist'>
         <div class="input-group" id="autocom" style="float: right; height: 52px; margin-bottom: 100px;">
            <select class="form-control input-lg" name="searchOption" style="height: 50px; float: left;">
               <option value="name">상품명</option>
               <option value="maker">제조사</option>
               <option value="material">원재료</option>
               <option value="allergy">알레르기 성분</option>
            </select> 
            <input class="form-control text-center" id="autocomplete" type="text" placeholder="입력하세요" name="searchName" style="width: 450px; height: 50px; letter-spacing: 1px">
            <button class="btn btn-success text-center" id="searchSubmit" style="height: 52px; margin-left: 5px;" type="submit">
               찾기<i class="fas fa-search"></i>
            </button>
         </div>
      </form>
      </div>
   
</header>

<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<script src="https://unpkg.com/vue"></script>   
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.18.0/axios.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue"></script>
<script type="text/javascript">


var newJquery = $.noConflict(true);
   newJquery(function() {
        
         newJquery("#autocomplete").autocomplete({
            source: function(request, response){
               $.ajax({
                  type: 'get',
                  url: "http://192.168.208.82:8198/ssafy/api/getFoodDetail/"+request.term,
                  dataType: "json",
                  success: function(data){
                     response(
                        $.map(data, function(item){
                           return {
                              label : item.name,
                              value: item.data
                           }
                        
                        })
                     );
                  }
               });
            
            }, 
       

        focus: function(event, ui) {

            return false;

            //event.preventDefault();

        }

         });
      newJquery('#searchSubmit').click(function() {
         $('#btnSearch').submit();
      });
      
   });
   
</script>




<section class="portfolio text-white text-center" id="portfolio">
	<div class="container">
		<div class="wrap-login100 p-l-55 p-r-55 p-t-80 p-b-30">
         <form class="login100-form validate-form">
            <table class='table' style="border-radius: 30px; margin: auto; background: white">
                  <tr>
                     <th class="header-font">순번</th>
                     <th class="header-font">제조사</th>
                     <th class="header-font">제품명</th>
                     <th class="header-font">이미지</th>
                     <c:if test="${not empty member}">
                        <th class="header-font">장바구니</th>
                     </c:if>
                     <c:if test="${member.email eq 'root@root.com'}">
                        <th class="header-font">삭제</th>
                     </c:if>
                  </tr>
               </thead>
               <c:if test="${empty foods}">
                  <tr>
                     <td colspan="5">작성된 글이 없습니다.</td>
                  </tr>
               </c:if>
               <c:forEach items="${foods}" var="food" varStatus="vs">
                  <tr>
                     <td class='td1' style="vertical-align: middle;">${vs.count}</td>
                     <td class='td1' style="vertical-align: middle;">${food.maker}</td>
                     <td style="vertical-align: middle;"><c:set var="status" value="1" /> 
	                     <c:forEach var='allergy' items='${userarg}' varStatus='vs'>
	                           <c:if test="${fn:contains(food.material,allergy)}">
	                              <c:if test="${status eq 1}">
	                                 <a class="header-font" href='./foodview.do?code=${food.code}&name=${food.name}' style="color: red;">${food.name}(allergy!) <c:set var="status" value="0" />
	                              </c:if>
	                           </c:if>
                        </c:forEach> 
                        <c:if test="${status eq 1}">
                           <a class="header-font" href='./foodview.do?code=${food.code}&name=${food.name}'>${food.name}</a>
                        </c:if></td>
                        <td style="vertical-align: middle;"><img src='${food.img}' style="height: 100px; width: 120px;"></td>
                     <c:if test="${not empty member}">
                        <td style="vertical-align: middle;">
                           <c:if test="${not empty member.email}">
                              <a href='./basketadd.do?code=${food.code}' style="margin-top: 15%;"> 
                              <img alt="장바구니" src="<%=request.getContextPath()%>/img/basket.png" style="border-radius: 20px solid black; width: 30px;">
                              </a>
                           </c:if>
                        </td>
                        <c:if test="${member.email eq 'root@root.com'}">
                        <td style="vertical-align: middle;">
                           <a href='./deleteFood.do?code=${food.code}' style="margin-top: 15%;"> 
                           <img alt="삭제" src="<%=request.getContextPath()%>/img/trash.png" style="border-radius: 20px solid black; width: 25px;">
                           </a>
                        </td>
                        </c:if>
                     </c:if>
                  </tr>
               </c:forEach>
            </table>
            <div  align="right">
				<c:if test="${member.email =='root@root.com'}">
					<button class="btn btn-success round"
					type="button"
						style="background: rgb(44, 62, 80); height: 52px; margin-left: 5px; border: none;"
						onclick = "location.href = './addFood.do'">식품 추가</button>
						
					</c:if>
					</div>
         </form>
      </div>
   </div>
</section>
<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>