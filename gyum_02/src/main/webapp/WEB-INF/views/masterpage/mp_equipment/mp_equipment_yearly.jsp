<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Meta, title, CSS, favicons, etc. -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Bootstrap -->
<link href="/gyum_02/vendors/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Font Awesome -->
<link href="/gyum_02/vendors/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<!-- NProgress -->
<link href="/gyum_02/vendors/nprogress/nprogress.css" rel="stylesheet">


<script src="/gyum_02/build/js/httpRequest.js" type="text/javascript"></script>

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
<!-- yearly: Css -->
<link rel="stylesheet" type="text/css" href="/gyum_02/css/masterpage/mp_all.css"/>
<link rel="stylesheet" type="text/css" 
 href="/gyum_02/css/masterpage/mp_equipment/mp_equipment_yearly.css"/>

<title>Insert title here</title>
</head>
<script>
var bol = {
	year:'1',		
	chart:'bar',
	e_s_in_out:'all'
}
//mav.addObject("nameList",nameList);
//mav.addObject("list",list);
//mav.addObject("firstYear",firstYear);

var map = '${map}';

var list = eval('('+map+')').list;
var nameList = eval('('+map+')').nameList;
var yearList = eval('('+map+')').yearList;
var modiYearList = eval('('+map+')').modiYearList;

var resultListAll = [];
var resultListIn = [];
var resultListOut = [];

for(var i=0; i<=yearList.length+1; i++){
	resultListAll[i] = 0;
	resultListIn[i] = 0;
	resultListOut[i] = 0;
}

