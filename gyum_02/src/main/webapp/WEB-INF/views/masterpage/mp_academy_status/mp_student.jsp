<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<script src="/gyum_02/build/js/httpRequest.js" type="text/javascript"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.js" 
	integrity="sha256-DZAnKJ/6XZ9si04Hgrsxu/8s717jcIzLy3oi35EouyE=" 
	crossorigin="anonymous">
</script>
 <link rel="stylesheet" type="text/css" href="/gyum_02/asset/css/plugins/datatables.bootstrap.min.css"/> 

<!-- start: Css -->
<link rel="stylesheet" type="text/css" href="/gyum_02/asset/css/bootstrap.min.css">
<!-- plugins --> 
<link rel="stylesheet" type="text/css" href="/gyum_02/asset/css/plugins/font-awesome.min.css"/>
<link rel="stylesheet" type="text/css" href="/gyum_02/asset/css/plugins/animate.min.css"/>
<link href="/gyum_02/asset/css/style.css" rel="stylesheet">
<!-- end: Css -->
<link rel="shortcut icon" href="/gyum_02/asset/img/logomi.png">
<!-- student: Css -->
<link rel="stylesheet" type="text/css" href="/gyum_02/css/masterpage/mp_all.css"/>
<link rel="stylesheet" type="text/css" 
 href="/gyum_02/css/masterpage/mp_academy_status/mp_student.css"/> 

<title>Insert title here</title>
</head>
<script>
	var list = [];
	var splits_class_idx_s = [];
</script>
<%
	int listSize=10;
%>
<body onload="showAll(1)" id="mimin" class="dashboard">
<%@include file="/header.jsp" %>
<div class="container-fluid mimin-wrapper">
<%@include file="../mp_index.jsp" %>
	<div id="content" class="article-v1">
		<input type="button" hidden="true" id="button_show_classInfo"
		 data-toggle="modal" data-target="#modal_classInfo">
		<!-- mp - header -->
		<div class="div_header">
			<a onclick="href='mp_student.do'"><span id="span_student_do">학생 현황</span
			></a><a onclick="href='mp_teacher.do'"><span id="span_teacher_do">선생 현황</span
			></a><a onclick="href='mp_sales.do'"><span id="span_sales_do">수입 지출 현황</span
			></a>	
		</div>
		<!-- /mp - header -->
		
		<div class="div_top">
			<a onclick="showAll(1)"><span id="span_tab_all">전체 보기</span
				></a><a onclick="showClass(1)"
				><span id="span_tab_class">반별 보기</span></a>		
		</div>
		<div id="div_select" class="container"></div>
		<div class="div_body">
			<table class="table table-hover" id='table_student'>
				<tr class="tr_student_2">
					<th>번호</th><th>이름</th><th>전화번호</th>
					<th>e-mail</th><th>출신 학교</th><th>가입일</th>
					<!-- 
					<th>반</th>
					 -->
				</tr>
				<c:forEach var="i" begin="0" end="<%=listSize - 1%>" step="1">
					<tr class="tr_student_${i%2}" 
					 onclick="$('#a_student_${i}').trigger('click');"><a
						 id="a_student_${i}" data-toggle="modal" 
						 data-target="#modal_stuInfo" onclick="modalSetting(${i})" 
						 hidden="true"></a>
						<td id='td_stu_idx_${i}' class="td_stu_idx"></td>
						<td id='td_stu_name_${i}' class="td_stu_name"></td>
						<td id='td_stu_tel_${i}' class="td_stu_tel"></td>
						<td id='td_stu_email_${i}' class="td_stu_email"></td>
						<td id='td_stu_school_${i}' class="td_stu_school"></td>
						<td id='td_stu_in_date_${i}' class="td_stu_in_date"></td>
						<!-- 
						<td id='td_class_subject_${i}' class="td_class_subject"></td>
						 -->
					</tr>
				</c:forEach>
			</table>
			<div id="div_page" align='center'></div><hr>
		</div>
		<!-- student Modal -->
		<div class="modal fade" id="modal_stuInfo" role="dialog">
			<div class="modal-dialog">
	
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close"
						 data-dismiss="modal">&times;</button>
						<h4 class="modal-title">학생 정보</h4>
					</div>
					<div class="modal-body">
						<ul>
							<li id='modal_li_stu_idx'></li>
							<li id='modal_li_stu_name'></li>
							<li id='modal_li_stu_tel'></li>
							<li id='modal_li_stu_email'></li>
							<li id='modal_li_stu_school'></li>
							<li id='modal_li_stu_in_date'></li>
							<li id='modal_li_class_subject'></li>
						</ul>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default"
						 data-dismiss="modal">close</button>
					</div>
				</div>
	
			</div>
		</div>
		<!-- class Modal -->
		<div class="modal fade" id="modal_classInfo" role="dialog">
			<div class="modal-dialog">
	
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close"
						 data-dismiss="modal">&times;</button>
						<h4 class="modal-title">이것은 타이틀</h4>
					</div>
					<div class="modal-body">
						<ul>
							<li id='modal_li_subject_num'></li>
							<li id='modal_li_class_startdate'></li>
							<li id='modal_li_class_enddate'></li>
							<li id='modal_li_class_time'></li>
							<li id='modal_li_classroom'></li>
							<li id='modal_li_class_price'></li>
							<li id='modal_li_class_max_student'></li>
							<li id='modal_li_class_day'></li>
							<li id='modal_li_class_subject2'></li>
							<li id='modal_li_tea_id'></li>
						</ul>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default"
						 data-dismiss="modal">close</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>	
