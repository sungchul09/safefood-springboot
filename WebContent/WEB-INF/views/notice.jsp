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

<title>공지사항</title>
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
<style>
.badge.type1 {
    background: #3c90e2;
    font-size: 12px;
    color: #fff;
    width: 50px;
    height: 22px;
    line-height: 22px;
    border-radius: 3px;
    font-weight: 500;
}
   
</style>

</head>
<jsp:include page="header.jsp"></jsp:include>


<!-- Header -->

<header class="masthead bg-white">
		<div class="page_title" id="titleH3" @click='showlist(0)' style="cursor:pointer;">
		<div class="container text-dark">
			<h2 clas="page-title"> 공지사항 </h2>
			<h5 class="page-sub-title point-color-01">
			사이트와 관련된 안내사항을 
			<br>
			기재합니다.
			</h5>
		</div>
		</div>
		<div class="mt-5 mb-5" id='app'>
			<component v-bind:is="currentview"></component>
		</div>
</header>


<!--  
  <td class='button'  @click="delete_user(user.isbn)"class='td1' style="vertical-align: middle;"><input type="button" class='blue' value='글 삭제'></button> </td>
  <td class='button'  @click="update_user(user.isbn)" class='td1' style="vertical-align: middle;"><input type="button" class='blue' value='글 수정'></button> </td> -->
<script type="text/x-template" id="listtemplate">
 <div class="container">
	<div class="wrap-login100 p-l-55 p-r-55 p-t-80 p-b-30">
		<span class="page-count">{{ pageNum + 1 }} / {{ pageCount }}
				페이지</span>
		<table class='table table-striped'>
			<thead class="thead-white">
				<tr>
					<th class="text-center" height="20%;">게시글번호</th>
					<th height="50%;">제목</th>
					<th class="text-center" height="20%;">조회수</th>
					<th class="text-center" height="20%;">작성일</th>

				</tr>
			</thead>
			<tr v-for="(user,index) in paginatedData" class="nicecolor enter-detail">
				<template v-if="index <3 && pageNum ===0">
				<td class='td1 text-center' style="vertical-align: middle; cursor: pointer;"
					@click="show_detail(user.isbn)"><span class="badge type1">공지</span></td>
				<td v-html="user.title" @click="show_detail(user.isbn)" class='td1'
					style="vertical-align: middle; cursor: pointer; color: #3c90e2; font-weight: 500;"></td>
				<td v-html="user.views" class='td1 text-center' style="vertical-align: middle;"></td>
				<td v-html="user.write_date" class='td1 text-center'
					style="vertical-align: middle;"></td>
				</template>
				<template v-else>
				<td class='td1 text-center' style="vertical-align: middle; cursor: pointer;"
					@click="show_detail(user.isbn)">{{user.isbn}}</td>

				<td v-html="user.title" @click="show_detail(user.isbn)" class='td1'
					style="vertical-align: middle; cursor: pointer;"></td>
				<td v-html="user.views" class='td1 text-center' style="vertical-align: middle;"></td>
				<td v-html="user.write_date" class='td1 text-center'
					style="vertical-align: middle;"></td>
				</template>
			</tr>
			<tr></tr>
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
		<c:if test="${ not empty admin}">
			<c:if test="${admin==true }">
				<button class="btn btn-success round"
					style="background: rgb(60, 144, 226); font-weight: bold; height: 40px; margin-left: 5px; border: none; float: right;"
					@click='showlist(2)'>공지작성</button>
			</c:if>

		</c:if>
	</div>
</div>
</script>

<script type="text/x-template" id="detailtemplate">
<div class="container">
	<div class="wrap-login100 p-l-55 p-r-55 p-t-80 p-b-30">
		<table class='table table-striped' style="min-height:300px;">
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
				<td id="detailcontent" colspan="6" style='word-break: break-all'
					v-html="cemp.content"></td>
			</tr>
			<tr>
			</tr>
		</table>
		<p>
			<button class="btn text-white round"
				style="font-weight: bold; height: 52px; margin-left: 5px; border: none;"
				@click='showlist(0)'>목록보기</button>
		</p>
		<c:if test="${ not empty admin}">
			<c:if test="${admin==true }">
				<button class="btn btn-success round"
					style="background: #3c90e2; float: right; font-weight: bold; height: 52px; margin-left: 5px; border: none;"
					@click='update_user(cemp.isbn)'>글 수정</button>
				<button class="btn btn-success round"
					style="background: #3c90e2; float: right; font-weight: bold; height: 52px; margin-left: 5px; border: none;"
					@click='delete_user(cemp.isbn)'>글 삭제</button>

			</c:if>

		</c:if>
	</div>
</div>
</script>
<script type="text/x-template" id="addqnatemplate">
<div class="container">
	<div class="textleft">
		<h2 class="con-title small">입력사항</h2>
		<form action="" method="post" id="_frmForm" name="frmForm"
			@submit.prevent="addqna">
			<fieldset>
				<table class="horizontal-list" style="margin-top:5%; margin-bottom:5%;">

					<colgroup>
						<col style="width: 190px">
						<col style="width: auto">
					</colgroup>
					<tbody>

						<tr>
							<th>공지 제목 <em class="fc06">*</em></th>
							<td><input id="title" name="title" style="width: 100%"
								title="문의 제목을 입력하세요" type="text" v-model="ctitle"
								maxlength="100"></td>
						</tr>
						<tr>
							<th class="v-t">공지 내용 <em class="fc06">*</em></th>
							<td><textarea style="width: 100%;" rows="20"
									title="문의 내용을 입력하세요" v-model="ccontent"></textarea></td>
						</tr>

					</tbody>
				</table>
			</fieldset>
			<button class="btn btn-success round"
				style="background: #3c90e2; float: right; font-weight: bold; height: 52px; margin-left: 5px; border: none;"
				type="submit" name="button">작성하기</button>
			</td>
		</form>
	</div>
