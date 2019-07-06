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

<title>Q&A</title>
<script src="https://unpkg.com/vue"></script>
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.18.0/axios.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue"></script>
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
<header class="masthead bg-white">
   <div id='app'>
      <div class="page_title" id="titleH3" @click='showlist(0)' style="cursor:pointer;">
      <br>
      <div class="container text-dark">
         <h2 clas="page-title"> Q&A </h2>
         <h5 class="page-sub-title point-color-01">
         궁금한사항에대해
         <br>
         질문해주세요
         </h5>
      </div>
      </div>
      <div class="container-login100 mt-5 mb-5" >
             <component v-bind:is = "currentview"></component>
       </div>
</header>
<!--
            <button class="btn btn-success round" style="background: rgb(52,54,68); font-weight:bold; height: 52px; margin-left: 5px; border: none;" @click='showlist(0)'>글 목록</button>
                     <button class="btn btn-success round" style="background: rgb(52,54,68); font-weight:bold; height: 52px; margin-left: 5px; border: none;" @click='showlist(2)'>사원추가</button>
 -->

<script type="text/x-template" id="listtemplate">
<div class="container">
   <c:if test="${ not empty member}">
      <button class="btn btn-success round"
         style="background: #3c90e2; font-weight: bold; height: 40px; margin-left: 5px; border: none; float: right;"
         @click='showlist(4)'>작성글 보기</button>
   </c:if>
   <div class="wrap-login100 p-l-55 p-r-55 p-t-80 p-b-30">
      <span class="page-count">{{ pageNum + 1 }} / {{ pageCount }}
         페이지</span>
      <table class='table table-striped' style="margin-top:5%; margin-bottom:5%;">
         <thead class="thead-white">
            <tr>
               <th class="text-center" width="10%;">번호</th>
               <th class="text-center" width="20%;">작성자</th>
               <th class="text-center" width="40%;">제목</th>
               <th class="text-center" width="10%;">조회수</th>
               <th class="text-center" width="20%;">작성일</th>
            </tr>
         </thead>
         <tr v-for="(user,index) in paginatedData"
            class="nicecolor enter-detail">
            <td class='td1 text-center' @click="show_detail(user.isbn)"
               style="vertical-align: middle; cursor: pointer;">{{user.isbn}}</td>
            <td v-html="user.writer" @click="show_detail(user.isbn)" class='td1 text-center'
               style="vertical-align: middle; cursor: pointer;"></td>
            <td v-html="user.title" @click="show_detail(user.isbn)" class='td1 text-center'
               style="vertical-align: middle; cursor: pointer;"></td>
            <td v-html="user.views" class='td1 text-center' style="vertical-align: middle;"></td>
            <td v-html="user.write_date" class='td1 text-center'
               style="vertical-align: middle;"></td>
         </tr>
      </table>
      <div class="btn-cover text-center">
         <button class="btn btn-success round"
            style="background: #3c90e2; font-weight: bold; border: none;"
            :disabled="pageNum === 0" @click="prevPage">이전</button>
         <button class="btn btn-success round"
            style="background: #3c90e2; font-weight: bold; border: none;"
            :disabled="pageNum >= pageCount - 1" @click="nextPage">다음
         </button>
      </div>
      <c:if test="${ not empty member}">
         <button class="btn btn-success round"
            style="background: #3c90e2; font-weight: bold; height: 40px; margin-left: 5px; border: none; float: right;"
            @click='showlist(2)'>글작성</button>
      </c:if>
   </div>
<div>
</script>




