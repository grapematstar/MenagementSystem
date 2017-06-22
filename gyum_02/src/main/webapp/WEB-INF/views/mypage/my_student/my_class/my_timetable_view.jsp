<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>Insert title here</title>
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
	width:1000px;
}
#timetable td{
	width: 100px;
	height: 55px;
}
</style>
<script>
var timetable = new Array();
window.onload = function setTimetable(){
	
	for(var i = 0; i < 7; i++){
		timetable[i] = new Array();
	}
	//my class
	var ttstr = '${ttstr}';
	var str = ttstr.split(',');
	for(var i = 0; i < str.length-1; i++){
		var setstr = str[i].split('/');
		document.getElementById(setstr[1]+setstr[2]).innerHTML = setstr[3];
		timetable[getDay(setstr[1])][setstr[2]] = setstr[0];
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
        <h3 class="animated fadeInLeft">강의시간표</h3>
        <p class="animated fadeInDown">
		          강의목록 <span class="fa-angle-right fa"></span> 강의시간표 보기
        </p>
    </div>
  </div>
</div>
<div class="panel " style="width:1030px !important;margin-top: 20px;">
  <div class="panel-body">
<table id="timetable" class="table table-striped table-bordered dataTable no-footer">
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
			<td id="MON${time }"></td>
			<td id="TUE${time }"></td>
			<td id="WED${time }"></td>
			<td id="THU${time }"></td>
			<td id="FRI${time }"></td>
			<td id="SAT${time }"></td>
			<td id="SUN${time }"></td>
		</tr>
	</c:forEach>
	</tbody>
</table>
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