<script src="/gyum_02/asset/js/jquery.min.js"></script>
<script src="/gyum_02/asset/js/jquery.ui.min.js"></script>
<script src="/gyum_02/asset/js/bootstrap.min.js"></script>
<!-- plugins -->
<script src="/gyum_02/asset/js/plugins/moment.min.js"></script>
<script src="/gyum_02/asset/js/plugins/jquery.nicescroll.js"></script>
<!-- custom -->
<script src="/gyum_02/asset/js/main.js"></script>	
</body>



<script>
function resultSetting(page){
	for(var i=0; i<<%=listSize %>; i++){
		if(i>=list.length) {
			var td_stu_idx = document.getElementById('td_stu_idx_'+i);
			var td_stu_name = document.getElementById('td_stu_name_'+i);
			var td_stu_tel = document.getElementById('td_stu_tel_'+i);
			var td_stu_email = document.getElementById('td_stu_email_'+i);
			var td_stu_school = document.getElementById('td_stu_school_'+i);
			var td_stu_in_date = document.getElementById('td_stu_in_date_'+i);
//			var td_class_subject = document.getElementById('td_class_subject_'+i);

			td_stu_idx.innerHTML="";
			td_stu_name.innerHTML="";
			td_stu_tel.innerHTML="";
			td_stu_email.innerHTML="";
			td_stu_school.innerHTML="";
			td_stu_in_date.innerHTML="";
//			td_class_subject.innerHTML="";
			
		}else{
			var td_stu_idx = document.getElementById('td_stu_idx_'+i);
			var td_stu_name = document.getElementById('td_stu_name_'+i);
			var td_stu_tel = document.getElementById('td_stu_tel_'+i);
			var td_stu_email = document.getElementById('td_stu_email_'+i);
			var td_stu_school = document.getElementById('td_stu_school_'+i);
			var td_stu_in_date = document.getElementById('td_stu_in_date_'+i);
//			var td_class_subject = document.getElementById('td_class_subject_'+i);

			td_stu_idx.innerHTML=list[i].stu_idx;
			td_stu_name.innerHTML = list[i].stu_name+
            '<a data-toggle="modal" data-target="#modal_stuInfo" '+
            'onclick="modalSetting('+i+')"></a>';
			td_stu_tel.innerHTML=list[i].stu_tel;
			td_stu_email.innerHTML=list[i].stu_email;
			td_stu_school.innerHTML=list[i].stu_school;
			var stu_in_date_str = new Date((Date)(list[i].stu_in_date).toString());
			var stu_in_date = stu_in_date_str.getFullYear()+"-"+
				stu_in_date_str.getMonth()+"-"+stu_in_date_str.getDate();
			td_stu_in_date.innerHTML=stu_in_date;
//			td_class_subject.innerHTML=list[i].class_subject;
		}
	}
	var div_page = document.getElementById('div_page');
	div_page.innerHTML=page;
}

