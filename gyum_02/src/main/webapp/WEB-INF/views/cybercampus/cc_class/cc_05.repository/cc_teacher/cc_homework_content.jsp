<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>과제물 본문</title>
<link rel="stylesheet" type="text/css" href="asset/css/bootstrap.min.css">
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
<script type="text/javascript">
</script>
<!-- plugins -->
<link rel="stylesheet" type="text/css" href="asset/css/plugins/font-awesome.min.css"/>
<link rel="stylesheet" type="text/css" href="asset/css/plugins/simple-line-icons.css"/>
<link rel="stylesheet" type="text/css" href="asset/css/plugins/mediaelementplayer.css"/>
<link rel="stylesheet" type="text/css" href="asset/css/plugins/animate.min.css"/>
<link rel="stylesheet" type="text/css" href="asset/css/plugins/icheck/skins/flat/red.css"/>
<link href="asset/css/style.css" rel="stylesheet">
<!-- end: Css -->
<link rel="shortcut icon" href="asset/img/logomi.png">
<title>사이버캠퍼스</title>
</head>
<body id="mimin" class="dashboard">
<jsp:include page="/header.jsp"/>
<section>
	<div class="container-fluid mimin-wrapper">
		<jsp:include page="/sidemenu.jsp" />
		<div id="content" style="width:96%;">
		<div class="panel">
			<div class="panel-body">
				<div class="col-md-12 col-sm-12" style="float:none;">
					<h3 class="animated fadeInLeft">${sessionScope.class_subject}</h3>
					<p class="animated fadeInDown">
						<a href="cc_gotoCurrentClass.do">사이버캠퍼스</a> <span class="fa-angle-right fa"></span> ${sessionScope.classStatus} <span class="fa-angle-right fa"></span> <a href="cc_gotoClassMainRe.do">${sessionScope.class_subject}</a><hr>
					</p>
				</div>
				<div class="col-md-12 col-sm-12">
				<ul class="nav navbar-nav" style="float:none;">
				<c:if test="${sessionScope.usergrade=='teacher'||sessionScope.usergrade=='master'}">
								<li><a href="cc_gotoTeacherNoticeList.do">강사공지사항</a></li>
							</c:if>
                   <li><a href="cc_gotoNoticeList.do" class="">공지사항</a></li>
                   <li><a href="cc_gotoInfoPlanClass.do" class="">강의정보</a></li>
                   <li><a href="cc_gotoAttendClass.do" class="">출석/성적</a></li>
                   <li><a href="cc_gotoFreeBBSList.do" class="">커뮤니티</a></li>
                   <li><a href="cc_gotoHomeworkList.do" class="btn btn-outline btn-primary">학습자료</a></li>
                   <li><a href="cc_gotoQnAList.do" class="">질의응답</a></li>
                   <li><a href="#" id="rightReview" class="opener-right-menu"><font class="sadness" style="color:#58666e;">강의후기</font></a></li>
                   <li><a href="cc_gotoMyClassMate.do" class="">수강생보기</a></li>
                </ul></div>

					<div class="col-md-12 col-sm-12">
						<div class="panel">
						<div class="panel-body">
							<div class="col-md-12" style="float:none;">
							<div class="responsive-table">
							       <c:set var="dto" value="${dto}"/>
<table class="table" width="100%">
<thead>
	<tr>
		<th>과제번호</th><th>${dto.c_h_t_idx}</th>
	</tr>
	<tr>
		<th>과제제목</th><th>${dto.c_h_t_subject}</th>
	</tr>
	<tr>
		<th>과제시작</th><th>${dto.c_h_t_startdate}</th>
		<th>과제종료</th><th>${dto.c_h_t_enddate}</th>
	</tr>
	<tr>
		<th>과제마감</th><th>${dto.c_h_t_deadline}</th>
	</tr>
	<tr>
		<th>기록날짜</th><th>${dto.c_h_t_writedate}</th>
	</tr>
</thead>
<tbody>
	<tr>
		<td>과제 제출시 유의사항</td>
	</tr>
	<tr>
		<td>${dto.c_h_t_notice}</td>
	</tr>
</tbody>
<tfoot>
</tfoot>
</table>
<div style="text-align:right;">
<button class="btn btn-default" id="cc_callStudentsHomework" data-toggle="modal" data-target="#myModal">제출된 과제 보기</button><input type="button" onclick="cc_deleteTeacherHomeworkContent()" class="btn btn-default" value="삭제">
</div>
							</div>
							</div>
						</div>
					</div>
         		</div>
         		</div>
			</div>
		</div>
	</div>

		<!-- MODAL PART -->
		<div class="container">
			<!-- Modal -->
			<div class="modal fade" id="myModal" role="dialog"
				style="width: 100%; height: 100%;">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title" id="freeBBSTitle">과제 제출 학생</h4>
						</div>
						<div class="modal-body" id="modalBody"></div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- RIGHT SIDE -->
		<div id="right-menu">
			<div class="tab-content">
				<div id="right-menu-user" class="tab-pane fade in active">
					<div class="user col-md-12" tabindex="5003"
						style="overflow: hidden; outline: none;">
						<div class="col-md-1"></div>
						<div class="col-md-10" id="successContent"></div>
						<div class="col-md-1"></div>
					</div>
				</div>
			</div>
			<div id="right-menu-notif" class="tab-pane fade"></div>
			<div id="right-menu-config" class="tab-pane fade"></div>

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
function cc_deleteTeacherHomeworkContent(){
	if(!(confirm("정말 삭제하시겠습니까? 이미 제출한 학생들의 과제물도 모두 함께 삭제됩니다.")))return false;
	var params=new Object();
	params.c_h_t_idx=${dto.c_h_t_idx};
	$.ajax({
		type:"GET",
		url:"cc_deleteTeacherHomeworkContent.do",
		data:params,
		success:function(args){
			alert("과제물 삭제에 성공했습니다.");
			
		}
	});
}
$(document).ready(function(){
	$("#rightReview").click(function(){
		$("#rightReview").addClass('btn btn-outline btn-primary');
		$("#sadness").removeAttr("style");
		$.ajax({
			type : "GET",
			url : "cc_gotoEpilogueClass.do",
			success : function(args) {
				$("#successContent").html(args);
			},
			error : function(e) {
				$("body").html(e.responseText);
			}
		});
	});
	
	$("#cc_callStudentsHomework").click(function(){
		var params=new Object();
		params.c_h_t_idx=${dto.c_h_t_idx}
		$.ajax({
			type:"GET",
			url:"cc_callTeacherHomeworkSideWrite.do",
			data:params,
			success:function(args){
				$("#modalBody").html(args);
			},
			error:function(e){
				console.log(e.responseText);
			}
		});
	});
});
</script>
</body>
</html>