<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- stylesheet -->
<!-- start: Css -->
<link rel="stylesheet" type="text/css"
	href="asset/css/bootstrap.min.css">

<!-- plugins -->
<link rel="stylesheet" type="text/css"
	href="asset/css/plugins/font-awesome.min.css" />
<link rel="stylesheet" type="text/css"
	href="asset/css/plugins/simple-line-icons.css" />
<link rel="stylesheet" type="text/css"
	href="asset/css/plugins/mediaelementplayer.css" />
<link rel="stylesheet" type="text/css"
	href="asset/css/plugins/animate.min.css" />
<link rel="stylesheet" type="text/css"
	href="asset/css/plugins/icheck/skins/flat/red.css" />
<link href="asset/css/style.css" rel="stylesheet">
<!-- end: Css -->
<link rel="shortcut icon" href="asset/img/logomi.png">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body id="mimin" class="dashboard" style="width:1200px; ">
<%@include file="/header.jsp" %>
<div class="container-fluid mimin-wrapper">
	<%@include file="/mypage_sidemenu.jsp"%>
<div id="content" class="article-v1">

			<div class="panel ">
				<div class="panel-body">
					<div class="col-md-12">
						<h2 class="animated fadeInLeft">온라인 시험 작성</h2>
						<p class="animated fadeInDown">자신의 강의 목록</p>
					</div>
				</div>
			</div>
		
					<div class="panel" style="margin-top: 20px;">
						<div class="panel-body">					
					
							<div class="responsive-table">
								<table class="table table-striped table-bordered" width="100%"
									cellspacing="0">
									<thead>
										<tr>
											<th>번호</th>
											<th>강의명</th>
											<th>개강날짜</th>
											<th>종강날짜</th>
											<th>강의실</th>
											<th>강의여부</th>
											<th>문제집등록</th>
										</tr>
									</thead>
									<tbody>
										<c:if test="${empty c_list }">
											<tr>
												<td colspan="7" align="center">등록된 강의가 없습니다.</td>
											</tr>
										</c:if>
										<c:forEach var="c_list" items="${c_list}">
											<tr>
												<td id="class_idx">${c_list.class_idx }</td>
												<td><a
													href="class_content.do?class_idx=${c_list.class_idx }">${c_list.class_subject }</a></td>
												<td>${c_list.class_startdate }</td>
												<td>${c_list.class_enddate }</td>
												<td>${c_list.classroom}</td>
												<td>${c_list.class_check}</td>
												<td><input type="button" value="문제집 등록" class=" btn btn-raised btn-primary"
													onclick="javascript:location.href='class_workbookForm.do?class_idx=${c_list.class_idx }'"></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<div class="col-md-6" style="padding-top: 20px;">
									
								</div>
								<div class="col-md-6">
									<ul class="pagination pull-right">
										<li><a href="#" aria-label="Previous"> <span
												aria-hidden="true">&laquo;</span>
										</a></li>
										<li class="active">${c_pageStr }</li>
										<li><a href="#" aria-label="Next"> <span
												aria-hidden="true">&raquo;</span>
										</a></li>
									</ul>
								</div>
							</div>
						</div>
	</div>

	
			<div class="panel" style="margin-top: 20px;">
				<div class="panel-body">
					<div class="col-md-12">
						<h2 class="animated fadeInLeft">등록된 강의</h2>
						<p class="animated fadeInDown">자신의 수강 신청한 강의 목록</p>
					</div>
				</div>
			</div>
		
					<div class="panel" style="margin-top: 20px;">
						<div class="panel-body">
						
							<div class="responsive-table">
		<table class="table table-striped table-bordered" width="100%"
			cellspacing="0">
			<thead>
				<tr>
					<th>강의번호</th>
					<th>강의명</th>
					<th>중간/기말</th>
					<th>등록된문제수</th>
					<th>문제보기</th>
					<th>문제등록</th>
					<th>문제집삭제</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty wb_list }">
					<tr>
						<td colspan="7" align="center">등록된 문제집이 없습니다.</td>
					</tr>
				</c:if>
				<c:set var="i" value="0"></c:set>
				<c:forEach var="wb_list" items="${wb_list}">
					<tr>
						<td id="class_idx">${wb_list.class_idx }</td>
						<td>${wb_list.class_subject }</td>
						<c:if test="${wb_list.c_t_testnum==1}">
							<td>중간고사</td>
						</c:if>
						<c:if test="${wb_list.c_t_testnum==2}">
							<td align="center">기말고사</td>
						</c:if>
						<td>${question_count[i] }</td>
						<td>
							<!-- Trigger the modal with a button -->
							<button type="button" class=" btn btn-raised btn-primary" data-toggle="modal" data-target="#myModal"
								onclick="questionList(${wb_list.test_idx},${wb_list.c_t_testnum},${wb_list.class_idx })">문제
								보기</button>
						</td>
						<td><input type="button" value="문제 등록" class=" btn btn-raised btn-primary"
							onclick="javascript:location.href='class_testWriteForm.do?test_idx=${wb_list.test_idx }&question_count=${question_count[i]+1 }'">
						</td>
						<td><input type="button" value="문제집 삭제" class=" btn btn-raised btn-primary"
							onclick="javascript:location.href='class_question_delete.do?test_idx=${wb_list.test_idx }&c_t_testnum=${wb_list.c_t_testnum}&class_idx=${wb_list.class_idx}'">
						</td>
					</tr>
					<c:set var="i" value="${i+1}"></c:set>
				</c:forEach>
			</tbody>
		</table>
		<div class="col-md-6" style="padding-top: 20px;">
			
		</div>
		<div class="col-md-6">
			<ul class="pagination pull-right">
				<li><a href="#" aria-label="Previous"> <span
						aria-hidden="true">&laquo;</span>
				</a></li>
				<li class="active">${wb_pageStr }</li>
				<li><a href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
				</a></li>
			</ul>
		</div>
	</div>
	</div>
	</div>


		<!-- Modal -->
		<div class="modal fade" id="myModal" role="dialog">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">문제 보기</h4>
					</div>
					<div class="modal-body">
						
					</div>
					<div class="modal-footer">
						<button type="button" id="modalClosing" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