function modalSetting(i) {
	var modal_li_stu_idx = document.getElementById('modal_li_stu_idx');
	var modal_li_stu_name = document.getElementById('modal_li_stu_name');
	var modal_li_stu_tel = document.getElementById('modal_li_stu_tel');
	var modal_li_stu_email = document.getElementById('modal_li_stu_email');
	var modal_li_stu_school = document.getElementById('modal_li_stu_school');
	var modal_li_stu_in_date = document.getElementById('modal_li_stu_in_date');
	var modal_li_class_subject = document.getElementById('modal_li_class_subject');
	
	modal_li_stu_idx.innerHTML='<label class="modal_label_1">번호 : </label>'+
		'<label class="modal_label_2">'+list[i].stu_idx+'</label>';
	modal_li_stu_name.innerHTML='<label class="modal_label_1">이름 : </label>'+
		'<label class="modal_label_2">'+list[i].stu_name+'</label>';
	modal_li_stu_tel.innerHTML='<label class="modal_label_1">전화번호 : </label>'+
		'<label class="modal_label_2">'+list[i].stu_tel+'</label>';
	modal_li_stu_email.innerHTML='<label class="modal_label_1">이메일 : </label>'+
		'<label class="modal_label_2">'+list[i].stu_email+'</label>';
	modal_li_stu_school.innerHTML='<label class="modal_label_1">학교 : </label>'+
		'<label class="modal_label_2">'+list[i].stu_school+'</label>';
	var modal_li_stu_in_date_str =new Date((Date)(list[i].stu_in_date).toString());
	var stu_in_date = modal_li_stu_in_date_str.getFullYear()+"-"+
		modal_li_stu_in_date_str.getMonth()+"-"+modal_li_stu_in_date_str.getDate();
	modal_li_stu_in_date.innerHTML='<label class="modal_label_1">가입일 : </label>'+
		'<label class="modal_label_2">'+stu_in_date+'</label>';
	
//	alert(list[i].class_idx_s);
	splits_class_idx_s =  list[i].class_idx_s.split("|");
	var splits_class_subject =  list[i].class_subject.split("|");
	modal_li_class_subject.innerHTML = 
		'<span class="modal_span_1">반 : </span>';
	for(var j=0; j<splits_class_idx_s.length; j++){
		if(j!=0) modal_li_class_subject.innerHTML+=', ';
		modal_li_class_subject.innerHTML+=
			'<a onclick="showClassInfo('+splits_class_idx_s[j]+
			')">'+splits_class_subject[j]+'</a>';
	}
}

function modalClassSetting(dto) {
	var modal_li_subject_num = document.getElementById('modal_li_subject_num');
	var modal_li_class_startdate = document.getElementById('modal_li_class_startdate');
	var modal_li_class_enddate = document.getElementById('modal_li_class_enddate');
	var modal_li_classroom = document.getElementById('modal_li_classroom');
	var modal_li_class_time = document.getElementById('modal_li_class_time');
	var modal_li_class_price = document.getElementById('modal_li_class_price');
	var modal_li_class_max_student = document.getElementById('modal_li_class_max_student');
	var modal_li_class_day = document.getElementById('modal_li_class_day');
	var modal_li_class_subject = document.getElementById('modal_li_class_subject2');
	var modal_li_tea_id = document.getElementById('modal_li_tea_id');
	modal_li_subject_num.innerHTML=
		'<label class="modal_label_1">과목번호 : </label><label class="modal_label_2">'+
		dto.subject_num;
	modal_li_class_startdate.innerHTML=
		'<label class="modal_label_1">개강일 : </label><label class="modal_label_2">'+
		parseInt(dto.class_startdate/10000) + "."+
		parseInt(dto.class_startdate/100%100) + "."+ 
		parseInt(dto.class_startdate%10000/100);
	modal_li_class_enddate.innerHTML=
		'<label class="modal_label_1">종강일 : </label><label class="modal_label_2">'+
		parseInt(dto.class_enddate/10000) + "."+
		parseInt(dto.class_enddate/100%100) + "."+ 
		parseInt(dto.class_enddate%10000/100);
	modal_li_classroom.innerHTML=
		'<label class="modal_label_1">강의실번호 : </label><label class="modal_label_2">'+
		dto.classroom+'</label>';
	modal_li_class_time.innerHTML=
		'<label class="modal_label_1">강의시간 : </label><label class="modal_label_2">'+
		dto.class_time+'</label>';
	modal_li_class_price.innerHTML=
		'<label class="modal_label_1">수강료 : </label><label class="modal_label_2">'+
		dto.class_price+'</label>';
	modal_li_class_max_student.innerHTML=
		'<label class="modal_label_1">최대인원 : </label><label class="modal_label_2">'+
		dto.class_max_student+'</label>';
	modal_li_class_day.innerHTML=
		'<label class="modal_label_1">강의요일 : </label><label class="modal_label_2">'+
		dto.class_day+'</label>';
	modal_li_class_subject.innerHTML=
		'<label class="modal_label_1">강의제목 : </label><label class="modal_label_2">'+
		dto.class_subject+'</label>';
	modal_li_tea_id.innerHTML=
		'<label class="modal_label_1">강사id : </label><label class="modal_label_2">'+
		dto.tea_id+'</label>';
	

	
	//var modal_li_stu_in_date_str =new Date((Date)(list[i].stu_in_date).toString());
	//var stu_in_date = modal_li_stu_in_date_str.getFullYear()+"-"+
	//	modal_li_stu_in_date_str.getMonth()+"-"+modal_li_stu_in_date_str.getDate();
	//modal_li_stu_in_date.innerHTML='가입일 : '+stu_in_date;
	
}

