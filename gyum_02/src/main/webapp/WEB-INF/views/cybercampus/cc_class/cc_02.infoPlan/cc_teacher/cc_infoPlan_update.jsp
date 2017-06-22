<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>강의정보/계획 수정</title>
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
                   <li><a href="cc_gotoNoticeList.do" class="active">공지사항</a></li>
                   <li><a href="cc_gotoInfoPlanClass.do" class="btn btn-outline btn-primary">강의정보</a></li>
                   <li><a href="cc_gotoAttendClass.do" class="">출석/성적</a></li>
                   <li><a href="cc_gotoFreeBBSList.do" class="">커뮤니티</a></li>
                   <li><a href="cc_gotoHomeworkList.do" class="">학습자료</a></li>
                   <li><a href="cc_gotoQnAList.do" class="">질의응답</a></li>
                   <li><a href="#" id="rightReview" class="opener-right-menu"><font class="sadness" style="color:#58666e;">강의후기</font></a></li>
                   <li><a href="cc_gotoMyClassMate.do" class="">수강생보기</a></li>
                </ul></div>

					<div class="col-md-12 col-sm-12">
						<div class="panel">
						<div class="panel-body">
							<div class="col-md-12" style="float:none;">
							<div class="responsive-table">						       
<form name="cc_submitInfoPlanWrite" action="cc_submitInfoPlanWrite.do" method="POST">
<c:set var="dto" value="${dataMap.dto}"/>
<div>강의명:<span>${dto.club_idx}</span></div>
<input type="hidden" name="club_idx" id="club_idx" value="${club_idx}">

<div>과목:<span>${dto.subject_num}</span></div>
<input type="hidden" name="subject_num" id="subject_num" value="${dto.subject_num}">

<div>강의기간:<span>${dto.c_i_p_startdate} ~ ${dto.c_i_p_enddate}</span></div>

강의개요<br>
<textarea name="c_i_p_overview" id="c_i_p_overview" rows="3" cols="100" required>${dto.c_i_p_overview}</textarea><br>
강의목표<br>
<textarea name="c_i_p_purpose" id="c_i_p_purpose" rows="3" cols="100" required>${dto.c_i_p_purpose}</textarea><br>
<hr>
<!-- 단원추가를 위한 블럭 시작 -->
<div style="display:none;">
<div id="PlanUNIT">
<div>단원: <input type="number" name="c_plan_unit">
세부계획: <textarea name="c_plan_content"></textarea></div>
<input type="button" class="btn btn-primary" value="삭제"></div>
</div>
<!-- 단원추가를 위한 블럭 끝 -->

강의계획<br>
<fieldset>
<input type="button" class="btn btn-primary" id="submitInfoPlanWrite" value="등록">
<input type="button" class="btn btn-primary" value="단원추가" id="addPlanUNIT">
<div id="addUnitLocation">
<c:forEach var="i" begin="0" end="${fn:length(dataMap.list)-1}" step="1">
<div id="PlanUNIT${i+1}">
<div>단원: <input type="number" name="c_plan_unit" value="${dataMap.list[i].c_plan_unit}">
세부계획: <textarea name="c_plan_content">${dataMap.list[i].c_plan_content}</textarea></div>
<input type="button" class="btn btn-primary" value="삭제"></div>
<c:set var="idNum" value="${i+1}"/>
</c:forEach>
</div>
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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
var idNum=${idNum};
var appendUnit=new Array;
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
	$("#addPlanUNIT").click(function(){
		idNum++;
		appendUnit[idNum]=$("#PlanUNIT").clone(true);
		$("#addUnitLocation").append(appendUnit[idNum].attr("id","PlanUNIT"+idNum).show());
	});
	$("#submitInfoPlanWrite").click(function(){
		var params=new Object();
		params.c_i_p_overview=$("#c_i_p_overview").val();
		params.c_i_p_purpose=$("#c_i_p_purpose").val();
		params.c_plan_unit=[];
		$("input[name='c_plan_unit']").each(function(){
			params.c_plan_unit.push($(this).val());
		});
		params.c_plan_content=[];
		$("textarea[name='c_plan_content']").each(function(){
			params.c_plan_content.push($(this).val());
		});
		$.ajax({
			type:"POST",
			url:"cc_submitInfoPlanUpdate.do",
			data:params,
			async:false,
			success:function(args){
				$("body").html(args);
			},
			error:function(e){
				$("#dialog").html(e.responseText);
			}
		});
	});
});
</script>
</body>
</html>