var settingTable = function() {
	//그래프 데이터 세팅
	for(var i=0; i<list.length; i++){
		resultListAll[modiYearList[i]-yearList[0]+1901] += list[i].e_s_in_out_num;
		if(list[i].e_s_in_out == 'in'){
			resultListIn[modiYearList[i]-yearList[0]+1901] += list[i].e_s_in_out_num;
		}else if(list[i].e_s_in_out == 'out'){
			resultListOut[modiYearList[i]-yearList[0]+1901] += list[i].e_s_in_out_num;
		}
	}
	
	//테이블 세팅
	var table_equipment = document.getElementById("table_equipment");
	
	while (table_equipment.hasChildNodes()) {
		table_equipment.removeChild(table_equipment.firstChild);
	}
	//for 돌려서 세팅
	var year_data_html = "";
	for(var i=yearList[0]; i<=yearList[yearList.length-1]; i++){
		year_data_html +="<th>"+i+"년</th>";
	}
	
	table_equipment.innerHTML = "<tr><th>관리번호</th> <th>품명/규격</th>"+
	"<th>입출고구분</th> "+year_data_html+" <th>합계</th></tr>";
	
	for(var i=0; i<nameList.length*2; i++){
		if(i%2==0){
			var tr = document.createElement('tr');
			table_equipment.appendChild(tr);
			/* 관리번호 */
			var td_equip_code = document.createElement('td');
			td_equip_code.setAttribute("rowspan", "2");
			tr.appendChild(td_equip_code);
			var equip_code = document.createTextNode(nameList[parseInt(i/2)].equip_code);
			//또는 document.createTextNode(list[i].equip_code);
			td_equip_code.appendChild(equip_code);
			
			/* 품명 / 규격*/
			var td_equip_name = document.createElement('td');
			tr.appendChild(td_equip_name);
			var equip_name = document.createTextNode(nameList[parseInt(i/2)].equip_name);
			td_equip_name.appendChild(equip_name);
			
			/* 입출고 구분 */
			var td_e_s_in_out = document.createElement('td');
			tr.appendChild(td_e_s_in_out);
			var e_s_in_out = document.createTextNode("입고");
			td_e_s_in_out.appendChild(e_s_in_out);
			var sum_data = 0;
			/* 년 */
			for(var j=0; j<yearList.length; j++){
				var data_number = 0;
				for(var k=0; k<list.length; k++){
					if(list[k].equip_name == nameList[parseInt(i/2)].equip_name
						&& list[k].e_s_in_out == 'in'
						&& modiYearList[k]-yearList[0]+1900==j){
						data_number += list[k].e_s_in_out_num;
					}
				}
				sum_data += data_number;
				var td_data = document.createElement('td');
				tr.appendChild(td_data);
				var data = document.createTextNode(data_number);
				td_data.appendChild(data);
			}
			
			/* 합계 */
			var td_sum = document.createElement('td');
			tr.appendChild(td_sum);
			var sum = document.createTextNode(sum_data);
			td_sum.appendChild(sum);
			
		}else{
			var tr = document.createElement('tr');
			table_equipment.appendChild(tr);
			
			var td_equip_s_size = document.createElement('td');
			tr.appendChild(td_equip_s_size);
			var equip_s_size = document.createTextNode(nameList[parseInt(i/2)].equip_s_size);
			td_equip_s_size.appendChild(equip_s_size);
			
			/* 입출고 구분 */
			var td_e_s_in_out = document.createElement('td');
			tr.appendChild(td_e_s_in_out);
			var e_s_in_out = document.createTextNode("출고");
			td_e_s_in_out.appendChild(e_s_in_out);
			var sum_data = 0;
			/* 년 */
			for(var j=0; j<yearList.length; j++){
				var data_number = 0;
				for(var k=0; k<list.length; k++){
					if(list[k].equip_name == nameList[parseInt(i/2)].equip_name
						&& list[k].e_s_in_out == 'out'
						&& modiYearList[k]-yearList[0]+1900==j){
						data_number += list[k].e_s_in_out_num;
					}
				}
				sum_data += data_number;
				var td_data = document.createElement('td');
				tr.appendChild(td_data);
				var data = document.createTextNode(data_number);
				td_data.appendChild(data);
			}
			var td_sum = document.createElement('td');
			tr.appendChild(td_sum);
			var sum = document.createTextNode(sum_data);
			td_sum.appendChild(sum);
			
		}
		
	}
	
}
</script>

	<!-- bar Chart -->
	<script>
	function createBarChart(){
		var div_chart = document.getElementById("div_chart");
		var canvas_bar_chart = document.createElement('canvas');
		canvas_bar_chart.setAttribute("id", "canvas_bar_chart");
		div_chart.appendChild(canvas_bar_chart);
		
	//	var f=document.getElementById("canvas_chart");
		var yearList_label = [];
		for(var i="${yearList[0]-1}", j=0;
			i<="${yearList[fn:length(requestScope.yearList)-1]+1}"; i++, j++){
			yearList_label[j] = i;
		}
		if(bol.e_s_in_out == 'all'){
			new Chart(
					canvas_bar_chart,
					{type:"bar",
						data:{labels:yearList_label,
							datasets:[{label:"# 입고",
								backgroundColor:"#26B99A",
							data:resultListIn},
							{label:"# 출고",
								backgroundColor:"#03586A",
								data:resultListOut}]
					},
					options:{scales:{yAxes:[{ticks:{beginAtZero:!0}}]}}}
				)
		}else{
			var resultList;
			var labelValue;
			var backgroundColorValue;
			if(bol.e_s_in_out == 'in'){
				resultList = resultListIn;
				labelValue = "# 입고";
				backgroundColorValue = "#26B99A";
			}else if(bol.e_s_in_out == 'out'){
				resultList = resultListOut;
				labelValue = "# 출고";
				backgroundColorValue = "#03586A";
			}
			new Chart(
					canvas_bar_chart,
					{type:"bar",
						data:{labels:yearList_label,
							datasets:[{label:labelValue,
								backgroundColor:backgroundColorValue,
							data:resultList}]
					},
					options:{scales:{yAxes:[{ticks:{beginAtZero:!0}}]}}}
				)
		}
	}
	</script>

	<!-- line Chart -->
	<script>
	function createLineChart(){
		var div_chart = document.getElementById("div_chart");
		
		var canvas_line_chart = document.createElement('canvas');
		canvas_line_chart.setAttribute("id", "canvas_line_chart");
		div_chart.appendChild(canvas_line_chart);
		
	//	var f=document.getElementById("canvas_chart");
		var yearList_label = [];
		for(var i="${yearList[0]-1}", j=0;
			i<="${yearList[fn:length(requestScope.yearList)-1]+1}"; i++, j++){
			yearList_label[j] = i;
		}
	
		if(bol.e_s_in_out == 'all'){
			new Chart(
					canvas_line_chart,
					{type:"line",
						data:{
							labels:yearList_label,
							datasets:[
								{label:"# 입고",
									backgroundColor:"rgba(38, 185, 154, 0.31)",
									borderColor:"rgba(38, 185, 154, 0.7)",
									pointBorderColor:"rgba(38, 185, 154, 0.7)",
									pointBackgroundColor:"rgba(38, 185, 154, 0.7)",
									pointHoverBackgroundColor:"#fff",
									pointHoverBorderColor:"rgba(220,220,220,1)",
									pointBorderWidth:1,
									data:resultListIn},
								{label:"# 출고",
										backgroundColor:"rgba(3, 88, 106, 0.3)",
										borderColor:"rgba(3, 88, 106, 0.70)",
										pointBorderColor:"rgba(3, 88, 106, 0.70)",
										pointBackgroundColor:"rgba(3, 88, 106, 0.70)",
										pointHoverBackgroundColor:"#fff",
										pointHoverBorderColor:"rgba(151,187,205,1)",
										pointBorderWidth:1,
										data:resultListOut}
							]
						}
					}
				)
		}else{
			var resultList;
			var labelValue;
			var backgroundColorValue;
			var borderColorValue;
			var pointBorderColorValue;
			var pointBackgroundColorValue;
			var pointHoverBackgroundColorValue;
			var pointHoverBorderColorValue;
			
			if(bol.e_s_in_out == 'in'){
				resultList = resultListIn;
				labelValue = "# 입고";
				backgroundColorValue = "rgba(38, 185, 154, 0.31)";
				borderColorValue ="rgba(38, 185, 154, 0.7)";
				pointBorderColorValue ="rgba(38, 185, 154, 0.7)";
				pointBackgroundColorValue ="rgba(38, 185, 154, 0.7)";
				pointHoverBackgroundColorValue ="#fff";
				pointHoverBorderColorValue ="rgba(220,220,220,1)";
			}else if(bol.e_s_in_out == 'out'){
				resultList = resultListOut;
				labelValue = "# 출고";
				backgroundColorValue = "rgba(3, 88, 106, 0.3)";
				borderColorValue ="rgba(3, 88, 106, 0.70)";
				pointBorderColorValue ="rgba(3, 88, 106, 0.70)";
				pointBackgroundColorValue ="rgba(3, 88, 106, 0.70)";
				pointHoverBackgroundColorValue ="#fff";
				pointHoverBorderColorValue ="rgba(151,187,205,1)";
			}
			new Chart(
					canvas_line_chart,
					{type:"line",
						data:{
							labels:yearList_label,
							datasets:[
								{label:labelValue,
									backgroundColor:backgroundColorValue,
									borderColor:borderColorValue,
									pointBorderColor:pointBorderColorValue,
									pointBackgroundColor:pointBackgroundColorValue,
									pointHoverBackgroundColor:pointHoverBackgroundColorValue,
									pointHoverBorderColor:pointHoverBorderColorValue,
									pointBorderWidth:1,
									data:resultList}
							]
						}
					}
				)
		}
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
		<div class="div_search">
			<select id="select_chart">
				<option value="bar">막대 그래프</option>
				<option value="line">선형 그래프</option>
			</select>
			<select id="select_e_s_in_out">
				<option value="all">전체</option>
				<option value="in">입고</option>
				<option value="out">출고</option>
			</select>
			
			<input type="button" value="조회" onclick="show()" class="btn btn-default">
		</div>
		
		<!-- /mp - header -->
		<div class="div_chart_row">
			<div class="col-md-6 col-sm-6 col-xs-12">
				<div class="x_panel">
					<div id="div_chart">
						<canvas id="canvas_chart"></canvas>
					</div>
				</div>
			</div>
		</div>
		<table id="table_equipment" class="table table-hover">
			<tr id="tr_th">
				<th>관리번호</th> <th>품명/규격</th> <th>입출고구분</th> 
				<c:forEach var="i" begin="${yearList[0]}"
				 end="${yearList[fn:length(requestScope.yearList)-1]}" step="1">
					<th>${i }년</th>
				</c:forEach>
				 <th>합계</th>
			</tr>
		</table>
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
var show = function() {
	
	var select_chart = document.getElementById('select_chart');
	var chart = select_chart.options[select_chart.selectedIndex].value;

	var select_e_s_in_out = document.getElementById('select_e_s_in_out');
	var e_s_in_out = select_e_s_in_out.options[select_e_s_in_out.selectedIndex].value;
	bol.chart = chart;
	bol.e_s_in_out = e_s_in_out;
	var div_chart = document.getElementById("div_chart");
	while (div_chart.hasChildNodes()) {
		div_chart.removeChild(div_chart.firstChild);
	}
	
	settingTable();
	
	if(bol.chart == 'bar'){
		createBarChart();
	}else if(bol.chart == 'line'){
		createLineChart();
	}else{
		alert('막대기 에러');
	}
	
	
}
</script>
<!-- jQuery -->
<script src="/gyum_02/vendors/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="/gyum_02/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- FastClick -->
<script src="/gyum_02/vendors/fastclick/lib/fastclick.js"></script>
<!-- NProgress -->
<script src="/gyum_02/vendors/nprogress/nprogress.js"></script>
<!-- Chart.js -->
<script src="/gyum_02/vendors/Chart.js/dist/Chart.min.js"></script>
</html>
