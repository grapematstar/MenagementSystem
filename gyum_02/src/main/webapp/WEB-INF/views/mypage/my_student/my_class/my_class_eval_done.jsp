<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="asset/css/bootstrap.min.css">

<!-- plugins -->
<link rel="stylesheet" type="text/css" href="asset/css/plugins/font-awesome.min.css"/>
<link rel="stylesheet" type="text/css" href="asset/css/plugins/simple-line-icons.css"/>
<link rel="stylesheet" type="text/css" href="asset/css/plugins/mediaelementplayer.css"/>
<link rel="stylesheet" type="text/css" href="asset/css/plugins/animate.min.css"/>
<link rel="stylesheet" type="text/css" href="asset/css/plugins/icheck/skins/flat/red.css"/>
<link href="asset/css/style.css" rel="stylesheet">
<!-- end: Css -->
<link rel="shortcut icon" href="asset/img/logomi.png">
<style>
#eval_note{
	height: 700px;
}
#eval_note thead th{
	font-size: 12px;
}
.c_e_note{
	overflow: auto;
}
</style>
<script>
if('${eval_content}'!=''){
	
	document.getElementById('${eval_content.c_e_a1}'+'c_e_a1').innerHTML = '◎';
	document.getElementById('${eval_content.c_e_a2}'+'c_e_a2').innerHTML = '◎';
	document.getElementById('${eval_content.c_e_a3}'+'c_e_a3').innerHTML = '◎';
	document.getElementById('${eval_content.c_e_a4}'+'c_e_a4').innerHTML = '◎';
	document.getElementById('${eval_content.c_e_a5}'+'c_e_a5').innerHTML = '◎';
}
</script>
</head>
<body>
강의명 : ${class_name }
<table id="eval_note" class="table table-striped table-bordered dataTable no-footer">
	<thead>
		<tr>
			<th width="200">평가항목</th>
			<th width="120">매우그렇지않다</th>
			<th width="120">그렇지않다</th>
			<th width="120">보통</th>
			<th width="120">그렇다</th>
			<th width="120">매우그렇다</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach var="question" items="${eval_question }">
		<tr>
			<td>${question.c_e_q_question }</td>
			<c:forEach var="num" begin="1" end="5" step="1">
				<td align="center" id="${num }c_e_a${question.c_e_q_idx }"></td>
			</c:forEach>
		</tr>
	</c:forEach>
	<tr>
		<td colspan="6" style="text-align: left;">${note }<br><br>
		<textarea id="c_e_note" class="form-control" name="c_e_note" readonly>${eval_content.c_e_note}</textarea>
	</td>
	</tr>
	</tbody>
</table>
</body>
<!-- start: Javascript -->
<script src="asset/js/jquery.min.js"></script>
<script src="asset/js/jquery.ui.min.js"></script>
<script src="asset/js/bootstrap.min.js"></script>


<!-- plugins -->
<script src="asset/js/plugins/moment.min.js"></script>
<script src="asset/js/plugins/icheck.min.js"></script>
<script src="asset/js/plugins/jquery.nicescroll.js"></script>


<!-- custom -->
<script src="asset/js/main.js"></script>
</html>