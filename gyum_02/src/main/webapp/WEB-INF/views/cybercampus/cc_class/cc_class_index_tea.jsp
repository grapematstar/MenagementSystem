<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<style>
.hidelongsentence {
    white-space: nowrap; 
    width: 15em; 
    overflow: hidden;
    text-overflow: ellipsis; 
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항</title>
<link rel="stylesheet" type="text/css" href="asset/css/bootstrap.min.css">
<!-- start: Javascript -->
<script src="asset/js/jquery.min.js"></script>
<script src="asset/js/jquery.ui.min.js"></script>
<script src="asset/js/bootstrap.min.js"></script>
<!-- plugins -->
<script src="asset/js/plugins/icheck.min.js"></script>
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
			<div id="content" style="width: 96%;">
				<div class="panel">
					<div class="panel-body">
						<div class="col-md-12 col-sm-12" style="float: none;">
							<h3 class="animated fadeInLeft">${sessionScope.class_subject}</h3>
							<p class="animated fadeInDown">
								<a href="cc_gotoCurrentClass.do">사이버캠퍼스</a> <span
									class="fa-angle-right fa"></span> ${sessionScope.classStatus} <span
									class="fa-angle-right fa"></span> <a
									href="cc_gotoClassMainRe.do">${sessionScope.class_subject}</a>
							<hr>
							</p>
						</div>
						<div class="col-md-12 col-sm-12">
							<ul class="nav navbar-nav" style="float: none;">
							<c:if test="${sessionScope.usergrade=='teacher'||sessionScope.usergrade=='master'}">
								<li><a href="cc_gotoTeacherNoticeList.do">강사공지사항</a></li>
							</c:if>
								<li><a href="cc_gotoNoticeList.do" class="">공지사항</a></li>
								<li><a href="cc_gotoInfoPlanClass.do" class="">강의정보</a></li>
								<li><a href="cc_gotoAttendClass.do" class="">출석/성적</a></li>
								<li><a href="cc_gotoFreeBBSList.do" class="">커뮤니티</a></li>
								<li><a href="cc_gotoHomeworkList.do" class="">학습자료</a></li>
								<li><a href="cc_gotoQnAList.do" class="">질의응답</a></li>
								<li><a href="#" id="rightReview" class="opener-right-menu"><font class="sadness" style="color:#58666e;">강의후기</font></a></li>
								<li><a href="cc_gotoMyClassMate.do" class="">수강생보기</a></li>
							</ul>
						</div>

						<div class="col-md-12 col-sm-12">
							<div class="panel">
								<div class="panel-body">
									<div class="col-md-12" style="float: none;">
										<div class="responsive-table">
										<div class="row" style="font-size:10px;">
										<div class="col-md-1"></div>
											<div class="col-md-4">
													<table class="table table-hover" style="width:100%;">
														<thead>
														<tr>
															<th style="background-color: white;" colspan="3"><div><h5><a href="">강사공지사항</a></h5></div></th>
														</tr>
														<tr>
															<th width="20%">글번호</th>
															<th width="50%">공지제목</th>
															<th width="30%">작성자</th>														
														</tr>
														</thead>
														<tbody>
															<c:if test="${empty teanoList}">
															<tr>
																<td colspan="3">아직 등록된 공지사항이 없습니다.</td>				
															</tr>
															</c:if>
															<c:forEach var="teanoList" items="${teanoList}">
															<tr>
																<td>${teanoList.t_n_idx}</td>
																<td><div class="hidelongsentence"><a href="cc_gotoTeacherNoticeContent.do?t_n_idx=${teanoList.t_n_idx}" data-toggle="tooltip" data-placement="top" title="${teanoList.string_writedate}">${teanoList.t_n_subject}</a></div></td>
																<td>관리자</td>
															</tr>
															</c:forEach>
														</tbody>										
													
													</table>
											</div>
											<div class="col-md-1"></div>
											<div class="col-md-4">
												<table class="table table-hover" style="width:100%">
														<thead>
														<tr>
															<th style="background-color: white;" colspan="3"><h5><a href="cc_gotoNoticeList.do">강의실 공지사항</a></h5></th>
														</tr>
														<tr>
															<th width="20%">글번호</th>
															<th width="50%">공지제목</th>
															<td width="30%">작성자</td>														
														</tr>
														</thead>
														<tbody>
															<c:if test="${empty noList}">
															<tr>
																<td colspan="3">아직 등록된 공지사항이 없습니다.</td>				
															</tr>
															</c:if>
															<c:forEach var="noList" items="${noList}">
															<tr>
																<td>${noList.c_n_idx}</td>
																<td><div class="hidelongsentence"><a href="cc_gotoNoticeContent.do?c_n_idx=${noList.c_n_idx}" data-toggle="tooltip" data-placement="top" title="${noList.string_writedate}">${noList.c_n_subject}</a></div></td>
																<td>${noList.c_n_writer}</td>
															</tr>
															</c:forEach>
														</tbody>
													</table>
											</div>
											<div class="col-md-2"></div>
											</div>
										
										
										<div class="row" style="font-size:100px;"><div class="col-md-12"><table><tr><td></td></tr></table></div></div>
										
										<div class="row" style="font-size:10px;">
											<div class="col-md-1"></div>
											<div class="col-md-4">
												<table class="table table-hover" style="width:100%">
														<thead>
														<tr>
															<th style="background-color: white;" colspan="3"><h5><a href="cc_gotoFreeBBSList.do">커뮤니티</a></h5></th>
														</tr>
														<tr>
															<th width="20%">글번호</th>
															<th width="50%">공지제목</th>
															<td width="30%">작성자</td>														
														</tr>
														</thead>
														<tbody>
															<c:if test="${empty freeList}">
															<tr>
																<td colspan="3">아직 등록된 공지사항이 없습니다.</td>				
															</tr>
															</c:if>
															<c:forEach var="freeList" items="${freeList}">
															<tr>
																<td>${freeList.c_f_b_idx}</td>
																<td><div class="hidelongsentence"><a href="cc_gotoFreeBBSList.do" data-toggle="tooltip" data-placement="top" title="${freeList.string_writedate}">${freeList.c_f_b_subject}</a></div></td>
																<td>${freeList.c_f_b_writer}</td>
															</tr>
															</c:forEach>
														</tbody>
													</table>
												</div>
												<div class="col-md-1"></div>
											<div class="col-md-4">
											<table class="table table-hover" style="width:100%">
														<thead>
														<tr>
															<th style="background-color: white;" colspan="3"><h5><a href="cc_gotoHomeworkList.do">학습과제</a></h5></th>
														</tr>
														<tr>
															<th width="20%">글번호</th>
															<th width="50%">공지제목</th>
															<td width="30%">작성자</td>													
														</tr>
														</thead>
														<tbody>
															<c:if test="${empty repoList}">
															<tr>
																<td colspan="3">아직 등록된 공지사항이 없습니다.</td>				
															</tr>
															</c:if>
															<c:forEach var="repoList" items="${repoList}">
															<tr>
																<td>${repoList.c_h_t_idx}</td>
																<td><div class="hidelongsentence"><a href="cc_gotoHomeworkContent.do?c_h_t_idx=${repoList.c_h_t_idx}" data-toggle="tooltip" data-placement="top" title="${repoList.wDate}">${repoList.c_h_t_subject}</a></div></td>
																<td>${sessionScope.classInfo.tea_name}</td>
															</tr>
															</c:forEach>
														</tbody>
													</table>
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
			<div id="right-menu">
				<div id="right-menu-user" class="tab-pane fade in active">
					<div class="user col-md-12" tabindex="5003"
						style="overflow: hidden; outline: none;">
						<div class="col-md-1"></div>
						<div class="col-md-11" id="successContent"> </div>
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
					$("#successContent").html(args);
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