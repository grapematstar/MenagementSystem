<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<script src="/gyum_02/build/js/httpRequest.js" type="text/javascript"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.js" 
	integrity="sha256-DZAnKJ/6XZ9si04Hgrsxu/8s717jcIzLy3oi35EouyE=" 
	crossorigin="anonymous">
</script>
<!-- start: Css -->
<link rel="stylesheet" type="text/css" href="/gyum_02/asset/css/bootstrap.min.css">
<!-- plugins --> 
<link rel="stylesheet" type="text/css" href="/gyum_02/asset/css/plugins/font-awesome.min.css"/>
<link rel="stylesheet" type="text/css" href="/gyum_02/asset/css/plugins/animate.min.css"/>
<link href="/gyum_02/asset/css/style.css" rel="stylesheet">
<!-- end: Css -->
<link rel="shortcut icon" href="/gyum_02/asset/img/logomi.png">
<!-- status: Css -->
<link rel="stylesheet" type="text/css" href="/gyum_02/css/masterpage/mp_all.css"/>
<link rel="stylesheet" type="text/css" 
 href="/gyum_02/css/masterpage/mp_equipment/mp_equipment_status.css"/>

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
	
		<table id='table_equipment' class="table table-hover" >
			<tr class="tr_equipment_2">
				<th>순번</th><th>관리번호</th><th>품명</th><th>규격</th>
				<th>최초 수량</th><th>현재 수량</th> <th>취득일자</th>
			</tr>
			<c:set var="i" value="0"/>
			<c:forEach var="dto" items="${list }" >
				<tr class="tr_equipment_${i%2}">
					<td id='td_equip_equip_idx_${i}' class="td_equip_equip_idx">
						${dto.equip_idx}
					</td>
					<td id='td_equip_code_${i}' class="td_equip_code">
						${dto.equip_code }
					</td>
					<td id='td_equip_name_${i}' class="td_equip_name">
						${dto.equip_name }
					</td>
					<td id='td_equip_s_size_${i}' class="td_equip_s_size">
						${dto.equip_s_size }
					</td>
					<td id='td_equip_first_num_${i}'
					 class="td_equip_first_num">
						${dto.equip_first_num }
					</td>
					<td id='td_equip_last_num_${i}'
					 class="td_equip_last_num">
						${dto.equip_last_num }
					</td>
					<td id='td_equip_firstdate_${i}'
					 class="td_equip_firstdate">
						${dto.equip_firstdate }
					</td>
				</tr>
				<c:set var="i" value="${i+1}"/>
			</c:forEach>
		</table>
		<div id="div_page" align='center'>${page }</div><hr>
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
</html>