<script type="text/x-template" id="mylisttemplate">
<div class="container">
   <div class="wrap-login100 p-l-55 p-r-55 p-t-80 p-b-30">
      <span class="page-count">{{ pageNum + 1 }} / {{ pageCount }} 페이지</span>
      <button class="btn btn-success round"
         style="background: #3c90e2; font-weight: bold; height: 40px; margin-left: 5px; border: none; float: right;"
         @click='showlist(0)'>전체글 보기</button>
      <table class='table table-striped' style="margin-top:5%; margin-bottom:5%;">
         <thead class="thead-white">
            <tr>
               <th class="text-center" width="10%;">번호</th>
               <th class="text-center" width="20%;">작성자</th>
               <th class="text-center" width="40%;">제목</th>
               <th class="text-center" width="10%;">조회수</th>
               <th class="text-center" width="20%;">작성일</th>
            </tr>
         </thead>
         <tr v-for="(user,index) in paginatedData" class="nicecolor enter-detail">
            <td class='td1 text-center' @click="show_detail(user.isbn)"
               style="vertical-align: middle; cursor: pointer;">{{user.isbn}}</td>
            <td v-html="user.writer" @click="show_detail(user.isbn)" class='td1 text-center'
               style="vertical-align: middle; cursor: pointer; cursor: pointer;"></td>
            <td v-html="user.title" @click="show_detail(user.isbn)" class='td1 text-center'
               style="vertical-align: middle; cursor: pointer;"></td>
            <td v-html="user.views" class='td1 text-center' style="vertical-align: middle;"></td>
            <td v-html="user.write_date" class='td1 text-center'
               style="vertical-align: middle;"></td>
         </tr>
      </table>
      <div class="btn-cover text-center">
         <button class="btn btn-success round"
            style="background: #3c90e2; font-weight: bold; border: none;"
            :disabled="pageNum === 0" @click="prevPage">이전</button>
         <button class="btn btn-success round"
            style="background: #3c90e2; font-weight: bold; border: none;"
            :disabled="pageNum >= pageCount - 1" @click="nextPage">다음
         </button>
      </div>
      <c:if test="${ not empty member}">
         <button class="btn btn-success round"
            style="background: #3c90e2; font-weight: bold; height: 40px; margin-left: 5px; border: none; float: right;"
            @click='showlist(2)'>글작성</button>
      </c:if>
   </div>
<div>
</script>





<script type="text/x-template" id="detailtemplate">
<div class="container">
   <div class="wrap-login100 p-l-55 p-r-55 p-t-80 p-b-30">
      <button class="btn btn-success round"
         style="background: #3c90e2; font-weight: bold; height: 40px; margin-left: 5px; border: none; float: right; margin-bottom:5%;"
         @click='showlist(0)'>목록으로</button>
      <table class='table table-striped' style="min-height:300px; margin-top:5%;">
         <thead class="thead-white">
            <tr>
               <th width="10%">제목</th>
               <th style="color:rgb(121, 119, 119);" width="35%" v-html="cemp.title"></th>
               <th>|</th>
               <th width="10%">조회수</th>
               <th width="15%" style="color:rgb(121, 119, 119);" v-html="cemp.views"></th>
               <th>|</th>
               <th width="10%">작성일</th>
               <th width="30%" style="color:rgb(121, 119, 119);" v-html="cemp.write_date"></th>
            </tr>
         </thead>
         <tr>
            <td id="detailcontent" colspan="8" style='word-break: break-all'
               v-html="cemp.content"></td>
         </tr>
      </table>
      <form action="" method="post" id="_frmForm2" name="frmForm2"
         @submit.prevent="addcomment">
         <template v-if="cemp.writer==='${membernm}'">
         <hr class="ng-margin point-another">
         <button class="btn btn-success round"
            style="background: rgb(60, 144, 226); float: right; font-weight: bold; height: 40px; margin-left: 5px; border: none;"
            @click='delete_user(cemp.isbn)'>글삭제</button>
         <button class="btn btn-success round"
            style="background: rgb(60, 144, 226); float: right; font-weight: bold; height: 40px; margin-left: 5px; border: none;"
            @click='update_user(cemp.isbn)'>글수정</button>
         <br>
         <br>
         <br>
         </template>
         <c:if test="${membernm =='root'}">
            <fieldset style="margin-top:5%; margin-bottom:2%;">
               <table class="horizontal-list">
                  <colgroup>
                     <col style="width: 190px">
                     <col style="width: auto">
                  </colgroup>
                  <tbody>
                     <tr>
                        <th class="v-t">댓글 내용 <em class="fc06">*</em></th>
                        <td><textarea style="width: 100%;" rows="5"
                              title="문의 내용을 입력하세요" v-model="ccontent"></textarea></td>
                     </tr>
                  </tbody>
               </table>
            </fieldset>
            <button class="btn btn-success round"
               style="background: rgb(60, 144, 226); float: right; font-weight: bold; height: 40px; margin-left: 5px; border: none;"
               type="submit" name="button">댓글작성</button>
            </td>
         </c:if>
      </form>
      <table class='table table-striped' style="margin-top:7%; margin-bottom:5%;">
         <thead class="thead-white">
            <tr>
               <th class="text-center" width="20%" >댓글작성일</th>
               <th class="text-center" width="60%">댓글내용</th>
               <c:if test="${membernm =='root'}">
                  <th class="text-center" width="10%">삭제</th>
               </c:if>
            </tr>
         </thead>
         <tr v-for="cemp2 in comment" v-if="comment !== null">
            <td class="text-center" v-html="cemp2.write_date"></td>
            <td class="text-center" tyle='word-break: break-all' v-html="cemp2.content"></td>
            <c:if test="${membernm =='root'}">
               <td><button class="btn btn-success round text-center"
                     style="background: rgb(60, 144, 226); float: right; font-weight: bold; height: 40px; margin-left: 5px; border: none;"
                     @click='delete_comment(cemp2.isbn)'>삭제</button></td>
            </c:if>
         </tr>
      </table>
      <c:if test="${membernm =='root'}">
         <!-- <button class="btn btn-success round" style="background: rgb(60, 144, 226); float: right; font-weight: bold; height: 40px; margin-left: 5px; border: none;" @click=' show_detail2(cemp.isbn)'>답글달기</button> -->
      </c:if>
      </fieldset>
      
   </div>
