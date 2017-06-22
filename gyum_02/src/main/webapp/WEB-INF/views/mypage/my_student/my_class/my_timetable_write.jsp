<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
#timetable{
	width: 1000px;
}
#timetable th{
	height: 35px;
}
#timetable td{
	width: 100px;
	height: 55px;
}
#classListAll{
	width: 1000px;
	height: 250px;
	overflow: auto;
}
#classListAlltable{
	width: 980px;
}
#classListAlltable thead th{
	text-align:center;
	height: 40px;
}
</style>
<script>
var timetable = new Array();
var myclass = new Array();
window.onload = function setTimetable(){
	
	for(var i = 0; i < 7; i++){
		timetable[i] = new Array();
	}
	for(var i = 0; i < 7; i++){
		myclass[i] = new Array();
	}
	//my timetable
	var ttstr = '${ttstr}';
	var str = ttstr.split(',');
	for(var i = 0; i < str.length-1; i++){
		var setstr = str[i].split('/');
		document.getElementById(setstr[1]+setstr[2]).innerHTML = setstr[3];
		timetable[getDay(setstr[1])][setstr[2]] = setstr[0];
	}
	
	//my class
	var classstr = '${classstr}';
	var str2 = classstr.split(',');
	for(var i = 0; i < str2.length-1; i++){
		var setstr2 = str2[i].split('/');
		document.getElementById(setstr2[1]+setstr2[2]).innerHTML = '<b>'+setstr2[3]+'</b>';
		document.getElementById(setstr2[1]+setstr2[2]).style = 'color: black;';
		myclass[getDay(setstr2[1])][setstr2[2]] = setstr2[0];
	}
}
function getDay(day){
	var daynum = 0;
	switch(day){
	case 'MON': daynum = 0; break;
	case 'TUE': daynum = 1; break;
	case 'WED': daynum = 2; break;
	case 'THU': daynum = 3; break;
	case 'FRI': daynum = 4; break;
	case 'SAT': daynum = 5; break;
	case 'SUN': daynum = 6; break;
	}
	return daynum;
}
function makeTimetable(getday, gettime, subject, classidx){

	var day = '';
	var daynum = 0;
	
	switch(getday){
	case '월요일' : day = 'MON'; break;
	case '화요일' : day = 'TUE'; daynum = 1; break;
	case '수요일' : day = 'WED'; daynum = 2; break;
	case '목요일' : day = 'THU'; daynum = 3; break;
	case '금요일' : day = 'FRI'; daynum = 4; break;
	case '토요일' : day = 'SAT'; daynum = 5; break;
	case '일요일' : day = 'SUN'; daynum = 6; break;
	}
	
	var dat = day+gettime;
	
	if(myclass[daynum][gettime] != '' && myclass[daynum][gettime] != null){
		alert('선택한 시간에 이미 강의를 듣고 있습니다');
		return;
	}
	
	if(document.getElementById(dat).innerHTML==subject){
		document.getElementById(dat).innerHTML = '';
		timetable[daynum][gettime] = '';
	}else if(document.getElementById(dat).innerHTML!=''){
		if(confirm('같은 시간에 이미 강의가 있습니다. 변경하시겠습니까?')){
			document.getElementById(dat).innerHTML = subject;
			timetable[daynum][gettime] = classidx;
		}
	}else{
		document.getElementById(dat).innerHTML = subject;
		timetable[daynum][gettime] = classidx;
		
	}
	
}
function saveTimetable(){
	var params = new Object();
	var tt = '';
	for(var i = 0; i < 7; i++){
		for(var j = 1; j <= 12; j++){
			if(timetable[i][j]){
				tt += timetable[i][j]+',';
			}
		}
	}
	params.timetable = tt;
	$.ajax({
		type : "POST",
		url : "my_student_timetable_save.do",
		data : params,
		success : function(args){
			alert('저장되었습니다');
		},
		error : function(e){
			alert('오류');
		}
	})
}
function deleteclass(day, time){
	
	if(myclass[getDay(day)][time] != null && myclass[getDay(day)][time] != ''){
		return;
	}
	document.getElementById(day+time).innerHTML = '';
	timetable[getDay(day)][time] = '';
}
function search(){
	var params = new Object();
	params.search = document.getElementById('searchbox').value;
	$.ajax({
		type : "POST",
		url : "my_student_timetable_search.do",
		data : params,
		success : function(args){
			$("#classListAll").html(args);
		},
		error : function(e){
			alert('오류');
		}
	})
}
</script>
</head>
<body id="mimin" class="dashboard">
<%@include file="/header.jsp" %>
<div class="container-fluid mimin-wrapper">
<%@include file="/mypage_sidemenu.jsp" %>
<div id="content" class="article-v1">
<div class="panel " style="width:1030px !important;">
  <div class="panel-body">
    <div class="col-md-12">
        <h3 class="animated fadeInLeft">강의시간표 작성</h3>
        <p class="animated fadeInDown">
		          강의목록 <span class="fa-angle-right fa"></span> 강의시간표 작성
        </p>
    </div>
  </div>
