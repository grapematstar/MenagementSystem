<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
 href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js">
</script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js">
</script>
<script src="/gyum_02/build/js/httpRequest.js" type="text/javascript"></script>
<script src="https://code.jquery.com/jquery-3.2.1.js" 
	integrity="sha256-DZAnKJ/6XZ9si04Hgrsxu/8s717jcIzLy3oi35EouyE=" 
	crossorigin="anonymous">
</script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" 
 href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<link rel="stylesheet" type="text/css"
 href="/gyum_02/codebase/fonts/font_roboto/roboto.css"/>
<link rel="stylesheet" type="text/css"
 href="/gyum_02/codebase/dhtmlxcalendar.css"/>
<script src="/gyum_02/codebase/dhtmlxcalendar.js"></script>

<!-- plugins -->
<link rel="stylesheet" type="text/css"
	href="/gyum_02/asset/css/plugins/font-awesome.min.css" />
<link rel="stylesheet" type="text/css"
	href="/gyum_02/asset/css/plugins/simple-line-icons.css" />
<link rel="stylesheet" type="text/css"
	href="/gyum_02/asset/css/plugins/animate.min.css" />
<link rel="stylesheet" type="text/css"
	href="/gyum_02/asset/css/plugins/fullcalendar.min.css" />
<link href="/gyum_02/asset/css/style.css" rel="stylesheet">
<!-- end: Css -->
<link rel="shortcut icon" href="/gyum_02/asset/img/logomi.png">
<!-- IO: Css -->
<link rel="stylesheet" type="text/css" href="/gyum_02/css/masterpage/mp_all.css"/>
<link rel="stylesheet" type="text/css" 
 href="/gyum_02/css/masterpage/mp_class/mp_class_management.css"/>

<style>
#calendar {
border: 1px solid #dfdfdf;
font-family: Roboto, Arial, Helvetica;
font-size: 14px; color: #404040;         
}
</style>
<script>
function doOnLoad() {
	
	var myCalendar1 = new dhtmlXCalendarObject("modal_class_startdate");
	myCalendar1.attachEvent("onShow", function(){});      
  	myCalendar1.attachEvent("onHide", function(){});   
	   
  	var myCalendar2 = new dhtmlXCalendarObject("modal_class_enddate");
   	myCalendar2.attachEvent("onShow", function(){});      
   	myCalendar2.attachEvent("onHide", function(){}); 
	
}
</script>
</head>

<script>
var jsonList = '${requestScope.jsonList}';

var list = [];
if(jsonList!=null && jsonList!=''){
	list= eval('('+jsonList+')');
} 
var modalNumber = 0;
var myCalendar;

function classModalInit() {
	var modal_div_footer = document.getElementById('modal_div_footer');
	
	while (modal_div_footer.hasChildNodes()) {
		modal_div_footer.removeChild(modal_div_footer.firstChild);
	}
}
 

function classModalInsertSetting() {
	classModalInit();
	document.getElementById('form_modal').reset();
	document.getElementById('modal_h2_title').innerHTML = '강의 개설창';
	
	var modal_div_footer = document.getElementById('modal_div_footer');
	
	var modal_button_classInfoInsert = document.createElement('input');
	modal_button_classInfoInsert.setAttribute("type", "button");
	modal_button_classInfoInsert.setAttribute("class", "btn btn-default");
	modal_button_classInfoInsert.setAttribute("onclick", "classInfoInsert()");
	modal_button_classInfoInsert.setAttribute("value", "추가하기");
	modal_div_footer.appendChild(modal_button_classInfoInsert);
	
	var modal_button_cancel = document.createElement('input');
	modal_button_cancel.setAttribute("type", "button");
	modal_button_cancel.setAttribute("class", "btn btn-default");
	modal_button_cancel.setAttribute("data-dismiss", "modal");
	modal_button_cancel.setAttribute("value", "취소");
	modal_div_footer.appendChild(modal_button_cancel);
}

