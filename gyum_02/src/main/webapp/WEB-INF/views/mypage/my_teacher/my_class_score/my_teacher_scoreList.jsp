<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
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
<script type="text/javascript">
function first(){
	if('${msg}'!=''){
		alert('${msg}');
		location.href = 'my_teacher_class_student_score_All.do';
		return;
	}
}
</script>
</head>
<body id="mimin" class="dashboard" onload="first()">
<%@include file="/header.jsp" %>
<div class="container-fluid mimin-wrapper">
<%@include file="/mypage_sidemenu.jsp" %>
<div id="content" class="article-v1">
<div class="panel " style="width: 930px;">
  <div class="panel-body">
    <div class="col-md-12">
        <h3 class="animated fadeInLeft">학생부</h3>
        <p class="animated fadeInDown">
		     학생부 <span class="fa-angle-right fa"></span> 강의별 성적 현황
        </p>
    </div>
  </div>
</div>

<div class="panel " style="margin-top: 20px;width: 930px;">
  <div class="panel-body">
<table class="table table-striped table-bordered dataTable no-footer" style="width:900px;">
	<thead>
		<tr>
			<th width="150">이름</th>
			<c:forEach var="list" items="${dsTotalList }">
				<th>${list.examDate }</th>
			</c:forEach>
			<c:if test="${empty dsTotalList }">
				<th width="750"></th>
			</c:if>
		</tr>
	</thead>
	<tbody>
	<c:forEach var="list" items="${stuScoreList }">
		<tr>
			<td onclick="showGraph(${list.stu_idx})">${list.stu_name }</td>
			<c:forEach var="elist" items="${list.examList }">
				<td>${elist }</td>
			</c:forEach>
		</tr>
	</c:forEach>
	</tbody>
	<tfoot>
		<tr>
			<th>평균</th>
			<c:forEach var="list" items="${dsTotalList }">
				<th>${list.avg }</th>
			</c:forEach>
		</tr>
	</tfoot>
</table>
</div>
</div>
</div></div>
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