var mpStudentAll = function() {
	if(XHR.readyState==4){
		if(XHR.status=200){
			var data = XHR.responseText;
			list = eval('('+data+')').list;
			var page = eval('('+data+')').page;
			
			var div_select = document.getElementById('div_select');
	
			while (div_select.hasChildNodes()) {
				div_select.removeChild(div_select.firstChild);
			}
			resultSetting(page);
		}
	}
}

var mpStudentClass = function() {
	if(XHR.readyState==4){
		if(XHR.status=200){
			var data = XHR.responseText;
			list = eval('('+data+')').list;
			var page = eval('('+data+')').page;
			var classList = eval('('+data+')').classList;
			var div_select = document.getElementById('div_select');
			
			if (!div_select.hasChildNodes()) {
				var select_class_subject = document.createElement('select');
				select_class_subject.setAttribute("id", "select_class_subject");
				select_class_subject.setAttribute("class", "form-control");
				select_class_subject.setAttribute("style", "float:left; width:200px;");
				select_class_subject.setAttribute("onChange", "setValue();");
				div_select.appendChild(select_class_subject);
				
				var button = document.createElement("input");
				button.setAttribute("type", "button");
				button.setAttribute("value", "조회");
				button.setAttribute("id", "button_student_class");
				button.setAttribute("class", "form-control");
				button.setAttribute("style", "width:200px;");
				button.setAttribute("onclick", "showClass(1)");
				div_select.appendChild(button);
				
				var select_class_idx = document.createElement('select');
				select_class_idx.setAttribute("id", "select_class_idx");
				select_class_idx.setAttribute("hidden", "true");
				div_select.appendChild(select_class_idx);
				
				for(var i=0; i<classList.length; i++){
					var option = document.createElement('option');
					option.setAttribute("value", classList[i].class_subject);
					option.innerHTML=classList[i].class_subject;
					select_class_subject.appendChild(option);
					
					var option = document.createElement('option');
					option.setAttribute("value", classList[i].class_idx);
					option.innerHTML=classList[i].class_idx;
					select_class_idx.appendChild(option);
				}
				
			}
			resultSetting(page);
		}
	}
}

var mpClassInfo = function() {
	if(XHR.readyState==4){
		if(XHR.status=200){
			var data = XHR.responseText;
			var dto = eval('('+data+')').dto;
			
			modalClassSetting(dto);
			
			$('#button_show_classInfo').click();
		}
	}
}

var showAll = function(cp) {
	var span_tab_class = document.getElementById('span_tab_class');
	var style = "background:linear-gradient(#cccccc, #e3e4e4 ); color:white;";
	span_tab_class.setAttribute("style",style);
	
	var span_tab_all = document.getElementById('span_tab_all');
	style = "background:linear-gradient(#ffffff, #ffffff );";
	span_tab_all.setAttribute("style",style);
	
	if(cp==null) cp=1;
	sendRequest("mp_student_all_list.do?cp="+cp,null,mpStudentAll,'GET');
}

var showClass = function(cp, class_idx) {
	var span_tab_class = document.getElementById('span_tab_class');
	style = "background:linear-gradient(#ffffff, #ffffff );";
	span_tab_class.setAttribute("style",style);
	
	var span_tab_all = document.getElementById('span_tab_all');
	style = "background:linear-gradient(#cccccc, #e3e4e4 ); color:white;";
	span_tab_all.setAttribute("style",style);
	
	if(!class_idx){
		sendRequest("mp_student_class_list.do?cp="+cp,null,mpStudentClass,'GET');
	}else{
		sendRequest("mp_student_class_list.do?cp="+cp+"&class_idx="+class_idx,null,mpStudentClass,'GET');
	}
}

var showClassInfo = function(splits_class_idx) {
	sendRequest("mp_class_info.do?splits_class_idx="+
			splits_class_idx,null,mpClassInfo,'GET');
}


function setValue() {
	var select_class_subject = document.getElementById('select_class_subject');
	var select_class_idx = document.getElementById('select_class_idx');
	var class_idx = select_class_idx.options[select_class_subject.selectedIndex].text;
	var button = document.getElementById('button_student_class');
	button.setAttribute("onclick", "showClass(1,'"+class_idx+"')");
}
</script>

</html>