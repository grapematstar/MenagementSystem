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
	width: 570px;
	height: 700px;
}
#eval_note thead th{
	font-size: 12px;
}
</style>
<script>
if('${eval_content}'!=''){
	
	document.getElementsByName('c_e_a1')[${eval_content.c_e_a1}-1].checked=true;
	document.getElementsByName('c_e_a2')[${eval_content.c_e_a2}-1].checked=true;
	document.getElementsByName('c_e_a3')[${eval_content.c_e_a3}-1].checked=true;
	document.getElementsByName('c_e_a4')[${eval_content.c_e_a4}-1].checked=true;
	document.getElementsByName('c_e_a5')[${eval_content.c_e_a5}-1].checked=true;
}
function modiEvalAnswer(){
	var addr = 'my_class_eval_modi.do?';
	var class_idx = document.getElementById('class_idx').value;
	addr += 'class_idx='+class_idx;
	
	for(var i = 1; i < 6; i++){
		var ans;
		for(var j = 0; j < 5; j++){
			if(document.getElementsByName('c_e_a'+i)[j].checked==true){
				ans = document.getElementsByName('c_e_a'+i)[j].value;
				break;
			}
		}
		addr += '&c_e_a'+i+'='+ans;
	}
	addr += '&c_e_note='+document.getElementById('c_e_note').value;
	location.href = addr;
}
</script>
</head>
<body>
작성자 : ${student_name }
강의명 : ${class_name }
<form name="class_eval" action="my_class_eval_submit.do" method="post">
<input type="hidden" id="class_idx" name="class_idx" value="${class_idx }">
<input type="hidden" name="c_e_fix" value="0">
<input type="hidden" name="stu_idx" value="3">
<table id="eval_note" class="table table-striped table-bordered dataTable no-footer">
	<thead>
		<tr>
			<th width="220">평가항목</th>
			<th width="70">매우그렇지않다</th>
			<th width="70">그렇지않다</th>
			<th width="70">보통</th>
			<th width="70">그렇다</th>
			<th width="70">매우그렇다</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach var="question" items="${eval_question }">
		<tr>
			<td style="text-align: left;">${question.c_e_q_question }</td>
			<c:forEach var="num" begin="1" end="5" step="1">
				<td><div class="form-animate-radio"><label class="radio"><input type="radio" name="c_e_a${question.c_e_q_idx }" id="c_e_a${question.c_e_q_idx }" value="${num }"><span class="outer"><span class="inner"></span></span></label></div></td>
			</c:forEach>
		</tr>
	</c:forEach>
	<tr>
		<td colspan="6" style="text-align: left;">${note }<br><br>
		<textarea id="c_e_note" class="form-control" name="c_e_note">${eval_content.c_e_note}</textarea></td>
	</tr>
	</tbody>
</table>
<c:if test="${fix=='fix' }">
	<input type="button" value="수정" class="btn btn-primary" onclick="modiEvalAnswer()">
	<input type="button" value="확정" class="btn btn-danger" onclick="location.href='my_class_eval_set.do?class_idx=${class_idx}';">
</c:if>
<c:if test="${fix=='none' }">
	<input type="submit" class="btn btn-primary" value="완료">
</c:if>
</form>
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