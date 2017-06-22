<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<script src="/gyum_02/build/js/httpRequest.js" type="text/javascript"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%
	int listSize=5;
%>
<body onload="showAll(1)">
<div id="div_select"></div>
	<table id='table_student' border='1'>
		<tr>
			<th>번호</th><th>반</th><th>이름</th><th>전화번호</th>
			<th>e-mail</th><th>출신 학교</th><th>가입일</th>
		</tr>
		<c:forEach var="i" begin="0" end="<%=listSize - 1%>" step="1">
			<tr>
				<td id='td_student_idx_${i}' class="td_student_idx"></td>
				<td id='td_student_class_id_${i}' class="td_student_class_id"></td>
				<td id='td_student_name_${i}' class="td_student_name"></td>
				<td id='td_student_tel_${i}' class="td_student_tel"></td>
				<td id='td_student_email_${i}' class="td_student_email"></td>
				<td id='td_student_school_${i}' class="td_student_school"></td>
				<td id='td_student_date_${i}' class="td_student_date"></td>
			</tr>
		</c:forEach>
	</table>
	<div id="div_page" align='center'></div><hr>
<input type="button" value="전체 보기" onclick="showAll(1)">
<input type="button" value="반별 보기" onclick="showClass(1)">
</body>
<script>
function resultSetting(list, page){
	for(var i=0; i<<%=listSize %>; i++){
		if(i>=list.length) {
			var td_student_idx = document.getElementById('td_student_idx_'+i);
			var td_student_class_id = document.getElementById('td_student_class_id_'+i);
			var td_student_name = document.getElementById('td_student_name_'+i);
			var td_student_tel = document.getElementById('td_student_tel_'+i);
			var td_student_email = document.getElementById('td_student_email_'+i);
			var td_student_school = document.getElementById('td_student_school_'+i);
			var td_student_date = document.getElementById('td_student_date_'+i);

			td_student_idx.innerHTML="";
			td_student_class_id.innerHTML="";
			td_student_name.innerHTML="";
			td_student_tel.innerHTML="";
			td_student_email.innerHTML="";
			td_student_school.innerHTML="";
			td_student_date.innerHTML="";
			
		}else{
			var td_student_idx = document.getElementById('td_student_idx_'+i);
			var td_student_class_id = document.getElementById('td_student_class_id_'+i);
			var td_student_name = document.getElementById('td_student_name_'+i);
			var td_student_tel = document.getElementById('td_student_tel_'+i);
			var td_student_email = document.getElementById('td_student_email_'+i);
			var td_student_school = document.getElementById('td_student_school_'+i);
			var td_student_date = document.getElementById('td_student_date_'+i);

			td_student_idx.innerHTML=list[i].idx;
			td_student_class_id.innerHTML=list[i].class_id;
			td_student_name.innerHTML=list[i].name;
			td_student_tel.innerHTML=list[i].tel;
			td_student_email.innerHTML=list[i].email;
			td_student_school.innerHTML=list[i].school;
			td_student_date.innerHTML="2020.";
		}
	}
	var div_page = document.getElementById('div_page');
	div_page.innerHTML=page;
}

var mpStudentAll = function() {
	if(XHR.readyState==4){
		if(XHR.status=200){
			var data = XHR.responseText;
			var list = eval('('+data+')').list;
			var page = eval('('+data+')').page;
			
			var div_select = document.getElementById('div_select');
	
			while (div_select.hasChildNodes()) {
				div_select.removeChild(div_select.firstChild);
			}
			resultSetting(list,page);
		}
	}
}

var mpStudentClass = function() {
	if(XHR.readyState==4){
		if(XHR.status=200){
			var data = XHR.responseText;
			var list = eval('('+data+')').list;
			var page = eval('('+data+')').page;
			var classList = eval('('+data+')').classList;
			var div_select = document.getElementById('div_select');
			
			if (!div_select.hasChildNodes()) {
				var select = document.createElement('select');
				select.setAttribute("id", "select_student");
				select.setAttribute("onChange", "setValue();");
				div_select.appendChild(select);
				
				for(var i=0; i<classList.length; i++){
					var option = document.createElement('option');
					option.setAttribute("value", classList[i]);
					option.innerHTML=classList[i];
					select.appendChild(option);
				}
				
				var button = document.createElement("input");
				button.setAttribute("type", "button");
				button.setAttribute("value", "조회");
				button.setAttribute("id", "button_student_class");
				button.setAttribute("onclick", "showClass(1)");
				div_select.appendChild(button);
			}
			resultSetting(list,page);
		}
	}
}

var showAll = function(cp) {
	if(cp==null) cp=1;
	sendRequest("mp_student_all_list.do?cp="+cp,null,mpStudentAll,'GET');
}

var showClass = function(cp, className) {
	if(!className){
		sendRequest("mp_student_class_list.do?cp="+cp,null,mpStudentClass,'GET');
	}else{
		sendRequest("mp_student_class_list.do?cp="+cp+"&class_id="+className,null,mpStudentClass,'GET');
	}
}

function setValue() {
	var select_student = document.getElementById('select_student');
	var className = select_student.options[select_student.selectedIndex].text;
	var button = document.getElementById('button_student_class');
	button.setAttribute("onclick", "showClass(1,'"+className+"')");
}
</script>

</html>