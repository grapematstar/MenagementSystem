<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<link rel="stylesheet" type="text/css" href="codebase/fonts/font_roboto/roboto.css"/>
<link rel="stylesheet" type="text/css" href="codebase/dhtmlxcalendar.css"/>
<title>출석/성적 입력</title>
<style>
#calendar {
border: 1px solid #dfdfdf;
font-family: Roboto, Arial, Helvetica;
font-size: 14px; color: #404040;         
}   
</style>

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
<jsp:include page="/sidemenu.jsp" />
<section>
	<div class="container-fluid mimin-wrapper">
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
                   <li><a href="cc_gotoAttendClass.do" class="btn btn-outline btn-primary">출석/성적</a></li>
                   <li><a href="cc_gotoFreeBBSList.do" class="">커뮤니티</a></li>
                   <li><a href="cc_gotoHomeworkList.do" class="">학습자료</a></li>
                   <li><a href="cc_gotoQnAList.do" class="">질의응답</a></li>
                   <li><a href="#" id="rightReview" class="opener-right-menu"><font class="sadness" style="color:#58666e;">강의후기</font></a></li>
                   <li><a href="cc_gotoMyClassMate.do" class="">수강생보기</a></li>
                   <li><a href="cc_gotoIndex.do">다른 강의실로</a></li>
                </ul></div>

					<div class="col-md-12 col-sm-12">
						<div class="panel">
						<div class="panel-body">
							<div class="col-md-12" style="float:none;">
							<div class="responsive-table">
							       <!-- 출석 입력: 학생리스트 형식으로 나옴 -->
