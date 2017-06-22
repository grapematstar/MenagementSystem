<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="gyum_02.mp_equipment.model.mp_EquipmentDTO" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

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
<!-- start: Css -->
<link rel="stylesheet" type="text/css" href="/gyum_02/asset/css/bootstrap.min.css">
<!-- plugins --> 
<link rel="stylesheet" type="text/css" 
href="/gyum_02/asset/css/plugins/font-awesome.min.css"/>
<link rel="stylesheet" type="text/css" 
href="/gyum_02/asset/css/plugins/animate.min.css"/>
<link href="/gyum_02/asset/css/style.css" rel="stylesheet">
<!-- end: Css -->
<link rel="shortcut icon" href="/gyum_02/asset/img/logomi.png">
<!-- IO: Css -->
<link rel="stylesheet" type="text/css" href="/gyum_02/css/masterpage/mp_all.css"/>
<link rel="stylesheet" type="text/css" 
 href="/gyum_02/css/masterpage/mp_equipment/mp_equipment_IO.css"/>

<title>Insert title here</title>
</head>
<!-- 

ArrayList<mp_EquipmentDTO> nameArr = 
	(ArrayList<mp_EquipmentDTO>)(request.getAttribute("nameList"));
System.out.println("222222222 :::" + nameArr.get(0).getEquip_name());
ArrayList<String> nameList = new ArrayList<String>();
String temp = "";
temp = nameArr.get(0).getEquip_name();
for(int i=1; i<nameArr.size(); i++){
	if(!temp.equals(nameArr.get(i).getEquip_name())){
		nameList.add(temp);
	}
	temp = nameArr.get(i).getEquip_name();
}
 -->

<script>
var list = [];

function listInsertAjax() {
	if(list.length<=0){
		alert('등록할 목록이 없습니다.');
		return;
	}
	$.ajax({
        url: "mp_equipment_insert_list.do",
        type: "POST",
        data: JSON.stringify(list), //Array를 JSON string형태로 변환
        dataType: "json",
        contentType: "application/json",
        success: function(data) {
        	alert(data.msg);
        	listReset();
        },
        error:function(data){
        	alert(data.msg);
        }
    });
}

function equipPlus(inOut) {
	var modal_e_s_modi_date_year = 
		document.getElementById('modal_e_s_modi_date_year');
	var modal_e_s_modi_date_month = 
		document.getElementById('modal_e_s_modi_date_month');
	var modal_e_s_modi_date_day =
		document.getElementById('modal_e_s_modi_date_day');
	var modal_e_s_modi_date = new Date();
	modal_e_s_modi_date.setFullYear(modal_e_s_modi_date_year.value);
	modal_e_s_modi_date.setMonth(modal_e_s_modi_date_month.value-1);
	modal_e_s_modi_date.setDate(modal_e_s_modi_date_day.value);
	var modal_equip_code = document.getElementById('modal_equip_code');
	var modal_equip_name = document.getElementById('modal_equip_name');
	var modal_equip_s_size_1 = document.getElementById('modal_equip_s_size_1');
	var modal_equip_s_size_2 = document.getElementById('modal_equip_s_size_2');
	var modal_equip_s_size = modal_equip_s_size_1.value + "*" + 
		modal_equip_s_size_2.value;
	var modal_e_s_in_out_num =
		document.getElementById('modal_e_s_in_out_num');
	
	list.push({'equip_lastdate':new Date().toString(),
		'e_s_modi_date':modal_e_s_modi_date.toString(),
		'e_s_in_out':inOut,
		'equip_code':modal_equip_code.value,
		'equip_name':modal_equip_name.value,
		'equip_s_size':modal_equip_s_size,
		'e_s_in_out_num':modal_e_s_in_out_num.value});
	
	
	var table_equipment = document.getElementById('table_equipment');
	var tr =  document.createElement('tr');
	tr.setAttribute("class","tr_equipment_"+((list.length-1)%2));
	table_equipment.appendChild(tr);
	
	if((list.length%2)==0){
		$('.tr_hollow_1').css("background-color","#f9f9f9;");
		$('.tr_hollow_0').css("background-color","#ffffff;");
	}else{
		$('.tr_hollow_0').css("background-color","#f9f9f9;");
		$('.tr_hollow_1').css("background-color","#ffffff;");
	}
	var td_e_s_modi_date = document.createElement('td');
	td_e_s_modi_date.setAttribute("class", 'td_e_s_modi_date');
	tr.appendChild(td_e_s_modi_date);
	
	var td_e_s_in_out = document.createElement('td');
	td_e_s_in_out.setAttribute("class", 'td_e_s_in_out');
	tr.appendChild(td_e_s_in_out);
	var td_equip_code = document.createElement('td');
	td_equip_code.setAttribute("class", 'td_equip_code');
	tr.appendChild(td_equip_code);
	var td_equip_name = document.createElement('td');
	td_equip_name.setAttribute("class", 'td_equip_name');
	tr.appendChild(td_equip_name);
	var td_equip_s_size = document.createElement('td');
	td_equip_s_size.setAttribute("class", 'td_equip_s_size');
	tr.appendChild(td_equip_s_size);
	var td_e_s_in_out_num = document.createElement('td');
	td_e_s_in_out_num.setAttribute("class", 'td_e_s_in_out_num');
	tr.appendChild(td_e_s_in_out_num);
	
	td_e_s_modi_date.innerHTML = modal_e_s_modi_date.getFullYear()+"-"+
		modal_e_s_modi_date.getMonth()+"-"+modal_e_s_modi_date.getDate();
	td_e_s_in_out.innerHTML = inOut;
	td_equip_code.innerHTML = modal_equip_code.value;
	td_equip_name.innerHTML = modal_equip_name.value;
	td_equip_s_size.innerHTML = modal_equip_s_size;
	td_e_s_in_out_num.innerHTML = modal_e_s_in_out_num.value;
	
	modalReset();
}

