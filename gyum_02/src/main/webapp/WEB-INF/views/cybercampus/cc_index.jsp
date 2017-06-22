<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사이버캠퍼스</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- start: Css -->
<link rel="stylesheet" type="text/css" href="asset/css/bootstrap.min.css">
<!-- plugins -->
<link rel="stylesheet" type="text/css" href="asset/css/plugins/font-awesome.min.css"/>
<link rel="stylesheet" type="text/css" href="asset/css/plugins/animate.min.css"/>
<link href="asset/css/style.css" rel="stylesheet">
<!-- end: Css -->
<link rel="shortcut icon" href="asset/img/logomi.png">
</head>
<body id="mimin" class="dashboard">
<jsp:include page="/header.jsp"/>
<jsp:include page="/sidemenu.jsp"/>
 <div id="content">
            <div class="tabs-wrapper text-center">             
             <div class="panel box-shadow-none text-left content-header">
                  <div class="panel-body" style="padding-bottom:0px;">
                    <div class="col-md-12">
                        <h3 class="animated fadeInLeft">Tab & Panels</h3>
                        <p class="animated fadeInDown">
                         Ui Element <span class="fa-angle-right fa"></span> Tabs & Panels
                        </p>
                    </div>
                    <ul id="tabs-demo" class="nav nav-tabs content-header-tab" role="tablist" style="padding-top:10px;">
                      <li role="presentation" class="active">
                        <a href="cc_gotoOldClass.do" id="tabs2" data-toggle="tab">지난강의실</a>
                      </li>
                      <li role="presentation" class="active">
                        <a href="cc_gotoCurrentClass.do" id="tabs2" data-toggle="tab">현재강의실</a>
                      </li>
                    </ul>
                  </div>
              </div>


			</div>
		</div>
	<!-- start: Javascript -->
<script src="asset/js/jquery.min.js"></script>
<script src="asset/js/jquery.ui.min.js"></script>
<script src="asset/js/bootstrap.min.js"></script>
<!-- plugins -->
<script src="asset/js/plugins/moment.min.js"></script>
<script src="asset/js/plugins/chart.min.js"></script>
<script src="asset/js/plugins/jquery.nicescroll.js"></script>
<!-- custom -->
<script src="asset/js/main.js"></script>
</body>
</html>