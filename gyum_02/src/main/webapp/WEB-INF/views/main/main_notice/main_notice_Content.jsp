<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
	<meta name="description" content="Miminium Admin Template v.1">
	<meta name="author" content="Isna Nur Azis">
	<meta name="keyword" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <title>공지</title>
 
    <!-- start: Css -->
    <link rel="stylesheet" type="text/css" href="asset/css/bootstrap.min.css">

      <!-- plugins -->
      <link rel="stylesheet" type="text/css" href="asset/css/plugins/font-awesome.min.css"/>
      <link rel="stylesheet" type="text/css" href="asset/css/plugins/icheck/skins/flat/red.css"/>
      <link rel="stylesheet" type="text/css" href="asset/css/plugins/animate.min.css"/>
      <link rel="stylesheet" type="text/css" href="asset/css/plugins/summernote.css"/>
      <link rel="stylesheet" type="text/css" href="asset/css/plugins/normalize.css"/>

	<link href="asset/css/style.css" rel="stylesheet">
	<!-- end: Css -->

	<link rel="shortcut icon" href="asset/img/logomi.png">
	<style>
	#inwhole{
		width: 90%;
    		float: left;
	}
	#contenttable{
		width: 70%;
		height: 70%;
		margin: 40px auto;
		border:0px;
	}
	table.table-striped.table-bordered.dataTable.no-footer {
    width: 85%;
    margin: 7%;
    margin-top: 3%;
}
	#contenttable th{
		border-color: #e2e2e2;
	}
	#backtr{
		text-align: center;
		border-color: #e2e2e2;
	}
	#reply{
		width: 400px;
    	height: 30px;
    	margin-right: 20px;
	}
	#rep-writedate{
		font-size: 10px;
   	 	margin-left: 20px;
	}
	#rep-del{
		margin-left: 10px;
		font-size: 10px;
	}
	#rep-writer{
		float: left;
		margin-left : 20px;
		margin-right : 34px;
	}
	#rep-del-a{
		cursor: pointer;
	}
	td{
		text-align: left
	}
	#center{
		text-align: center;
	}
</style>
</head>
<body id="mimin" class="dashboard" >
<%@include file="/header.jsp" %>
<div class="container-fluid mimin-wrapper">
<%@include file="/sidemenu.jsp" %>
<div id="content" class="article-v1">
	<section id="whole">
		<section id="inwhole">
	<table border=1 width="450" cellspacing="0"  class="table-striped table-bordered dataTable no-footer">
		<tr>
			<th>번호</th>
			<td>${dto.notice_idx}</td>
			<th>제목</th>
			<td>${dto.notice_subject}</td>
			<th>날짜</th>
			<td>${dto.notice_writedate}</td>
		</tr>
		<tr height="150">
			<td colspan="6">${dto.notice_content}</td>
		</tr>
		<tr>
			<td colspan="6"><a href="notice.do">목록으로</a></td>
		</tr>
	</table>
	</section>
	</section>
	</div>
	</div>
</body>
<!-- start: Javascript -->
    <script src="asset/js/jquery.min.js"></script>
    <script src="asset/js/jquery.ui.min.js"></script>
    <script src="asset/js/bootstrap.min.js"></script>
   
    
    <!-- plugins -->
    <script src="asset/js/plugins/icheck.min.js"></script>
    <script src="asset/js/plugins/summernote.min.js"></script>
    <script src="asset/js/plugins/moment.min.js"></script>
    <script src="asset/js/plugins/jquery.nicescroll.js"></script>


    <!-- custom -->
     <script src="asset/js/main.js"></script>
     <script type="text/javascript">
        $(document).ready(function(){
            $('input').iCheck({
              checkboxClass: 'icheckbox_flat-red',
              radioClass: 'iradio_flat-red'
            });

             $('.summernote').summernote({
                height: 300
              });
                 $('.mail-wrapper').find('.mail-left').css('height', $('.mail-wrapper').innerHeight());

        });
     </script>
</html>