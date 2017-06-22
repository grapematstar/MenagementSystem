<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항</title>
<!-- start: Css -->
<link rel="stylesheet" type="text/css"
	href="asset/css/bootstrap.min.css">
<!-- plugins -->
<link rel="stylesheet" type="text/css"
	href="asset/css/plugins/font-awesome.min.css" />
<link rel="stylesheet" type="text/css"
	href="asset/css/plugins/mediaelementplayer.css" />
<link rel="stylesheet" type="text/css"
	href="asset/css/plugins/animate.min.css" />
<link href="asset/css/style.css" rel="stylesheet">
<!-- end: Css -->
<link rel="shortcut icon" href="asset/img/logomi.png">
</head>
<body id="mimin" class="dashboard">
	<jsp:include page="/header.jsp" />
	<section>
		<div class="container-fluid mimin-wrapper">
			<jsp:include page="/sidemenu.jsp" />
			<div id="content" style="width:96%;">
				<div class="panel">
					<div class="panel-body">
						<div class="col-md-12 col-sm-12" style="float: none;">
							<h3 class="animated fadeInLeft">${sessionScope.class_subject}</h3>
							<p class="animated fadeInDown">
								<a href="cc_gotoCurrentClass.do">사이버캠퍼스</a> <span class="fa-angle-right fa"></span>
								${sessionScope.classStatus} <span class="fa-angle-right fa"></span>
								<a href="cc_gotoClassMainRe.do">${sessionScope.class_subject}</a>
							<hr>
							</p>
						</div>
						<div class="col-md-12 col-sm-12">
							<ul class="nav navbar-nav" style="float: none;">
							<c:if test="${sessionScope.usergrade=='teacher'||sessionScope.usergrade=='master'}">
								<li><a href="cc_gotoTeacherNoticeList.do">강사공지사항</a></li>
							</c:if>
								<li><a href="cc_gotoNoticeList.do"
									class="btn btn-outline btn-primary">공지사항</a></li>
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
											<table class="table">
												<thead>
													<tr>
														<th>번호</th>
														<th>제목</th>
														<th>글쓴이</th>
														<th>작성날짜</th>
													</tr>
												</thead>
												<tbody>
													<c:if test="${empty teanoList}">
														<tr>
															<td colspan="4">등록된 공지사항이 아직 없습니다.</td>
														</tr>
													</c:if>
													<c:forEach var="list" items="${teanoList}">
														<tr>
															<td>${list.t_n_idx}</td>
															<td><a
																href="cc_gotoTeacherNoticeContent.do?t_n_idx=${list.t_n_idx}">${list.t_n_subject}</a></td>
															<td>관리자</td>
															<td>${list.string_writedate}</td>
														</tr>
													</c:forEach>
												</tbody>
											<!-- 	<tfoot>
													<tr>
														<td colspan="4" align="center">${pageStr}</td>
													</tr>
												</tfoot>  -->
											</table>
											<!-- <table><tr><td></td></tr></table> -->
											<hr>
											<!-- 	<div style="text-align:center;"><form action="cc_searchNoticeForThisUser.do" name="cc_searchNoticeForThisUser" method="GET">
															<select name="searchHow">
																<option value="subject" <c:out value="${map.searchHow=='subject'?'selected':''}"/>>제목</option>
																<option value="content" <c:out value="${map.searchHow=='content'?'selected':''}"/>>내용</option>
																<option value="subjectNcontent" <c:out value="${map.searchHow=='subjectNcontent'?'selected':''}"/>>제목+내용</option>
															</select>
															<input type="text" name="searchWhat" id="searchWhat" value="${map.searchWhat}">
															<input type="submit" class="btn btn-primary" value="검색" name="searchNow" id="searchNow">
														</form></div>  -->
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