function classModalSetting(i) {
	modalNumber = i;
	classModalInit();
	document.getElementById('modal_h2_title').innerHTML = '강의 수정창';
	
	$("#modal_subject_num").val(list[i].subject_num).attr("selected", "selected");
	document.getElementById('modal_class_startdate').value = list[i].class_startdate;
	document.getElementById('modal_class_enddate').value = list[i].class_enddate;
	$("#modal_classroom").val(list[i].classroom).attr("selected", "selected");
	$("#modal_class_time").val(list[i].class_time).attr("selected", "selected");
	$("#modal_class_day").val(list[i].class_day).attr("selected", "selected");
	
	document.getElementById('modal_class_subject').value = list[i].class_subject;
	document.getElementById('modal_tea_idx').value = list[i].tea_idx;
	document.getElementById('modal_class_price').value = list[i].class_price;
	document.getElementById('modal_class_max_student').value = list[i].class_max_student;

	var modal_div_footer = document.getElementById('modal_div_footer');
	
	var modal_button_classInfoUpdate = document.createElement('input');
	modal_button_classInfoUpdate.setAttribute("type", "button");
	modal_button_classInfoUpdate.setAttribute("class", "btn btn-default");
	modal_button_classInfoUpdate.setAttribute("onclick", "classInfoUpdate()");
	modal_button_classInfoUpdate.setAttribute("value", "수정하기");
	modal_div_footer.appendChild(modal_button_classInfoUpdate);
	
	var modal_button_cancel = document.createElement('input');
	modal_button_cancel.setAttribute("type", "button");
	modal_button_cancel.setAttribute("class", "btn btn-default");
	modal_button_cancel.setAttribute("data-dismiss", "modal");
	modal_button_cancel.setAttribute("value", "취소");
	modal_div_footer.appendChild(modal_button_cancel);
	
}

var classInfoUpdate = function () {
	var class_subject = document.getElementById('modal_class_subject');
	var class_day = document.getElementById('modal_class_day');
	var subject_num = document.getElementById('modal_subject_num');
	var class_startdate = document.getElementById('modal_class_startdate');
	var class_enddate = document.getElementById('modal_class_enddate');
	var classroom = document.getElementById('modal_classroom');
	var class_time = document.getElementById('modal_class_time');
	var tea_idx = document.getElementById('modal_tea_idx');
	var class_price = document.getElementById('modal_class_price');
	var class_max_student = document.getElementById('modal_class_max_student');
	
	var selectedList = [];
	
	selectedList.push({
		"class_idx":list[modalNumber].class_idx,
		"class_subject":class_subject.value,
		"class_day":class_day.options[class_day.selectedIndex].value,
		"class_startdate":class_startdate.value,
		"class_enddate":class_enddate.value,
		"classroom":classroom.options[classroom.selectedIndex].value,
		"class_time":class_time.options[class_time.selectedIndex].value,
		"tea_idx":tea_idx.value,
		"class_price":class_price.value,
		"class_max_student":class_max_student.value,
		"subject_num":subject_num.options[subject_num.selectedIndex].value
	});
	
	$.ajax({
        url: "mp_ClassUpdate.do",
        type: "POST",
        data: JSON.stringify(selectedList), //Array를 JSON string형태로 변환
        dataType: "json",
        contentType: "application/json",
        success: function(data) {
        	alert(data.msg);
			$('#classModal .close').click();
			document.getElementById('form_class').submit();
        },
        error:function(data){
        	alert(data.msg);
        }
    });
	selectedList = [];
}


</script>
<%
String [] gubun = {
		"수락 필요", "수락됨", "거절됨"
};

request.setAttribute("gubun", gubun);