</div>
</div>
</div>
</script>   

<script type="text/x-template" id="addqnatemplate">
<div class="container">
<div class="textleft">
<h2 class="con-title small">입력사항</h2>
<button class="btn btn-success round"
         style="background: #3c90e2; font-weight: bold; height: 40px; margin-left: 5px; border: none; float: right;"
         @click='gotolist()'>목록으로</button>
<form action="" method="post" id="_frmForm" name="frmForm" @submit.prevent="addqna">
      <fieldset style="margin-top:8%; margin-bottom:5%;">
               
               <table class="horizontal-list">
                  
                  <colgroup>
                     <col style="width:190px">
                     <col style="width:auto">
                  </colgroup>
                  <tbody>
               
                     <tr>
                        <th>문의 제목 <em class="fc06">*</em></th>
                        <td>
                        <input id="title" name="title" style="width:100%" title="문의 제목을 입력하세요" type="text" v-model="ctitle" maxlength="100">
                        
                        </td>
                     </tr>
                     <tr>
                        <th class="v-t">문의 내용 <em class="fc06">*</em></th>
                        <td>
                        <textarea style="width:100%;" rows="20" title="문의 내용을 입력하세요" v-model="ccontent" ></textarea>
                        
                        </td>
                     </tr>
                     
                  </tbody>
               </table>
            </fieldset>


<button  class="btn btn-success round" style="background: rgb(60, 144, 226); float: right; font-weight: bold; height: 40px; margin-left: 5px; border: none;">작성하기</button></td>
</form>
</div>
</div>
</script>
<script type="text/x-template" id="addcommenttemplate">
<div class="container">
   <div class="textleft">
      <h2 class="con-title small">입력사항</h2>
      <button class="btn btn-success round" style="background: #3c90e2; font-weight: bold; height: 40px; margin-left: 5px; border: none; float: right; margin-bottom: 5%;" @click='showlist(0)'>목록으로</button>
         <form action="" method="post" id="_frmForm" name="frmForm" @submit.prevent="addqna">
            <fieldset style="margin-top: 5%; margin-bottom: 5%;">
               <table class="horizontal-list">
                  <colgroup>
                     <col style="width: 190px">
                     <col style="width: auto">
                  </colgroup>
                  <tbody>
                     <tr>
                        <th>문의 제목 <em class="fc06">*</em></th>
                        <td><input id="title" name="title" style="width: 100%" title="문의 제목을 입력하세요" type="text" v-model="ctitle" maxlength="100"></td>
                     </tr>
                     <tr>
                        <th class="v-t">문의 내용 <em class="fc06">*</em></th>
                        <td><textarea style="width: 100%;" rows="20" title="문의 내용을 입력하세요" v-model="ccontent"></textarea></td>
                     </tr>
                  </tbody>
               </table>
            </fieldset>
            <button class="btn btn-success round" style="background: rgb(60, 144, 226); float: right; font-weight: bold; height: 40px; margin-left: 5px; border: none;">작성하기</button>
       </form>
   </div>
</div>
</script>

