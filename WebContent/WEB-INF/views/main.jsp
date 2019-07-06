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
<body>
<!-- Header style="background:#d9d5d8;"-->
<header class="text-white text-center" style="margin-top:-10%; margin-bottom:15%;">
   <div class="" style="margin-top:40%;">
      <video id="video" preload="auto" autoplay="true" loop="loop" muted="muted" volume="0" style="margin-top:10%;">
            <source src="video/foodmedia.mp4">
      </video>
      <div>
      <h1 class="text-center text-uppercase text-white ">What We Provide</h1>
      <h2 class="font-weight-light mb-0 text-white">건강한 삶을 위한 먹거리 프로젝트</h2>
      </div>
   </div>
</header>
<div id="demo" class="carousel slide carousel-fade" data-ride="carousel" style="margin-top:10%;">
   <!-- Indicators -->
   <ul class="carousel-indicators">
      <li data-target="#demo" data-slide-to="0" class="active"></li>
      <li data-target="#demo" data-slide-to="1"></li>
      <li data-target="#demo" data-slide-to="2"></li>
   </ul>
     
<!-- The slideshow -->
<div class="carousel-inner">
   <div class="carousel-item active">
      <a href="./main.do">
         <li style="background-image:url('img/slide-bg-1.jpg');" >
            <div class="carousel-caption d-none d-md-block" style="margin-bottom:350px;">
               
                  <!-- <img src="img/농심.png" width="500px"> -->
               
            </div>
         </li>
      </a>
   </div>
   <div class="carousel-item">
      <a href="./foodlist.do">
         <li style="background-image:url('img/slide-bg-2.jpg');">
            <div class="carousel-caption d-none d-md-block" style="margin-bottom:350px;">
            
            </div>
         </li>
      </a>
   </div>
   <div class="carousel-item">
   <a href="./foodqna.do">
      <li style="background-image:url('img/slide-bg-3.jpg');">
         <div class="carousel-caption d-none d-md-block" style="margin-bottom:350px;">
            <!-- <h1>로그인 및 회원가입을 진행해주세요.</h1>
            <h5>우측상단의 메뉴바를 확인해주시기 바랍니다.</h5> -->
         </div>
      </li>
      </a>
   </div>
</div>
     
     <!-- Left and right controls -->
     <a class="carousel-control-prev mb" href="#demo" data-slide="prev">
       <span class="carousel-control-prev-icon"></span>
     </a>
     <a class="carousel-control-next" href="#demo" data-slide="next">
       <span class="carousel-control-next-icon"></span>
     </a>
   </div>
</div>

<!-- Portfolio Grid Section -->
<div class="portfolio bg-light pt-5" id="portfolio"> <!-- background-image: url('img/bg.png'); -->
   <table class="m-auto">
      <tr>
         <td>
            <br class="">
         </td>
      </tr>
      <tr>
         <td class="text-center">
         <img class="pb-5" src="img/products.png">
         <!-- <h2 class="text-center text-uppercase text-white mb-0" style="text-shadow: -3px 0 #000000, 0 2px #000000, 2px 0 #000000, 0 -3px #000000;">Products</h2>
          -->
          </td>
      </tr>
      <tr>
         <td>
            <br>
         </td>
      </tr>
      <tr>
         <td>
            <div class="container">
               <form class="text-center text-white" id="btnSearch" action="./foodsearch.do">
                  <input type="hidden" name='action' value='search'/>
                  <input type="hidden" name='currentPage' value='main'/>
                  <div class="input-group" style="float: right; height: 52px; margin-bottom: 100px;" id="autocom">
                     <select class="form-control input-lg" name="searchOption" style="height: 50px; float: left;">
                        <option value="name">상품명</option>
                        <option value="maker">제조사</option>
                        <option value="material">원재료</option>
                        <option value="allergy">알레르기 성분</option>
                     </select> 
                     <input class="form-control text-center" id="autocomplete" type="text" placeholder="입력하세요" name="searchName" style="width: 450px; height: 50px; letter-spacing: 1px"/>
                     <button class="btn btn-success text-center" id="searchSubmit" style="height: 52px; margin-left: 5px;" type="submit">
                        찾기<i class="fas fa-search"></i>
                     </button>
                  </div>
               </form>
            </div>
         </td>
      </tr>
      <tr>
         <td>
            <hr>
         </td>
      </tr>
      <tr>
         <td>
            <div class="container">
               <div class="row rounded-lg">
                  <c:forEach items="${foods}" var="food" varStatus="vs">
                     <div style="margin: auto;">
                        <a class="gallery-cell portfolio-item" href="#portfolio-modal-${vs.count}">
                           <span class="cover">
                              <span></span>
                              <span></span>
                              <span></span>
                              <span></span>
                           </span>
                           <div class="d-flex position-absolute h-100 w-100" > 
                              
                              <div class="portfolio-item-caption d-flex position-absolute h-100 w-100 my-auto w-100 text-center text-white">
                              </div>
                           </div> 
                           <img class="img-fluid " src='${food.img}' width="250px;">
                           <span class="info-wrap">
                           <span class="item-info text-center" style="font-family: 'Nanum Gothic Coding', monospace;">${food.name}</span>
                           <span class="item-subject text-center" style="font-font-family: 'Nanum Gothic Coding', monospace;">${food.maker}</span>
                           </span>
                        </a>
                     </div>
                  </c:forEach>
               </div>
            </div>
         </td>
      </tr>
   </table>
