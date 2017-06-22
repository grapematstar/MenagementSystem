<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<link rel="stylesheet" type="text/css" href="codebase/fonts/font_roboto/roboto.css"/>
<link rel="stylesheet" type="text/css" href="codebase/dhtmlxcalendar.css"/>
<script src="codebase/dhtmlxcalendar.js"></script>
<style>
#calendar {
border: 1px solid #dfdfdf;
font-family: Roboto, Arial, Helvetica;
font-size: 14px; color: #404040;         
}   
</style>  
<title>Insert title here</title>

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
	var formID=document.getElementById('submitClassUpdate');
	
	formID.submit();
}
</script>
<script>
function back(){
	location.href='class_check.do';
}
</script>
</head>
<h2>결과조회 content</h2>
<c:set var="dto" value="${dto}"></c:set>
<body onload="doOnLoad()">
<form class="table table-striped table-bordered" width="100%"
									cellspacing="0" name="class_Update" id="submitClassUpdate" action="class_Update.do">
<table border="1" cellspacing="0">
	<tr>
		<th>강사명</th>
		<td>
			<input type="text" name="tea_name" value="${dto.tea_name }" readonly>
			<input type="hidden" name="class_idx" value="${dto.class_idx }">
		</td>
	</tr>
	<tr>
		<th>강의제목</th>
		<td><input type="text" name="class_subject" value="${dto.class_subject }"></td>
	</tr>
	<tr>
		<th>과목</th>
		<td>
			<select name="subject_num" id="subject_num">
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
		<th>강의실</th>
		<td>
			<select name="classroom" id="classroom">
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
		<th>개강날짜</th>
		<td style="position:relative; height:10px;" id="calen">
			<input type="text" id="cal_1" name="class_startdate" value="${dto.class_startdate }">
		</td>
	</tr>
	<tr>
		<th>종강날짜</th>
		<td style="position:relative; height:10px;" id="calen">
			<input type="text" id="cal_2" name="class_enddate" value="${dto.class_enddate }">
		</td>
	</tr>
	<tr>
		<th>강의요일</th>
		<td>
			<select name="class_day" id="class_day">
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
		<th>강의시간</th>
		<td>
			<select name="class_time" id="class_time">	
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
		<th>수강료</th>
		<td><input type="number" name="class_price" value="${dto.class_price }"></td>
	</tr>
	<tr>
		<th>최대수강생</th>
		<td><input type="number" name="class_max_student" value="${dto.class_max_student }"></td>
	</tr>
	<tr>
		<td colspan="2"><input type="button" value="수정" onclick="submitON()"><input type="button" value="닫기" onclick="back()"></td>
	</tr>
</table>
</form>
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
   myCalendar1.attachEvent("onHide", function(){});  
	document.getElementById('subject_num').value='${dto.subject_num }';
	document.getElementById('class_day').value='${dto.class_day }';
	document.getElementById('class_time').value='${dto.class_time }';
	document.getElementById('classroom').value='${dto.classroom }';
}
</script>
</body>
</html>