%>
<body onload="doOnLoad()" id="mimin" class="dashboard">
<%@include file="/header.jsp" %>
<div class="container-fluid mimin-wrapper">
<%@include file="../mp_index.jsp" %>
	<div id="content" class="article-v1">

		<form action="class_management_form.do" name="class_management_form"
		 id="form_class">
		 	<ul class="ul_search">
		 		<li class="li_title"><span class="span_title">상세검색</span></li>	
		 		<li class="li_accept">
		 			<span><label>수락여부</label></span>
			 		<ul class="ul_accept">
			 			<li>
			 				<span class="span_accept_need">
				 				<input type="checkbox" name="checkbox_class_check_0"
								 ${param.checkbox_class_check_0=='on'?'checked':''}
								 class="icheck">
								<label>수락이 필요한 것</label>
							</span>
			 			</li>
			 			<li>
			 				<span class="span_accept_ok">
			 					<input type="checkbox" name="checkbox_class_check_1" 
								 ${param.checkbox_class_check_1=='on'?'checked':''}>
								<label>수락한 것</label>
			 				</span>
			 			</li>
			 			<li>
			 				<span class="span_accept_no">
			 					<input type="checkbox" name="checkbox_class_check_2" 
								 ${param.checkbox_class_check_2=='on'?'checked':''}>
								<label>거절한 것</label>
			 				</span>
			 			</li>
			 		</ul>
		 		</li>
		 		<li class="li_order_by">
		 			<span><label>정렬 순서</label></span>
		 			<ul class="ul_order_by">
		 				<li>
		 					<span class="span_order_number">
			 					<input type="checkbox" name="checkbox_class_idx" 
								 ${param.checkbox_class_idx=='on'?'checked':''}>
								<label>번호순</label>
			 				</span>
		 				</li>
		 				<li>
		 					<span class="span_order_subject_name">
			 					<input type="checkbox" name="checkbox_subject_name" 
								 ${param.checkbox_subject_name=='on'?'checked':''}>
								<label>과목명</label>
		 					</span>
		 					
		 				</li>
		 				<li>
		 					<span class="span_order_class_subject">
				 				<input type="checkbox" name="checkbox_class_subject" 
								 ${param.checkbox_class_subject=='on'?'checked':''}>
								<label>강의명</label>
		 					</span>
		 				</li>
		 				<li>
		 					<span class="span_order_tea_name">
			 					<input type="checkbox" name="checkbox_tea_name" 
								 ${param.checkbox_tea_name=='on'?'checked':''}>
								<label>강사명</label>
		 					</span>
		 				</li>
		 				<li>
		 					<span class="span_order_class_startdate">
			 					<input type="checkbox" name="checkbox_class_startdate" 
								 ${param.checkbox_class_startdate=='on'?'checked':''}>
								<label>개강일</label>
		 					</span>
		 				</li>
		 				<li>
		 					<span class="span_order_class_enddate">
			 					<input type="checkbox" name="checkbox_class_enddate" 
								 ${param.checkbox_class_enddate=='on'?'checked':''}>
								<label>종강일</label>
		 					</span>
		 				</li>
		 		 	</ul>
		 			
		 		</li>
		 		<li class="li_week">
		 		<span><label>요일</label></span>
		 			<ul class="ul_week">
		 				<li>
		 					<span class="span_week_class_day_0">
		 						<input type="checkbox" name="checkbox_class_day_0" 
								 ${param.checkbox_class_day_0=='on'?'checked':''}>
								<label>월요일</label>
		 					</span>
		 				</li>
		 				<li>
		 					<span class="span_week_class_day_1">
			 					<input type="checkbox" name="checkbox_class_day_1" 
								 ${param.checkbox_class_day_1=='on'?'checked':''}>
								<label>화요일</label>
		 					</span>
		 				</li>
		 				<li>
		 					<span class="span_week_class_day_2">
			 					<input type="checkbox" name="checkbox_class_day_2" 
								 ${param.checkbox_class_day_2=='on'?'checked':''}>
								<label>수요일</label>
		 					</span>
		 				</li>
		 				<li>
		 					<span class="span_week_class_day_3">
			 					<input type="checkbox" name="checkbox_class_day_3" 
								 ${param.checkbox_class_day_3=='on'?'checked':''}>
								<label>목요일</label>
		 					</span>
		 				</li>
		 				<li>
		 					<span class="span_week_class_day_4">
			 					<input type="checkbox" name="checkbox_class_day_4" 
								 ${param.checkbox_class_day_4=='on'?'checked':''}>
								<label>금요일</label>
		 					</span>
		 				</li>
		 				
		 			</ul>
		 		</li>
		 		<li>
		 			<input type="submit" value="검색" id="submit_class_search" 
		 			 class="btn btn-default">
		 		</li>
		 		
		 	</ul>
		</form>
		<div class="div_accept_button">
			<input type="button" value="일괄 수락" onclick="classCheckUpdate(1)"
			 class="btn btn-default">
			<input type="button" value="일괄 거절" onclick="classCheckUpdate(2)"
			 class="btn btn-default">
			<input type="button" value="강의 추가" data-toggle="modal" class="btn btn-default"
			 data-target="#classModal" onclick="classModalInsertSetting()">
		</div>
		<table class="table table-hover" id="table_management">
			<tr>
				<th>선택</th>
				<th>번호</th>
				<th>과목명</th>
				<th>강의명</th>
				<th>강사명</th>
				<th>요일</th>
				<th>개강일</th>
				<th>종강일</th>
				<th>구분</th>
				<th>수정하기</th>
			</tr>
			<c:forEach var="i" begin="1" end="${fn:length(list)}" step="1">
			<tr>
				<td>
					<input type="checkbox" id="checkbox_class_${i-1}" class="checkbox_class">
				</td>
				<td>
					${list[i-1].class_idx}
				</td>
				<td>
					${list[i-1].subject_name}
				</td>
				<td>
					${list[i-1].class_subject}
				</td>
				<td>
					${list[i-1].tea_name}
				</td>
				<td>
					${list[i-1].class_day}
				</td>
				<td>
					${list[i-1].class_startdate}
				</td>
				<td>
					${list[i-1].class_enddate}
				</td>
				<td>
					${requestScope.gubun[list[i-1].class_check]}
				</td>
				<td>
					<input type="button" value="수정하기" class="btn btn-default"
					 data-toggle="modal" data-target="#classModal"
					 onclick="classModalSetting(${i-1})">
				</td>
			</tr>
			</c:forEach>
		</table>
		
		<!-- Modal -->
		<div class="modal fade" id="classModal" role="dialog">
			<div class="modal-dialog">
	
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close"
						 data-dismiss="modal">&times;</button>
						<h2 class="modal-title" id="modal_h2_title"></h2>
					</div>
					<div class="modal-body">
						<form name="class_write" id="form_modal" 
						 action="/gyum_02/open_lecture.do">
						   <table class="table table-striped table-bordered"  cellspacing="0">
						      <tr>
						         <th>과목</th>
						         <td>
						            <select name="subject_num" id="modal_subject_num">
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
						            <input type="text" id="modal_class_startdate"
						              name="class_startdate">
						         </td>
						      </tr>
						      <tr>
						         <th>종강날짜</th>
						         <td style="position:relative; height:10px;" id="calen">
						            <input type="text" id="modal_class_enddate" 
						             name="class_enddate">
						         </td>
						      </tr>
						      <tr>
						         <th>강의실</th>
						         <td>
						            <select name="classroom" id="modal_classroom">
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
						            <select name="class_day" id="modal_class_day">
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
						            <select name="class_time" id="modal_class_time">
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
						         <td><input type="text" id="modal_class_subject" 
						          name="class_subject"></td>
						      </tr>
						      <tr>
						         <th>강사 인덱스</th>
						         <td>
						         	<input type="text" id="modal_tea_idx" name="tea_idx" >
						         </td>
						      </tr>
						      <tr>
						         <th>수강료</th>
						         <td>
						         	<input type="number" id="modal_class_price" 
						         	 name="class_price">
						         </td>
						      </tr>
						      <tr>
						         <th>최대 수강생</th>
						         <td>
							         <input type="number" id="modal_class_max_student"
							          name="class_max_student">
						         </td>
						      </tr>
						   </table>
						</form>
					</div>
					<div id="modal_div_footer" class="modal-footer"></div>
				</div>
	
			</div>
		</div>
	</div>
