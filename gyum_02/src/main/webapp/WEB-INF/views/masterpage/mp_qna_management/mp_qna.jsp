<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<script src="/gyum_02/build/js/httpRequest.js" type="text/javascript"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- start: Css -->
<link rel="stylesheet" type="text/css" href="/gyum_02/asset/css/bootstrap.min.css">
<!-- plugins --> 
<link rel="stylesheet" type="text/css" href="/gyum_02/asset/css/plugins/font-awesome.min.css"/>
<link rel="stylesheet" type="text/css" href="/gyum_02/asset/css/plugins/animate.min.css"/>
<link href="/gyum_02/asset/css/style.css" rel="stylesheet">
<!-- end: Css -->
<link rel="shortcut icon" href="/gyum_02/asset/img/logomi.png">
<!-- qna: Css -->
<link rel="stylesheet" type="text/css" href="/gyum_02/css/masterpage/mp_all.css"/>
<link rel="stylesheet" type="text/css" 
 href="/gyum_02/css/masterpage/mp_qna_management/mp_qna.css"/>
<title>Insert title here</title>
</head>
<%
int listSize = 10;
%>
<body id="mimin" class="dashboard" onload="showAll(1)">
<%@include file="/header.jsp" %>
<div class="container-fluid mimin-wrapper">
<%@include file="../mp_index.jsp" %>
	<div id="content" class="article-v1">
		<table id='table_qna'>  
			 <tr class="tr_qna_2">
				 <th>번호</th><th>질문 제목</th><th>작성자</th><th>날짜</th>  
			 </tr>   
			 <c:forEach var="i" begin="0" end="<%=listSize-1 %>" step="1">
			 <tr id="tr_qna_${i}" class="tr_qna_${i%2}">  
				 <td id='td_qna_idx_${i}' class="td_qna_idx"></td>   
				 <td id='td_qna_subject_${i}' class="td_qna_subject"></td>  
				 <td id='td_qna_qna_writer_${i}' class="td_qna_qna_writer"></td>   
				 <td id='td_qna_writedate_${i}' class="td_qna_writedate"></td>  
			 </tr>   
			 </c:forEach>
		</table>  
		<div id="div_page" align='center'></div><hr>
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
function resultSetting(list, page){
	
	for(var i=0; i<<%=listSize%>; i++){
		if(i>=list.length){
			var td_qna_idx = document.getElementById('td_qna_idx_'+i);
			var td_qna_subject = document.getElementById('td_qna_subject_'+i);
			var td_qna_qna_writer = document.getElementById('td_qna_qna_writer_'+i);
			var td_qna_writedate = document.getElementById('td_qna_writedate_'+i);
		
			td_qna_idx.innerHTML="";
			td_qna_subject.innerHTML="";
			td_qna_qna_writer.innerHTML="";
			td_qna_writedate.innerHTML="";
		}else{
			var tr_qna = document.getElementById("tr_qna_"+i);
			tr_qna.setAttribute(
					"onclick","location.href='mp_qna_content.do?qna_idx="+
					list[i].qna_idx+"'");
			
			var td_qna_idx = document.getElementById('td_qna_idx_'+i);
			var td_qna_subject = document.getElementById('td_qna_subject_'+i);
			var td_qna_qna_writer = document.getElementById('td_qna_qna_writer_'+i);
			var td_qna_writedate = document.getElementById('td_qna_writedate_'+i);
		
			td_qna_idx.innerHTML=list[i].qna_idx;
			td_qna_subject.innerHTML=list[i].qna_subject;
			td_qna_qna_writer.innerHTML=list[i].qna_writer;
			var tempDate = new Date((Date)(list[i].qna_writedate).toString());
			td_qna_writedate.innerHTML = tempDate.getFullYear()+"-"+
				tempDate.getMonth()+"-"+tempDate.getDate();
		}	
	}
	
	var div_page = document.getElementById('div_page');
	div_page.innerHTML=page;
}

var mpQnaAll = function() {
	if(XHR.readyState==4){
		if(XHR.status=200){
			var data = XHR.responseText;
			var list = eval('('+data+')').list;
			var page = eval('('+data+')').page;
			
			resultSetting(list,page);
		}
	}
}

var showAll = function(cp) {
	if(cp==null) cp=1;
	sendRequest("mp_qna_all_list.do?cp="+cp,null,mpQnaAll,'GET');
}

</script>

</html>