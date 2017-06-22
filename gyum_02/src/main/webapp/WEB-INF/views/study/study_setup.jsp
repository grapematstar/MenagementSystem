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
var today = new Date();
var strDateSetting = function (date) {
	var date_str = new Date(date);
	return date_str.getFullYear()+"" +
		((date_str.getMonth()+1)>=10?(date_str.getMonth()+1):("0"+(date_str.getMonth()+1)))+
		""+(date_str.getDate()>=10?date_str.getDate():("0"+date_str.getDate()));
}
var today_study=strDateSetting(today);

var myCalendar;
var cal_check=0;
var s_last_day="${createSlist.study_lastday }";
function doOnLoad() {		
	var msg="${msg}";		
	if(msg!=""){			
		alert("${msg}");
		msg="";
	}
	
	myCalendar = new dhtmlXCalendarObject("cal_1");
	myCalendar.attachEvent("onShow", function(){	
		/* alert(s_last_day);
 		calren(); */ 
	});		
	myCalendar.attachEvent("onHide", function(){
	
		
	});			
}
/* function  calren(){
	var cal_input=document.getElementById("cal_1");	
	var cal_s=cal_input.value;
	var cal_value=cal_s.substring(0,4)+cal_s.substring(5,7)+cal_s.substring(8,10);	
	if(today_study<cal_value){
		
	}else{
		cal_s=s_last_day;
	}
	if(cal_check==0){
		setTimeout(calren(),"1000");
	}
}
 */


function bbsname_add(){
	var newbbsdiv=document.getElementById('newbbsname');					
		var bbsnamediv=makebbsnameadd();
		newbbsdiv.appendChild(bbsnamediv);
}	

var i=0;
function makebbsnameadd(){
	var nbdiv=document.createElement('div');
	nbdiv.setAttribute('id','nb'+i);
	var numid="nb"+i;	
	nbdiv.innerHTML='<input type="text" size=50 id="bbsname'+i+'" name="bbsnameStudyDTO['+i+'].study_bbsname"><input style="margin-left:20px;" type="button" class="btn btn-default" onclick="inputdel('+i+')" value="지우기">';
	i++;
	/* nbdiv.comment=nb; */
	nbdiv.className="nb";
	return nbdiv;
}
function inputdel(b){	
	var inputvalue=eval("document.getElementById('bbsname"+b+"')");
	inputvalue.value="";	
	var inputdiv=eval("document.getElementById('nb"+b+"')");
	inputdiv.style.display="none";	
}
function bbsname_modi(){
	var params="";
	for(j=0;j<i;j++){
	  	var iv=eval("document.getElementById('bbsname"+j+"')");
	  	var ivalue=iv.value;
		params+="bbsnameStudyDTO["+j+"].study_bbsname="+encodeURIComponent(ivalue); 
		if((j-1)==i){
			
		}else{
			params+="&";	
		} 
	}
	console.log('params : '+params);
	$.ajax({
		type : "GET",
		url : "studybbsnameadd.do",
		data : params, 
		error:function (e){
			alert(e.responseText);
		},
		success:function(data){	
			if(data.msg!=null){
				alert(data.msg);
				i=0;		
				document.getElementById("newbbsname").innerHTML="";				
				location.reload(); 
			}
		}
	});
	
}
function bbsname_del(name,ref){
	if(ref==1){
		alert('기본게시판은 삭제 할수 없습니다.');
		return false;
	}
	var params="study_bbsname="+encodeURIComponent(name)+"&"+"study_bbsref="+ encodeURIComponent(ref);
	console.log(params);
	$.ajax({
		type : "GET",
		url : "studybbsnamedel.do",
		data : params, 
		error:function (e){
			alert(e.responseText);
		},
		success:function(data){	
			if(data.msg!=null){
				alert(data.msg);
				i=0;		
				document.getElementById("newbbsname").innerHTML="";
				location.reload();
			}
		}
	});
}
function memberchange(){
	location.href="study_memberchangego.do";
}