</div>
</body>
<script>

var classInfoInsert = function() {
	var class_startdatenum = new Array();
	class_startdatenum=document.getElementById("modal_class_startdate").value;
	var class_startdate=class_startdatenum.replace(/-/g,'');
	document.getElementById("modal_class_startdate").value=class_startdate;
	
	var class_enddatenum = new Array();
	class_enddatenum=document.getElementById("modal_class_enddate").value;
	var class_enddate=class_enddatenum.replace(/-/g,'');
	document.getElementById("modal_class_enddate").value=class_enddate;
	var formID=document.getElementById('form_modal');
	
	formID.submit();
}

var classCheckUpdate = function (class_check) {
	var classCheckList = [];
	for(var i=0; i<list.length; i++){
		var checkbox_class = document.getElementById('checkbox_class_'+i);
		if(checkbox_class.checked){
			var class_idx = list[i].class_idx;
			classCheckList.push({'class_idx':class_idx});
		}
	}
	if(classCheckList.length!=0){
		$.ajax({
	        url: "mp_classCheckUpdate.do?class_check="+class_check,
	        type: "POST",
	        data: JSON.stringify(classCheckList), //Array를 JSON string형태로 변환
	        dataType: "json",
	        contentType: "application/json",
	        success: function(data) {
	        	alert(data.msg);
	        	document.getElementById('form_class').submit();
	        },
	        error:function(data){
	        	alert(data.msg);
	        }
	    });
	}else{
		alert('아무것도 선택하지 않았습니다.');
	}
	classCheckList = [];
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