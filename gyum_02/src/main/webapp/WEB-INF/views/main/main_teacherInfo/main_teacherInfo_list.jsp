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
    <title>강사소개</title>
 
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
		#submenu{
			position: fixed;
			width: 10%
		}
		#teachers {
		    float: right;
		    width: 85%;
		    padding: 3%;
		}
		table.teacher{
			margin-left: 5%;
		    margin-right: 5%;
		    margin-bottom: 5%;
		    float: left;
		}
		#tprofileImg{
			height: 4cm;
    		width: 3cm;
		}
		#nametd{
			padding-bottom: 5px;
			padding-top: 5px;			
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
			<section id="submenu" style="width: 150px; float: left;">
				<hr>
				<h2>과목</h2>
				<ul>
					<li><a href="teacherInfoListGo.do?sub=1">국어</a></li>
					<li><a href="teacherInfoListGo.do?sub=2">영어</a></li>
					<li><a href="teacherInfoListGo.do?sub=3">수학</a></li>
					<li><a href="teacherInfoListGo.do?sub=4">사회</a></li>
					<li><a href="teacherInfoListGo.do?sub=5">과학</a></li>
				</ul>
				<hr>
			</section>
			
			<section id="teachers">
				<c:forEach var="tea_list" items="${list}">
					<table class="teacher">
						<tr>
							<td>
								<a href="teacherInfoContentGo.do?idx=${tea_list.tea_idx}&sub=${sub}">
									<img id="tprofileImg" alt="${tea_list.file_idx}img" src="#">
								</a>
							</td>
						</tr>
						<tr>
							<td align="center" id="nametd">
								<a href="teacherInfoContentGo.do?idx=${tea_list.tea_idx}&sub=${sub}">
									${tea_list.tea_name} 강사님
								</a>
							</td>
						</tr>
					</table>
				</c:forEach>
			</section>
		</section>
	</section>
	</div></div>
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