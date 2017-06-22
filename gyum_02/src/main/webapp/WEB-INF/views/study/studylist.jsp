<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
  <meta name="description" content="Miminium Admin Template v.1">
  <meta name="author" content="Isna Nur Azis">
  <meta name="keyword" content="">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>academy</title>

   <!-- start: Css -->
    <link rel="stylesheet" type="text/css" href="asset/css/bootstrap.min.css">

      <!-- plugins -->
      <link rel="stylesheet" type="text/css" href="asset/css/plugins/font-awesome.min.css"/>

      <link rel="stylesheet" type="text/css" href="asset/css/plugins/animate.min.css"/>
      <link rel="stylesheet" type="text/css" href="asset/css/plugins/summernote.css"/>
      <link rel="stylesheet" type="text/css" href="asset/css/plugins/normalize.css"/>

   <link href="asset/css/style.css" rel="stylesheet">
   <!-- end: Css -->

   <link rel="shortcut icon" href="asset/img/logomi.png">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

     <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
   <link rel="stylesheet" type="text/css" href="codebase/fonts/font_roboto/roboto.css"/>
   <link rel="stylesheet" type="text/css" href="codebase/dhtmlxcalendar.css"/>
   <script src="codebase/dhtmlxcalendar.js"></script>

<style>
   #calendar {
      border: 1px solid #dfdfdf;
      font-family: Roboto, Arial, Helvetica;
      font-size: 14px;
      color: #404040;         
   }   
   .tr_w{
      background-color: #fff;
      border:1px solid #e2e2e2 ;
   }
   .form-group {
      margin-bottom: 5px;
   }
</style>  
 <script>
var myCalendar;      
function doOnLoad() {      
   var msg="${msg}";      
   if(msg!=""){         
      alert("${msg}");
      msg="";
   }
   
   myCalendar = new dhtmlXCalendarObject("cal_1");
   myCalendar.attachEvent("onShow", function(){
      document.getElementById("cal_1").readOnly = true; 
   });      
   myCalendar.attachEvent("onHide", function(){});         
   studylist();
   
}
var i=0
var cp=1;
function studylist(cpi){
   document.getElementById("study_list").innerHTML="";
   if(cpi!=null){
      cp=cpi
   }
   var params="cp="+cp;
    $.ajax({
         type : "GET",
         url : "studyList.do",
         data:params,
         success:function(data){                  
            var listdiv=document.getElementById('study_list');               
            for(var i=0;i<data.list.length;i++){
               var sl=eval("data.list["+i+"]");
               var studydiv=makestudylist(sl);
               listdiv.appendChild(studydiv);
            }      
            document.getElementById('page').innerHTML=data.page;
         }
    });       
}


function makestudylist(sl){
   var situ="";
   if(sl.study_situ==0){
      situ="진행중";
   }else{
      situ="종료";
   }         
   var sldiv=document.createElement('div');
   sldiv.setAttribute('id','s'+i);
   sldiv.innerHTML='<table cellspacing="0" class="table-striped table-bordered dataTable no-footer"><tbody><tr class="odd"><td width="50" >'+sl.study_idx+'</td><td width="450" style="text-align:left;"><a onclick=" memcheck('+sl.study_idx+')">'+sl.study_subject+'</a></td><td width="100" align="center">'+situ+'</td><td width="100" align="center">'+sl.study_id+'</td><td width="100" align="center">'+sl.study_createdate+'</td><td width="50" align="center"><a onclick="contentshow('+i+')">▼</a></td></tr>'+
               '<table id="content'+i+'" class="table-striped table-bordered dataTable no-footer" style="display:none;"><tbody><tr class="tr_w"><td width="200" align="left" style="padding-left:50px;" class="odd" colspan=2> 주제 : '+sl.study_directory+'</td><td width=300></td><td width="100" align="center"> 정원 '+sl.study_maxnum+' 명 </td><td width="250" align="left"> 종료 예정 날짜 : '+sl.study_lastday+'</td></tr><tr class="tr_w"><td colspan="5" align="center"><pre>'+sl.study_content+'</pre></td></tr></tbody></table>';
   i++;
   sldiv.comment=sl;
   sldiv.className="sl";
   return sldiv;
}
function contentshow(num){
   var cs=eval("document.getElementById('content"+num+"')");
   if(cs.style.display=="inherit"){
      cs.style.display="none";   
   }else{
      cs.style.display="inherit";   
   }
}   
var logincheck="${sessionScope.id}";
function study_add(){
   var study_subject=document.studyadd.study_name.value;
   var study_public=document.studyadd.study_public.value;
   var study_id=document.studyadd.study_id.value;
   var study_maxnum=document.studyadd.study_maxnum.value;
   var study_directory=document.studyadd.study_directory.value;
   var study_lastday=document.studyadd.study_lastday.value;
   var study_content=document.studyadd.study_content.value;
   if(logincheck==""){
      alert('로그인이 필요 합니다.');
      return false;
   }else if(study_subject==""||study_public==""||study_maxnum==""||study_directory==""||study_lastday==""||study_content==""){
      return false;
   }   
   
   var params="study_id="+encodeURIComponent(study_id)+"&"+"study_subject="+encodeURIComponent(study_subject)+"&"+"study_public="+encodeURIComponent(study_public)+"&"+"study_maxnum="+encodeURIComponent(study_maxnum)+"&"+"study_directory="+encodeURIComponent(study_directory)+"&"+"study_lastday="+encodeURIComponent(study_lastday)+"&"+"study_content="+encodeURIComponent(study_content);   
   $.ajax({
      type : "GET",
      url : "studyadd.do",
      data : params, 
      error:function (e){
         alert(e.responseText);
      },
      success:function(data){   
         if(data.msg!=null){
            alert(data.msg);
            i=0;      
            document.studyadd.study_name.value="";
            document.studyadd.study_directory.value="";
            document.studyadd.study_content.value="";
            document.studyadd.study_maxnum.value="";
            document.studyadd.study_lastday.value="";
            document.getElementById("study_list").innerHTML="";
            studylist();
         }
      }
   });

}

