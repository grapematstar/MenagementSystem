<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>
 <meta name="description" content="Miminium Admin Template v.1">
  <meta name="author" content="Isna Nur Azis">
  <meta name="keyword" content="">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- start: Css -->
  <link rel="stylesheet" type="text/css" href="asset/css/bootstrap.min.css">

  <!-- plugins -->
  <link rel="stylesheet" type="text/css" href="asset/css/plugins/font-awesome.min.css"/>
  <link rel="stylesheet" type="text/css" href="asset/css/plugins/animate.min.css"/>
  <link rel="stylesheet" type="text/css" href="asset/css/plugins/nouislider.min.css"/>
  <link rel="stylesheet" type="text/css" href="asset/css/plugins/select2.min.css"/>
  <link rel="stylesheet" type="text/css" href="asset/css/plugins/ionrangeslider/ion.rangeSlider.css"/>
  <link rel="stylesheet" type="text/css" href="asset/css/plugins/ionrangeslider/ion.rangeSlider.skinFlat.css"/>
  <link rel="stylesheet" type="text/css" href="asset/css/plugins/bootstrap-material-datetimepicker.css"/>
	<link href="asset/css/style.css" rel="stylesheet">
  <!-- end: Css -->
  <link rel="shortcut icon" href="asset/img/logomi.png">

<style>
.dhx_month_body{
	width:143px;
}
 td{
	display:table-cell;
	vertical-align: inherit;
	padding: 0px;
	width:143px !important;
	height:121px !important;
}
table{
	border-spacing:0;
	border-collapse: collapse; 
} 
body{
    line-height: 1.42857143;
}
.dhx_month_body{
	height:104px !important;
}

.dhx_before,.dhx_month_head,.dhx_month_body{
	width:143px !important;
}

.dhx_cal_tab{
	display: none;
}
.dhx_cal_tab dhx_cal_tab_first{
	display: none;
}
.dhx_section_time{
	display: none;
}
.dhx_cal_event_clear b{
	display: none;
}
.dhx_time{
	display: none;
}
.dhx_cal_lsection{
	display:none;
}
</style>
</head>
<body id="mimin" class="dashboard">
<%@include file="/header.jsp" %>
<div class="container-fluid mimin-wrapper">
<%@include file="study_insidebar.jsp" %>
<div id="content" class="article-v1">

	<div class="panel" style="width:1040px;">
          <div class="panel-body">
            <div class="col-md-12">
                <h3 class="animated fadeInLeft">일일 일지</h3>      
                  <p class="animated fadeInDown">
	        	스터디 <span class="fa-angle-right fa"></span> 일지
	    		 </p>         
            </div>
          </div>

	<div class="panel" style="margin-top:20px;width:1040px;">
	<div class="panel-body">
		${schedule }
	</div>
</div>
</div>
</div>
<script src="asset/js/jquery.min.js"></script>
<script src="asset/js/jquery.ui.min.js"></script>
<script src="asset/js/bootstrap.min.js"></script>
<!-- plugins -->
<script src="asset/js/plugins/moment.min.js"></script>
<script src="asset/js/plugins/icheck.min.js"></script>
<script src="asset/js/plugins/summernote.min.js"></script>
<script src="asset/js/plugins/jquery.nicescroll.js"></script>
<script src="asset/js/plugins/jquery.validate.min.js"></script>
<script src="asset/js/plugins/ion.rangeSlider.min.js"></script>
<script src="asset/js/plugins/bootstrap-material-datetimepicker.js"></script>
<script src="asset/js/plugins/jquery.mask.min.js"></script>
<script src="asset/js/plugins/select2.full.min.js"></script>
<script src="asset/js/plugins/nouislider.min.js"></script>
<!-- custom -->
 <script src="asset/js/main.js"></script>
</body>
</html>