<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="description" content="Miminium Admin Template v.1">
	<meta name="author" content="Isna Nur Azis">
	<meta name="keyword" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Miminium</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="codebase/fonts/font_roboto/roboto.css" />
<link rel="stylesheet" type="text/css"
	href="codebase/dhtmlxcalendar.css" />
<script src="codebase/dhtmlxcalendar.js"></script>

 <!-- start: Css -->
  <link rel="stylesheet" type="text/css" href="asset/css/bootstrap.min.css">

  <!-- plugins -->
  <link rel="stylesheet" type="text/css" href="asset/css/plugins/font-awesome.min.css"/>
  <link rel="stylesheet" type="text/css" href="asset/css/plugins/simple-line-icons.css"/>
  <link rel="stylesheet" type="text/css" href="asset/css/plugins/jquery.steps.css"/>
  <link rel="stylesheet" type="text/css" href="asset/css/plugins/animate.min.css"/>
  <link href="asset/css/style.css" rel="stylesheet">
  <!-- end: Css -->

  <link rel="shortcut icon" href="asset/img/logomi.png">
  <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
      <![endif]-->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>
#calendar {
border: 1px solid #dfdfdf;
font-family: Roboto, Arial, Helvetica;
font-size: 14px; color: #404040;         
}   
</style>  
<title>Insert title here</title>
<script>
var myCalendar;      
function doOnLoad() {      
   myCalendar1 = new dhtmlXCalendarObject("cal_1");
   myCalendar1.attachEvent("onShow", function(){
      
   });      
   myCalendar1.attachEvent("onHide", function(){});   
   
   myCalendar2 = new dhtmlXCalendarObject("cal_2");
   myCalendar2.attachEvent("onShow", function(){
      
   });      
   myCalendar1.attachEvent("onHide", function(){});  
}
</script>
<script>
function submitON(){
	var class_startdatenum = new Array();
	class_startdatenum=document.getElementById("cal_1").value;
	var class_startdate=class_startdatenum.replace(/-/g,'');
	document.getElementById("cal_1").value=class_startdate;
	
	var class_enddatenum = new Array();
	class_enddatenum=document.getElementById("cal_2").value;
	var class_enddate=class_enddatenum.replace(/-/g,'');
	document.getElementById("cal_2").value=class_enddate;
	var formID=document.getElementById('submitClassWrite');
	
	formID.submit();
}
</script>
</head>
<body id="mimin" class="dashboard" onload="doOnLoad()">
<%@include file="/header.jsp"%>
<div class="container-fluid mimin-wrapper">
	<%@include file="/mypage_sidemenu.jsp"%>
<div id="content" class="article-v1">
	
			<div class="panel " style="width: 880px;">
				<div class="panel-body">
					<div class="col-md-12">
						<h2 class="animated fadeInLeft">강의 개설창</h2>
						<p class="animated fadeInDown">자신의 강의를 개설하는 곳입니다.</p>
					</div>
				</div>
			</div>
			
					<div class="panel" style="width: 880px;margin-top: 20px;">
						<div class="panel-body">
				
							<div class="responsive-table">
<h2>강의 개설창</h2>
<form name="class_write" id="submitClassWrite" action="open_lecture.do">
	<table class="table table-striped table-bordered" width="100%"
									cellspacing="0">
		<tr>
			<th>과목</th>
			<td>
				<select name="subject_num" id="subject_num" class="form-control">
					<option value="0">과목 선택</option>
					<option value="1">국어</option>
					<option value="2">영어</option>
					<option value="3">수학</option>
					<option value="4">사회</option>
					<option value="5">과학</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>개강날짜</th>
			<td style="position:relative; height:10px;" id="calen">
				<input type="text" id="cal_1" name="class_startdate">
			</td>
		</tr>
		<tr>
			<th>종강날짜</th>
			<td style="position:relative; height:10px;" id="calen">
				<input type="text" id="cal_2" name="class_enddate">
			</td>
		</tr>
		<tr>
			<th>강의실</th>
			<td>
				<select name="classroom" id="classroom" class="form-control">
					<option value="0">강의실 선택</option>
					<option value="101">강의실 101호</option>
					<option value="102">강의실 102호</option>
					<option value="103">강의실 103호</option>
					<option value="201">강의실 201호</option>
					<option value="202">강의실 202호</option>
					<option value="203">강의실 203호</option>
					<option value="301">강의실 301호</option>
					<option value="302">강의실 302호</option>
					<option value="303">강의실 303호</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>강의 요일</th>
			<td>
				<select name="class_day" id="class_day" class="form-control">
					<option value="요일없음">요일 선택</option>
					<option value="월요일">월요일</option>
					<option value="화요일">화요일</option>
					<option value="수요일">수요일</option>
					<option value="목요일">목요일</option>
					<option value="금요일">금요일</option>
					<option value="토요일">토요일</option>
					<option value="일요일">일요일</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>강의 시간</th>
			<td>
				<select name="class_time" id="class_time" class="form-control">
					<option value="0">시간 선택</option>
					<option value="1">9:00 ~ 9:50</option>
					<option value="2">10:00 ~ 10:50</option>
					<option value="3">11:00 ~ 11:50</option>
					<option value="4">12:00 ~ 12:50</option>
					<option value="5">13:00 ~ 13:50</option>
					<option value="6">14:00 ~ 14:50</option>
					<option value="7">15:00 ~ 15:50</option>
					<option value="8">16:00 ~ 16:50</option>
					<option value="9">17:00 ~ 17:50</option>
					<option value="10">18:00 ~ 18:50</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>강의 제목</th>
			<td><input type="text" name="class_subject"></td>
		</tr>
		<tr>
			<th>강사 인덱스</th>
			<td><input type="text" name="tea_idx" value="${sessionScope.idx}"></td>
		</tr>
		<tr>
			<th>수강료</th>
			<td><input type="number" name="class_price"></td>
		</tr>
		<tr>
			<th>최대 수강생</th>
			<td><input type="number" name="class_max_student"></td>
		</tr>
		<tr>
			<td colspan="2" align="center"><input type="button" class=" btn btn-raised btn-primary" value="강의 개설" onclick="submitON()">&nbsp;<input type="reset" class=" btn btn-raised btn-primary" value="다시 작성"></td>
		</tr>
	</table>
</form>
</div>
</div>
</div>
</div>
</div>

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
	<script>
var myCalendar;      
function doOnLoad(){     
   myCalendar1 = new dhtmlXCalendarObject("cal_1");
   myCalendar1.attachEvent("onShow", function(){
      
   });      
   myCalendar1.attachEvent("onHide", function(){});   
   
   myCalendar2 = new dhtmlXCalendarObject("cal_2");
   myCalendar2.attachEvent("onShow", function(){
      
   });      
   myCalendar2.attachEvent("onHide", function(){});  
}
</script>
</body>
</html>