function listReset() {
	var table_equipment = document.getElementById('table_equipment');
	for(var i=0; i<list.length; i++){
		table_equipment.removeChild(table_equipment.childNodes[3]);
	}
	list = [];

}

function modalReset() {
	document.getElementById('modal_equip_name').setAttribute("value", "");
	document.getElementById('modal_equip_code').setAttribute("value", "");
	document.getElementById('modal_equip_s_size_1').setAttribute("value", "");
	document.getElementById('modal_equip_s_size_2').setAttribute("value", "");
	document.getElementById('form_modal').reset();
}

function autoSettingModal() {
	if(document.getElementById('select_modal_equip_name').value =='noName'){
		modalReset();
		return;
	}
	var select_modal_equip_name = 
		document.getElementById('select_modal_equip_name');
	var select_modal_equip_code = 
		document.getElementById('select_modal_equip_code');
	var select_modal_equip_s_size = 
		document.getElementById('select_modal_equip_s_size');
	
	var modal_equip_name_selected =
		select_modal_equip_name.options[
			select_modal_equip_name.selectedIndex].value;
	var modal_equip_code_selected =
		select_modal_equip_code.options[
			select_modal_equip_name.selectedIndex].value;
	var modal_equip_s_size_selected =
		select_modal_equip_s_size.options[
			select_modal_equip_name.selectedIndex].value;
	var modal_equip_name = document.getElementById('modal_equip_name');
	var modal_equip_code = document.getElementById('modal_equip_code');
	var modal_equip_s_size_1 = document.getElementById('modal_equip_s_size_1');
	var modal_equip_s_size_2 = document.getElementById('modal_equip_s_size_2');
	var selectedIndex = select_modal_equip_name.selectedIndex;
	document.getElementById('form_modal').reset();
	document.getElementById('select_modal_equip_name').selectedIndex = 
		selectedIndex;
	modal_equip_name.setAttribute("value", modal_equip_name_selected);
	modal_equip_code.setAttribute("value", modal_equip_code_selected);
	
//	modal_equip_s_size_1.setAttribute("value", modal_equip_s_size_selected);
	var splits_size =  modal_equip_s_size_selected.split("*");

	modal_equip_s_size_1.setAttribute("value", splits_size[0]);
	modal_equip_s_size_2.setAttribute("value", splits_size[1]);
	
}