function memcheck(idx){
   if(logincheck==""){
      alert('로그인이 필요 합니다.');
      return false;
   }
   var params="study_idx="+encodeURIComponent(idx);
    $.ajax({
         type : "GET",
         url : "memcheck.do",
         data : params, 
         error:function (e){
            alert(e.responseText);
         },
         success:function(data){                  
            if(data.msg!=null){
               alert(data.msg);
            }else{                  
               location.href="study.do?study_idx="+idx;
            }
         }
      
      });
}
   
function reset(){
   document.studyadd.study_name.value="";
   document.studyadd.study_directory.value="";
   document.studyadd.study_content.value="";
   document.studyadd.study_maxnum.value="";
   document.studyadd.study_lastday.value="";
}

/*jsy place*/
function goSearching(cpnum){
   if(cpnum!=null){
      cp=cpnum;
   }else{
      cp=1;
   }
   var radioitem=document.getElementById("radioitem").value;//라디오버튼
   var key=document.getElementById("key").value;//입력값
   var params="";
   if(key==null || key==""){
      alert("검색어를 입력하세요.");
      return false;
   }
   if(radioitem=="title"){
      params="cp="+cp+"&title="+encodeURIComponent(key)+"&theme=";
   }else{
      params="cp="+cp+"&title=&theme="+encodeURIComponent(key);
   }

   $.ajax({
      type:"get",url:"goSearching.do",data:params,
      success:function(data){
         var listdiv=document.getElementById('study_list');   
         listdiv.innerHTML="";
         if(data.list.length==0){
            alert("검색결과가 없습니다");
            location.reload();
         }else{
            for(var i=0;i<data.list.length;i++){
               var sl=eval("data.list["+i+"]");
               var studydiv=makestudylist(sl);
               listdiv.appendChild(studydiv);
            }      
            document.getElementById('page').innerHTML=data.page;
         }
      }
   })
}
   
</script>
<style>
 h3{
    margin-top: 10px;
 }
 .pagination{
	margin-top: 10px !important;
	margin-bottom: 10px !important;
}
.btn{
margin-top: 10px !important;
	margin-bottom: 10px !important;	
}
 </style>
</head>
<body id="mimin" class="dashboard" onload="doOnLoad();" style="width:1200px;" >
<%@include file="/header.jsp" %>
<div class="container-fluid mimin-wrapper">
<%@include file="/sidemenu.jsp" %>
<div id="content" class="article-v1">
   <div class="panel" style="width:880px;">
          <div class="panel-body">
            <div class="col-md-12">
                <h3 class="animated fadeInLeft">스터디</h3>
                <p class="animated fadeInDown">
                     스터디<span class="fa-angle-right fa"></span> 리스트
                </p>
            </div>
          </div>
    </div>        
    
   <div class="panel" style="margin-top:20px;width:880px;">

   <div class="panel-header">
   <div  style="padding-top: 10px;margin-left: 500px;">
      <select id="radioitem" style="top:2px;position: relative;"><option value="title">제목</option><option value="theme">주제</option></select> 
      <input type="text" id="key"><input type="button" class="btn btn-primary" onclick="goSearching(1)" value="검색"  style="bottom:1px;position: relative;margin-left: 5px;"></div>
   </div>
   
   <div class="panel-body">
      <table class="table table-striped table-bordered dataTable no-footer">
         <thead>
         <tr>      
         <th class="sorting_asc" width="50" align="center">번호</th><th class="sorting_asc" width="450" align="center">제목</th><th class="sorting_asc" width="100"  align="center">진행</th><th class="sorting_asc" width="100" align="center">생성자</th><th width="150" align="center" class="sorting_asc">날짜</th>
         </tr>
         </thead>
      </table>
   
    <div id="study_list" style="width:850px;"></div>
    <div style="width:850px;">
       <table>
          <tr>      
            <th class="sorting_asc" width="700" align="center" id="page"></th><th width="150" align="center" class="sorting_asc"><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal" style="margin-top: 10px;">스터디 생성</button></th>
         </tr>  
      </table>
        </div>
   </div>
