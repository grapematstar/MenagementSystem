<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<script src="/gyum_02/build/js/httpRequest.js" type="text/javascript"></script>
<!-- 
<script src="http://malsup.github.com/jquery.form.js"></script>
 -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" 
 href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js">
</script>
<script src="https://code.jquery.com/jquery-3.2.1.js" 
	integrity="sha256-DZAnKJ/6XZ9si04Hgrsxu/8s717jcIzLy3oi35EouyE=" 
	crossorigin="anonymous">
</script>
<!-- start: Css -->
<link rel="stylesheet" type="text/css" 
 href="/gyum_02/asset/css/bootstrap.min.css">
<!-- plugins --> 
<link rel="stylesheet" type="text/css" 
 href="/gyum_02/asset/css/plugins/font-awesome.min.css"/>
<link rel="stylesheet" type="text/css" 
 href="/gyum_02/asset/css/plugins/animate.min.css"/>
<link href="/gyum_02/asset/css/style.css" rel="stylesheet">
<!-- end: Css -->
<link rel="shortcut icon" href="/gyum_02/asset/img/logomi.png">
<!-- management: Css -->
<link rel="stylesheet" type="text/css" href="/gyum_02/css/masterpage/mp_all.css"/>
<link rel="stylesheet" type="text/css" 
 href="/gyum_02/css/masterpage/mp_equipment/mp_equipment_management.css"/>

<title>Insert title here</title>
</head>
<body id="mimin" class="dashboard">
<%@include file="/header.jsp" %>
<div class="container-fluid mimin-wrapper">
<%@include file="../mp_index.jsp" %>
	<div id="content" class="article-v1">
		<!-- mp - header -->
		<div class="div_header">
			<a onclick="href='mp_equipment_status.do'"><span id="span_status_do">비품 현황</span
			></a><a onclick="href='mp_equipment_IO.do'"><span id="span_IO_do">비품 입출고</span
			></a><a onclick="href='mp_equipment_management.do'"><span 
			id="span_management_do">비품 관리 대장</span></a
			><a onclick="href='mp_equipment_monthly.do'"><span 
			id="span_monthly_do">월별 입출고 현황</span></a
			><a onclick="href='mp_equipment_yearly.do'"><span 
			id="span_yearly_do">연별 입출고 현황</span></a>
		</div>
		<!-- /mp - header -->
		
		<div id="div_equipment_management">
			<form action="mp_equipment_day_list.do" id="form_equipment_management">
				<ul>
					<li><input 
						type="number" id="search_year" name="year"
					>년</li>
					<li><input 
						type="number" id="search_month" name="month"
					>월</li>
					<li><input 
						type="number" id="search_day" name="day"
					>일</li>
					<li class="li_button_search"><input id="button_search" 
					 type="button" value="조회" class="btn btn-default"
					 onclick="searchSubmit()"></li>
				</ul>
			</form>
				
			<c:set var="i" value="0"/>
			<table border="1" id="table_equipment" class="table table-hover" >
				<tr class="tr_equipment_2">
					<th class="td_equip_code">관리번호</th>
					<th class="td_equip_name">품명</th>
					<th class="td_equip_s_size">규격</th>
					<th class="td_equip_first_num">최초 수량</th>
					<th class="td_e_s_in">입고</th>
					<th class="td_e_s_out">출고</th>
					<th class="td_equip_last_num">현재고</th>
				</tr>
				<c:forEach var="dto" items="${list }">
					<tr class="tr_equipment_${i%2}">
						<td class="td_equip_code">${dto.equip_code }</td>
						<td class="td_equip_name">${dto.equip_name }</td>
						<td class="td_equip_s_size">${dto.equip_s_size }</td>
						<td class="td_equip_first_num">${dto.equip_first_num }</td>
						<td class="td_e_s_in"
						 >${dto.e_s_in_out=='in'?dto.e_s_in_out_num:'' }</td>
						<td class="td_e_s_out"
						 >${dto.e_s_in_out=='out'?dto.e_s_in_out_num:'' }</td>
						<td class="td_equip_last_num">${dto.equip_last_num }</td>
					</tr>
					<c:set var="i" value="${i+1}"/>
				</c:forEach>
			</table>
		</div>
	</div>
</div>
</body>
<script>
var searchSubmit = function() {
	/* 유효성 검사 후 submit */
	var search_year = document.getElementById('search_year').value;
	var search_month = document.getElementById('search_month').value;
	var search_day = document.getElementById('search_day').value;
	var result = true;
	
	if(search_year==null || search_year=='' ||
			search_year<1 || search_year>new Date().getFullYear()){
		result = false;
	}else if(search_month==null || search_month=='' ||
			search_month<1 || search_month>12){
		result = false;
	}else if(search_day==null || search_day=='' ||
			search_day<1 || search_day>31){
		result = false;
	}
	
	if(result){
		document.getElementById('form_equipment_management').submit();
	}else{
		alert('정확한 날짜를 입력하시오.');
		document.getElementById('form_equipment_management').reset();
	}
}

var mpResult = function() {
	if(XHR.readyState==4){
		if(XHR.status=200){
			var data = XHR.responseText;
			var errorCode = eval('('+data+')').errorCode;
			var msg = eval('('+data+')').msg;
			
			if(errorCode==1){//성공
				alert(msg);
				listSetting();
			}else{//실패
				alert(msg);
			}
		}
	}
}

</script>
    <!-- start: Javascript -->
    <script src="/gyum_02/asset/js/jquery.min.js"></script>
    <script src="/gyum_02/asset/js/jquery.ui.min.js"></script>
    <script src="/gyum_02/asset/js/bootstrap.min.js"></script>
   
    <!-- plugins -->
    <script src="/gyum_02/asset/js/plugins/moment.min.js"></script>
    <script src="/gyum_02/asset/js/plugins/fullcalendar.min.js"></script>
    <script src="/gyum_02/asset/js/plugins/jquery.nicescroll.js"></script>
    <script src="/gyum_02/asset/js/plugins/jquery.vmap.min.js"></script>
    <script src="/gyum_02/asset/js/plugins/maps/jquery.vmap.world.js"></script>
    <script src="/gyum_02/asset/js/plugins/jquery.vmap.sampledata.js"></script>
    <script src="/gyum_02/asset/js/plugins/chart.min.js"></script>

    <!-- custom -->
     <script src="/gyum_02/asset/js/main.js"></script>
</html>