<script type="text/x-template" id="updateqnatemplate">
<div class="container">
<div class="textleft">
<h2 class="con-title small">입력사항</h2>
<form action="" method="post" id="_frmForm" name="frmForm" @submit.prevent="updateqna">
<fieldset style="margin-top:5%; margin-bottom:5%;">
               
               <table class="horizontal-list">
                  
                  <colgroup>
                     <col style="width:190px">
                     <col style="width:auto">
                  </colgroup>
                  <tbody>
               
                     <tr>
                        <th>문의 제목 <em class="fc06">*</em></th>
                        <td>
                        <input id="title" name="title" style="width:100%" title="문의 제목을 입력하세요" type="text" v-model="cemp.title" maxlength="100">
                        
                        </td>
                     </tr>
                     <tr>
                        <th class="v-t">문의 내용 <em class="fc06">*</em></th>
                        <td>
                        <textarea style="width:100%;" rows="20" title="문의 내용을 입력하세요" v-model="cemp.content" ></textarea>
                        
                        </td>
                     </tr>
                     
                  </tbody>
               </table>
            </fieldset>


<button  class="btn btn-success round" style="background: rgb(60, 144, 226); float: right; font-weight: bold; height: 40px; margin-left: 5px; border: none;"type="submit" name="button">수정하기</button></td>
</form>
</div>
</div>




</script>











<jsp:include page="footer.jsp"></jsp:include>

<script type="text/javascript">
var listqna = Vue.component('listqna',{
    template: '#listtemplate',
    data(){
        return {
          upHere : false,
          info: [],
          loading: true,
          errored: false,
          pageNum: 0 
        }
      },
     props: {
  
    pageSize: {
      type: Number,
      required: false,
      default: 10
    }
  },
      methods:{
        nextPage () {
      this.pageNum += 1;
    },
    prevPage () {
      this.pageNum -= 1;
    },
      
         show_detail:function(userisbn){
            App.updateviews(userisbn);
            App.userisbn=userisbn;
            App.currentview = 'qna';
            App.showlist(1);
          } ,
          showlist: function(val){
             App.showlist(val);
          },
          delete_user:function(isbn){
           
            App.userisbn=isbn;
            axios
              .post('http://192.168.208.82:8198/ssafy/api/deleteQnA/'+App.userisbn)
              //.then(function(response){
                 .then(response => (App.showlist(0)));
                  
               // })
           },
           update_user:function(userisbn){
               
               App.userisbn=userisbn;
               App.currentview = 'updateqna';
               App.showlist(3);
             }
      },
      created () {
        axios
          .get('http://192.168.208.82:8198/ssafy/api/getQnATotal')
          //.get('./emp.json')
          .then(response => (this.info = response.data))
          .catch(error => {
            console.log(error)
            this.errored = true
          })
          .finally(() => this.loading = false);
      },
    computed: {
    pageCount () {
      let listLeng = this.info.length,
          listSize = this.pageSize,
          page = Math.floor(listLeng / listSize);
      if (listLeng % listSize > 0) page += 1;
      

      return page;
    },
    paginatedData () {
      const start = this.pageNum * this.pageSize,
            end = start + this.pageSize;
      return this.info.slice(start, end);
    }
  }
});


var mylistqna = Vue.component('mylistqna',{
    template: '#mylisttemplate',
    data(){
        return {
          upHere : false,
          info: [],
          loading: true,
          errored: false ,
           pageNum: 0 
        }
      },
       props: {
  
    pageSize: {
      type: Number,
      required: false,
      default: 10
    }
  },
      methods:{
        nextPage () {
      this.pageNum += 1;
    },
    prevPage () {
      this.pageNum -= 1;
    },
         show_detail:function(userisbn){
           
            App.userisbn=userisbn;
            App.currentview = 'detailqna';
            App.showlist(1);
          } ,
          showlist: function(val){
             App.showlist(val);
          },
          delete_comment:function(isbn){
          axios
              .post('http://192.168.208.82:8198/ssafy/api/deleteComment/'+isbn)
              .then(function(response){
                 //.then(response => (this.deps = response.data))
                   if(response.data.state=='succ'){
                     
                      location.href='./foodqna.do';
                      //App.currentview = 'listhrm';
                      //App.showlist(0);
                   }else{
                     
                      location.href='./foodqna.do';
                      //App.currentview = 'listhrm';
                      //App.showlist(0);
                   }
                })
          }
          
          ,
          delete_user:function(isbn){
            
            App.userisbn=isbn;
            axios
              .post('http://192.168.208.82:8198/ssafy/api/deleteQnA/'+App.userisbn)
              .then(function(response){
                 //.then(response => (this.deps = response.data))
                   if(response.data.state=='succ'){
                     
                      location.href='./foodqna.do';
                      //App.currentview = 'listhrm';
                      //App.showlist(0);
                   }else{
                     
                      location.href='./foodqna.do';
                      //App.currentview = 'listhrm';
                      //App.showlist(0);
                   }
                })
           },
           update_user:function(userisbn){
               
               App.userisbn=userisbn;
               App.currentview = 'updateqna';
               App.showlist(3);
             }
      },
      mounted () {
            var username= "<%=session.getAttribute("membername") %>";
        
      
        axios
          .get('http://192.168.208.82:8198/ssafy/api/getQnAByWriter/'+username)
          //.get('./emp.json')
          .then(response => (this.info = response.data))
          .catch(error => {
            console.log(error)
            this.errored = true
          })
          .finally(() => this.loading = false);
      },
        computed: {
    pageCount () {
      let listLeng = this.info.length,
          listSize = this.pageSize,
          page = Math.floor(listLeng / listSize);
      if (listLeng % listSize > 0) page += 1;
      

      return page;
    },
    paginatedData () {
      const start = this.pageNum * this.pageSize,
            end = start + this.pageSize;
      return this.info.slice(start, end);
    }
  }
});



