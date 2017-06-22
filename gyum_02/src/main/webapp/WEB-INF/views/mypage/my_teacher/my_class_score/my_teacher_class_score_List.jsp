<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
</head>
<body id="mimin" class="dashboard">
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
<div class="panel " style="width: 930px;margin-top: 20px;">
  <div class="panel-body">
<table class="table table-striped table-bordered dataTable no-footer" style="width:900px;">
	<thead>
		<tr>
			<th>기간</th>
			<th>강의명</th>
			<th>요일</th>
			<th>시간</th>
			<th>강의실</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach var="list" items="${classList }">
		<tr>
			<td>${list.class_startdate } - ${list.class_enddate }</td>
			<td style="text-align:left;"><a href="my_teacher_student_score_list.do?class_idx=${list.class_idx }">${list.class_subject }</a></td>
			<td>${list.class_day }</td>
			<td>${list.class_time }교시</td>
			<td>${list.classroom }호</td>
		</tr>
	</c:forEach>
	</tbody>
	<tfoot>
		<tr>
			<td style="text-align:right;" colspan="5">${page }</td>
		</tr>
	</tfoot>
</table>
</div>
</div>
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