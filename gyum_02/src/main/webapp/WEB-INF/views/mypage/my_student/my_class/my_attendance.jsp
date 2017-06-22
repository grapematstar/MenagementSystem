<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<link rel="stylesheet" type="text/css" href="/gyum_02/codebase/fonts/font_roboto/roboto.css"/>
<link rel="stylesheet" type="text/css" href="/gyum_02/codebase/dhtmlxcalendar.css"/>
<script src="/gyum_02/codebase/dhtmlxcalendar.js"></script>
<link rel="stylesheet" type="text/css" href="asset/css/bootstrap.min.css">

<!-- plugins -->
<link rel="stylesheet" type="text/css" href="asset/css/plugins/font-awesome.min.css"/>
<link rel="stylesheet" type="text/css" href="asset/css/plugins/simple-line-icons.css"/>
<link rel="stylesheet" type="text/css" href="asset/css/plugins/mediaelementplayer.css"/>
<link rel="stylesheet" type="text/css" href="asset/css/plugins/animate.min.css"/>
<link rel="stylesheet" type="text/css" href="asset/css/plugins/icheck/skins/flat/red.css"/>
<link href="asset/css/style.css" rel="stylesheet">
<!-- end: Css -->
<link rel="shortcut icon" href="asset/img/logomi.png">

<style>
#calendar {
   border: 1px solid #dfdfdf;
   font-family: Roboto, Arial, Helvetica;
   font-size: 14px;
   color: #404040;         
}
</style>
<script>
var myCalendar;
function modidate(date){
	if(date<10){
		date = '0' + date;
	}
	return date;
}
function doOnLoad() { 
	   var params = new Object();
			params.startdate = 'today';
			if('${childidx}'!=''){
				params.childidx = '${childidx}';
			}
			$.ajax({
				type : "POST",
				url : "my_student_attendance_check.do",
				data : params,
				success : function(args){
					$("#checkthis").html(args);
				},
				error : function(e){
					alert('오류');
				}
			})
			
   myCalendar = new dhtmlXCalendarObject("cal_1");
   myCalendar.attachEvent("onShow", function(){});      
   myCalendar.attachEvent("onHide", function(){
	   var firstdate = document.getElementById('cal_1').value;
	   var lastdate = firstdate;
	   for(var i = 0; i < 6; i++){
		   var lastyear = lastdate.substring(0,4);
		   var lastmonth = lastdate.substring(5,7);
		   var lastday = lastdate.substring(8);
		   lastday = parseInt(lastday)+1;
		   if(lastday==32){
			   lastday = 1;
			   lastmonth = parseInt(lastmonth) + 1;
			   if(lastmonth==13){
				   lastmonth = 1;
				   lastyear = parseInt(lastyear)+1;
			   }
		   }
		   lastdate = lastyear+'-'+lastmonth+'-'+lastday;
		   var temp = new Date(lastdate);
		   lastdate = temp.getFullYear() +'-'+ modidate(temp.getMonth()+1) +'-'+ modidate(temp.getDate());
		   lastday = temp.getDate();
	   }
	   document.getElementById('cal_2').value = lastdate;   
   });         
 
}
$(document).ready(
		function(){
			var params = new Object();
			$("#search").click(
					function(){
						if(document.getElementById('cal_1').value=='') return;
						params.startdate = document.getElementById('cal_1').value;
						if('${childidx}'!=''){
							params.childidx = '${childidx}';
						}
						$.ajax({
							type : "POST",
							url : "my_student_attendance_check.do",
							data : params,
							success : function(args){
								$("#checkthis").html(args);
							},
							error : function(e){
								alert('오류');
							}
						})
					});
		});
</script>
<style>
input {
border:1px solid #f0f3f4 !important;"
}
</style>
</head>
<body id="mimin" class="dashboard" onload="doOnLoad()">
<%@include file="/header.jsp" %>
<div class="container-fluid mimin-wrapper">
<%@include file="/mypage_sidemenu.jsp" %>
<div id="content" class="article-v1">
<div class="panel" style="width: 830px;">
  <div class="panel-body">
    <div class="col-md-12">
        <h3 class="animated fadeInLeft">출결확인</h3>
        <p class="animated fadeInDown">
		          강의목록 <span class="fa-angle-right fa"></span> 출결확인
        </p>
    </div>
  </div>
</div>
<div class="panel " style="width:830px !important;margin-top: 20px;">
  <div class="panel-body">
	<div style="height:50px;" id="calen">
	<input type="text" id="cal_1" name="firstday" readonly>&nbsp;&nbsp;-&nbsp;&nbsp;<input type="text" id="cal_2" name="lastday" readonly>
	&nbsp;<i class="fa fa-search" id="search"></i>
	</div>

<div id="checkthis"></div>
</div></div>
<div style="height: 100px;"></div>
</div>
</div>
</body>
<!-- start: Javascript -->
<script src="asset/js/jquery.min.js"></script>
<script src="asset/js/jquery.ui.min.js"></script>
<script src="asset/js/bootstrap.min.js"></script>


<!-- plugins -->
<script src="asset/js/plugins/moment.min.js"></script>
<script src="asset/js/plugins/icheck.min.js"></script>
<script src="asset/js/plugins/jquery.nicescroll.js"></script>


<!-- custom -->
<script src="asset/js/main.js"></script>
</html>