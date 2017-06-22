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
    <title>강의정보</title>
 
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
		#classinfo{
			float: right;
		    width: 85%;
		    padding: 3%;
		}
		#submenu{
			position: fixed;
			width: 10%
		}
		#tea{
			font-size: large;
    		margin-right: 2%;
    		margin-left: 2%;
		}
		#tprofileImg{
			height: 4cm;
    		width: 3cm;
		}
		#teatable{
			margin-left: 5%;
		    margin-right: 24%;
		    margin-bottom: 2%;
		    width: 66%;
		    float: right;
		}
		#clasub{
    		font-size: large;
		}
		#tea1{
			float: right;
		    margin-right: 10px;
		    width: 50%;
		    font-size: small;
		}
		#nowepil{
			margin-left: 6%;
		    margin-right: 24%;
		    margin-bottom: 5%;
		    float: right;
		    width: 66%;
		}
		#rwriter{
			width: 100px;
		}
		#rwritedate{
			width: 100px;
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
			
			<section id="classinfo">
				<table id="teatable">
					<tbody>
						<tr>
							<td rowspan="5"><img id="tprofileImg" alt="${teadto.file_idx}img" src="#"></td>
							<td colspan="4" id="clasub">
								${cdto.class_subject}
								<br>
								<span id="tea1">
									<span id="tea">
										${teadto.tea_name}
									</span> 
									강사님 (${cdto.subject_name})
								</span>
							</td>
						</tr>
						<tr>
							
						</tr>
						<tr>
							<td align="right">시작일: </td>
							<td align="center">${cdto.class_startdate}</td>
							<td align="right">끝일: </td>
							<td align="center">${cdto.class_enddate }</td>
						</tr>
						<tr>
							<td align="center">${cdto.classroom}호</td>
							<td align="center">${cdto.class_day}, ${cdto.class_time}교시</td>
							<td align="center">${cdto.class_price} 원</td>
							<td align="center">총원: ${cdto.class_max_student}</td>
						</tr>
					</tbody>
				</table>
				<table id="nowepil">
					<c:if test="${empty elist}">
						<tr>
							<td>저장 된 후기가 없습니다.</td>
						</tr>
					</c:if>
					<c:if test="${!empty elist}">
						<c:forEach var="e" items="${elist}">
							<tr>
								<td id="rwriter">${e.c_r_writer}</td>
								<td id="rcontent">${e.c_r_content}</td>
								<td id="rwritedate">${e.c_r_writedate}</td>
							</tr>
						</c:forEach>
						<tfoot>
							<tr>
								<td colspan="3" align="center">${pageStr}</td>
							</tr>
						</tfoot>
					</c:if>
				</table>
			</section>
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