<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기</title>
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
				<div class="col-md-12 col-sm-12" style="float:none;">
					<h3 class="animated fadeInLeft">${sessionScope.class_subject}</h3>
					<p class="animated fadeInDown">
						<a href="cc_gotoCurrentClass.do">사이버캠퍼스</a> <span class="fa-angle-right fa"></span> ${sessionScope.classStatus} <span class="fa-angle-right fa"></span> <a href="cc_gotoClassMainRe.do">${sessionScope.class_subject}</a><hr>
					</p>
				</div>
				<div class="col-md-12 col-sm-12">
				<ul class="nav navbar-nav" style="float:none;">
                   <li><a href="cc_gotoNoticeList.do" class="">공지사항</a></li>
                   <li><a href="cc_gotoInfoPlanClass.do" class="">강의정보</a></li>
                   <li><a href="cc_gotoAttendClass.do" class="">출석/성적</a></li>
                   <li><a href="cc_gotoFreeBBSList.do" class="">커뮤니티</a></li>
                   <li><a href="cc_gotoHomeworkList.do" class="">학습자료</a></li>
                   <li><a href="cc_gotoQnAList.do" class="">질의응답</a></li>
                   <li><a href="cc_gotoEpilogueClass.do" class="btn btn-outline btn-primary">강의후기</a></li>
                   <li><a href="cc_gotoMyClassMate.do" class="">수강생보기</a></li>
                </ul></div>

					<div class="col-md-12 col-sm-12">
						<div class="panel">
						<div class="panel-body">
						<div class="row" style="width:100%;">
<div class="col-md-12">
<textarea name="" id="submitEpilogueContent"></textarea>
<input type="button" value="작성" id="submitEpilogueWrite">
</div>
</div>
	<!-- 댓글 작성란 -->

<div class="row">
<div class="col-md-12">
<c:forEach var="list" items="${list}">
<div>${list.c_r_writer}</div><div id="epilogueContent${list.c_r_idx}">${list.c_r_content}</div>
<input type="button" value="수정" id="firstUpdate${list.c_r_idx}" onclick="txtOn(${list.c_r_idx})">
<input type="button" value="수정" id="secondUpdate${list.c_r_idx}" onclick="submitEpilogueUpdate(${list.c_r_idx})" style="display:none">
<input type="button" value="삭제" id="submitEpilogueDelete${list.c_r_idx}" onclick="submitEpilogueDelete(${list.c_r_idx})">
</c:forEach>
<div id="successContent"><!-- 작성된 댓글 보이는 곳 --></div>
<div><!-- 페이징이 들어오는 자리 --></div>
</div>
</div>					
						
							<div class="col-md-12" style="float:none;">
							<div class="responsive-table">
							       <!-- 댓글 작성수정삭제는 모두 한페이지에서 할 수 있도록 설계 -->

						
							</div>
						</div>
					</div>
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
<script src="asset/js/plugins/jquery.nicescroll.js"></script>
<!-- custom -->
<script src="asset/js/main.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="resources/js/cybercampusEpilogue.js"></script>
</body>
</html>