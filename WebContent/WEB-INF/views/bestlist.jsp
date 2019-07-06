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
<header class="masthead bg-primary text-black text-center" style="padding-bottom:0;">
   <h2 class="page_title" id="titleH3">베스트 섭취 정보</h2>
   <br>
   <p>회원님의 베스트 섭취 정보를 알려드립니다.</p>

</header>

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



<section class="container">
   <header class="box-header is-water-mark">
      <b>섭취랭킹</b> <small class="d-block d-sm-inline-block"><%=new Date()%>기준</small>
   </header>
   <div class="box-content">
      <table class="table table-default">
         <colgroup>
            <col width="10%">
            <col width="50%">
            <col class="d-none d-sm-table-column">
            <col class="d-none d-sm-table-column">
         </colgroup>
         <thead>
            <tr>
               <th scope="col"></th>
               <th scope="col">제품명</th>
               <th scope="col" class="d-none d-sm-table-cell text-center">섭취횟수</th>
               <th scope="col" class="d-none d-sm-table-cell">제조회사</th>
            </tr>
         </thead>
         <tbody>
         <c:if test="${empty foods}">
            <tr>
               <td colspan="4">작성된 글이 없습니다.</td>
            </tr>
         </c:if>
         <c:forEach items="${sortfood}" var="food" varStatus="vs" begin="0"
            end="9">
         
            <tr>
               <th scope="row" class="text-center align-middle">${vs.index+1}</th>
               <td class="align-middle">
                  <div class="d-inline-block mr-2 align-middle">
                     <a href='./foodview.do?code=${food.code}&name=${food.name}'> <img
                        src='${food.img}'
                        alt="진용" style="max-width: 75px" class="character-image">
                     </a>
                  </div>
                  <div class="d-inline-block align-middle">
                     <img
                        src="https://avatar.maplestory.nexon.com/GuildMark/GMJNOCPEKA.png"
                        alt="레드"> <span><a
                        href="./foodview.do?code=${food.code}&name=${food.name}"
                        class="text-grape-fruit">${food.name}</a></span>
                     <div class="font-size-0">
                        <span class="font-size-14">칼로리</span>
                        <div class="vertical-line"></div>
                        <span class="d-inline-block d-md-none font-size-14">스커</span> <span
                           class="d-none d-md-inline-block font-size-14">${food.calory}</span>
                     </div>
                     <div class="d-sm-none">
                        <b>길드</b> 키티<br> <b>기록</b> <span>62층(14분 37초)</span>
                     </div>
                  </div>
               </td>
               <td class="align-middle d-none d-sm-table-cell text-center">${quantity[vs.index].quantity }
               </td>
               <td class="align-middle d-none d-sm-table-cell"><img
                     src="https://static.maple.gg/images/maplestory/world/ico_world_aurora.gif"
                     alt="키티"> ${food.maker}
               </td>
            </tr>
            </c:forEach>
            
            
            
            
            
            
            
            
            
         </tbody>
      </table>

      
   </div>
</section>
<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>