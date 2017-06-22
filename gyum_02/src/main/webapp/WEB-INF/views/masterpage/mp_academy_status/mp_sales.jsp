<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
 <meta name="description" content="Miminium Admin Template v.1">
 <meta name="author" content="Isna Nur Azis">
 <meta name="keyword" content="">
 <meta name="viewport" content="width=device-width, initial-scale=1">
 <script src="/gyum_02/build/js/httpRequest.js" type="text/javascript"></script>
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
<!-- sales: Css -->
<link rel="stylesheet" type="text/css" href="/gyum_02/css/masterpage/mp_all.css"/>
<link rel="stylesheet" type="text/css" 
 href="/gyum_02/css/masterpage/mp_academy_status/mp_sales.css"/>
 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- <link rel="stylesheet"
 href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
<!-- <script src="https://code.jquery.com/jquery-3.2.1.js" 
	integrity="sha256-DZAnKJ/6XZ9si04Hgrsxu/8s717jcIzLy3oi35EouyE=" 
	crossorigin="anonymous">
</script> -->

</head>
<%
int listSize=10;
%>
<body id="mimin" class="dashboard" onload="showAll(1)">
<%@include file="/header.jsp" %>
<div class="container-fluid mimin-wrapper">
<%@include file="../mp_index.jsp" %>
	<div id="content" class="article-v1">
		<!-- mp - header -->
		<div class="div_header">
			<a onclick="href='mp_student.do'"><span id="span_student_do">학생 현황</span
			></a><a onclick="href='mp_teacher.do'"><span id="span_teacher_do">선생 현황</span
			></a><a onclick="href='mp_sales.do'"><span id="span_sales_do">수입 지출 현황</span
			></a>	
		</div>
		<!-- /mp - header -->
		<div class="div_top">
			<a onclick="showAll(1)"><span id="span_tab_all">전체 보기</span></a
				><a onclick="showIn(1)"><span id="span_tab_in">수입</span></a
				><a onclick="showOut(1)"><span id="span_tab_out">지출</span></a>	
		</div>
		<div class="div_body">
			<table id='table_sales' class="table table-hover" >  
				 <tr class="tr_sales_2">
					 <th>번호</th><th>내용</th><th>금액</th><th>날짜</th> <th>구분</th>
				 </tr>
				 <c:forEach var="i" begin="0" end="<%=listSize-1 %>" step="1">  
					 <tr class="tr_sales_${i%2 }">
						 <td id='td_i_e_idx_${i}' class="td_i_e_idx"></td>   
						 <td id='td_i_e_content_${i}' class="td_i_e_content"></td>  
						 <td id='td_i_e_money_${i}' class="td_i_e_money"></td>  
						 <td id='td_i_e_r_date_${i}' class="td_i_e_r_date"></td>  
						 <td id='td_i_e_in_out_${i}' class="td_i_e_in_out"></td>  
					 </tr>   
				 </c:forEach>
			</table>  
			<div id="div_page" align='center'></div>
		</div>
	
	</div>
</div>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js">
</script>
<!-- 
<script src="https://code.jquery.com/jquery-3.2.1.js" 
	integrity="sha256-DZAnKJ/6XZ9si04Hgrsxu/8s717jcIzLy3oi35EouyE=" 
	crossorigin="anonymous">
