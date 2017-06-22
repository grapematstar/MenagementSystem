<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>사이버캠퍼스-단체성적입력::</title>
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
							      <h2>${HashMap.class_subject} 성적입력</h2>

<form name="cc_submitAllScoreWrite" id="cc_submitAllScoreWrite" action="cc_submitAllScoreWrite.do" method="POST">
날짜: 
<select name="writeyear">
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
									<select name="writemonth">
										<c:forEach var="i" begin="1" end="12" step="1">
										<option value="${i}">${i}</option>
									</c:forEach>
									</select>
									월 
									<select name="writeday">
										<c:forEach var="i" begin="1" end="30" step="1">
										<option value="${i}">${i}</option>
									</c:forEach>
									</select>
									일 


<table style="width:100%;">
	<thead>
		<tr>	
			<td>학생번호</td>		
			<td>학생이름</td>		
			<td>학생아이디</td>		
			<td>점수</td>		
			<td>비고</td>		
		</tr>
	</thead>
	<tbody>
	<c:set var="list" value="${HashMap.list}"/>
	<c:forEach var="i" begin="0" end="${fn:length(list)-1}">
		<tr>
			<td>
			<div>${list.get(i).stu_idx}</div>
			</td>
			<td>
			<div>${list.get(i).stu_name}</div>
			</td>
			<td>
			<div>${list.get(i).stu_id}</div>
			</td>
			<td>
			<input type="text" name="list[${i}].s_s_result" id="list[${i}].s_s_result">
			</td>
			<td>
			<input type="hidden" name="list[${i}].stu_idx" id="list[${i}].stu_idx" value="${list.get(i).stu_idx}">
			<input type="hidden" name="list[${i}].stu_id" id="list[${i}].stu_id" value="${list.get(i).stu_id}">
			<input type="hidden" name="list[${i}].stu_name" id="list[${i}].stu_name" value="${list.get(i).stu_name}">
			<input type="hidden" name="list[${i}].subject_num" id="list[${i}].subject_num" value="${list.get(i).subject_num}">
			<input type="hidden" name="list[${i}].class_idx" value="${class_idx}">
			<input type="hidden" name="list[${i}].club_idx" value="${class_idx}">
			</td>
		</tr>
	</c:forEach>
	</tbody>
	<tfoot>
		<tr>
			<td colspan="6">
			<input type="button" class="btn btn-primary" id="forSubmit" value="입력">
			</td>
		</tr>
	</tfoot>
</table>
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
$("#forSubmit").click(function(){
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
	
	if(confirm("성적을 입력하시겠습니까?")){
		var writedate=$("#writedate").val();
		writedate=writedate.replace("/-/gi","");
		if(!(parseInt(writedate))||writedate.length!=8){
			alert("날짜 입력 기준에 맞지 않습니다.\n다시 입력하시기 바랍니다.");
			return false;
		}
		$("#cc_submitAllScoreWrite").submit();
	}
});
</script>
</body>
</html>