<input type="button" class="btn btn-default" value="뒤로" onclick="javascript:history.go(-1)">
출석날짜: <input type="text" name="chooseDate" id="chooseDate" value="${date}">
<table class="table table-striped table-bordered" width="100%">
	<thead>
		<tr>
			<th style="width:5%"><input type="checkbox" id="allSelector" name="allSelector" value=""></th>
			<th style="width:5%">학생번호</th>
			<th style="width:15%">학생명</th>
			<th style="width:15%">학생아이디</th>
			<!-- <th style="width:15%">날짜</th>  -->
			<th>출석</th>
			<th>지각</th>
			<th>조퇴</th>
			<th>결석</th>
			<th>취소</th>
			<th>특이사항 기재</th>
		</tr>
	</thead>
	<tbody>
	<c:if test="${empty list}">
		<tr>
			<td>등록된 학생이 없습니다.</td>
		</tr>
	</c:if>
	<c:forEach var="list" items="${list}">
		<tr>
			<td><input type="checkbox" name="stuOneSelector" id="${list.attend_note}" value="${list.stu_idx}"></td>
			<td>${list.stu_idx}</td>
			<td>${list.stu_name}</td>
			<td>${list.stu_id}</td>
			<!-- <td>${list.today}</td> -->
			<!-- <td>
				<c:choose>
					<c:when test="${list.a_a_idx==0}">미확인</c:when>
					<c:when test="${list.a_a_idx==1}">출석</c:when>
					<c:when test="${list.a_a_idx==2}">지각</c:when>
					<c:when test="${list.a_a_idx==3}">조퇴</c:when>
					<c:when test="${list.a_a_idx==4}">결석</c:when>
				</c:choose>
			</td>  -->
			<td>
				<c:if test="${list.a_a_idx!=1}"><input type="button" class="btn btn-outline btn-default" value="출석" id="${list.stu_idx}" name="${list.stu_idx}" onclick="submitOnePresent('${list.stu_idx}')"></c:if>
				<c:if test="${list.a_a_idx==1}"><input type="button" class="btn btn-outline btn-success" value="출석" disabled="disabled"></c:if>
			</td>
			<td>
				<c:if test="${list.a_a_idx!=2}"><input type="button" class="btn btn-outline btn-default" value="지각" id="${list.stu_idx}" name="${list.stu_idx}" onclick="submitOneLateness('${list.stu_idx}')"></c:if>
				<c:if test="${list.a_a_idx==2}"><input type="button" class="btn btn-outline btn-warning" value="지각" disabled="disabled"></c:if>
			</td>
			<td>
				<c:if test="${list.a_a_idx!=3}"><input type="button" class="btn btn-outline btn-default" value="조퇴" id="${list.stu_idx}" name="${list.stu_idx}" onclick="submitOneEarlyGo('${list.stu_idx}')"></c:if>
				<c:if test="${list.a_a_idx==3}"><input type="button" class="btn btn-outline btn-primary" value="조퇴" style="color:red;" disabled="disabled"></c:if>
			</td>
			<td>
				<c:if test="${list.a_a_idx!=4}"><input type="button" class="btn btn-outline btn-default" value="결석" id="${list.stu_idx}" name="${list.stu_idx}" onclick="submitOneAbsence('${list.stu_idx}')"></c:if>
				<c:if test="${list.a_a_idx==4}"><input type="button" class="btn btn-outline btn-danger" value="결석" style="color:red;" disabled="disabled"></c:if>
			</td>
			<td>
				<input type="button" class="btn btn-outline btn-info" value="취소" id="attendCancel" name="attendCancel" onclick="submitOneIdontknow('${list.stu_idx}')">
			
			</td>
			<td>
				<input type="text" name="attend_note${list.stu_idx}" id="attend_note${list.stu_idx}" onblur="submitOneAttendNote('${list.stu_idx}')" value="${list.attend_note}"></td>
		</tr>
	</c:forEach>
	</tbody>
	<tfoot>
		<tr>
			<td colspan="12">
				<input type="button" class="btn btn-primary" id="selectAttend" value="선택출석">&nbsp;&nbsp;
				<input type="button" class="btn btn-primary" id="selectLateness" value="선택지각">&nbsp;&nbsp;
				<input type="button" class="btn btn-primary" id="selectEarlyGo" value="선택조퇴">&nbsp;&nbsp;
				<input type="button" class="btn btn-primary" id="selectAbsence" value="선택결석">&nbsp;&nbsp;
				<input type="button" class="btn btn-primary" id="selectCancel" value="선택취소">
			</td>
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
					<div id="right-menu">
				<div id="right-menu-user" class="tab-pane fade in active">
					<div class="user col-md-12" tabindex="5003"
						style="overflow: hidden; outline: none;">
						<div class="col-md-1"></div>
						<div class="col-md-11" id="#successContent"> </div>
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
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="codebase/dhtmlxcalendar.js"></script>
<script>
var myCalendar;
$(document).ready(function(){
	myCalendar = new dhtmlXCalendarObject("chooseDate");
	myCalendar.attachEvent("onShow", function(){});
	myCalendar.attachEvent("onHide", function(){$("#chooseDate").blur();});
	
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
	
	$("#chooseDate").blur(function(){
		var params=new Object();
		params.attend_date=$("#chooseDate").val().replace(/-/gi,"");
		$.ajax({
			type:"POST",
			url:"cc_gotoDateAttendWrite.do",
			data:params,
			success:function(args){
				$("body").html(args);
			},
			error:function(e){
				console.log(e.responseText);
			}
		});
	});
	   
	$("#allSelector").click(function(){
		if($("#allSelector").prop("checked")){
			$("input[name=stuOneSelector]").prop("checked",true);
		}else{
			$("input[name=stuOneSelector]").prop("checked",false);
		}
	});
	
	$("#selectAttend").click(function(){
		var params=new Object();
		params.a_a_idx=1;		
		params.attend_date=$("#chooseDate").val().replace(/-/gi,"");
		params.stu_idx=[];
		params.attend_note=[];
		$("input[name='stuOneSelector']:checked").each(function(){
			params.stu_idx.push($(this).val());
			params.attend_note.push($(this).attr('id'));
		});
		$.ajax({
			type:"POST",
			url:"cc_submitAllAttendWrite.do",
			data:params,
			success:function(args){
				$("body").html(args);
			},
			error:function(e){
				console.log(e.responseText);
			}
		})
	});
	$("#selectLateness").click(function(){
		var params=new Object();
		params.a_a_idx=2;
		params.attend_date=$("#chooseDate").val().replace(/-/gi,"");
		params.stu_idx=[];
		params.attend_note=[];
		$("input[name='stuOneSelector']:checked").each(function(){
			params.stu_idx.push($(this).val());
			params.attend_note.push($(this).attr('id'));
		});
		$.ajax({
			type:"POST",
			url:"cc_submitAllAttendWrite.do",
			data:params,
			success:function(args){
				$("body").html(args);
			},
			error:function(e){
				console.log(e.responseText);
			}
		})
	});
	$("#selectEarlyGo").click(function(){
		var params=new Object();
		params.a_a_idx=3;
		params.attend_date=$("#chooseDate").val().replace(/-/gi,"");
		params.stu_idx=[];
		params.attend_note=[];
		$("input[name='stuOneSelector']:checked").each(function(){
			params.stu_idx.push($(this).val());
			params.attend_note.push($(this).attr('id'));
		});
		$.ajax({
			type:"POST",
			url:"cc_submitAllAttendWrite.do",
			data:params,
			success:function(args){
				$("body").html(args);
			},
			error:function(e){
				console.log(e.responseText);
			}
		})
	});
	$("#selectAbsence").click(function(){
		var params=new Object();
		params.a_a_idx=4;
		params.attend_date=$("#chooseDate").val().replace(/-/gi,"");
		params.stu_idx=[];
		params.attend_note=[];
		$("input[name='stuOneSelector']:checked").each(function(){
			params.stu_idx.push($(this).val());
			params.attend_note.push($(this).attr('id'));
		});
		$.ajax({
			type:"POST",
			url:"cc_submitAllAttendWrite.do",
			data:params,
			success:function(args){
				$("body").html(args);
			},
			error:function(e){
				console.log(e.responseText);
			}
		})
	});
	$("#selectCancel").click(function(){
		var params=new Object();
		params.a_a_idx=0;
		params.attend_date=$("#chooseDate").val().replace(/-/gi,"");
		params.stu_idx=[];
		params.attend_note=[];
		$("input[name='stuOneSelector']:checked").each(function(){
			params.stu_idx.push($(this).val());
			params.attend_note.push($(this).attr('id'));
		});
		$.ajax({
			type:"POST",
			url:"cc_submitAllAttendWrite.do",
			data:params,
			success:function(args){
				$("body").html(args);
			},
			error:function(e){
				console.log(e.responseText);
			}
		})
	});
});
function submitOneAttendNote(stu_idx){
	var params=new Object();
	params.stu_idx=stu_idx;
	params.attend_date=$("#chooseDate").val().replace(/-/gi,"");
	params.attend_note=$("input[name='attend_note"+stu_idx+"']").val();
	if(!($("#attend_note"+stu_idx).val()==""||$("#attend_note"+stu_idx).val()==null)){
	$.ajax({
		type:"POST",
		url:"cc_submitOneAttendNoteUpdate.do",
		data:params,
		success:function(args){
		
		},
		error:function(e){
			alert('상태를 먼저 입력하셔야 합니다.');
			$("#attend_note"+stu_idx).val("");
			console.log(e.responseText);
		}
	});
	}
}


