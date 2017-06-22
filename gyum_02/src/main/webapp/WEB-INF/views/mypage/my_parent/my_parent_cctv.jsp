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
#my_student_class_list_table thead th{
text-align: center;
}
#my_student_class_list_table tbody td{
text-align: left;
}
</style>
<script>
</script>
</head>
<body id="mimin" class="dashboard">
<%@include file="/header.jsp" %>
<div class="container-fluid mimin-wrapper">
<%@include file="/mypage_sidemenu.jsp" %>
<div id="content" class="article-v1">
<div class="panel ">
  <div class="panel-body">
    <div class="col-md-12">
        <h3 class="animated fadeInLeft">CCTV</h3>
        <p class="animated fadeInDown">
		          CCTV <span class="fa-angle-right fa"></span> CCTV
        </p>
    </div>
  </div>
</div>
<div class="panel " style="margin-top: 20px;">
  <div class="panel-body">
<iframe width="560" height="600" src="https://192.168.20.157:8443/gyum_02/basic_video_call.html#view" frameborder="0" allowfullscreen></iframe>
</div>
</div>
<div style="height:100px;"></div>
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