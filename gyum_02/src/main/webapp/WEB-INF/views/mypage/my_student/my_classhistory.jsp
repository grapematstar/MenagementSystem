<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
</head>
<body>
	<%@include file="/header.jsp"%>
	<%@include file="/mypage_sidemenu.jsp"%>
	<section>
		<div id="content">
			<div class="panel box-shadow-none content-header">
				<div class="panel-body">
					<div class="col-md-12">
						<h2 class="animated fadeInLeft">등록된 강의</h2>
						<p class="animated fadeInDown">자신의 수강 신청한 강의 목록</p>
					</div>
				</div>
			</div>
			<div class="col-md-12 top-20 padding-0">
				<div class="col-md-12">
					<div class="panel">
						<div class="panel-body">
							<div class="col-md-12 padding-0" style="padding-bottom: 20px;">
								<div class="col-md-6" style="padding-left: 10px;"></div>
								<div class="col-md-6">
									<div class="col-lg-12">
										<div class="input-group">
											<div class="input-group-btn"></div>
											<!-- /btn-group -->
										</div>
										<!-- /input-group -->
									</div>
									<!-- /.col-lg-6 -->
								</div>
							</div>
							<div class="responsive-table">
								<table class="table table-striped table-bordered" width="100%"
									cellspacing="0">
									<thead>
										<tr>
											<th>번호</th>
											<th>과목</th>
											<th>과목명</th>
											<th>강의실</th>
											<th>강의요일</th>
											<th>개강날짜</th>
											<th>종강날짜</th>
										</tr>
									</thead>
									<tbody>
										<c:if test="${empty check_List }">
											<tr>
												<td colspan="6">강의 내역이 없습니다.</td>
											</tr>
										</c:if>
										<c:forEach var="check_List" items="${check_List }">
											<tr>
												<td>${check_List.class_idx }</td>
												<c:if test="${check_List.subject_num==1}">
													<td>국어</td>
												</c:if>
												<c:if test="${check_List.subject_num==2}">
													<td>영어</td>
												</c:if>
												<c:if test="${check_List.subject_num==3}">
													<td>수학</td>
												</c:if>
												<c:if test="${check_List.subject_num==4}">
													<td>사회</td>
												</c:if>
												<c:if test="${check_List.subject_num==5}">
													<td>과학</td>
												</c:if>
												<td>${check_List.class_subject }</td>
												<td>${check_List.classroom }</td>
												<td>${check_List.class_day }</td>
												<td>${check_List.class_startdate }</td>
												<td>${check_List.class_enddate }</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<div class="col-md-6" style="padding-top: 20px;">
									<span>showing 0-10 of 30 items</span>
								</div>
								<div class="col-md-6">
									<ul class="pagination pull-right">
										<li><a href="#" aria-label="Previous"> <span
												aria-hidden="true">&laquo;</span>
										</a></li>
										<li class="active">${check_pageStr }</li>
										<li><a href="#" aria-label="Next"> <span
												aria-hidden="true">&raquo;</span>
										</a></li>
									</ul>
								</div>
							</div>
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
	<script src="asset/js/plugins/icheck.min.js"></script>
	<script src="asset/js/plugins/jquery.nicescroll.js"></script>


	<!-- custom -->
	<script src="asset/js/main.js"></script>
</body>
</html>