function submitOnePresent(stu_idx){
	var params=new Object();
	params.stu_idx=stu_idx;
	params.a_a_idx=1;
	params.attend_date=$("#chooseDate").val().replace(/-/gi,"");
	params.attend_note=$("input[name='attend_note"+stu_idx+"']").val();
	$.ajax({
		type:"POST",
		url:"cc_submitOneAttendWrite.do",
		data:params,
		success:function(args){
			$("body").html(args);
		},
		error:function(e){
			console.log(e.responseText);
		}
	});
}
function submitOneLateness(stu_idx){
	var params=new Object();
	params.stu_idx=stu_idx;
	params.a_a_idx=2;
	params.attend_date=$("#chooseDate").val().replace(/-/gi,"");
	params.attend_note=$("input[name='attend_note"+stu_idx+"']").val();
	$.ajax({
		type:"POST",
		url:"cc_submitOneAttendWrite.do",
		data:params,
		success:function(args){
			$("body").html(args);
		},
		error:function(e){
			console.log(e.responseText);
		}
	});
}
function submitOneEarlyGo(stu_idx){
	var params=new Object();
	params.stu_idx=stu_idx;
	params.a_a_idx=3;
	params.attend_date=$("#chooseDate").val().replace(/-/gi,"");
	params.attend_note=$("input[name='attend_note"+stu_idx+"']").val();
	$.ajax({
		type:"POST",
		url:"cc_submitOneAttendWrite.do",
		data:params,
		success:function(args){
			$("body").html(args);
		},
		error:function(e){
			console.log(e.responseText);
		}
	});
}
function submitOneAbsence(stu_idx){
	var params=new Object();
	params.stu_idx=stu_idx;
	params.a_a_idx=4;
	params.attend_date=$("#chooseDate").val().replace(/-/gi,"");
	params.attend_note=$("input[name='attend_note"+stu_idx+"']").val();
	$.ajax({
		type:"POST",
		url:"cc_submitOneAttendWrite.do",
		data:params,
		success:function(args){
			$("body").html(args);
		},
		error:function(e){
			console.log(e.responseText);
		}
	});
}
function submitOneIdontknow(stu_idx){
	var params=new Object();
	params.stu_idx=stu_idx;
	params.a_a_idx=0;
	params.attend_date=$("#chooseDate").val().replace(/-/gi,"");
	params.attend_note=$("input[name='attend_note"+stu_idx+"']").val();
	$.ajax({
		type:"POST",
		url:"cc_submitOneAttendWrite.do",
		data:params,
		success:function(args){
			$("body").html(args);
		},
		error:function(e){
			console.log(e.responseText);
		}
	});
}
</script>
</body>
</html>