</div>
<div class="panel " style="width:1030px !important;margin-top: 20px;">
  <div class="panel-body">
<table id="timetable">
	<thead>
		<tr>
			<th></th>
			<th>MON</th>
			<th>TUE</th>
			<th>WED</th>
			<th>THU</th>
			<th>FRI</th>
			<th>SAT</th>
			<th>SUN</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach var="time" begin="1" end="12" step="1">
		<tr>	
			<td>${time }</td>
			<td id="MON${time }" onclick="deleteclass('MON','${time }')"></td>
			<td id="TUE${time }" onclick="deleteclass('TUE','${time }')"></td>
			<td id="WED${time }" onclick="deleteclass('WED','${time }')"></td>
			<td id="THU${time }" onclick="deleteclass('THU','${time }')"></td>
			<td id="FRI${time }" onclick="deleteclass('FRI','${time }')"></td>
			<td id="SAT${time }" onclick="deleteclass('SAT','${time }')"></td>
			<td id="SUN${time }" onclick="deleteclass('SUN','${time }')"></td>
		</tr>
	</c:forEach>
	</tbody>
</table>
<div style="text-align: right; width:1000px; margin-top: 5px;">
<input type="button" class="btn btn-primary" value="저장하기" onclick="saveTimetable()">
<input type="button" class="btn btn-default" value="원래대로" onclick="location.reload();">
</div>
<div></div></div></div>
<div class="panel " style="width:1030px !important;margin-top: 20px;">
  <div class="panel-body">
<input type="text" id="searchbox" maxlength="20" class="form-control border-bottom" style="border:1px solid #f0f3f4 !important;">&nbsp;<i class="fa fa-search" onclick="search()"></i>

<div id="classListAll">
<table id="classListAlltable">
	<thead>
		<tr>
			<th>번호</th>
			<th>과목</th>
			<th>강의</th>
			<th>강사</th>
			<th>강의실</th>
			<th>요일</th>
			<th>시간</th>	
			<th>개강</th>	
			<th>종강</th>				
		</tr>
	</thead>
	<tbody>
	<c:forEach var="dto" items="${list }">
		<tr>
			<td>${dto.class_idx }</td>
			<td>${dto.subject_num }</td>
			<td onclick="makeTimetable('${dto.class_day}',${dto.class_time },'${dto.class_subject }', '${dto.class_idx }')">${dto.class_subject }</td>
			<td>${dto.tea_name }</td>
			<td>${dto.classroom }</td>
			<td>${dto.class_day }</td>
			<td>${dto.class_time }교시</td>
			<td>${dto.class_startdate }</td>
			<td>${dto.class_enddate }</td>
		</tr>
	</c:forEach>
	</tbody>
</table>
</div>
</div></div>
<div style="height:100px;"></div>
</div></div>

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