</div>
</script>

<script type="text/x-template" id="updateqnatemplate">
<div class="container">
	<div class="textleft">
		<h2 class="con-title small">입력사항</h2>
		<form action="" method="post" id="_frmForm" name="frmForm"
			@submit.prevent="updateqna">
			<fieldset style="margin-top:5%; margin-bottom:5%;">
				<table class="horizontal-list">
					<colgroup>
						<col style="width: 190px">
						<col style="width: auto">
					</colgroup>
					<tbody>
						<tr>
							<th>문의 제목 <em class="fc06">*</em></th>
							<td><input id="title" name="title" style="width: 100%"
								title="문의 제목을 입력하세요" type="text" v-model="cemp.title"
								maxlength="100"></td>
						</tr>
						<tr>
							<th class="v-t">문의 내용 <em class="fc06">*</em></th>
							<td><textarea style="width: 100%;" rows="20"
									title="문의 내용을 입력하세요" v-model="cemp.content"></textarea></td>
						</tr>

					</tbody>
				</table>
			</fieldset>
			<button class="btn btn-success round"
				style="background: #3c90e2; font-weight: bold; height: 40px; margin-left: 5px; border: none; float: right;"
				type="submit" name="button">수정하기</button>
			</td>
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
            
            App.currentview = 'detailqna';
          
            
            App.showlist(1);
           
            
          } ,
          showlist: function(val){
             App.showlist(val);
          },
          
          
          
          delete_user:function(isbn){
          
            App.userisbn=isbn;
            axios
              .post('http://192.168.208.82:8198/ssafy/api/deleteNotice/'+App.userisbn)
              .then(function(response){
                 //.then(response => (this.deps = response.data))
                   if(response.data.state=='succ'){
                      alert(response.data.name+"이 실행되었습니다.");
                      location.href='./notice.do';
                      //App.currentview = 'listhrm';
                      //App.showlist(0);
                   }else{
                      alert(response.data.name+"에 실패하였습니다.");
                      location.href='./notice.do';
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
      created () {
        axios
          .get('http://192.168.208.82:8198/ssafy/api/getNoticeTotal')
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
          cviews:0
        }
      },
      methods:{
        showlist: function(val){
             App.showlist(val);
          },
         delete_user:function(isbn){
            
            App.userisbn=isbn;
            axios
              .post('http://192.168.208.82:8198/ssafy/api/deleteNotice/'+App.userisbn)
              .then(function(response){
                 //.then(response => (this.deps = response.data))
                   if(response.data.state=='succ'){
                      alert(response.data.name+"이 실행되었습니다.");
                      location.href='./notice.do';
                      //App.currentview = 'listhrm';
                      //App.showlist(0);
                   }else{
                      alert(response.data.name+"에 실패하였습니다.");
                      location.href='./notice.do';
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
          .get('http://192.168.208.82:8198/ssafy/api/getNoticeDetail/'+App.userisbn)
           //.get('./emp.json')
          .then(response => (this.cemp = response.data))
          .catch(error => {
            console.log(error)
            this.errored = true
          })
          .finally(() => this.loading = false );
   
         
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
          
          cwrite_date:'',
       }
     },
     methods: {
       addqna() {
       
             var date = new Date();
        var year = date.getFullYear();
        var month = date.getMonth()+1;
        var day = date.getDate();
         if(this.ctitle==''){ alert('제목을 입력하세요.'); return ;}
         if(this.ccontent==''){ alert('내용을 입력하세요.'); return ;}
         this.cwrite_date = year+"-"+month+"-"+day;
       
        
        axios.post('http://192.168.208.82:8198/ssafy/api/addNotice', {
           title: this.ctitle,
             content: this.ccontent,
      
             views: this.cviews,
             write_date: this.cwrite_date
          }
         ).then(function(response){
             //.then(response => (this.deps = response.data))
            location.href='./notice.do';
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
          
          cwrite_date:'',
          cemp:{}
       }
     },
     mounted () {
         //App.showlist(4),
      
         axios
          .get('http://192.168.208.82:8198/ssafy/api/getNoticeDetail/'+App.userisbn)
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
       var date = new Date();
        var year = date.getFullYear();
        var month = date.getMonth()+1;
        var day = date.getDate();
        this.cemp.write_date = year+"-"+month+"-"+day;
         if(this.cemp.title==''){ alert('제목을 입력하세요.'); return ;}
         if(this.cemp.content==''){ alert('내용을 입력하세요.'); return ;}
         
         
        
        axios.post('http://192.168.208.82:8198/ssafy/api/updateNotice', {
           isbn: App.userisbn,
           title: this.cemp.title,
             content: this.cemp.content,
           
             views: this.cemp.views,
             write_date: this.cemp.write_date
          }
         ).then(function(response){
             //.then(response => (this.deps = response.data))
            location.href='./notice.do';
         });
      }}
   });







var cemp;
var App=new Vue({
   el: '#app',
   
   data: {
      currenttitle: 'Q&A 목록',
      userisbn:'',
      currentview: 'listqna',
      allviews:['listqna','detailqna','addqna', 'updateqna'],
      cutt:['Q&A 목록','Q&A 상세보기', 'Q&A 추가', 'Q&A 수정'],
      title:'',
      content:'',
      views:0,
      write_date:''
      
      
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
          axios.post('http://192.168.208.82:8198/ssafy/api/updateViews/'+isbn2
            ).then(function(response){
                //.then(response => (this.deps = response.data))
                       
               }).finally(() => this.loading = false);
      }
      
   }
});
Vue.config.devtools= true;
</script>

</html>