var detailqna = Vue.component('detailqna',{
    template: '#detailtemplate',
    data () {
        return {
          info: [],
          loading: true,
          errored: false ,
          cisbn:'',
          cemp:{},
          comment:{},
          ccontent : '',
          cwrite_date : ''
        }
      },
   
      methods:{
       getans(){
             
           axios
          .get('http://192.168.208.82:8198/ssafy/api/getCommentDetail/'+App.userisbn)
           //.get('./emp.json')
          .then(response => (this.comment = response.data))
          .catch(error => {
            console.log(error)
            this.errored = true
          })
          .finally(() => this.loading = false);
       
       },
       
       
       addcomment() {
        var test= "<%=session.getAttribute("membername") %>";
        this.cwriter=test;
        
        var date = new Date();
        var year = date.getFullYear();
        var month = date.getMonth()+1;
        var day = date.getDate();
        this.cwrite_date = year+"-"+month+"-"+day;
    
         
        
        
        axios.post('http://192.168.208.82:8198/ssafy/api/addComment', {
               qnaisbn: App.userisbn,
             content: this.ccontent,
             
             
             write_date: this.cwrite_date
          }
         ).then(response => (this.getans(),this.ccontent='',this.comment=reponse.data,App.showlist(1)));
           
         //})
         },
      
         show_detail:function(userisbn){
           
            App.userisbn=userisbn;
            App.currentview = 'detailqna';
            App.showlist(1);
          } ,
          
          show_detail2:function(userisbn){
           
            App.userisbn=userisbn;
            App.currentview = 'addcomment';
            App.showlist(5);
          } ,
          showlist: function(val){
             App.showlist(val);
          }
          ,
          delete_comment:function(isbn){
          axios
              .post('http://192.168.208.82:8198/ssafy/api/deleteComment/'+isbn)
              //.then(function(response){
                 .then(response => (this.getans(),this.comment=reponse.data,App.showlist(1)));
                 
                //})
          },
          delete_user:function(isbn){
            
            App.userisbn=isbn;
            axios
              .post('http://192.168.208.82:8198/ssafy/api/deleteQnA/'+App.userisbn)
              .then(function(response){
                 //.then(response => (this.deps = response.data))
                   if(response.data.state=='succ'){
                      
                      location.href='./foodqna.do';
                      //App.currentview = 'listhrm';
                      //App.showlist(0);
                   }else{
                     
                      location.href='./foodqna.do';
                      //App.currentview = 'listhrm';
                      //App.showlist(0);
                   }
                })
           },
           update_user:function(userisbn){
             
               App.userisbn=userisbn;
               App.currentview = 'updateqna';
               App.showlist(3);
             }
      },
      mounted () {
         //App.showlist(4),
          alert('상세보기');
         axios
          .get('http://192.168.208.82:8198/ssafy/api/getQnADetail/'+App.userisbn)
           //.get('./emp.json')
          .then(response => (this.cemp = response.data), this.cisbn=this.cemp.isbn)
          .catch(error => {
            console.log(error)
            this.errored = true
          })
          .finally(() => this.loading = false);
          
      
          
          this.getans();
      }
});