</script>
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
		<div id="div_equipment_IO">
			<div id="div_equipment_IO_input">
				<input type="button" class="btn btn-default" value="추가"
						data-toggle="modal" data-target="#myModal">
				<input type="button" class="btn btn-default" value="등록" 
				 onclick="listInsertAjax()">
				<input type="button" class="btn btn-default" value="다시작성" 
				 onclick="listReset();">
			</div>
			 
			<form id="form_table">
				<table id="table_equipment" class="table table-hover" >
					<tr class="tr_hollow_2">
						<th class="td_e_s_modi_date">일자</th>
						<th class="td_e_s_in_out">입출고 구분</th>
						<th class="td_equip_code">관리번호</th>
						<th class="td_equip_name">품명</th>
						<th class="td_equip_s_size">규격</th>
						<th class="td_e_s_in_out_num">수량</th>
					</tr>
				</table>
			</form>
		</div>
	
		<!-- Modal -->
		<div class="modal fade" id="myModal" role="dialog">
			<div class="modal-dialog">
	
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close"
						 data-dismiss="modal">&times;</button>
						<h4 class="modal-title">비품 입출고 등록</h4>
					</div>
					<div class="modal-body">
						<form id="form_modal">
						<ul>
							<li class="modal_li_equip_name">
								<article class="article_data">
		<select onchange="autoSettingModal()"
		 id="select_modal_equip_name">
			<option value="noName">품목 추가</option>
			<c:forEach var="i"
			 begin="0" end="${fn:length(nameList)>0?fn:length(nameList)-1:0}"
			  step="1">
				<option value="${nameList[i].equip_name}">
					${nameList[i].equip_name}
					 - ${nameList[i].equip_code}
					(${nameList[i].equip_s_size})
				</option>
			</c:forEach>
		</select>
									<input type="text" id="modal_equip_name">
								</article>
							</li>
							<li class="modal_li_equip_code">
								<article class="article_label"
								 >제품 코드</article>
								<article class="article_data">
									<input type="text" id="modal_equip_code">
		<select hidden="true" id="select_modal_equip_code">
			<option value="noName"></option>
			<c:forEach var="i"
			 begin="0" end="${fn:length(nameList)>0?fn:length(nameList)-1:0}"
			  step="1">
			<option value="${nameList[i].equip_code}">
					${nameList[i].equip_code}
				</option>
			</c:forEach>
		</select>
								</article>
							</li>
							<li class="modal_li_day">
								<article class="article_label"
								 >입/출고 일</article>
								<article class="article_data">
									<input type="number"
									 id="modal_e_s_modi_date_year"
									 value="<%=new Date().getYear()+1900%>"
									 >년<input type="number"
									 id="modal_e_s_modi_date_month"
									 value="<%=new Date().getMonth()+1%>"
									 >월<input type="number"
									 id="modal_e_s_modi_date_day"
									 value="<%=new Date().getDate()%>"
									 >일
								</article>
							</li>
							<li class="modal_li_equip_s_size">
								<article class="article_label"
								 >규격</article>
								<article class="article_data">
									<input type="number" id="modal_equip_s_size_1"
									> * <input type="number" 
									 id="modal_equip_s_size_2">
		<select hidden="true" id="select_modal_equip_s_size">
			<option value="noName"></option>
			<c:forEach var="i"
			 begin="0" end="${fn:length(nameList)>0?fn:length(nameList)-1:0}"
			  step="1">
			<option value="${nameList[i].equip_s_size}">
					${nameList[i].equip_s_size}
				</option>
			</c:forEach>
		</select></article></li>
							<li class="modal_li_e_s_in_out_num"><article class="article_label"
								 >수량</article><article class="article_data"><input 
								 type="number" id="modal_e_s_in_out_num">
								</article>
							</li>
						</ul>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default"
 onclick="modalDataTest()?[equipPlus('in'),alert('입고 추가되었습니다.'),modalReset()]:'';"
 >입고 추가</button>
						<button type="button" class="btn btn-default"
 onclick="modalDataTest()?[equipPlus('out'),alert('출고 추가되었습니다.'),modalReset()]:'';"
 >출고 추가</button>
						<button type="button" class="btn btn-default"
						 data-dismiss="modal">취소</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
var table_equipment = document.getElementById('table_equipment');
var tfoot_equipment = document.createElement('tfoot');
table_equipment.appendChild(tfoot_equipment);

for(var i=0; i<5; i++){
	var tr_hollow = document.createElement('tr');
	tr_hollow.setAttribute("class","tr_hollow_"+(i%2));
	tfoot_equipment.appendChild(tr_hollow);
	
	var td_hollow = document.createElement('td');
	td_hollow.setAttribute("class","td_hollow_"+(i%2));
	td_hollow.setAttribute("colspan","10");
	tr_hollow.appendChild(td_hollow);
}

