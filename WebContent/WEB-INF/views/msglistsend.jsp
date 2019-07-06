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

<title>msg list send</title>

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


<header class="masthead bg-light text-white text-center" >
   <h1 class=" mb-0 text-center text-uppercase" style="color: rgb(44, 62, 80);">보낸 메세지함</h1>
   <h2 class="font-weight-light mb-0" style="color: rgb(44, 62, 80);">보낸 메세지를 확인하세요~! </h2>
   </div>
</header>
<section class="portfolio text-white text-center" id="portfolio">
   <div class="container">
      <div class="wrap-login100 p-l-55 p-r-55 p-t-80 p-b-30">
         <form class="login100-form validate-form">
            <table class='table table-striped'
               style="border-radius: 30px; margin: auto; background: white">
               <thead class="thead-white">
                  <tr>
                     <th>순번</th>
                     <th>받은 사람</th>
                     <th>내용</th>
                     <th>보낸 날짜</th>
<!--                      <th>삭제</th> -->
                  </tr>
               </thead>
               <c:if test="${empty msgs}">
                  <tr>
                     <td colspan="5">받은 메세지가 없습니다.</td>
                  </tr>
               </c:if>
               <c:forEach items="${msgs}" var="msg" varStatus="vs">
                  <tr>
                     <td class='td1' style="vertical-align: middle;">${vs.count}</td>
                     <td class='td1' style="vertical-align: middle;">${msg.receive_email}</td>
                     <td class='td1' style="vertical-align: middle;">${msg.contents}</td>
                     <td class='td1' style="vertical-align: middle;">${msg.send_date}</td>
<!--                         <td style="vertical-align: middle;"> -->
<%--                            <a href='./deleteMsg.do?code=${msg.msg_code}' style="margin-top: 15%;">  --%>
<%--                            <img alt="삭제" src="<%=request.getContextPath()%>/img/trash.png" style="border-radius: 20px solid black; width: 25px;"> --%>
<!--                            </a> -->
<!--                         </td> -->
                  </tr>
               </c:forEach>
            </table>
            <div  align="right">
<div class="container-login100-form-btn" style="margin-bottom:50px; margin-top:10px">
               <button class="btn btn-success round"
               type="button"
                  style="background: rgb(44, 62, 80); height: 52px; margin-left: 5px; border: none;"
                  onclick = "location.href = './msglistreceive.do'">받은 메일함</button>
               <button class="btn btn-success round"
               type="button"
                  style="background: rgb(44, 62, 80); height: 52px; margin-left: 5px; border: none;"
                  onclick = "location.href = './addMsg.do'">메세지 보내기</button>
                  </div>
            </div>      
         </form>
      </div>
   </div>
</section>
<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>	