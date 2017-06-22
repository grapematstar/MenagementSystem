<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
  <style>
  #inp{
     outline: none;
     border: none;
  }
  .tr_w{
      background-color: #fff;
      border:1px solid #e2e2e2 ;
       font-family: 굴림, gulim, helvetica, sans-serif;
   }
   .form-group {
      margin-bottom: 5px;
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
<script>
var i=0
var onoff="";
var cp=1;
function study_recruitlist(cpi){
   document.getElementById("study_recruit_list").innerHTML="";
   if(cpi!=null){
      cp=cpi
   }
   var params="cp="+cp;
    $.ajax({
         type : "GET",
         url : "study_recruitList.do",            
         success:function(data){   
            var listdiv=document.getElementById('study_recruit_list');               
            for(var i=0;i<data.list.length;i++){
               var sl=eval("data.list["+i+"]");
               var study_recruit_div=makestudy_recruit_list(sl);
               listdiv.appendChild(study_recruit_div);
            }   
            document.getElementById('page').innerHTML=data.page;
         }
    });       
}


function makestudy_recruit_list(sl){
   var situ="";
   if(sl.study_recruit_situ==0){
      situ="마감";
   }else{
      situ="진행중";
   }         
   if(sl.study_recruit_onoff==0){
      onoff="온라인";
   }else if(sl.study_recruit_onoff==1){
      onoff="오프라인";
   }else {
      onoff="온오프";
   }   
   var sldiv=document.createElement('div');
   sldiv.setAttribute('id','s'+i);
                    
   sldiv.innerHTML='<table cellspacing="0" class="table-striped table-bordered dataTable no-footer"><tbody><tr><td width="50" >'+sl.study_recruitidx+'</td><td width="450" style="text-align:left;">'+sl.study_recruit_subject+'</td><td width="100" align="center">'+situ+'</td><td width="100" align="center">'+sl.stu_id+'</td><td width="150" align="center">'+sl.study_recruit_writedate+' <a onclick="contentshow('+i+')">▼</a></td></tr></table>'+
               '<table id="content'+i+'" class="table-striped table-bordered dataTable no-footer" style="display:none; "><tr class="tr_w"><td width="150" align="left" style="padding-left:20px;"> 주제  - '+sl.study_recruit_directory+'</td><td width=350></td><td width="150" align="center"> 기간 '+sl.study_recruit_term+' 주 </td><td width="350" align="center"> 총 인원/ 현재인원/ 신청인원  '+sl.study_recruit_maxnum+'명/ '+sl.study_recruit_aceptmem+'명/ '+sl.study_recruit_reqmem+'명</td></tr>'+
               '<tr class="tr_w"><td align="center"> 주 '+sl.study_recruit_weeknum+'회</td><td></td><td></td><td>'+onoff+'활동 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+sl.study_recruit_usetime+'시간 동안 진행</td></tr><tr class="tr_w"><td colspan="4" align="center"><pre>'+sl.study_recruit_content+'</pre></td></tr>';
         if("${sessionScope.id}"!=sl.stu_id){                  
            sldiv.innerHTML+='<table id="content_'+i+'" style="display:none; padding-bottom:7px;"><tr class="tr_w"><td width=650></td><td width=200 align="right" style="padding-right:10px;"><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal2" onclick="inq('+sl.study_recruitidx+',\''+sl.stu_id+'\')">문의</button> <input class="btn btn-primary" type="button" onclick="req('+sl.study_recruitidx+')" value="신청"></td></tr></table>';
            
         }
   i++;
   sldiv.comment=sl;
   sldiv.className="sl";
   return sldiv;
}
function contentshow(num){
   var cs=eval("document.getElementById('content"+num+"')");
   var cs2=eval("document.getElementById('content_"+num+"')");
   if(cs.style.display=="inherit"){
      cs.style.display="none";
      cs2.style.display="none";
   }else{
      cs.style.display="inherit";   
      cs2.style.display="inherit";
   }
}   

function study_recruit_add(){   
   if("${sessionScope.id}"==""){
      alert('로그인이 필요 합니다.');
      return false;
   }
   var study_recruit_subject=document.study_recruit_add_form.study_recruit_subject.value;   
   var study_id=document.study_recruit_add_form.stu_id.value;   
   var study_recruit_maxnum=document.study_recruit_add_form.study_recruit_maxnum.value;   
   var study_recruit_directory=document.study_recruit_add_form.study_recruit_directory.value;   
   var study_recruit_content=document.study_recruit_add_form.study_recruit_content.value;   
   var study_recruit_term=document.study_recruit_add_form.study_recruit_term.value;   
   var study_recruit_onoff=document.study_recruit_add_form.study_recruit_onoff.value;   
   var study_recruit_usetime=document.study_recruit_add_form.study_recruit_usetime.value;   
   var study_recruit_weeknum=document.study_recruit_add_form.study_recruit_weeknum.value;   
   var params="stu_id="+encodeURIComponent(study_id)+"&study_recruit_subject="+encodeURIComponent(study_recruit_subject)+"&study_recruit_term="+encodeURIComponent(study_recruit_term)+"&study_recruit_maxnum="+encodeURIComponent(study_recruit_maxnum)+"&study_recruit_directory="+encodeURIComponent(study_recruit_directory)+"&study_recruit_onoff="+encodeURIComponent(study_recruit_onoff)+"&study_recruit_content="+encodeURIComponent(study_recruit_content)+"&study_recruit_usetime="+encodeURIComponent(study_recruit_usetime)+"&study_recruit_weeknum="+study_recruit_weeknum;
   alert(params);   
   $.ajax({
      type : "GET",
      url : "study_recruitadd.do",
      data : params, 
      error:function (e){
         alert(e.responseText);
      },
      success:function(data){   
         if(data.msg!=null){
            alert(data.msg);
            i=0;      
            document.study_recruit_add_form.study_recruit_subject.value="";
            document.study_recruit_add_form.stu_id.value="";
            document.study_recruit_add_form.study_recruit_maxnum.value="";
            document.study_recruit_add_form.study_recruit_directory.value="";
            document.study_recruit_add_form.study_recruit_content.value="";
            document.study_recruit_add_form.study_recruit_term.value="";
            document.study_recruit_add_form.study_recruit_onoff.value="";
            document.study_recruit_add_form.sutdy_recruit_usetime.value=""; 
            document.study_recruit_add_form.study_recruit_weeknum.value="";
            document.getElementById("study_recruit_list").innerHTML="";
            study_recruitlist();
         }
      }      
   });
}
var study_recruitidx=0;

function inq(idx,stuid){   
   study_recruitidx=idx;
   document.study_recruit_inq_form.study_inq_reciver.value=stuid;
}

function req(idx){
   if("${sessionScope.id }"==""){
      alert("로그인 후 이용가능합니다.");
      return false;
   }
   var params="study_recruitidx="+idx;
   $.ajax({
      type : "GET",
      url : "study_req_add.do",
      data : params, 
      error:function (e){
         alert(e.responseText);
      },
      success:function(data){   
         alert(data.msg);
         
      }
   });   
}
function study_inq_add(){
   if("${sessionScope.id }"==""){
      alert("로그인 후 이용가능합니다.");
      return false;
   }
   var study_inq_reciver=document.study_recruit_inq_form.study_inq_reciver.value;
   var study_inq_sender=document.study_recruit_inq_form.study_inq_sender.value;   
   var study_inq_content=document.study_recruit_inq_form.study_inq_content.value;
   var params="study_recruitidx="+study_recruitidx+"&study_inq_reciver="+encodeURIComponent(study_inq_reciver)+"&study_inq_sender="+encodeURIComponent(study_inq_sender)+"&study_inq_content="+encodeURIComponent(study_inq_content);
   $.ajax({
      type : "GET",
      url : "study_recruit_inq.do",
      data : params, 
      error:function (e){
         alert(e.responseText);
      },
      success:function(data){   
         if(data.msg!=null){
            alert(data.msg);
         }
         document.study_recruit_inq_form.study_inq_content.value="";
      }
   });
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
      type:"get",url:"goSearching_recruit.do",data:params,
      success:function(data){
         var listdiv=document.getElementById('study_recruit_list');   
         listdiv.innerHTML="";
         if(data.list.length==0){
            alert("검색결과가 없습니다");
            location.reload();
         }else{
            for(var i=0;i<data.list.length;i++){
               var sl=eval("data.list["+i+"]");
               var studydiv=makestudy_recruit_list(sl);
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
 select{
 padding:5px;
 }
 </style>
</head>

<body id="mimin" class="dashboard" onload="study_recruitlist()" style="width:1200px;" >
<%@include file="/header.jsp" %>
<div class="container-fluid mimin-wrapper">
<%@include file="/sidemenu.jsp" %>
<div id="content" class="article-v1">
   <div class="panel" style="width:880px;">
          <div class="panel-body">
            <div class="col-md-12">
                <h3 class="animated fadeInLeft">스터디</h3>
                <p class="animated fadeInDown">
                     스터디<span class="fa-angle-right fa"></span> 모집
                </p>
            </div>
          </div>
    </div>        
   


   <div class="panel" style="margin-top:20px;width:880px;">
   
   <div  style="padding-top: 10px;margin-left: 500px;">
      <select id="radioitem" style="top:2px;position: relative;"><option value="title">제목</option><option value="theme">주제</option></select> 
      <input type="text" id="key"><input type="button" class="btn btn-primary" onclick="goSearching(1)" value="검색"  style="bottom:1px;position: relative;margin-left: 5px;">
   </div>

   <div class="panel-body">
      <table class="table table-striped table-bordered dataTable no-footer">
         <thead>
         <tr>      
         <th class="sorting_asc" width="50" align="center">번호</th><th class="sorting_asc" width="450" align="center">제목</th><th class="sorting_asc" width="100"  align="center">진행</th><th class="sorting_asc" width="100" align="center">생성자</th><th width="150" align="center" class="sorting_asc">날짜</th>
         </tr>
         </thead>
      </table>   
       <div id="study_recruit_list" style="width:850px;"></div>
       <div style="width:850px;">
          <table>
          <tr>                                                                                                                   
            <th class="sorting_asc" width="700" align="center" id="page"></th><th width="150" align="center" class="sorting_asc"><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal" style="margin-top: 10px;">스터디모집 등록</button></th>
         </tr>  
         </table>
       </div>
   </div>
   </div>

  <!-- Modal_1 -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">스터디 모집 등록</h4>
        </div>
       <form name="study_recruit_add_form" class="cmxform" id="signupForm"  method="get" action="">
        <div class="modal-body" style="height: 400px;"> 
        <input type="hidden" name="stu_id" value="${sessionScope.id }">   
        
        
            <div class="form-group form-animate-text" style="width:300px; float: left;height: 66px;">
              <input type="text" class="form-text" id="study_recruit_subject"  name="study_recruit_subject" size=27 required>
              <span class="bar"></span>
              <label>스터디 명</label>
         </div> 
        
        <div class="form-group form-animate-text" style="float:left;width:120px;margin-left:10px;">
              <input type="text" class="form-text" id="study_recruit_directory" name="study_recruit_directory" size=5 maxlength=3 required="required">
              <span class="bar"></span>
              <label>주제</label>
         </div> 
        <div class="form-group form-animate-text" style="float: left; margin-left:10px;">
              <input type="text" class="form-text mask-phone" id="study_recruit_maxnum" name="study_recruit_maxnum" size=5 maxlength="2" required>            
              <span class="bar"></span>
              <label>총인원</label>
         </div> 
         <div style="float: left">
               모임장소 <select name="study_recruit_onoff" style="margin-right: 20px;"><option value=0>온라인</option><option value=1>오프라인</option><option value=2>둘다 운용</option></select>         
       
                기간 <select name="study_recruit_term" style="margin-left: 10px;"> <option value=1 selected="selected">1주</option><option value=2>2주</option><option value=3>3즈</option><option value=4>4주</option><option value=5>5주</option>
           <option value=6>6주</option><option value=7>7주</option><option value=8>8주</option><option value=9>9주</option><option value=10>10주</option><option value=0>그이상</option> </select> 
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;주 <select name="study_recruit_weeknum" style="margin-right:10px;" ><option value=1 selected="selected">1회</option><option value=2>2회</option><option value=3>3회</option><option value=4>4회</option><option value=5>5회</option>
           <option value=6>6회</option><option value=7>7</option></select> 
   
            모임시간<select name="study_recruit_usetime">
            <option value=1>1시간</option><option value=2>2시간</option><option value=3>3시간</option><option value=4>4시간</option>
            </select>
         </div>
         
         <div style="width:570px; float: left; margin-top: 10px;">
                 <div class="col-md-12 col-sm-12 col-xs-12 mail-reply">
                <textarea class="summernote" rows="5" role="100" cols="76"  name="study_recruit_content" style="resize: none;">스터디 소개</textarea>   
             </div>
          </div>      
        </div>
        <div class="modal-footer">
          <button class="btn btn-default"  onclick="study_recruit_add()">스터디 등록</button>
        </div>
      </form>
      </div>      
    </div>
  </div>
  
   <!-- Modal_2 -->
  <div class="modal fade" id="myModal2" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">스터디 문의</h4>
        </div>
       <form name="study_recruit_inq_form">
        <div class="modal-body"> 
        <table >
        <tr><td colspan="6">받는 사람<input id="inp" type="text" name="study_inq_reciver" size="10" readonly="readonly" style="margin-right: 130px;">  신청자 <input id="inp" type="text" name="study_inq_sender" value="${sessionScope.id }" readonly="readonly">   </td></tr>       
        <tr>        
             <td style="padding: 0px !important;">
             
              <div style="width:570px; float: left; margin-top: 10px;">
                 <div class="col-md-12 col-sm-12 col-xs-12 mail-reply">
                <textarea class="summernote" rows="5" role="100" cols="76" name="study_inq_content" style="resize: none;"></textarea>   
             </div>
          </div>    
          </td>
        </tr>
        </table>
        </div>
        <div class="modal-footer">
          <input type="button" class="btn btn-default" data-dismiss="modal" onclick="study_inq_add()" value="문의 하기">
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
 <style>
#note-codable{
   display: none;
}
 
 </style>
</body>
</html>