/* 모달 비품 등록버튼 클릭 시 데이터 유효성 검사  */
var modalDataTest = function() {
	var modal_e_s_modi_date_year = 
		document.getElementById('modal_e_s_modi_date_year').value;
	var modal_e_s_modi_date_month = 
		document.getElementById('modal_e_s_modi_date_month').value;
	var modal_e_s_modi_date_day =
		document.getElementById('modal_e_s_modi_date_day').value;
	var modal_equip_code = document.getElementById('modal_equip_code').value;
	var modal_equip_name = document.getElementById('modal_equip_name').value;
	var modal_equip_s_size_1 = document.getElementById('modal_equip_s_size_1').value;
	var modal_equip_s_size_2 = document.getElementById('modal_equip_s_size_2').value;
	var modal_e_s_in_out_num = document.getElementById('modal_e_s_in_out_num').value;

	var result = true;
	
	if(modal_e_s_modi_date_year==null || modal_e_s_modi_date_year=='' ||
		modal_e_s_modi_date_year<=2015 || modal_e_s_modi_date_year>(new Date().getFullYear()) ||
		modal_e_s_modi_date_year!=parseInt(modal_e_s_modi_date_year)){
		result = false;
	}else if(modal_e_s_modi_date_month==null || modal_e_s_modi_date_month=='' ||
			modal_e_s_modi_date_month<1 || modal_e_s_modi_date_month>12 ||
			modal_e_s_modi_date_month!=parseInt(modal_e_s_modi_date_month)){
		result = false;
	}else if(modal_e_s_modi_date_day==null || modal_e_s_modi_date_day=='' ||
			modal_e_s_modi_date_day<1 || modal_e_s_modi_date_day>31 ||
			modal_e_s_modi_date_day!=parseInt(modal_e_s_modi_date_day)){
		result = false;
	}else if(modal_equip_code==null || modal_equip_code.replace(/\s/g, "")==''){
		result = false;
	}else if(modal_equip_name==null || modal_equip_name.replace(/\s/g, "")==''){
		result = false;
	}else if(modal_equip_s_size_1==null || modal_equip_s_size_1=='' ||
			modal_equip_s_size_1<=0 || modal_equip_s_size_1!=parseInt(modal_equip_s_size_1)){
		result = false;
	}else if(modal_equip_s_size_2==null || modal_equip_s_size_2=='' ||
			modal_equip_s_size_2<=0 || modal_equip_s_size_2!=parseInt(modal_equip_s_size_2)){
		result = false;
	}else if(modal_e_s_in_out_num==null || modal_e_s_in_out_num=='' ||
			modal_e_s_in_out_num<=0 || modal_e_s_in_out_num!=parseInt(modal_e_s_in_out_num)){
		result = false;
	}
	
	if(!result){
		alert('데이터가 올바르지 않습니다.');
	}else{
		var select_modal_equip_name = 
			document.getElementById('select_modal_equip_name');
		var select_modal_equip_code = 
			document.getElementById('select_modal_equip_code');
		var select_modal_equip_s_size = 
			document.getElementById('select_modal_equip_s_size');
		
		var modal_equip_name_selected =
			select_modal_equip_name.options[
				select_modal_equip_name.selectedIndex].value;
		var modal_equip_code_selected =
			select_modal_equip_code.options[
				select_modal_equip_name.selectedIndex].value;
		var modal_equip_s_size_selected =
			select_modal_equip_s_size.options[
				select_modal_equip_name.selectedIndex].value;

		var modal_equip_s_size = modal_equip_s_size_1 + "*" + 
			modal_equip_s_size_2;
		
		if(select_modal_equip_name.selectedIndex!=0){
			if(modal_equip_name_selected!=modal_equip_name ||
				modal_equip_code_selected!=modal_equip_code ||
				modal_equip_s_size_selected!=modal_equip_s_size){
				result = confirm('새로운 품목을 추가하시겠습니까?');
			}
		}else{
			var j=0;
			for(var i=0; i<'${fn:length(nameList)}'; i++){
				if(select_modal_equip_name.options[i+1].value!=modal_equip_name){
					j++;
				}else{
					j=0;
					if(select_modal_equip_code.options[i+1].value!=modal_equip_code){
						j++;
					}else{
						j=0;
						if(select_modal_equip_s_size.options[i+1].value!=modal_equip_s_size){
							j++;
						}else{
							j=0;
							break;
						}
					}
				}
				
			}
			if(j>0){
				result = confirm('새로운 품목을 추가하시겠습니까?');
			}
		}
	}
	return result;
}


</script>
<script src="/gyum_02/asset/js/jquery.min.js"></script>
<script src="/gyum_02/asset/js/jquery.ui.min.js"></script>
<script src="/gyum_02/asset/js/bootstrap.min.js"></script>
<!-- plugins -->
<script src="/gyum_02/asset/js/plugins/moment.min.js"></script>
<script src="/gyum_02/asset/js/plugins/jquery.nicescroll.js"></script>
<!-- custom -->
<script src="/gyum_02/asset/js/main.js"></script>
</body>
</html>