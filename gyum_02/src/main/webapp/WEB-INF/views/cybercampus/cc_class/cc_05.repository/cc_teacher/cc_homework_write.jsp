<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
		<div id="content" style="float:none;">
		<div class="panel">
			<div class="panel-body">
				<div class="col-md-12 col-sm-12" style="width:96%;">
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
							     <form name="cc_submitHomeworkWrite" action="cc_submitHomeworkWrite.do" method="POST">
	<fieldset>
		<legend>과제물 제출 작성</legend>
			<ul>
				<li>과제물제목:<input type="text" name="c_h_t_subject" id="c_h_t_subject" required="required"></li>
				<li>과제물기간:<br> 과제시작:
									<select name="c_h_t_startyear">
										<c:forEach var="i" begin="1970" end="2017" step="1">
										<c:if test="${i==2017}">
										<option value="${i}" selected>${i}</option>
										</c:if>
										<c:if test="${i!=2017}">
										<option value="${i}">${i}</option>
										</c:if>
									</c:forEach>
									</select>
									년 
									<select name="c_h_t_startmonth">
										<c:forEach var="i" begin="1" end="12" step="1">
										<option value="${i}" selected>${i}</option>
									</c:forEach>
									</select>
									일 
									<select name="c_h_t_startday">
										<c:forEach var="i" begin="1" end="30" step="1">
										<c:if test="${i==2017}">
										<option value="${i}" selected>${i}</option>
										</c:if>
										<c:if test="${i!=2017}">
										<option value="${i}">${i}</option>
										</c:if>
									</c:forEach>
									</select>
									일 
									<select name="c_h_t_starthour" id="c_h_t_starthour">
									<c:forEach var="i" begin="0" end="24" step="1">
										<option value="${i}">${i}</option>
									</c:forEach>
									</select>시
									
									<select name="c_h_t_startmin" id="c_h_t_startmin">
									<c:forEach var="i" begin="0" end="59" step="1">
										<option value="${i}">${i}</option>
									</c:forEach>
									</select>분
									
									<select name="c_h_t_startsec" id="c_h_t_startsec">
									<c:forEach var="i" begin="0" end="59" step="1">
										<option value="${i}">${i}</option>
									</c:forEach>
									</select>초
									<br>
					과제종료:
																		<select name="c_h_t_endyear">
										<c:forEach var="i" begin="1970" end="2017" step="1">
										<c:if test="${i==2017}">
										<option value="${i}" selected>${i}</option>
										</c:if>
										<c:if test="${i!=2017}">
										<option value="${i}">${i}</option>
										</c:if>
									</c:forEach>
									</select>
									년 
									<select name="c_h_t_endmonth">
										<c:forEach var="i" begin="1" end="12" step="1">
										<option value="${i}" selected>${i}</option>
									</c:forEach>
									</select>
									월 
									<select name="c_h_t_endday">
										<c:forEach var="i" begin="1" end="30" step="1">
										<c:if test="${i==2017}">
										<option value="${i}" selected>${i}</option>
										</c:if>
										<c:if test="${i!=2017}">
										<option value="${i}">${i}</option>
										</c:if>
									</c:forEach>
									</select>
									일 
									<select name="c_h_t_endhour" id="c_h_t_endhour">
									<c:forEach var="i" begin="0" end="24" step="1">
										<option value="${i}">${i}</option>
									</c:forEach>
									</select>시
									
									<select name="c_h_t_endmin" id="c_h_t_endmin">
									<c:forEach var="i" begin="0" end="59" step="1">
										<option value="${i}">${i}</option>
									</c:forEach>
									</select>분
									
									<select name="c_h_t_endsec" id="c_h_t_endsec">
									<c:forEach var="i" begin="0" end="59" step="1">
										<option value="${i}">${i}</option>
									</c:forEach>
									</select>초
									
									</li>
				<li>과제마감:
									<select name="c_h_t_deadyear">
										<c:forEach var="i" begin="1970" end="2017" step="1">
										<c:if test="${i==2017}">
										<option value="${i}" selected>${i}</option>
										</c:if>
										<c:if test="${i!=2017}">
										<option value="${i}">${i}</option>
										</c:if>
									</c:forEach>
									</select>
									년 
									<select name="c_h_t_deadmonth">
										<c:forEach var="i" begin="1" end="12" step="1">
										<option value="${i}" selected>${i}</option>
									</c:forEach>
									</select>
									월 
									<select name="c_h_t_deadday">
										<c:forEach var="i" begin="1" end="30" step="1">
										<option value="${i}">${i}</option>
									</c:forEach>
									</select>
									일 
									<select name="c_h_t_deadhour" id="c_h_t_deadhour">
									<c:forEach var="i" begin="0" end="24" step="1">
										<option value="${i}">${i}</option>
									</c:forEach>
									</select>시
									
									<select name="c_h_t_deadmin" id="c_h_t_deadmin">
									<c:forEach var="i" begin="0" end="59" step="1">
										<option value="${i}">${i}</option>
									</c:forEach>
									</select>분
									
									<select name="c_h_t_deadsec" id="c_h_t_deadsec">
									<c:forEach var="i" begin="0" end="59" step="1">
										<option value="${i}">${i}</option>
									</c:forEach>
									</select>초
				<br>
				</li>
				<li>과제물 제출시 주의사항<br>
				<textarea cols="100" rows="20" name="c_h_t_notice" id="c_h_t_notice" required="required"></textarea>
				</li>
			</ul>
		<input type="submit" value="제출"><input type="button" value="취소" onclick="">
	</fieldset>
</form>  
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