</div></div>	
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
	<script>
	var modalBody=$(".modal-body");
	function questionUpdate(c_t_q_idx){
		var params = new Object();
		params.c_t_q_idx = c_t_q_idx;
		$.ajax({
			type:"GET",
			url:"class_question_update_select.do",
			data:params,
			success:function(mav){
				$(".modal-body").html(mav);
			}
		})
	}
	</script>
	<script>
	var modalBody=$(".modal-body");
	function questionDelete(c_t_q_idx){
		var params = new Object();
		params.c_t_q_idx = c_t_q_idx;
		$.ajax({
			type:"GET",
			url:"class_question_delete.do",
			data:params,
			success:function(mav){
				$(".modal-body").html(mav);
			}
		})
	}
	</script>
	<script>
	var modalBody=$(".modal-body");
function questionList(test_idx,c_t_testnum,class_idx){
	var params = new Object();
	params.test_idx = test_idx;
	params.c_t_testnum = c_t_testnum;
	params.class_idx = class_idx;
	$.ajax({
		type:"GET",
		url:"class_question_list.do",
		data:params,
		success:function(mav){
			$(".modal-body").html(mav);
		}
	})
}
function questionListPaging(test_idx,c_t_testnum,class_idx,cp){
	var params = new Object();
	params.test_idx = test_idx;
	params.c_t_testnum = c_t_testnum;
	params.class_idx = class_idx;
	params.cp=cp;
	$.ajax({
		type:"GET",
		url:"class_question_list.do",
		data:params,
		success:function(mav){
			modalBody.html(mav);
		}
	})
}

</script>
	<script>
function questiondelete(c_t_q_idx){
	var params = new Object();
	params.c_t_q_idx = c_t_q_idx;
	
	$.ajax({
		type:"GET",
		url:"question_Delete.do",
		data:params,
		success:function(mav){
			$(".del-button").html(mav);
		}
	})
}
</script>

</body>
</html>