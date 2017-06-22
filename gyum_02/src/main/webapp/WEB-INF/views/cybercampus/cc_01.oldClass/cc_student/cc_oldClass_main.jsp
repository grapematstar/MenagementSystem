<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>사이버캠퍼스-학생강의실 기록보관::</title>
<!-- start: Css -->
<link rel="stylesheet" type="text/css" href="asset/css/bootstrap.min.css">
<!-- plugins -->
<link rel="stylesheet" type="text/css" href="asset/css/plugins/font-awesome.min.css"/>
<link rel="stylesheet" type="text/css" href="asset/css/plugins/mediaelementplayer.css"/>
<link rel="stylesheet" type="text/css" href="asset/css/plugins/animate.min.css"/>
<link href="asset/css/style.css" rel="stylesheet">
<!-- end: Css -->
<link rel="shortcut icon" href="asset/img/logomi.png">
</head>
<body>
<jsp:include page="/header.jsp"/>
<section>
	<div class="container-fluid mimin-wrapper">
		<jsp:include page="/sidemenu.jsp" />
		<div id="content" style="width:96%;">
		<div class="panel">
			<div class="panel-body">
				<div class="col-md-12 col-sm-12" style="float:none;">
					<h3 class="animated fadeInLeft">강의실 이동</h3>
					<p class="animated fadeInDown">
						<a href="#">사이버캠퍼스</a> <span class="fa-angle-right fa"></span> <a href="#">강의실 이동</a>
					</p>
				</div>
				<div class="col-md-12 col-sm-12">
				<ul class="nav navbar-nav" style="float:none;">
                   <li><a href="cc_gotoOldClass.do" class="btn btn-outline btn-primary">이전 강의실</a></li>
                   <li><a href="cc_gotoCurrentClass.do" class="">현재 강의실</a></li>
                   <li><a href="cc_gotoPlannedClass.do" class="">예정된 강의</a></li>
                </ul></div>

					<div class="col-md-12 col-sm-12">
						<div class="panel">
						<div class="panel-body">
	
							<div class="col-md-12" style="float:none;">
							<div class="responsive-table">
								<table class="table table-striped table-bordered" width="100%">
									<thead>
										<tr>
											<th>번호</th>
											<th>강의실명</th>
											<th>기간</th>
											<th>강사명</th>
										</tr>
									</thead>
									<tbody>
									<c:if test="${empty list}">
										<tr>
											<td colspan="5">등록된 강의가 없습니다.</td>
										</tr>
									</c:if>
									<c:forEach var="list" items="${list}">
										<tr>
											<td>${list.class_idx}</td>
											<td><a href="cc_gotoClassMain.do?class_idx=${list.class_idx}">${list.class_subject}</a></td>
														<td>
			<span id="class_startdate">
			<script>
			var startdate='${list.class_startdate}';
			var startyear=startdate.substr(0,4);
			var startmonth=startdate.substr(4,2);
			var startday=startdate.substr(6,2);
			startdate=startyear+'년 '+startmonth+'월 '+startday+'일';
			document.write(startdate);
			</script>
			</span>
			&nbsp;~&nbsp;
			<span id="class_enddate">
			<script>
			var enddate='${list.class_enddate}';
			var endyear=enddate.substr(0,4);
			var endmonth=enddate.substr(4,2);
			var endday=enddate.substr(6,2);
			enddate=endyear+'년 '+endmonth+'월 '+endday+'일';
			document.write(enddate);
			</script>
			</span></td>
											<td>${list.tea_name}</td>
										</tr>
									</c:forEach>
									</tbody>
									<tfoot>
										<tr>
											<td colspan="4" align="center">${pageStr}</td>
										</tr>
									</tfoot>
								</table>
							</div>
		</div>
						</div>
					</div>
         		</div>
         		</div>
			</div>
		</div>
					<div id="right-menu">
				<div id="right-menu-user" class="tab-pane fade in active">
					<div class="user col-md-12" tabindex="5003"
						style="overflow: hidden; outline: none;">
						<div class="col-md-1"></div>
						<div class="col-md-11" id="right-side-body"> </div>
					</div>
				</div>
			</div>
	</div>
</section>

	<!-- start: Javascript -->
<script src="asset/js/jquery.min.js"></script>
<script src="asset/js/jquery.ui.min.js"></script>
<script src="asset/js/bootstrap.min.js"></script>
<!-- plugins -->
<script src="asset/js/plugins/moment.min.js"></script>
<script src="asset/js/plugins/jquery.nicescroll.js"></script>
<!-- custom -->
<script src="asset/js/main.js"></script>
<script>
$(document).ready(function(){
	$("#rightReview").click(function(){
		$("#rightReview").addClass('btn btn-outline btn-primary');
		$("#sadness").removeAttr("style");
		$.ajax({
			type : "GET",
			url : "cc_gotoEpilogueClass.do",
			success : function(args) {
				$("#right-side-body").html(args);
			},
			error : function(e) {
				$("body").html(e.responseText);
			}
		});
	});
});

</script>
</body>
</html>