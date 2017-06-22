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
<script>
window.onload = function msg(){
	if('${msg}'!=''){
		window.alert('${msg}');
		location.href='${gopage}';
	}
}
</script>
</head>
<body id="mimin" class="dashboard" style="width: 1200px;">
<%@include file="/header.jsp" %>
<div class="container-fluid mimin-wrapper">
<%@include file="/mypage_sidemenu.jsp" %>
<div id="content" class="article-v1">
<div class="panel">
  <div class="panel-body">
    <div class="col-md-12">
        <h3 class="animated fadeInLeft">자녀정보</h3>
        <p class="animated fadeInDown">
		          자녀정보 <span class="fa-angle-right fa"></span> 학교 성적 확인
        </p>
    </div>
  </div>
</div>
<div class="panel" style="margin-top: 20px;">
  <div class="panel-body">
<c:forEach var="list" items="${childList }">
	<input type="button" class="btn btn-primary" onclick="location.href='my_parent_score_school.do?stu_idx=${list.stu_idx }';" value="${list.stu_name }">
	<br>
</c:forEach>
</div>
</div></div>
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