function study_modi(){
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
	alert(params); 
	$.ajax({
		type : "GET",
		url : "studymodi.do",
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
</script>  
  <style>
  p{
  	margin: 0;
  }
  .panel-heading{
  	background-color: #f9f9f9 !important;
  }
  .study_info{
  	background-color: white;
  }
  </style>
</head>
<body id="mimin" class="dashboard" onload="doOnLoad() ">
<%@include file="/header.jsp" %>
<div class="container-fluid mimin-wrapper">
<%@include file="study_insidebar.jsp" %>
<div id="content" class="article-v1">



  <div class="panel" style="width:880px;">
          <div class="panel-body">
            <div class="col-md-12">
                <h3 class="animated fadeInLeft">${createSlist.study_subject}</h3>      
                  <p class="animated fadeInDown" style="width:860px;">
	        	${createSlist.study_content}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 생성날짜 : ${createSlist.study_createdate }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 종료 날짜 : ${createSlist.study_lastday }
	    		 </p>         
            </div>
     </div>
</div>

<div class="panel panel-default" style="width:880px;margin-top: 20px;" >
          <div class="panel-heading">
          <h5>조원 </h5>
          </div>
          <div class="panel-body">
            <div class="col-md-12">      
              <h5 class="animated fadeInLeft" style="float: left;">팀장 ${leaderSlist.study_leader } &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 부팀장 ${leaderSlist.study_seconleader}</h5>                
                 
	        	<table class="study_info" style="float: left;"><tr>	<c:forEach var="mem" items="${memberSlist}" varStatus="count"><td>${mem.stu_id} </td><c:if test="${count.index%7==0&&count.index>1 }"></c:if> </c:forEach><td><input style="margin-left: 570px;float: left;" type="button" class="btn btn-primary" onclick="memberchange()"value="조원 변경"> </td> </tr></table>
            </div>
     </div>
</div>

<div class="panel panel-default" style="width:880px;margin-top: 20px;" >
          <div class="panel-heading">
          <h5>정보</h5>
          </div>
          <div class="panel-body">
            <table class="study_info">
		           <tr>
		           	<th width=75>주제</th><th width=150>${createSlist.study_directory }</th><th width=75>인원</th><th width=75>${createSlist.study_maxnum} / ${nownum}</th> <th width=75><c:if test="${createSlist.study_public==0 }">공개</c:if>	<c:if test="${createSlist.study_public==1 }">비공개</c:if></th><th>종료 날짜 : ${createSlist.study_lastday }</th><th> <button class="btn btn-primary" style="margin-left:140px;" data-toggle="modal" data-target="#myModal3">정보 변경 </button> </th>
		           	
		           	
		           </tr>
            </table>
     </div>
</div>

<div class="panel panel-default" style="width:880px;margin-top: 20px;" >
	<div class="panel-heading">
		<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">게시판 설정</button>
	</div>
</div>
	
  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">게시판 설정</h4>
        </div>
       <form name="bbsnameadd">
        <div class="modal-body">
        <c:if test="${empty bbsnameSlist}"></c:if>               
		<c:forEach var="bbsname" items="${bbsnameSlist}"><div style="margin-bottom: 10px;">${bbsname.study_bbsname} <input style="margin-left:20px;" type="button" class="btn btn-default" data-dismiss="modal" onclick="bbsname_del('${bbsname.study_bbsname}',${bbsname.study_bbsref} )" value="삭제하기"></div></c:forEach>
		<div id="newbbsname"></div>	
		<div style="padding-top: 10px;">
		<input type="button" class="btn btn-default" onclick="bbsname_add()" value="추가하기">
		</div>
        </div>
        <div class="modal-footer">
          <input type="button" class="btn btn-default" data-dismiss="modal" onclick="bbsname_modi()" value="게시판 변경 완료">
        </div>
      </form>
      </div>
      
    </div>
  </div>
  
  
  
  
  
  <div class="modal fade" id="myModal3" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" onclick="reset()">&times;</button>
          <h5 class="modal-title">스터디 수정</h5>
        </div>
        <form class="cmxform" id="signupForm" method="get" action="" name="studyadd">

        <div class="modal-body" style="height: 375px;"> 
          
        <input type="hidden" name="study_id" value="${sessionScope.id }">      
        
        
          <div class="form-group form-animate-text" style="width:300px; float: left;height: 66px;">
              <input type="text" class="form-text" id="validate_study_name" name="study_name" size=27 required value="${createSlist.study_subject}">
              <span class="bar"></span>
              <label>스터디 명</label>
         </div> 	
			<div class="col-md-6" style="padding-left:80px;padding-bottom:0px;margin-top:5px; float:left;height: 66px;">
			공개 여부
	            <div class="form-animate-radio">
	              <label class="radio">
	                <input id="radio1" type="radio" name="study_public" value="0" checked/>
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
              <input type="text" class="form-text" id="validate_directory" name="study_directory" size=10 maxlength=3 required="required" value="${createSlist.study_directory }">
              <span class="bar"></span>
              <label>주제</label>
         </div>  
         
          <div class="form-group form-animate-text" style="float: left; margin-left:20px;">
              <input type="text" class="form-text mask-phone" id="validate_phone" name="study_maxnum" size=7 maxlength="2" required value="${createSlist.study_maxnum} ">            
              <span class="bar"></span>
              <label>총인원</label>
         </div> 
		<div id="calen"  class="form-group form-animate-text" style="margin-top:5px !important; float: left; margin-left:10px;">
			<font size="2">종료날짜 </font>
			 <input type="text" id="cal_1" name="study_lastday" readonly="readonly" required value="${createSlist.study_lastday }">
			 <span class="bar"></span>
             <label></label>
		</div>	
			
			<div style="width:570px; float: left;">
	       		 <div class="col-md-12 col-sm-12 col-xs-12 mail-reply">
				    <textarea class="summernote" rows="5" role="100" cols="76"  name="study_content" style="resize: none;">${createSlist.study_content}</textarea>   
				 </div>
	       </div>	
		 
       </div>	
        <div class="modal-footer">
          <button class="btn btn-default"  onclick="study_modi()" >스터디 변경</button>
        </div>
     </form>
      </div>      
    </div>
  </div>
  
  
</div></div>
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