<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="gyum_02.mp_academyStatus.model.mp_TeacherDTO" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<script src="/gyum_02/build/js/httpRequest.js" type="text/javascript"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.js" 
	integrity="sha256-DZAnKJ/6XZ9si04Hgrsxu/8s717jcIzLy3oi35EouyE=" 
	crossorigin="anonymous">
</script>
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
<!-- teacher: Css -->
<link rel="stylesheet" type="text/css" href="/gyum_02/css/masterpage/mp_all.css"/>
<link rel="stylesheet" type="text/css" 
 href="/gyum_02/css/masterpage/mp_academy_status/mp_teacher.css"/>

</head>
<%
int listSize = 3;
%>
<body onload="showAll(1)" id="mimin" class="dashboard">
<%@include file="/header.jsp" %>
	<div class="container-fluid mimin-wrapper">
	<%@include file="../mp_index.jsp" %>
		<div id="content" class="article-v1">
			<!-- mp - header -->
			<div class="div_header">
				<a onclick="href='mp_student.do'"><span id="span_student_do">학생
						현황</span></a><a onclick="href='mp_teacher.do'"><span id="span_teacher_do">선생
						현황</span></a><a onclick="href='mp_sales.do'"><span id="span_sales_do">수입
						지출 현황</span></a>
			</div>
			<!-- /mp - header -->
			<div id="div_teacher">
				<c:forEach var="i" begin="0" end="<%=listSize-1 %>" step="1">
					<input type="hidden" id="hidden_tea_idx_${i}"
						class="hidden_tea_idx">
					<table id='table_teacher_${i}' class="table_teacher">
						<tr>
							<td id='td_teacher_img_${i}' class="td_teacher_img">
								<div id="div_teacher_img_${i}" class="div_teacher_img"></div>
							</td>
							<td>
								<ul class="ul_content">
									<li id="li_tea_id_${i}" class="li_tea_id"></li>
									<li id='li_tea_name_${i}' class="li_tea_name"></li>
									<li id='li_tea_email_${i}' class="li_tea_email"></li>
									<li id='li_tea_tel_${i}' class="li_tea_tel"></li>
									<li id='li_tea_in_date_${i}' class="li_tea_in_date"></li>
								</ul>
							</td>
						</tr>
					</table>
				</c:forEach>
			</div>
			<div id="div_page" align='center'></div>
		</div>
	</div>
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
</body>
<script>
<%
String strSaveDir = getServletContext().getRealPath("img/book");
System.out.println(strSaveDir);
%>
function resultSetting(list, page){
	for(var i=0; i<<%=listSize %>; i++){
		//이미지 처리 해야함
		if(i>=list.length){
			var hidden_tea_idx = document.getElementById('hidden_tea_idx_'+i);
			var li_tea_id = document.getElementById('li_tea_id_'+i);
			var li_tea_name = document.getElementById('li_tea_name_'+i);
			var li_tea_tel = document.getElementById('li_tea_tel_'+i);
			var li_tea_email = document.getElementById('li_tea_email_'+i);
			var li_tea_in_date = document.getElementById('li_tea_in_date_'+i);
			var div_teacher_img = document.getElementById('div_teacher_img_'+i);

			hidden_tea_idx.value="";
			li_tea_id.innerHTML="";
			li_tea_name.innerHTML="";
			li_tea_tel.innerHTML="";
			li_tea_email.innerHTML="";
			li_tea_in_date.innerHTML="";
			div_teacher_img.innerHTML="";
		}else{
			
			var hidden_tea_idx = document.getElementById('hidden_tea_idx_'+i);
			var li_tea_id = document.getElementById('li_tea_id_'+i);
			var li_tea_name = document.getElementById('li_tea_name_'+i);
			var li_tea_tel = document.getElementById('li_tea_tel_'+i);
			var li_tea_email = document.getElementById('li_tea_email_'+i);
			var li_tea_in_date = document.getElementById('li_tea_in_date_'+i);
			var div_teacher_img = document.getElementById('div_teacher_img_'+i);

			hidden_tea_idx.value=list[i].tea_idx;
			li_tea_id.innerHTML='<label class="label_tea">아이디 : </label>'+list[i].tea_id;
			li_tea_name.innerHTML='<label class="label_tea">이름 : </label>'+list[i].tea_name;
			li_tea_tel.innerHTML='<label class="label_tea">전화번호 : </label>'+list[i].tea_tel;
			li_tea_email.innerHTML='<label class="label_tea">이메일 : </label>'+list[i].tea_email;
			
			var tea_in_date_str = new Date((Date)(list[i].tea_in_date).toString());
			var tea_in_date = tea_in_date_str.getFullYear()+"-"+
			tea_in_date_str.getMonth()+"-"+tea_in_date_str.getDate();
			li_tea_in_date.innerHTML='<label class="label_tea">가입일 : </label>'+tea_in_date;
			div_teacher_img.innerHTML='<img src="uploads/'+list[i].file_name+'" class="img_teacher">';
		
		//파일 경로
		//	var file_route = list[i].file_route;
		}
	}
	
	var div_page = document.getElementById('div_page');
	div_page.innerHTML=page;
}

var mpteacherAll = function() {
	if(XHR.readyState==4){
		if(XHR.status=200){
			var data = XHR.responseText;
			var list = eval('('+data+')').list;
			var page = eval('('+data+')').page;
			
			
	//		var div_teacher = document.getElementById('div_teacher');
			
	//		while (div_teacher.hasChildNodes()) {
	//			div_teacher.removeChild(div_teacher.firstChild);
	//		}
			
			resultSetting(list,page);
			
			if(list.length<<%=listSize%>){
				for(var i=<%=listSize-1%>; i>=list.length; i--){
					var div_teacher = document.getElementById('div_teacher');
					div_teacher.removeChild(document.getElementById('table_teacher_'+i));
					div_teacher.removeChild(document.getElementById('hr_'+i));
				}
			}
		}
	}
}

var showAll = function(cp) {
	if(cp==null) cp=1;
	sendRequest("mp_teacher_all_list.do?cp="+cp,null,mpteacherAll,'GET');
}
</script>

</html>