</script> -->
<section id="section_body">
</section>
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
function resultSetting(list, page){
	for(var i=0; i<<%=listSize %>; i++){
		if(i>=list.length) {
			var td_i_e_idx = document.getElementById('td_i_e_idx_'+i);
			var td_i_e_content = document.getElementById('td_i_e_content_'+i);
			var td_i_e_money = document.getElementById('td_i_e_money_'+i);
			var td_i_e_r_date = document.getElementById('td_i_e_r_date_'+i);
			var td_i_e_in_out = document.getElementById('td_i_e_in_out_'+i);

			td_i_e_idx.innerHTML="";
			td_i_e_content.innerHTML="";
			td_i_e_money.innerHTML="";
			td_i_e_r_date.innerHTML="";
			td_i_e_in_out.innerHTML="";
			
		}else{
			var td_i_e_idx = document.getElementById('td_i_e_idx_'+i);
			var td_i_e_content = document.getElementById('td_i_e_content_'+i);
			var td_i_e_money = document.getElementById('td_i_e_money_'+i);
			var td_i_e_r_date = document.getElementById('td_i_e_r_date_'+i);
			var td_i_e_in_out = document.getElementById('td_i_e_in_out_'+i);

			td_i_e_idx.innerHTML=list[i].i_e_idx;
			td_i_e_content.innerHTML=list[i].i_e_content;
			td_i_e_money.innerHTML=list[i].i_e_money;
		td_i_e_in_out.innerHTML=
			list[i].i_e_in_out=='in'?"입고":(list[i].i_e_in_out=="out"?"출고":"미확인");
			
			var td_i_e_r_date_str =new Date((Date)(list[i].i_e_r_date).toString());
			
			var i_e_r_date = td_i_e_r_date_str.getFullYear()+"-"+
			td_i_e_r_date_str.getMonth()+"-"+td_i_e_r_date_str.getDate();
			td_i_e_r_date.innerHTML=i_e_r_date;
			
		}
	}
	
	var div_page = document.getElementById('div_page');
	div_page.innerHTML=page;
}

var mpSalesIn = function() {
	if(XHR.readyState==4){
		if(XHR.status=200){
			var data = XHR.responseText;
			var list = eval('('+data+')').list;
			var page = eval('('+data+')').page;
			
			resultSetting(list,page);
		}
	}
}

var mpSalesOut = function() {
	if(XHR.readyState==4){
		if(XHR.status=200){
			var data = XHR.responseText;
			var list = eval('('+data+')').list;
			var page = eval('('+data+')').page;
			var classList = eval('('+data+')').classList;
			
			resultSetting(list,page);
		}
	}
}

var showAll = function(cp) {
	var span_tab_in = document.getElementById('span_tab_in');
	var style = "background:linear-gradient(#cccccc, #e3e4e4 );";
	span_tab_in.setAttribute("style",style);
	
	var span_tab_out = document.getElementById('span_tab_out');
	var style = "background:linear-gradient(#cccccc, #e3e4e4 );";
		span_tab_out.setAttribute("style",style);
	
	var span_tab_all = document.getElementById('span_tab_all');
	style = "background:linear-gradient(#ffffff, #ffffff );";
	span_tab_all.setAttribute("style",style);
	
	if(cp==null) cp=1;
	sendRequest("mp_sales_all_list.do?cp="+cp,null,mpSalesIn,'GET');
}

var showIn = function(cp) {
	
	var span_tab_in = document.getElementById('span_tab_in');
	style = "background:linear-gradient(#ffffff, #ffffff );";
	span_tab_in.setAttribute("style",style);
	
	var span_tab_out = document.getElementById('span_tab_out');
	var style = "background:linear-gradient(#cccccc, #e3e4e4 );";
	span_tab_out.setAttribute("style",style);

	var span_tab_all = document.getElementById('span_tab_all');
	style = "background:linear-gradient(#cccccc, #e3e4e4 );";
	span_tab_all.setAttribute("style",style);
	
	sendRequest("mp_sales_in_list.do?cp="+cp,null,mpSalesOut,'GET');
}

var showOut = function(cp) {

	var span_tab_out = document.getElementById('span_tab_out');
	style = "background:linear-gradient(#ffffff, #ffffff );";
	span_tab_out.setAttribute("style",style);
	
	var span_tab_in = document.getElementById('span_tab_in');
	var style = "background:linear-gradient(#cccccc, #e3e4e4 );";
	span_tab_in.setAttribute("style",style);

	var span_tab_all = document.getElementById('span_tab_all');
	style = "background:linear-gradient(#cccccc, #e3e4e4 );";
	span_tab_all.setAttribute("style",style);
	
	
	sendRequest("mp_sales_out_list.do?cp="+cp,null,mpSalesOut,'GET');
}
</script>

</html>