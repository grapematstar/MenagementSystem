<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>질의응답</title>
<link rel="stylesheet" type="text/css"
	href="asset/css/bootstrap.min.css">
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
<title>사이버캠퍼스</title>
</head>
<body id="mimin" class="dashboard">
	<jsp:include page="/header.jsp" />
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
								<li><a href="cc_gotoQnAList.do"
									class="btn btn-outline btn-primary">질의응답</a></li>
								<li><a href="#" id="rightReview" class="opener-right-menu"><font
										class="sadness" style="color: #58666e;">강의후기</font></a></li>
								<li><a href="cc_gotoMyClassMate.do" class="">수강생보기</a></li>
							</ul>
						</div>
						<div class="col-md-12 col-sm-12">
							<div class="panel">
								<div class="panel-body">
									<div class="col-md-12" style="float: none;">
										<div class="responsive-table">
											<c:set var="dto" value="${dto}" />
											<table class="table" width="100%">
												<thead>
													<tr>
														<th>작성날짜</th>
														<td>${dto.string_Qwritedate}</td>
													</tr>
													<tr>
														<th>글쓴이</th>
														<td>${dto.c_q_q_writer}</td>
													</tr>
													<tr>
														<th>제목</th>
														<td>${dto.c_q_q_subject}</td>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td colspan="4">${dto.c_q_q_content}</td>
													</tr>
												</tbody>
												<tfoot>
													<tr>
														<td>
															<!-- 이전 글 -->
														</td>
													</tr>
													<tr>
														<td>
															<!-- 다음 글 -->
														</td>
													</tr>
													<tr>
														<td colspan="4"><input type="hidden" id="qnaIDX"
															value="${dto.c_q_q_idx}">
															<button id="getQnAAnswer"
																class="opener-right-menu  btn btn-default">
																<a>답변확인</a>
															</button> <c:if test="${dto.c_q_q_writer==sessionScope.id}">
																<input type="button" class="btn btn-default" value="수정"
																	onclick="location.href='cc_gotoQnAUpdate.do?c_q_q_idx=${dto.c_q_q_idx}'">
																<!-- 작성자 전용: if 아이디 일치여부 확인을 통해 등록 -->
																<input type="button" class="btn btn-default" value="삭제"
																	onclick="location.href='cc_gotoQnADelete.do?c_q_q_idx=${dto.c_q_q_idx}'">
															</c:if></td>
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
			<!-- RIGHT SIDE -->
			<div id="right-menu" style="display: none; width: 0px;">

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
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="resources/js/jquery.form.js"></script>
	<script>
		$(document).ready(function() {
			$("#rightReview").click(function() {
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
			$("#getQnAAnswer").click(function() {
				var params = new Object();
				params.c_q_q_idx = $("#qnaIDX").val();
				$.ajax({
					type : "GET",
					data : params,
					url : "cc_gotoQnAReply.do",
					success : function(args) {
						$("#successContent").html(args);
					},
					error : function(e) {
						alert(e.responseText);
					}
				});
			});
		})
	</script>
</body>
</html>