</div>
  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" onclick="reset()">&times;</button>
          <h5 class="modal-title">스터디 등록</h5>
        </div>
        <form class="cmxform" id="signupForm" method="get" action="" name="studyadd">

        <div class="modal-body" style="height: 375px;"> 
          
        <input type="hidden" name="study_id" value="${sessionScope.id }">      
        
        
          <div class="form-group form-animate-text" style="width:300px; float: left;height: 66px;">
              <input type="text" class="form-text" id="validate_study_name" name="study_name" size=27 required>
              <span class="bar"></span>
              <label>스터디 명</label>
         </div>    
         <div class="col-md-6" style="padding-left:80px;padding-bottom:0px;margin-top:5px; float:left;height: 66px;">
         공개 여부
               <div class="form-animate-radio">
                 <label class="radio">
                   <input id="radio1" type="radio" name="study_public" value="0"/>
                   <span class="outer">
                     <span class="inner"></span></span>공개
                   </label>
                      <label class="radio">
                   <input id="radio1" type="radio" name="study_public" value="1"/>
                   <span class="outer">
                     <span class="inner"></span></span>비공개
                   </label>
                 </div>
             </div>
         <div class="form-group form-animate-text" style="float:left;width:150px;">
              <input type="text" class="form-text" id="validate_directory" name="study_directory" size=10 maxlength=3 required="required">
              <span class="bar"></span>
              <label>주제</label>
         </div>  
         
          <div class="form-group form-animate-text" style="float: left; margin-left:20px;">
              <input type="text" class="form-text mask-phone" id="validate_phone" name="study_maxnum" size=7 maxlength="2" required>            
              <span class="bar"></span>
              <label>총인원</label>
         </div> 
      <div id="calen"  class="form-group form-animate-text" style="margin-top:5px !important; float: left; margin-left:10px;">
         <font size="2">종료날짜 </font>
          <input type="text" id="cal_1" name="study_lastday" readonly="readonly" required>
          <span class="bar"></span>
             <label></label>
      </div>   
         
         <div style="width:570px; float: left;">
                 <div class="col-md-12 col-sm-12 col-xs-12 mail-reply">
                <textarea class="summernote" rows="5" role="100" cols="76"  name="study_content" style="resize: none;">스터디 소개</textarea>   
             </div>
          </div>   
       
       </div>   
        <div class="modal-footer">
          <button class="btn btn-default"  onclick="study_add()" >스터디 등록</button>
        </div>
     </form>
      </div>      
    </div>
  </div>

</div>
</div>
<script src="asset/js/jquery.min.js"></script>
<script src="asset/js/jquery.ui.min.js"></script>
<script src="asset/js/bootstrap.min.js"></script>
<!-- plugins -->
<script src="asset/js/plugins/moment.min.js"></script>

<script src="asset/js/plugins/summernote.min.js"></script>
<script src="asset/js/plugins/jquery.nicescroll.js"></script>
<script src="asset/js/plugins/jquery.validate.min.js"></script>

<script src="asset/js/plugins/jquery.mask.min.js"></script>

<script src="asset/js/plugins/nouislider.min.js"></script>
<!-- custom -->
 <script src="asset/js/main.js"></script>
 <script type="text/javascript">
 $(document).ready(function(){      
          $('.summernote').summernote({
            height: 150
          });

    $("#signupForm").validate({
      errorElement: "em",
      errorPlacement: function(error, element) {
        $(element.parent("div").addClass("form-animate-error"));
        error.appendTo(element.parent("div"));
      },
      success: function(label) {
        $(label.parent("div").removeClass("form-animate-error"));
      },
      rules: {
        validate_study_name: "required",
     
        validate_directory: {
          required: true,
          minlength: 2          
        },
        validate_maxnum: {
          required: true,
          minlength: 1          
        },
      },
      messages: {
        validate_study_name: "Please enter your study_name",     
        validate_username: {
          required: "Please enter a username",
          minlength: "Your username must consist of at least 2 characters"
        },
        validate_password: {
          required: "Please provide a password",
          minlength: "Your password must be at least 5 characters long"
        },
        validate_confirm_password: {
          required: "Please provide a password",
          minlength: "Your password must be at least 5 characters long",
          equalTo: "Please enter the same password as above"
        },
        validate_email: "Please enter a valid email address",
        validate_agree: "Please accept our policy"
      }
    });
    $('.mask-phone').mask('00');
  }); 
 </script>


</body>
</html>