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
<body id="mimin" class="dashboard" style="width: 1200px;">
<%@include file="/header.jsp" %>
<div class="container-fluid mimin-wrapper">
<%@include file="/mypage_sidemenu.jsp" %>
<div id="content" class="article-v1">
	
			<div class="panel ">
				<div class="panel-body">
					<div class="col-md-12">
						<h2 class="animated fadeInLeft">개설된 강의 목록</h2>
						<p class="animated fadeInDown">자신의 강의중 개설된 강의 목록입니다.</p>
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
										</tr>
									</thead>
									<tbody>
										<c:if test="${empty c_list }">
											<tr>
												<td colspan="6" align="center">등록된 강의가 없습니다.</td>
											</tr>
										</c:if>
										<c:forEach var="c_list" items="${c_list}">
											<tr>
												<td align="center">${c_list.class_idx }</td>
												<td align="center"><a
													href="class_content.do?class_idx=${c_list.class_idx }">${c_list.class_subject }</a></td>
												<td align="center">${c_list.class_startdate }</td>
												<td align="center">${c_list.class_enddate }</td>
												<td align="center">${c_list.classroom}</td>
												<td align="center">${c_list.class_check}</td>
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
						<h2 class="animated fadeInLeft">개설중인 강의</h2>
						<p class="animated fadeInDown">자신의 강의중 개설중인 강의 목록</p>
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
										</tr>
									</thead>
									<tbody>
										<c:if test="${empty nc_list }">
											<tr>
												<td colspan="6" align="center">등록된 강의가 없습니다.</td>
											</tr>
										</c:if>
										<c:forEach var="nc_list" items="${nc_list}">
											<tr>
												<td align="center">${nc_list.class_idx }</td>
												<td align="center"><a
													href="class_content.do?class_idx=${nc_list.class_idx }">${nc_list.class_subject }</a></td>
												<td align="center">${nc_list.class_startdate }</td>
												<td align="center">${nc_list.class_enddate }</td>
												<td align="center">${nc_list.classroom}</td>
												<td align="center">${nc_list.class_check}</td>
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
										<li class="active">${nc_pageStr }</li>
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
	
	</div></div>
	
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