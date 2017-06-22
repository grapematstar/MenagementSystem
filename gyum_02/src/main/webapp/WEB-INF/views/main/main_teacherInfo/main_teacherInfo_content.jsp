<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="Miminium Admin Template v.1">
	<meta name="author" content="Isna Nur Azis">
	<meta name="keyword" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <title>강사정보</title>
 
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
		#incontent{
			float: right;
    		width: 80%;
		}
		#tprofileImg{
			height: 4cm;
		    width: 3cm;
		}
		#teainfo{
			width: 90%;
    		margin: 5%;
    		margin-bottom: 2%;
		}
		#imgtd{
			width: 28%;
			text-align: center;
		}
		#tea{
			font-size: large;
    		margin-right: 2%;
    		margin-left: 2%;
		}
		#classitem {
		    float: right;
		    width: 170px;
		    margin: 15px;
		}
		#classdate{
			padding-bottom: 0px !important;
    		text-align: right;
		}
		#classroom{
			padding-top: 0px !important;
    		text-align: right;
		}
		#nowclassfield {
		    border: none;
		    background-color: whitesmoke;
		}
		#rcontent {
		    font-size: inherit;
		    margin-left: 40px;
		}
		#rwriter {
		    font-size: initial;
		}
		#rwritedate {
		    font-size: x-small;
		    margin-left: 30px;
		}
		#lastepil {
		    width: 95%;
		    float: right;
		    margin-right: 18px;
		 }
		 td{
		 	text-align: left;
		 }
		 #page{
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
			
			<section id="incontent">
				<table id="teainfo">
					<tr>
						<td rowspan="3" id="imgtd"><img id="tprofileImg" alt="${teacherdto.file_idx}img" src="#"></td>
						<td><span id="tea">${teacherdto.tea_name}</span> 강사님</td>
					</tr>
					<tr>
						<td>tel. <span id="tea">${teacherdto.tea_tel}</span></td>
					</tr>
					<tr>
						<td>E-mail. <span id="tea">${teacherdto.tea_email}</span></td>
					</tr>
				</table>
			
				<fieldset id="nowclassfield">
					<h5>현재강의</h5>
					<c:if test="${empty nowclass}">
						진행 중인 강의가 없습니다.
					</c:if>
					<span id="nowclassspan">
						<c:forEach var="nc" items="${nowclass}">
							<table id="classitem">
								<tr>
									<td id="classname">
										<a id="nowclassA" href="teacherClassContentGo.do?class_idx=${nc.class_idx}">${nc.class_subject}</a>
									</td>
								</tr>
								<tr>
									<td id="classdate">
										${nc.class_startdate} ~ ${nc.class_enddate}
									</td>
								</tr>
								<tr>
									<td id="classroom">
										${nc.classroom}호
									</td>
								</tr>
							</table>
						</c:forEach>
					</span>
				</fieldset>
				
				<fieldset id="nowclassfield">
					<h5>후기</h5>
					<c:if test="${empty lastclass}">
						지난 강의가 없습니다.
					</c:if>
					<c:if test="${!empty lastclass}">
						<c:if test="${empty lastepil}">
							지난 강의후기가 없습니다.
						</c:if>
						<c:if test="${!empty lastepil}">
						<table id="lastepil">
							<c:forEach var="lep" items="${lastepil}">
								<tr>
									<td id="rwriter">${lep.c_r_writer}</td>
									<td id="rcontent">${lep.c_r_content}<span id="rwritedate">${lep.class_subject} - ${lep.c_r_writedate}</span></td>
								</tr>
							</c:forEach>
							<tfoot>
								<tr>
									<td id="page" colspan="2">${pageStr}</td>
								</tr>
							</tfoot>
						</table>
						</c:if>
					</c:if>
				</fieldset>
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