var addqna = Vue.component('addqna',{
    template: '#addqnatemplate',
    data () {
       return {
         info: null,
         loading: true,
         errored: false,
          ctitle:'',
          ccontent:'',
          cviews:0,
          cwriter:'',
          cwrite_date:'',
       }
     },
     mounted() {
        var test= "<%=session.getAttribute("membername") %>";
        this.cwriter=test;
        
        var date = new Date();
        var year = date.getFullYear();
        var month = date.getMonth()+1;
        var day = date.getDate();
        this.cwrite_date = year+"-"+month+"-"+day;
        
     },
     methods: {
        gotolist:function(){
             
             
             App.currentview = 'listqna';
             App.showlist(0);
           },
           
       addqna() {
         if(this.ctitle==''){ alert('제목을 입력하세요.'); return ;}
         if(this.ccontent==''){ alert('내용을 입력하세요.'); return ;}
         
        
        
        axios.post('http://192.168.208.82:8198/ssafy/api/addQnA', {
           title: this.ctitle,
             content: this.ccontent,
             writer: this.cwriter,
             views: this.cviews,
             write_date: this.cwrite_date
          }
         ).then(function(response){
             //.then(response => (this.deps = response.data))
            location.href='./foodqna.do';
         });
      }}
   });
   
   
   var addcomment = Vue.component('addcomment',{
    template: '#addcommenttemplate',
    data () {
       return {
         info: null,
         loading: true,
         errored: false,
          ctitle:'',
          ccontent:'',
          cviews:0,
          cwriter:'',
          cisbn:0,
          cwrite_date:'',
       }
     },
     mounted() {
        var test= "<%=session.getAttribute("membername") %>";
        this.cwriter=test;
        
        var date = new Date();
        var year = date.getFullYear();
        var month = date.getMonth()+1;
        var day = date.getDate();
        this.cwrite_date = year+"-"+month+"-"+day;
        
     },
     methods: {
       addcomment() {
    
        
         if(this.ccontent==''){ alert('내용을 입력하세요.'); return ;}
         
        
        
        axios.post('http://192.168.208.82:8198/ssafy/api/addComment', {
               qnaisbn: App.userisbn,
             content: this.ccontent,
             
             
             write_date: this.cwrite_date
          }
         ).then(function(response){
             //.then(response => (this.deps = response.data))
            location.href='./foodqna.do';
         });
      }}
   });

var updateqna = Vue.component('updateqna',{
    template: '#updateqnatemplate',
    data () {
       return {
         info: null,
         loading: true,
         errored: false,
          ctitle:'',
          ccontent:'',
          cviews:'',
          cwriter:'',
          cwrite_date:'',
          cemp:{}
       }
     },
       mounted() {
        var test= "<%=session.getAttribute("membername") %>";
        this.cwriter=test;
        
        var date = new Date();
        var year = date.getFullYear();
        var month = date.getMonth()+1;
        var day = date.getDate();
        this.cwrite_date = year+"-"+month+"-"+day;
        axios
          .get('http://192.168.208.82:8198/ssafy/api/getQnADetail/'+App.userisbn)
           //.get('./emp.json')
          .then(response => (this.cemp = response.data))
          .catch(error => {
            console.log(error)
            this.errored = true
          })
          .finally(() => this.loading = false );
        
     },
     methods: {
       updateqna() {
         if(this.cemp.title==''){ alert('제목을 입력하세요.'); return ;}
         if(this.cemp.content==''){ alert('내용을 입력하세요.'); return ;}
         
       
      
        axios.post('http://192.168.208.82:8198/ssafy/api/updateQnA', {
           isbn: App.userisbn,
           title: this.cemp.title,
             content: this.cemp.content,
             writer: this.cwriter,
             views: this.cemp.views,
             write_date: this.cwrite_date
          }
         ).then(function(response){
             //.then(response => (this.deps = response.data))
            location.href='./foodqna.do';
         });
      }}
   });








var App=new Vue({
   el: '#app',
   data: {
      currenttitle: 'Q&A 목록',
      userisbn:'',
      currentview: 'listqna',
      allviews:['listqna','detailqna','addqna', 'updateqna','mylistqna','addcomment'],
      cutt:['Q&A 목록','Q&A 상세보기', 'Q&A 추가', 'Q&A 수정','Q&A 내글목록','댓글달기']
   },
   components:{
      listqna: listqna,
      detailqna: detailqna,
      addqna: addqna,
      updateqna: updateqna
   },
   methods:{
      showlist: function(val){
         this.currentview=this.allviews[val];
         this.currenttitle=this.cutt[val];
      },
        updateviews: function(isbn2){
         console.log("update test :"+isbn2);
          axios.post('http://192.168.208.82:8198/ssafy/api/updateQnAViews/'+isbn2
            ).then(function(response){
                //.then(response => (this.deps = response.data))
                       
               }).finally(() => this.loading = false);
      }
   }
});
Vue.config.devtools= true;
</script>
</body>
</html>