</div>

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



<!-- Scroll to Top Button (Only visible on small and extra-small screen sizes) -->
<div class="scroll-to-top d-lg-none position-fixed ">
   <a class="js-scroll-trigger d-block text-center text-white rounded"
      href="#page-top"> <i class="fa fa-chevron-up"></i>
   </a>
</div>

<!-- Portfolio Modals -->
<c:forEach items="${foods}" var="food" varStatus="vs">
   <!-- Portfolio Modal 1 -->
   <div class="portfolio-modal mfp-hide m-auto" style="width:700px;"id="portfolio-modal-${vs.count}">
      <div class="portfolio-modal-dialog bg-white m-auto" style="width:800px;">
         <a class="close-button d-none d-md-block portfolio-modal-dismiss" href="#"> <i class="fa fa-3x fa-times"></i>
         </a>
         <div class="container text-center">
            <table class="container">
               <tr>
                  <td>
                     <c:set var="status" value="1" />
                     <c:forEach var='allergy' items='${userarg}' varStatus='vs'>
                        <c:if test="${fn:contains(food.material,allergy)}">
                           <c:if test="${status eq 1}">
                              <h2 class="text-danger text-uppercase mb-0">${food.name} (allergy!)</a>
                              <c:set var="status" value="0" />
                           </c:if>
                        </c:if>
                     </c:forEach>
                     <c:if test="${status eq 1}">
                        <h2 class="text-secondary text-uppercase mb-0">${food.name}</a>
                     </c:if>
                  </td>
               </tr>
               <tr>
                  <td><hr style="border: 2px solid rgb(44, 62, 80);"></td>
               </tr>
               <tr>
                  <td><img class="img-fluid" width=250px; src="${food.img}" alt=""></td>
                  <td>
                     <h4>
                        
                     </h4>
                  </td>
               </tr>
            </table>   
            <table class="container table-striped">
               <tr>
                  <th>제품명</th>
                  <td>${food.name}</td>
               </tr>
               <tr>
                  <th>제조사</th>
                  <td>${food.maker}</td>
               </tr>
               <tr>
                  <th>원재료</th>
                  <td>${food.material}</td>
               </tr>
               <tr>
                  <th>알레르기 성분</th>
                  <td><c:forEach var='allergy' items='${allergies}' varStatus='vs'>
                     <c:if test="${fn:contains(food.material, allergy.argingredient)}">
                        ${allergy.argingredient}
                     </c:if>
                     </c:forEach>
                  </td>
               </tr>
            </table>
            <a class="btn btn-primary btn-lg rounded-pill portfolio-modal-dismiss" style="margin-top: 50px;" href="#">
               <i class="fa fa-close"></i>창 닫기</a>
         </div>
      </div>
   </div>
</c:forEach>
<br><br>

<jsp:include page="footer.jsp"></jsp:include>
</body>

</html>