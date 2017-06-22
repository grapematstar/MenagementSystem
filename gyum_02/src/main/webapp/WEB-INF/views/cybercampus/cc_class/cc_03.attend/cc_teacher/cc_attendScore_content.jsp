<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>사이버캠퍼스-출석/성적 확인/정정/입력::</title>
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
                   <li><a href="cc_gotoAttendClass.do" class="btn btn-outline btn-primary">출석/성적</a></li>
                   <li><a href="cc_gotoFreeBBSList.do" class="">커뮤니티</a></li>
                   <li><a href="cc_gotoHomeworkList.do" class="">학습자료</a></li>
                   <li><a href="cc_gotoQnAList.do" class="">질의응답</a></li>
                   <li><a href="#" id="rightReview" class="opener-right-menu"><font class="sadness" style="color:#58666e;">강의후기</font></a></li>
                   <li><a href="cc_gotoMyClassMate.do" class="">수강생보기</a></li>
                </ul></div>
					<div class="col-md-12 col-sm-12">
						<div class="panel">
						<div class="panel-body">
						<div>
						<input type="button" class="btn btn-primary" value="성적입력" onclick="location.href='cc_gotoAllScoreWrite.do'">
						<input type="button" class="btn btn-primary" value="오늘출결" onclick="location.href='cc_gotoAllAttendWrite.do'">
					</div>
							<div class="col-md-12" style="float:none;">
							<div class="responsive-table">
							     <table class="table" width="100%">
	<caption>${subject_name} 학생 리스트</caption>
	<thead>
		<tr>
			<th>순번</th>
			<th>학생번호</th>
			<th>학생이름</th>
			<th>아이디</th>
			<th>성적</th>
			<th>출결</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach var="list" items="${list}">
		<tr>
			<td>${list.rnum}</td>
			<td>${list.stu_idx}</td>
			<td>${list.stu_name}</td>
			<td>${list.stu_id}</td>
			<td>
				<input type="button" id="cc_gotoScoreContent${list.stu_idx}" class="btn btn-primary" value="성적" data-toggle="modal" data-target="#scoreContent" onclick="cc_callScore(${list.stu_idx},'${list.stu_name}')">
			</td>
			<td>
				<input type="button" id="cc_gotoAttendContent${list.stu_idx}" class="btn btn-primary" value="출결" data-toggle="modal" data-target="#scoreContent" onclick="cc_callAttend(${list.stu_idx},'${list.stu_name}')">
			</td>
		</tr>
	</c:forEach>
	</tbody>
	<tfoot>
		<tr>
			<td colspan="6" align="center">${pageStr}</td>
		<tr>
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
<div class="container">
  <!-- Modal -->
  <div class="modal fade" id="scoreContent" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
      
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title" id="modal-title"></h4>
        </div>
      
        <div class="modal-body" id="modal-body">
        </div>
      
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      
      </div>
    </div>
  </div>
</div>
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
var modalBody=document.getElementById("modal-body");
var bodyContent=new Object();
var stu_name;
function cc_callScore(stu_idx,stu_name){
	stu_name=stu_name+"학생의 성적표";
	var params=new Object();
	params.stu_idx=stu_idx;
	$.ajax({
		type:"GET",
		data:params,
		url:"cc_gotoSingleScoreContentList.do",
		success:function(args){
			bodyContent=args;
			modalBody.innerHTML=bodyContent;
			$("#modal-title").text(stu_name);
		},
		error:function(error){
			$("body").html(error.responseText);
		}
	});	
}
function cc_callAttend(stu_idx,stu_name){
	stu_name=stu_name+"학생의 출결현황";
	var params=new Object();
	params.stu_idx=stu_idx;
	$.ajax({
		type:"GET",
		data:params,
		url:"cc_gotoSingleAttendContentList.do",
		success:function(args){
			bodyContent=args;
			modalBody.innerHTML=bodyContent;
			$("#modal-title").text(stu_name);
		},
		error:function(error){
			$("body").html(error.responseText);
		}
	});	
}
function cc_callAttendPaging(cp){
	stu_name=stu_name;
	var params=new Object();
	params.cp=cp;
	$.ajax({
		type:"GET",
		url:"cc_gotoSingleAttendContentListAjax.do",
		data:params,
		success:function(args){
			bodyContent=args;
			modalBody.innerHTML=bodyContent;
			$("#modal-title").text(stu_name);
		},
		error:function(error){
			$("body").html(error.responseText);
		}
	});	
}
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